use gpio_cdev::{Chip, LineRequestFlags, MultiLineHandle, LineHandle};
use gpio_cdev::Error;
use std::thread;
use std::time::Duration;
use std::u16;
use std::fs;
use clap::{App, crate_version, crate_authors, crate_name, Arg};
use std::num::ParseIntError;

const DEFAULT_DEVICE_PATH: &str = "/dev/gpiochip0";

// Least significant bits first.
const OUTPUT_PINS: [u32; 12] = [
    24, 25, 4, 7, 8, 9, 10, 11, 14, 15, 17, 18
];
const INPUT_PINS: [u32; 12] = [
    // Input available with 40-pin connector only.
    5, 6, 12, 13, 16, 19, 20, 21, 27, 2, 26, 3
];
const SET_PIN: u32 = 22;
const DEPOSIT_PIN: u32 = 23;

const DELAY_SHORT: Duration = Duration::from_millis(5);
const DELAY_LONG: Duration = Duration::from_millis(95);

pub struct ProgError {
    message: String
}

impl From<std::io::Error> for ProgError {
    fn from(e: std::io::Error) -> ProgError {
        ProgError {
            message: e.to_string()
        }
    }
}

impl From<Error> for ProgError {
    fn from(e: Error) -> ProgError {
        ProgError {
            message: e.to_string()
        }
    }
}

impl From<ParseIntError> for ProgError {
    fn from(e: ParseIntError) -> ProgError {
        ProgError {
            message: e.to_string()
        }
    }
}

pub struct FrontPanel {
    output_lines: MultiLineHandle,
    input_lines: Option<MultiLineHandle>,
    set_line: LineHandle,
    deposit_line: LineHandle
}

impl FrontPanel {
    fn press_button(&self, line: &LineHandle, dur: &Duration) -> Result<(), Error> {
        line.set_value(1)?;
        thread::sleep(DELAY_SHORT);
        line.set_value(0)?;
        thread::sleep(*dur);
        Ok(())
    }

    fn press_set(&self) -> Result<(), Error> {
        self.press_button(&self.set_line, &DELAY_LONG)
    }

    fn press_deposit(&self) -> Result<(), Error> {
        self.press_button(&self.deposit_line, &DELAY_SHORT)
    }

    fn set_value(&self, value: u16) -> Result<(), Error> {
        let mut temp = [0u8; 12];
        for i in 0..12 {
            if (value >> i) & 1 != 0 {
                temp[i] = 1u8;
            }
        }
        self.output_lines.set_values(&temp)
    }

    fn get_value(&self) -> Result<u16, Error> {
        let mut result = 0u16;
        let temp = self.input_lines.as_ref().unwrap().get_values()?;
        for i in 0..12 {
            if temp[i] != 0 {
                result |= 1 << i;
            }
        }
        Ok(result)
    }

    pub fn write_word(&self, addr: u16, word: u16) -> Result<(), Error> {
        eprintln!("write {:03x} = {:03x}", addr, word);
        self.set_value(addr)?;
        self.press_set()?;
        self.set_value(word)?;
        self.press_deposit()
    }

    pub fn read_word(&self, addr: u16) -> Result<u16, Error> {
        self.set_value(addr)?;
        self.press_set()?;
        let word = self.get_value()?;
        eprintln!("read {:03x} = {:03x}", addr, word);
        Ok(word)
    }

    pub fn cleanup(&self) -> Result<(), Error> {
        self.set_value(0u16)?;
        self.press_set()
    }
}

pub fn create_frontpanel(device_path: &str, read_enable: bool) -> Result<FrontPanel, Error> {
    let process_name = "q2prog";
    let mut chip = Chip::new(device_path)?;
    let output_lines = chip.get_lines(&OUTPUT_PINS)?.request(
        LineRequestFlags::OUTPUT | LineRequestFlags::OPEN_DRAIN | LineRequestFlags::ACTIVE_LOW,
        &[0u8; 12],
        process_name
    )?;
    let input_lines = if read_enable {
        Some(
            chip.get_lines(&INPUT_PINS)?.request(
                LineRequestFlags::INPUT | LineRequestFlags::ACTIVE_LOW,
                &[0u8; 12],
                process_name
            )?
        )
    } else {
        None
    };
    let set_line = chip.get_line(SET_PIN)?.request(
        LineRequestFlags::OUTPUT | LineRequestFlags::OPEN_DRAIN | LineRequestFlags::ACTIVE_LOW,
        0u8,
        process_name
    )?;
    let deposit_line = chip.get_line(DEPOSIT_PIN)?.request(
        LineRequestFlags::OUTPUT | LineRequestFlags::OPEN_DRAIN | LineRequestFlags::ACTIVE_LOW,
        0u8,
        process_name
    )?;
    Ok(FrontPanel{ output_lines, input_lines, set_line, deposit_line })
}

