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

fn compile(input_name: &str, code_addr: i64, heap_addr: i64, freq: i64) -> Result<(), Box<dyn Error>> {
    let mut source = generate_builtins();
    source.push(parse_file(input_name)?);
    let mut state = SymbolTable::new(code_addr, heap_addr, freq);

    // Rename nested symbols based on hierarchy.
    let renamed = Renamer::rename(&source)?;

    // Simplify constant expressions.
    let simplified = Simplifier::simplify(&renamed)?;

    // Promote operators to function calls.
    let promoted = Promoter::promote(&simplified)?;

    // Prune unused functions.
    let pruned = Statement::Block(Pruner::prune(&promoted)?);

    let _ = state.emit_prelude(code_addr)?;
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
    let input_key = "INPUT";
    let code_key = "CODE";
    let heap_key = "HEAP";
    let freq_key = "FREQ";
    let matches = App::new(crate_name!())
        .version(crate_version!())
        .author(crate_authors!())
        .about("A compiler for the Q2 computer")
        .max_term_width(80)
        .arg(
            Arg::with_name(code_key)
                .short("-c")
                .long("--code")
                .takes_value(true)
                .default_value("0x000")
                .help("Starting code address")
        )
        .arg(
            Arg::with_name(heap_key)
                .short("-h")
                .long("--heap")
                .takes_value(true)
                .default_value("0xFFF")
                .help("Starting heap address (heap grows down)")
        )
        .arg(
            Arg::with_name(freq_key)
                .short("-f")
                .long("--frequency")
                .takes_value(true)
                .default_value("100000")
                .help("Clock frequency in Hz (for delays)")
        )
        .arg(
            Arg::with_name(input_key)
                .required(true)
                .help("Source to compile")
        )
        .get_matches();

    let input_name = matches.value_of(input_key).unwrap();
    let code_addr = parse_addr(matches.value_of(code_key).unwrap());
    let heap_addr = parse_addr(matches.value_of(heap_key).unwrap());
    let freq = i64::from_str(matches.value_of(freq_key).unwrap()).unwrap();
    match compile(input_name, code_addr, heap_addr, freq) {
        Ok(_) => (),
        Err(e) => {
            eprintln!("ERROR: {}", e.to_string());
            std::process::exit(-1)
        },
    }
}
