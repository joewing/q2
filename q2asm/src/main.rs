
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
use std::num::ParseIntError;
use std::rc::Rc;

fn read_addr(s: &str) -> Result<u16, ParseIntError> {
    if s.starts_with("0x") {
        u16::from_str_radix(&s[2..], 16)
    } else if s.starts_with("0o") {
        u16::from_str_radix(&s[2..], 8)
    } else if s.starts_with("0b") {
        u16::from_str_radix(&s[2..], 2)
    } else {
        u16::from_str_radix(s, 10)
    }
}

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
    fn name(&self) -> &str;
    fn pad(&self, _vec: &mut Vec<u8>, _last_addr: i64, _addr: i64) -> () {}
    fn write(&self, vec: &mut Vec<u8>, base: u16, addr: i64, st: &Statement, word_opt: Option<u16>);
    fn write_end(&self, _vec: &mut Vec<u8>) -> () {}
}

struct HexOutputFormat;
impl OutputFormat for HexOutputFormat {
    fn name(&self) -> &str { "hex" }
    fn pad(&self, vec: &mut Vec<u8>, last_addr: i64, addr: i64) {
        for _ in last_addr..addr {
            write_hex(vec, 0);
            write_str(vec, "\n");
        }
    }
    fn write(&self, vec: &mut Vec<u8>, _base: u16, _addr: i64, _st: &Statement, word_opt: Option<u16>) {
        match word_opt {
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
    fn write(&self, vec: &mut Vec<u8>, _base: u16, addr: i64, st: &Statement, word_opt: Option<u16>) {
        write_str(vec, format!("{:03X}  ", addr).as_ref());
        match word_opt {
            Some(word)  => write_hex(vec, word),
            None        => write_str(vec, "    ")
        }
        write_str(vec, format!("    {}\n", st.emit_listing()).as_ref())
    }
}

struct HighRomOutputFormat;
impl OutputFormat for HighRomOutputFormat {
    fn name(&self) -> &str { "high.hex" }
    fn write(&self, vec: &mut Vec<u8>, base: u16, addr: i64, _st: &Statement, word_opt: Option<u16>) {
       match word_opt {
           Some(word) => write_intel_hex(vec, word >> 6, addr - (base as i64)),
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
    fn write(&self, vec: &mut Vec<u8>, base: u16, addr: i64, _st: &Statement, word_opt: Option<u16>) {
        match word_opt {
            Some(word) => write_intel_hex(vec, word & 0x3F, addr - (base as i64)),
            None => ()
        }
    }
    fn write_end(&self, vec: &mut Vec<u8>) {
        write_str(vec, ":00000001FF\n")
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
    let statements = parser::parse(&content)?;
    let symbols = pass1::pass1(&statements);
    let mut result = pass2::pass2(&statements, &symbols)?;
    result.sort_by_key(|(a, _, _)| a.clone());
    let mut last_addr: i64 = -1;
    let mut base: u16 = 0;
    for (addr, st, word_opt) in result {
        if last_addr < 0 {
            last_addr = addr;
            base = addr as u16;
        }
        for writer in &mut writers {
            writer.format.pad(&mut writer.output, last_addr, addr);
            writer.format.write(&mut writer.output, base, addr, &st, word_opt);
        }
        last_addr = addr + if word_opt.is_some() { 1 } else { 0 };
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
        Rc::new(LowRomOutputFormat)
    ];
    let input_key = "INPUT";
    let matches = App::new(crate_name!())
        .version(crate_version!())
        .author(crate_authors!())
        .about("An assembler for the Q2 computer")
        .max_term_width(80)
        .arg(Arg::with_name(input_key)
            .required(true)
            .help("Source to assemble")
        )
        .get_matches();

    let input_name = matches.value_of(input_key).unwrap();
    match assemble(input_name, &output_formats) {
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
