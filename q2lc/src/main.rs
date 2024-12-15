mod parser;
mod expr;
mod statement;
mod symbol;
mod builtin;
mod emit;
mod tokenizer;
mod renamer;
mod visitor;
mod pruner;
mod simplifier;
mod allocator;
mod promoter;
mod retcheck;

extern crate clap;
use clap::{App, Arg, crate_version, crate_name, crate_authors};

use std::fs;
use std::env;
use std::error::Error;
use std::io::Write;
use std::str::FromStr;
use crate::builtin::generate_builtins;
use crate::parser::parse_file;
use crate::promoter::Promoter;
use crate::pruner::Pruner;
use crate::renamer::Renamer;
use crate::simplifier::Simplifier;
use crate::symbol::SymbolTable;
use crate::statement::Statement;

const Q2L_EXTENSION: &str = ".q2l";
const Q2_EXTENSION: &str = ".q2";

fn output_name(input_name: &str) -> String {
    if input_name.ends_with(Q2L_EXTENSION) {
        format!("{}{}", &input_name[0..input_name.len()-Q2L_EXTENSION.len()], Q2_EXTENSION)
    } else {
        format!("{}{}", input_name, Q2_EXTENSION)
    }
}

pub struct Machine {
    pub code_addr: i64,
    pub heap_addr: i64,
    pub freq: i64,
    pub key_polarity: i8,
    pub key_mask: u8
}

fn compile(
    input_name: &str,
    machine: &Machine
) -> Result<(), Box<dyn Error>> {
    let mut source = generate_builtins(&machine);
    source.push(parse_file(input_name)?);
    let mut state = SymbolTable::new(&machine);

    // Rename nested symbols based on hierarchy.
    let renamed = Renamer::rename(&source)?;

    // Simplify constant expressions.
    let simplified = Simplifier::simplify(&renamed)?;

    // Promote operators to function calls.
    let promoted = Promoter::promote(&simplified)?;

    // Prune unused functions.
    let pruned = Statement::Block(Pruner::prune(&promoted)?);

    let _ = state.emit_prelude(&machine)?;
    let _ = pruned.emit_globals(&mut state)?;
    let mut output_file = fs::File::create(output_name(input_name))?;
    for line in state.emit()? {
        output_file.write_all(line.as_bytes())?;
        output_file.write_all(&['\n' as u8])?;
    }
    Ok(())
}

fn parse_addr(s: &str) -> i64 {
    if s.starts_with("0x") {
        i64::from_str_radix(&s[2..], 16).unwrap()
    } else {
        i64::from_str(s).unwrap()
    }
}

fn main() {
    let target_key = "TARGET";
    let q2_target = "q2";
    let q2a_target = "q2a";
    let input_key = "INPUT";
    let code_key = "CODE";
    let heap_key = "HEAP";
    let freq_key = "FREQ";
    let key_polarity_key = "KEY";
    let matches = App::new(crate_name!())
        .version(crate_version!())
        .author(crate_authors!())
        .about("A compiler for the Q2 computer")
        .max_term_width(80)
        .arg(
            Arg::with_name(target_key)
                .short("-t")
                .long("--target")
                .takes_value(true)
                .possible_values(&[q2_target, q2a_target])
                .default_value(q2_target)
                .help("Target machine")
        )
        .arg(
            Arg::with_name(code_key)
                .short("-c")
                .long("--code")
                .takes_value(true)
                .help("Starting code address")
        )
        .arg(
            Arg::with_name(heap_key)
                .short("-h")
                .long("--heap")
                .takes_value(true)
                .help("Starting heap address (heap grows down)")
        )
        .arg(
            Arg::with_name(freq_key)
                .short("-f")
                .long("--frequency")
                .takes_value(true)
                .help("Clock frequency in Hz (for delays)")
        )
        .arg(
            Arg::with_name(key_polarity_key)
                .short("-kp")
                .long("--keypolarity")
                .takes_value(true)
                .possible_values(&["+", "-"])
                .help("Key polarity")
        )
        .arg(
            Arg::with_name(input_key)
                .required(true)
                .help("Source to compile")
        )
        .get_matches();

    let target = match matches.value_of(target_key).unwrap_or(q2_target) {
        "q2" => Machine {
            code_addr: 0x000,
            heap_addr: 0xFFF,
            freq: 100_000,
            key_polarity: -1,
            key_mask: 31
        },
        "q2a" => Machine {
            code_addr: 0x800,
            heap_addr: 0x800,
            freq: 1_000_000,
            key_polarity: 1,
            key_mask: 63
        },
        t => panic!("invalid target: {}", t)
    };
    let input_name = matches.value_of(input_key).unwrap();
    let machine = Machine {
        code_addr: matches.value_of(code_key).map(parse_addr).unwrap_or(target.code_addr),
        heap_addr: matches.value_of(heap_key).map(parse_addr).unwrap_or(target.heap_addr),
        freq: matches.value_of(freq_key).and_then(|f| i64::from_str(f).ok()).unwrap_or(target.freq),
        key_polarity: matches.value_of(key_polarity_key).map(|f| if f == "+" { 1 } else { -1 }).unwrap_or(target.key_polarity),
        key_mask: target.key_mask
    };
    match compile(input_name, &machine) {
        Ok(_) => (),
        Err(e) => {
            eprintln!("ERROR: {}", e.to_string());
            std::process::exit(-1)
        },
    }
}
