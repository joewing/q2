
extern crate clap;
use clap::{App, Arg, crate_version, crate_name, crate_authors};

use std::fs;
use std::env;
use std::error::Error;
use std::str::FromStr;

mod parser;
mod eval;
mod pass1;
mod pass2;

use std::rc::Rc;
use crate::pass2::CompiledStatement;

fn write_str(vec: &mut Vec<u8>, s: &str) -> () {
    vec.extend(s.bytes());
}

fn write_hex(vec: &mut Vec<u8>, word: u16) {

    fn insert(vec: &mut Vec<u8>, x: u16) -> () {
        let hex = b"0123456789ABCDEF";
        vec.push(hex[(x & 15) as usize]);
    }

    insert(vec, word >> 8);
    insert(vec, word >> 4);
    insert(vec, word >> 0);
}

fn write_intel_hex(vec: &mut Vec<u8>, word: u16, addr: i64) {
    let byte_count = 1u8;
    let record_type = 0u8;
    let mut csum = byte_count & 255;
    csum = csum.wrapping_add(record_type & 255);
    csum = csum.wrapping_add((addr >> 8) as u8);
    csum = csum.wrapping_add((addr & 255) as u8);
    csum = csum.wrapping_add((word & 255) as u8);
    csum = (!csum).wrapping_add(1);
    write_str(vec,
              format!(
                  ":{:02X}{:04X}{:02X}{:02X}{:02X}\n",
                  byte_count, addr, record_type, (word & 255), csum
              ).as_ref()
    )
}

trait OutputFormat {

    /** The name of the output format (used as a file extension). */
    fn name(&self) -> &str;

    /** Skip to last_addr to addr (inclusive), generate padding if necessary. */
    fn pad(&self, _vec: &mut Vec<u8>, _last_addr: i64, _addr: i64) -> () {}

    fn write(&self, vec: &mut Vec<u8>, bank: i64, base: u16, st: &CompiledStatement);
    fn write_end(&self, _vec: &mut Vec<u8>) -> () {}
}

struct HexOutputFormat;
impl OutputFormat for HexOutputFormat {
    fn name(&self) -> &str { "hex" }
    fn pad(&self, vec: &mut Vec<u8>, last_addr: i64, addr: i64) {
        for _ in last_addr..addr {
            write_str(vec, "XX\n");
        }
    }
    fn write(&self, vec: &mut Vec<u8>, _bank: i64, _base: u16, st: &CompiledStatement) {
        match st.code {
            Some(word) => {
                write_hex(vec, word);
                write_str(vec, "\n");
            }
            None => ()
        }
    }
}

struct ListOutputFormat;
impl OutputFormat for ListOutputFormat {
    fn name(&self) -> &str { "lst" }
    fn write(&self, vec: &mut Vec<u8>, _bank: i64, _base: u16, st: &CompiledStatement) {
        write_str(vec, format!("{:03X}  ", st.addr).as_ref());
        match st.code {
            Some(word)  => write_hex(vec, word),
            None        => write_str(vec, "    ")
        }
        write_str(vec, &*format!("    {}\n", st.line.as_str()))
    }
}

struct HighRomOutputFormat;
impl OutputFormat for HighRomOutputFormat {
    fn name(&self) -> &str { "high.hex" }
    fn write(&self, vec: &mut Vec<u8>, bank: i64, base: u16, st: &CompiledStatement) {
       match st.code {
           Some(word) => {
               let addr = st.full_addr() - (base as i64);
               write_intel_hex(vec, word >> 6, addr | (bank << 11))
           },
           None => ()
       }
    }
    fn write_end(&self, vec: &mut Vec<u8>) {
        write_str(vec, ":00000001FF\n")
    }
}

struct LowRomOutputFormat;
impl OutputFormat for LowRomOutputFormat {
    fn name(&self) -> &str { "low.hex" }
    fn write(&self, vec: &mut Vec<u8>, bank: i64, base: u16, st: &CompiledStatement) {
        match st.code {
            Some(word) => {
                let addr = st.full_addr() - (base as i64);
                write_intel_hex(vec, word & 0x3F, addr | (bank << 11))
            },
            None => ()
        }
    }
    fn write_end(&self, vec: &mut Vec<u8>) {
        write_str(vec, ":00000001FF\n")
    }
}

