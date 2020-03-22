
extern crate clap;
use clap::{App, Arg, crate_version, crate_name, crate_authors};

use std::fs;
use std::env;
use std::error::Error;

mod parser;
mod eval;
mod pass1;
mod pass2;

use parser::Listing;

enum OutputMode {
    Raw,
    Hex,
    List
}

fn get_output_name(name: &str, suffix: &str) -> String {
    match name.rfind(".") {
        Some(idx) => {
            let mut s = String::from(name);
            s.truncate(idx);
            format!("{}.{}", s, suffix)
        }
        None => format!("{}.{}", name, suffix)
    }
}

fn write_u16_raw(vec: &mut Vec<u8>, word: u16) -> () {
    vec.push((word >> 8) as u8);
    vec.push((word & 255) as u8);
}

fn write_u16_hex(vec: &mut Vec<u8>, word: u16) -> () {

    fn insert(vec: &mut Vec<u8>, x: u16) -> () {
        let hex = b"0123456789ABCDEF";
        vec.push(hex[(x & 15) as usize]);
    }

    insert(vec, word >> 12);
    insert(vec, word >> 8);
    insert(vec, word >> 4);
    insert(vec, word >> 0);
}

fn write_str(vec: &mut Vec<u8>, s: &str) -> () {
    vec.extend(s.bytes());
}

fn assemble(input_name: &str, output_name: &str, mode: OutputMode) -> Result<(), Box<dyn Error>> {
    let content = fs::read_to_string(input_name)?;
    let statements = parser::parse(&content)?;
    let symbols = pass1::pass1(&statements);
    let result = pass2::pass2(&statements, &symbols)?;
    let mut output: Vec<u8> = Vec::new();
    for (st, word_opt) in result {
        match mode {
            OutputMode::Hex     => {
                match word_opt {
                    Some(word) => {
                        write_u16_hex(&mut output, word);
                        write_str(&mut output, "\n");
                    }
                    None => ()
                }
            }
            OutputMode::List    => {
                match word_opt {
                    Some(word)  => write_u16_hex(&mut output, word),
                    None        => write_str(&mut output, "    ")
                }
                write_str(&mut output, format!("    {}\n", st.emit_listing()).as_ref());
            }
            OutputMode::Raw     => {
                match word_opt {
                    Some(word) => write_u16_raw(&mut output, word),
                    None => ()
                }
            }
        }
    };
    if output_name == "-" {
        let s = String::new();
        for b in output.iter() {
            print!("{}", *b as char);
        }
    } else {
        fs::write(output_name, output)?;
    }
    Ok(())
}

fn main() {
    let input_key = "INPUT";
    let output_key = "OUTPUT";
    let mode_key = "MODE";
    let raw_name = "raw";
    let hex_name = "hex";
    let list_name = "lst";
    let matches = App::new(crate_name!())
        .version(crate_version!())
        .author(crate_authors!())
        .arg(Arg::with_name(input_key).required(true))
        .arg(Arg::with_name(output_key)
            .short("o")
            .long("output")
            .number_of_values(1)
        )
        .arg(Arg::with_name(mode_key)
            .short("m")
            .long("mode")
            .possible_values(&[raw_name, hex_name, list_name])
            .default_value(raw_name)
        )
        .get_matches();

    let input_name = matches.value_of(input_key).unwrap();
    let mode_str = matches.value_of(mode_key).unwrap();
    let mode = match mode_str {
        "raw"    => OutputMode::Raw,
        "hex"    => OutputMode::Hex,
        "lst"    => OutputMode::List,
        _        => panic!("invalid mode")
    };
    let output_name = matches.value_of(output_key).map(String::from).unwrap_or_else(||
        get_output_name(&input_name, &mode_str)
    );
    match assemble(input_name, &output_name, mode) {
        Ok(_) => println!("done"),
        Err(e) => eprintln!("ERROR: {}", e)
    };
}

mod tests {
    use super::*;

    #[test]
    fn test_get_output_name() {
        assert_eq!(get_output_name("test.ext", "what"), "test.what");
        assert_eq!(get_output_name("test", "what"), "test.what");
    }
}
