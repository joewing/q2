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

fn compile(input_name: &str) -> Result<(), Box<dyn Error>> {
    let mut source = generate_builtins();
    source.push(parse_file(input_name)?);
    let mut state = SymbolTable::new();

    // Rename nested symbols based on hierarchy.
    let renamed = Renamer::rename(&source)?;

    // Simplify constant expressions.
    let simplified = Simplifier::simplify(&renamed)?;

    // Promote operators to function calls.
    let promoted = Promoter::promote(&simplified)?;

    // Prune unused functions.
    let pruned = Statement::Block(Pruner::prune(&promoted)?);

    let _ = pruned.emit_globals(&mut state)?;
    let mut output_file = fs::File::create(output_name(input_name))?;
    for line in state.emit()? {
        output_file.write_all(line.as_bytes())?;
        output_file.write_all(&['\n' as u8])?;
    }
    Ok(())
}

fn main() {
    let input_key = "INPUT";
    let matches = App::new(crate_name!())
        .version(crate_version!())
        .author(crate_authors!())
        .about("A compiler for the Q2 computer")
        .max_term_width(80)
        .arg(
            Arg::with_name(input_key)
                .required(true)
                .help("Source to compile")
        )
        .get_matches();

    let input_name = matches.value_of(input_key).unwrap();
    match compile(input_name) {
        Ok(_) => (),
        Err(e) => {
            eprintln!("ERROR: {}", e.to_string());
            std::process::exit(-1)
        },
    }
}