struct Q2pOutputFormat;
impl OutputFormat for Q2pOutputFormat {
    fn name(&self) -> &str { "q2p" }
    fn write(&self, vec: &mut Vec<u8>, _bank: i64, _base: u16, st: &CompiledStatement) {
        match st.code {
            Some(word) => {
                write_hex(vec, st.full_addr() as u16);
                write_str(vec, ":");
                write_hex(vec, word);
                write_str(vec, "\n");
            },
            None => ()
        }
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

struct OutputWriter {
    format: Rc<dyn OutputFormat>,
    output: Vec<u8>
}

fn assemble(
    input_name: &str,
    start_addr: i64,
    bank: i64,
    formats: &Vec<Rc<dyn OutputFormat>>
) -> Result<(), Box<dyn Error>> {
    let mut writers: Vec<OutputWriter> = Vec::new();
    for format in formats {
        writers.push(
            OutputWriter {
                format: format.clone(),
                output: Vec::new()
            }
        );
    }
    let content = fs::read_to_string(input_name)?;
    let statements = parser::parse(input_name, &content)?;
    let (symbols, updated_statements) = pass1::pass1(statements)?;
    let mut result = pass2::pass2(&updated_statements, &symbols)?;
    result.sort_by_key(|s| s.full_addr());
    let mut last_addr: i64 = start_addr;
    let mut base: u16 = 0xFFFF;
    for cs in result {
        if cs.code.is_some() && base == 0xFFFF {
            // Set the base address to be the address of the first instruction.
            base = cs.addr as u16;
        }
        for writer in &mut writers {
            if last_addr != cs.addr {
                writer.format.pad(&mut writer.output, last_addr, cs.addr);
            }
            writer.format.write(&mut writer.output, bank, base, &cs);
        }
        last_addr = cs.addr + if cs.code.is_some() { 1 } else { 0 };
    }
    for mut writer in writers {
        writer.format.write_end(&mut writer.output);
        let output_name = get_output_name(input_name, writer.format.name());
        fs::write(output_name, writer.output)?;
    }
    Ok(())
}

fn main() {
    let output_formats: Vec<Rc<dyn OutputFormat>> = vec![
        Rc::new(HexOutputFormat),
        Rc::new(ListOutputFormat),
        Rc::new(HighRomOutputFormat),
        Rc::new(LowRomOutputFormat),
        Rc::new(Q2pOutputFormat),
    ];
    let input_key = "INPUT";
    let start_key = "START";
    let bank_key = "BANK";
    let matches = App::new(crate_name!())
        .version(crate_version!())
        .author(crate_authors!())
        .about("An assembler for the Q2 computer")
        .max_term_width(80)
        .arg(Arg::with_name(start_key)
            .short("-s")
            .long("--start")
            .takes_value(true)
            .default_value("0x000")
            .help("Starting address")
        )
        .arg(Arg::with_name(bank_key)
            .short("-b")
            .long("--bank")
            .takes_value(true)
            .default_value("0")
            .help("ROM bank")
        )
        .arg(Arg::with_name(input_key)
            .required(true)
            .help("Source to assemble")
        )
        .get_matches();

    let input_name = matches.value_of(input_key).unwrap();
    let start_addr_str = matches.value_of(start_key).unwrap_or("0x000");
    let start_addr = if start_addr_str.starts_with("0x") {
        i64::from_str_radix(&start_addr_str[2..], 16).unwrap()
    } else {
        i64::from_str(start_addr_str).unwrap()
    };
    let bank = i64::from_str(matches.value_of(bank_key).unwrap_or("0")).unwrap();
    match assemble(input_name, start_addr, bank, &output_formats) {
        Ok(_) => (),
        Err(e) => eprintln!("ERROR: {}", e)
    };
}

mod tests {
    #[cfg(test)]
    use super::*;

    #[test]
    fn test_get_output_name() {
        assert_eq!(get_output_name("test.ext", "what"), "test.what");
        assert_eq!(get_output_name("test", "what"), "test.what");
    }
}