fn parse_word(word: &str) -> Result<u16, ProgError> {
    let result = u16::from_str_radix(word, 16)?;
    Ok(result)
}

fn do_write(device_path: &str, filename: &str) -> Result<usize, ProgError> {
    let data = fs::read_to_string(filename)?;
    let panel = create_frontpanel(device_path, false)?;
    let mut count = 0;
    for line in data.split('\n') {
        let parts: Vec<&str> = line.split(':').collect();
        if parts.len() == 2 {
            let addr = parse_word(parts[0])?;
            let word = parse_word(parts[1])?;
            panel.write_word(addr, word)?;
            count += 1;
        } else if line.len() > 0 {
            return Err(ProgError { message: format!("ERROR: invalid line: {}", line) })
        }
    }
    panel.cleanup()?;
    Ok(count)
}

fn do_verify(device_path: &str, filename: &str) -> Result<usize, ProgError> {
    let data = fs::read_to_string(filename)?;
    let panel = create_frontpanel(device_path, true)?;
    let mut count = 0;
    for line in data.split('\n') {
        let parts: Vec<&str> = line.split(':').collect();
        if parts.len() == 2 {
            let addr = parse_word(parts[0])?;
            let word = parse_word(parts[1])?;
            let actual = panel.read_word(addr)?;
            if word != actual {
                return Err(ProgError { message: format!("ERROR: verification failed at {:03X}: expected {:03X}, got {:03X}", addr, word, actual) })
            };
            count += 1;
        } else if line.len() > 0 {
            return Err(ProgError { message: format!("ERROR: invalid line: {}", line) })
        }
    }
    panel.cleanup()?;
    Ok(count)
}

fn do_read(device_path: &str, filename: &str, start: u16, end: u16) -> Result<usize, ProgError> {
    let panel = create_frontpanel(device_path, true)?;
    let mut data = String::new();
    let mut count = 0;
    for addr in start..=end {
        let word = panel.read_word(addr)?;
        let line = format!("{:03X}:{:03X}\n", addr, word);
        if filename == "-" {
            println!("{}", line);
        } else {
            data += line.as_str();
        }
        count += 1;
    }
    if filename != "-" {
        fs::write(filename, data)?;
    }
    panel.cleanup()?;
    Ok(count)
}

fn main() {
    let action_key = "ACTION";
    let write_action = "write";
    let read_action= "read";
    let verify_action= "verify";
    let file_key = "FILE";
    let start_key = "START";
    let end_key = "END";
    let device_key = "DEVICE";
    let matches = App::new(crate_name!())
        .version(crate_version!())
        .author(crate_authors!())
        .about("A Raspberry Pi Q2 programmer")
        .max_term_width(80)
        .arg(
            Arg::with_name(action_key)
                .possible_values(&[write_action, read_action, verify_action])
                .required(true)
                .help("Action to perform")
        )
        .arg(
            Arg::with_name(file_key)
                .short("-f")
                .long("--file")
                .default_value("out.q2p")
                .help("File name")
        )
        .arg(
            Arg::with_name(start_key)
                .short("-s")
                .long("--start")
                .default_value("000")
                .help("First address to read (hex)")
        )
        .arg(
            Arg::with_name(end_key)
                .short("-e")
                .long("--end")
                .default_value("FFF")
                .help("Last address to read (hex)")
        )
        .arg(
            Arg::with_name(device_key)
                .short("-d")
                .long("--device")
                .default_value(DEFAULT_DEVICE_PATH)
                .help("Device")
        )
        .get_matches();
    let filename = matches.value_of(file_key).unwrap();
    let device_path = matches.value_of(device_key).unwrap();
    if matches.value_of(action_key).unwrap() == write_action {
        match do_write(device_path, filename) {
            Ok(count) => eprintln!("wrote {} words", count),
            Err(e) => eprintln!("write failed: {}", e.message)
        }
    } else if matches.value_of(action_key).unwrap() == verify_action {
        match do_verify(device_path, filename) {
            Ok(count) => eprintln!("verified {} words", count),
            Err(e) => eprintln!("verification failed: {}", e.message)
        }
    } else {
        let start_str = matches.value_of(start_key).unwrap();
        let start = match parse_word(start_str) {
            Ok(v) => v,
            Err(_) => {
                eprintln!("ERROR: invalid start address: {}", start_str);
                return
            }
        };
        let end_str = matches.value_of(end_key).unwrap();
        let end = match parse_word(end_str) {
            Ok(v) => v,
            Err(_) => {
                eprintln!("ERROR: invalid end address: {}", end_str);
                return
            }
        };
        match do_read(device_path, filename, start, end) {
            Ok(count) => eprintln!("read {} words", count),
            Err(e) => eprintln!("read failed: {}", e.message)
        }
    }

}
