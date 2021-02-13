use gpio_cdev::{Chip, LineRequestFlags, MultiLineHandle, LineHandle};
use gpio_cdev::Error;
use std::thread;
use std::time::Duration;
use std::u16;
use std::fs;
use clap::{App, crate_version, crate_authors, crate_name, Arg};

const DEFAULT_DEVICE_PATH: &str = "/dev/gpiochip0";

const OUTPUT_PINS: [u32; 12] = [
    2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13
];
const INPUT_PINS: [u32; 12] = [
    14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25
];
const SET_PIN: u32 = 26;
const DEPOSIT_PIN: u32 = 27;

const DELAY: Duration = Duration::from_millis(50);

pub struct FrontPanel {
    output_lines: MultiLineHandle,
    input_lines: MultiLineHandle,
    set_line: LineHandle,
    deposit_line: LineHandle
}

impl FrontPanel {
    fn press_button(&self, line: &LineHandle) -> Result<(), Error> {
        thread::sleep(DELAY);
        line.set_value(1)?;
        thread::sleep(DELAY);
        line.set_value(0)?;
        thread::sleep(DELAY);
        Ok(())
    }

    fn press_set(&self) -> Result<(), Error> {
        self.press_button(&self.set_line)
    }

    fn press_deposit(&self) -> Result<(), Error> {
        self.press_button(&self.deposit_line)
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
        let temp = self.input_lines.get_values()?;
        for i in 0..12 {
            if temp[i] != 0 {
                result |= 1 << i;
            }
        }
        Ok(result)
    }

    pub fn write_word(&self, addr: u16, word: u16) -> Result<(), Error> {
        self.set_value(addr)?;
        self.press_set()?;
        self.set_value(word)?;
        self.press_deposit()
    }

    pub fn read_word(&self, addr: u16) -> Result<u16, Error> {
        self.set_value(addr)?;
        self.press_set()?;
        self.get_value()
    }
}

pub fn create_frontpanel(device_path: &str) -> Result<FrontPanel, Error> {
    let process_name = "q2prog";
    let mut chip = Chip::new(device_path)?;
    let output_lines = chip.get_lines(&OUTPUT_PINS)?.request(
        LineRequestFlags::OUTPUT | LineRequestFlags::OPEN_DRAIN | LineRequestFlags::ACTIVE_LOW,
        &[0u8; 12],
        process_name
    )?;
    let input_lines = chip.get_lines(&INPUT_PINS)?.request(
        LineRequestFlags::INPUT | LineRequestFlags::ACTIVE_LOW,
        &[0u8, 12],
        process_name
    )?;
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

fn parse_word(word: &str) -> u16 {
    u16::from_str_radix(word, 16).unwrap()
}

fn do_write(device_path: &str, filename: &str) {
    let data = fs::read_to_string(filename).unwrap();
    let panel = create_frontpanel(device_path).unwrap();
    let mut count = 0;
    for line in data.split('\n') {
        let parts: Vec<&str> = line.split(':').collect();
        if parts.len() == 2 {
            let addr = parse_word(parts[0]);
            let word = parse_word(parts[1]);
            panel.write_word(addr, word).unwrap();
            count += 1;
        } else if line.len() > 0 {
            println!("ERROR: invalid line: {}", line);
        }
    }
    println!("wrote {} words", count);
}

fn do_read(device_path: &str, filename: &str, start: u16, end: u16) {
    let panel = create_frontpanel(device_path).unwrap();
    let mut data = String::new();
    for addr in start..=end {
        let word = panel.read_word(addr).unwrap();
        data += format!("{:03X}:{:03X}\n", addr, word).as_str();
    }
    fs::write(filename, data).unwrap();
}

fn main() {
    let action_key = "ACTION";
    let write_action = "write";
    let read_action= "read";
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
                .possible_values(&[write_action, read_action])
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
        do_write(device_path, filename);
    } else {
        let start = parse_word(matches.value_of(start_key).unwrap());
        let end = parse_word(matches.value_of(end_key).unwrap());
        do_read(device_path, filename, start, end);
    }

}
