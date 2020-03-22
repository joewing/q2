
extern crate clap;
use clap::{App, Arg, crate_version, crate_name, crate_authors};
use std::fs;
use std::process;
use std::ops::{Shr, BitAnd, BitOr, BitXor};
use std::convert::TryInto;

#[derive(Clone)]
struct State {
    clk: u64,       // Clocks
    a: u16,         // Accumulator
    f: u8,          // Flag register
    p: u16,         // Program counter
    x: u16,         // Operand
    o: u8,          // Opcode (7 bits)
    s: u8,          // State
    halted: bool,
    ram: Vec<u16>
}

fn show_int<T: Into<u64>>(raw: T, bits: usize) -> String {
    let mut result = String::new();
    let v: u64 = Into::into(raw);
    for i in 0..bits {
        if (v >> ((bits - i - 1) as u64) & 1) != 0 {
            result.push('*');
        } else {
            result.push('-');
        }
    }
    result
}

impl State {

    fn new(program: &Vec<u8>) -> State {
        let program_size = program.len() / 2;
        let mut ram: Vec<u16> = Vec::new();
        for i in 0..program_size {
            let high = program[i * 2] as u16;
            let low = program[i * 2 + 1] as u16;
            ram.push((high << 8) | low);
        }
        State {
            clk: 0,
            a: 0,
            f: 0,
            p: 0,
            x: 0,
            o: 0,
            s: 0,
            halted: false,
            ram
        }
    }

    fn display(&self) -> () {
        println!("Clocks: {}, State: {}", self.clk, show_int(self.s, 2));
        println!("A: {} {}", show_int(self.f as u16, 1), show_int(self.a, 16));
        println!("X:   {}", show_int(self.x, 16));
        println!("P:   {}", show_int(self.p, 16));
        println!();
    }

    fn step(&self) -> State {
        let mut updated = self.clone();

        let mut abus: u16 = 0xffff;
        let mut dbus: u16 = 0xffff;

        // Decode state.
        let state_fetch = self.s == 0;
        let state_load = self.s == 1;
        let state_deref = self.s == 2;
        let state_exec = self.s == 3;

        // Decode bus drivers.
        let rdp_abus = state_fetch;
        let rdx_abus = !state_fetch;
        let ram_oe = !state_exec;
        if rdp_abus {
            abus = self.p;
        }
        if rdx_abus {
            abus = self.x;
        }
        if ram_oe && (abus as usize) < self.ram.len() {
            dbus = self.ram[abus as usize];
        }

        // Decode opcode (note that the zero-page flag references ram direclty).
        // o is organized as:
        // 6 543 2 1 0
        // T FFF L D Z
        let dbus_operand = dbus >> 9;
        let type0 = (self.o & (1 << 6)) == 0;
        let type1 = (self.o & (1 << 6)) != 0;
        let func = (self.o >> 3) & 7;
        let load_bit = (self.o & 4) != 0;
        let deref_bit = (self.o & 2) != 0;
        let zp_bit = (dbus_operand & 1) != 0;

        let pin_next = state_fetch;
        let pin_x = state_exec;
        let wra = state_exec && type0;
        let ram_we = state_exec && type1 && func == 1;
        let rda_dbus = state_exec && type1 && func == 1;
        let xhin_abus = state_fetch && !zp_bit;
        let xhin_dbus = state_load || state_deref;
        let wrn = state_fetch
            || (state_exec && type1 && func == 4)
            || (state_exec && type1 && func == 3 && self.f != 0)
            || (state_exec && type1 && func == 2 && self.f == 0);
        let wrx = (state_deref && deref_bit)
            || (state_load && load_bit)
            || state_fetch;
        updated.halted = state_exec && type1 && func == 7;
        let wro = state_fetch;
        if rda_dbus {
            dbus = self.a;
        }

        if wro { updated.o = dbus_operand as u8 }
        if wra {
            match func {
                0 => {  // Ld
                    updated.a = self.x;
                    updated.f = if updated.a != 0 { 1 } else { 0 };
                }
                1 => {  // Not
                    updated.a = self.x.bitxor(0xffff);
                    updated.f = if updated.a != 0 { 1 } else { 0 };
                }
                2 => {  // And
                    updated.a = self.a.bitand(self.x);
                    updated.f = if updated.a != 0 { 1 } else { 0 };
                }
                3 => {  // Or
                    updated.a = self.a.bitor(self.x);
                    updated.f = if updated.a != 0 { 1 } else { 0 };
                }
                4 => {  // Xor
                    updated.a = self.a.bitxor(self.x);
                    updated.f = if updated.a != 0 { 1 } else { 0 };
                }
                5 => {  // Add
                    updated.f = if ((self.x as u32) + (self.a as u32) >> 16) != 0 { 1 } else { 0 };
                    updated.a = self.x.wrapping_add(self.a);
                }
                6 => {  // Sub
                    updated.f = if self.x > self.a { 1 } else { 0 };
                    updated.a = self.a.wrapping_sub(self.x);
                }
                7 => {  // Shr
                    updated.f = (self.x & 1) as u8;
                    updated.a = self.x >> 1;
                }
                _ => panic!("invalid func: {}", func)
            }
        }
        if wrn {
            if pin_next { updated.p = updated.p + 1; }
            else if pin_x { updated.p = self.x; }
            else { panic!("no input for p"); }
        }
        if wrx {
            let xh = if xhin_abus { abus } else if xhin_dbus { dbus } else { 0 };
            let xl = dbus;
            updated.x = (xh & 0xfe00) | (xl & 0x01ff);
        }
        if ram_we {
            updated.ram[abus as usize] = dbus;
        }

        updated.s = match self.s {
            0 => 1,
            1 => 2,
            2 => 3,
            3 => 0,
            _ => panic!("invalid state: {}", self.s)
        };

        updated
    }
}

fn main() {

    let input_key = "INPUT";
    let freq_key = "FREQ";
    let clks_key = "CLKS";
    let matches = App::new(crate_name!())
        .version(crate_version!())
        .author(crate_authors!())
        .arg(Arg::with_name(input_key).required(true))
        .arg(Arg::with_name(freq_key)
            .short("f")
            .long("frequency")
            .default_value("100")
            .help("Clock frequency in Hz")
            .validator(|s|
                s.parse::<u32>().map(|_| ()).map_err(|_| format!("invalid frequency: {}", s))
            )
        )
        .arg(Arg::with_name(clks_key)
            .short("m")
            .long("max_clks")
            .default_value("1000000")
            .help("Max clock cycles")
            .validator(|s|
                s.parse::<u64>().map(|_| ()).map_err(|_| format!("invalid max_clks: {}", s))
            )
        )
        .get_matches();

    let input_name = matches.value_of(input_key).unwrap();
    let freq = matches.value_of(freq_key).unwrap().parse::<f32>().unwrap();
    let max_clks = matches.value_of(clks_key).unwrap().parse::<u64>().unwrap();
    let program = fs::read(&input_name).unwrap_or_else(
        |e| {
            eprintln!("error reading input: {}", e);
            process::exit(-1)
        }
    );
    let mut state = State::new(&program);

    state.display();
    loop {
        if state.s == 0 && (state.p as usize) >= state.ram.len() {
            println!("program counter out of range");
            break;
        }
        state = state.step();
        state.display();
        if state.halted {
            println!("halted");
            break;
        }
        if freq > 0.0 {
            std::thread::sleep(std::time::Duration::from_secs_f32(1.0 / freq));
        }
        state.clk += 1;
        if state.clk > max_clks {
            break;
        }
    }
}
