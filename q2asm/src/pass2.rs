use crate::parser::{Statement, Expression, AddressMode, InstructionType};
use std::collections::HashMap;
use crate::eval::eval;

fn mode_bits(m: &AddressMode, load: bool) -> u16 {
    let load_mask = if load { 0b010 } else { 0b000 };
    match m {
        AddressMode::Immediate          =>  0b100,
        AddressMode::Relative           =>  0b000 | load_mask,
        AddressMode::Indirect           =>  0b001 | load_mask,
        AddressMode::ZeroPage           =>  0b100 | load_mask,
        AddressMode::ZeroPageIndirect   =>  0b101 | load_mask,
        AddressMode::Invalid            =>  0b000
    }
}

fn emit_instruction(
    addr: u64,
    i: &InstructionType,
    m: &AddressMode,
    offset: u64
) -> Result<u16, String> {
    let opcode = (*i as u16) << 12;
    let load = (opcode & 0x8000) != 0;
    let mode = mode_bits(m, load) << 9;
    let page = addr & !0x01ff;
    let value = match m {
        AddressMode::Immediate          => offset,
        AddressMode::Relative           => offset - page,
        AddressMode::ZeroPage           => offset,
        AddressMode::ZeroPageIndirect   => offset,
        AddressMode::Indirect           => offset - page,
        AddressMode::Invalid            => 0
    };
    if value > 0x1ff {
        Err(format!("operand {} out of range", value))
    } else {
        Ok(opcode | mode | (value as u16))
    }
}

pub fn pass2(
    statements: &Vec<Statement>,
    symbols: &HashMap<String, Expression>
) -> Result<Vec<u16>, String> {

    let mut result = Vec::new();
    let mut addr = 0;

    for st in statements {
        match st {
            Statement::Define(_, _)         => (),
            Statement::Label(_)             => (),
            Statement::Origin(e)            => {
                addr = eval(addr, e, symbols, 0)?;
            },
            Statement::Instruction(i, m, e) => {
                let offset = eval(addr, e, symbols, 0)?;
                let code = emit_instruction(addr, i, m, offset)?;
                result.push(code);
                addr += 1;
            },
            Statement::Word(e)              => {
                let word = eval(addr, e, symbols, 0)?;
                if word > 0xffff {
                    return Err(format!("word {} out of range", word));
                }
                result.push(word as u16);
                addr += 1;
            }
        }
    }

    Ok(result)
}
