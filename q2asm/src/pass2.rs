use crate::parser::{Statement, Expression, InstructionType, AddressMode};
use std::collections::HashMap;
use crate::eval::eval;
use crate::parser::Listing;

fn load_bit(i: &InstructionType) -> u16 {
    match i {
        InstructionType::Lda => 0b100,
        InstructionType::Nor => 0b100,
        InstructionType::Add => 0b100,
        InstructionType::Shr => 0b100,
        _  => 0b000
    }
}

fn mode_bits(i: &InstructionType, mode: &AddressMode) -> u16 {
    match mode {
        AddressMode::ImmediateAddress => 0b000,
        AddressMode::Immediate        => 0b001,
        AddressMode::Relative         => 0b000 | load_bit(i),
        AddressMode::ZeroPage         => 0b001 | load_bit(i),
        AddressMode::RelativeIndirect => 0b010 | load_bit(i),
        AddressMode::ZeroPageIndirect => 0b011 | load_bit(i),
    }
}

fn check_imm_range(value: i64, st: &Statement) -> Result<u16, String> {
    if value < -32 || value > 31 {
        Err(format!("{}: operand out of range: {}", st.emit_listing(), value))
    } else {
        Ok((value & 0x3f) as u16)
    }
}

fn check_addr_range(value: i64, st: &Statement) -> Result<u16, String> {
    if value < 0 || value > 63 {
        Err(format!("{}: operand out of range: {}", st.emit_listing(), value))
    } else {
        Ok(value as u16)
    }
}

fn emit_instruction(
    addr: i64,
    i: &InstructionType,
    mode: &AddressMode,
    expr: &Expression,
    symbols: &HashMap<String, Expression>,
    st: &Statement
) -> Result<u16, String> {
    let opcode = ((*i as u16) << 9) | (mode_bits(i, mode) << 6);
    let operand = eval(addr, expr, symbols, 0)?;
    let offset = match mode {
        AddressMode::Relative | AddressMode::RelativeIndirect | AddressMode::ImmediateAddress => {
            let page = addr & 0xFFC0;
            check_addr_range(operand - page, st)
        },
        AddressMode::ZeroPage | AddressMode::ZeroPageIndirect => {
            check_addr_range(operand, st)
        },
        AddressMode::Immediate => {
            check_imm_range(operand, st)
        }
    }?;
    Ok(opcode | offset)
}

pub fn pass2(
    statements: &Vec<Statement>,
    symbols: &HashMap<String, Expression>
) -> Result<Vec<(i64, Statement, Option<u16>)>, String> {

    let mut result: Vec<(i64, Statement, Option<u16>)> = Vec::new();
    let mut addr: i64 = 0;

    for st in statements {
        match st {
            Statement::Define(_, _)         => result.push((addr, st.clone(), None)),
            Statement::Label(_)             => result.push((addr, st.clone(), None)),
            Statement::Origin(e)            => {
                addr = eval(addr, e, symbols, 0)?;
                result.push((addr, st.clone(), None));
            },
            Statement::Align(e)             => {
                addr = eval(addr, e, symbols, 0)?;
                result.push((addr, st.clone(), None));
            },
            Statement::Instruction(inst, mode, op) => {
                let word = emit_instruction(addr, inst, mode, op, symbols, st)?;
                result.push((addr, st.clone(), Some(word)));
                addr += 1;
            },
            Statement::Word(e)              => {
                let word = eval(addr, e, symbols, 0)?;
                if word > 0xfff {
                    return Err(format!("word {} out of range", word));
                }
                result.push((addr, st.clone(), Some(word as u16)));
                addr += 1;
            },
            Statement::Reserve(e)           => {
                let count = eval(addr, e, symbols, 0)?;
                result.push((addr, st.clone(), None));
                addr += count;
            },
        }
    }

    Ok(result)
}
