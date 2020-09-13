
extern crate clap;
use clap::{App, Arg, crate_version, crate_name, crate_authors};

use std::fs;
use std::env;
use std::error::Error;

mod parser;
mod eval;
mod pass1;
mod pass2;

use parser::{Listing, Statement};

fn write_u16_raw(vec: &mut Vec<u8>, word: u16) -> () {
    vec.push((word >> 8) as u8);
    vec.push((word & 255) as u8);
}

fn write_str(vec: &mut Vec<u8>, s: &str) -> () {
    vec.extend(s.bytes());
}

fn write_u16_hex(vec: &mut Vec<u8>, word: u16) -> () {

    fn insert(vec: &mut Vec<u8>, x: u16) -> () {
        let hex = b"0123456789ABCDEF";
        vec.push(hex[(x & 15) as usize]);
    }

    insert(vec, word >> 8);
    insert(vec, word >> 4);
    insert(vec, word >> 0);
}


trait OutputFormat {
    fn name(self: &Self) -> &str;
    fn pad(self: &Self, vec: &mut Vec<u8>, last_addr: i64, addr: i64);
    fn write(self: &Self, vec: &mut Vec<u8>, addr: i64, st: Statement, word_opt: Option<u16>);
}

struct RawOutputFormat;
impl OutputFormat for RawOutputFormat {
    fn name(self: &Self) -> &str { "raw" }
    fn pad(self: &Self, vec: &mut Vec<u8>, last_addr: i64, addr: i64) {
        for _ in last_addr + 1..addr {
            write_u16_raw(vec, 0);
        }
    }
    fn write(self: &Self, vec: &mut Vec<u8>, _addr: i64, _st: Statement, word_opt: Option<u16>) {
        match word_opt {
            Some(word) => write_u16_raw(vec, word),
            None => ()
        }
    }
}

struct HexOutputFormat;
impl OutputFormat for HexOutputFormat {
    fn name(self: &Self) -> &str { "hex" }
    fn pad(self: &Self, vec: &mut Vec<u8>, last_addr: i64, addr: i64) {
        for _ in last_addr + 1..addr {
            write_u16_hex(vec, 0);
            write_str(vec, "\n");
        }
    }
    fn write(self: &Self, vec: &mut Vec<u8>, _addr: i64, _st: Statement, word_opt: Option<u16>) {
        match word_opt {
            Some(word) => {
                write_u16_hex(vec, word);
                write_str(vec, "\n");
            }
            None => ()
        }
    }
}

struct ListOutputFormat;
impl OutputFormat for ListOutputFormat {
    fn name(self: &Self) -> &str { "lst" }
    fn pad(self: &Self, _vec: &mut Vec<u8>, _last_addr: i64, _addr: i64) {}
    fn write(self: &Self, vec: &mut Vec<u8>, addr: i64, st: Statement, word_opt: Option<u16>) {
        write_str(vec, format!("{:04X}  ", addr).as_ref());
        match word_opt {
            Some(word)  => write_u16_hex(vec, word),
            None        => write_str(vec, "    ")
        }
        write_str(vec, format!("    {}\n", st.emit_listing()).as_ref());
    }
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

fn assemble(input_name: &str, output_name: &str, format: &Box<dyn OutputFormat>) -> Result<(), Box<dyn Error>> {
    let content = fs::read_to_string(input_name)?;
    let statements = parser::parse(&content)?;
    let symbols = pass1::pass1(&statements);
    let mut result = pass2::pass2(&statements, &symbols)?;
    result.sort_by_key(|(a, _, _)| a.clone());
    let mut output: Vec<u8> = Vec::new();
    let mut last_addr: i64 = 0;
    for (addr, st, word_opt) in result {
        format.pad(&mut output, last_addr, addr);
        format.write(&mut output, addr, st, word_opt);
        last_addr = addr;
    };
    if output_name == "-" {
        for b in output.iter() {
            print!("{}", *b as char);
        }
    } else {
        fs::write(output_name, output)?;
    }
    Ok(())
}

fn main() {
    let output_formats: Vec<Box<dyn OutputFormat>> = vec![
        Box::new(HexOutputFormat),
        Box::new(ListOutputFormat),
        Box::new(RawOutputFormat),
    ];
    let output_names: Vec<&str> = output_formats.iter().map(|f| f.name()).collect();
    let input_key = "INPUT";
    let output_key = "OUTPUT";
    let format_key = "FORMAT";
    let matches = App::new(crate_name!())
        .version(crate_version!())
        .author(crate_authors!())
        .about("An assembler for the Q2 computer")
        .max_term_width(80)
        .arg(Arg::with_name(input_key)
            .required(true)
            .help("Source to assemble")
        )
        .arg(Arg::with_name(output_key)
            .short("o")
            .long("output")
            .number_of_values(1)
            .help("Output file name (defaults to the input name with an appropriate extension)")
        )
        .arg(Arg::with_name(format_key)
            .short("f")
            .long("format")
            .possible_values(output_names.as_ref())
            .default_value(output_formats[0].name())
            .help("Output format")
        )
        .get_matches();

    let input_name = matches.value_of(input_key).unwrap();
    let format_str = matches.value_of(format_key).unwrap();
    let format = output_formats.iter().find(|f| f.name() == format_str).unwrap();
    let output_name = matches.value_of(output_key).map(String::from).unwrap_or_else(||
        get_output_name(&input_name, &format_str)
    );
    match assemble(input_name, &output_name, format) {
        Ok(_) => (),
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
