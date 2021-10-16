mod parser;
mod expr;
mod statement;
mod symbol;
mod builtin;
mod emit;

extern crate clap;
use clap::{App, Arg, crate_version, crate_name, crate_authors};

use std::fs;
use std::env;
use std::error::Error;
use std::io::Write;
use crate::builtin::generate_builtins;
use crate::symbol::SymbolTable;
use crate::statement::{emit_statements, simplify};

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
    let content = fs::read_to_string(input_name)?;
    let mut source = generate_builtins();
    source.extend(parser::parse(input_name, content.as_str())?);
    let mut state = SymbolTable::new();
    let statements = simplify(&mut state, &source);
    emit_statements(&mut state, &statements);
    let mut output_file = fs::File::create(output_name(input_name))?;
    for line in state.emit() {
        output_file.write_all(line.as_bytes())?;
        output_file.write_all(&['\n' as u8])?;
    }
    Ok(())
}

fn main() -> Result<(), Box<dyn Error>> {
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
    compile(input_name).map_err(
        |e| {
            eprintln!("ERROR: {}", e);
            e
        }
    )
}
