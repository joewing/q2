use crate::parser::{Statement, Expression, InstructionType, AddressMode};
use std::collections::HashMap;
use crate::eval::eval;
use crate::parser::Listing;

fn mode_bits(mode: &AddressMode) -> u16 {
    match mode {
        AddressMode::Relative         => 0b00,
        AddressMode::ZeroPage         => 0b01,
        AddressMode::RelativeIndirect => 0b10,
        AddressMode::ZeroPageIndirect => 0b11,
    }
}

fn check_addr_range(value: i64, st: &Statement) -> Result<u16, String> {
    if value < 0 || value > 127 {
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
    let opcode = ((*i as u16) << 9) | (mode_bits(mode) << 7);
    let operand = eval(addr, expr, symbols, 0)?;
    let offset = match mode {
        AddressMode::Relative | AddressMode::RelativeIndirect => {
            let page = addr & 0xF80;
            check_addr_range(operand - page, st)
        },
        AddressMode::ZeroPage | AddressMode::ZeroPageIndirect => {
            check_addr_range(operand, st)
        },
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
                let alignment = eval(addr, e, symbols, 0)?;
                addr = addr + alignment - addr % alignment;
                result.push((addr, st.clone(), None));
            },
            Statement::Instruction(inst, mode, op) => {
                let word = emit_instruction(addr, inst, mode, op, symbols, st)?;
                result.push((addr, st.clone(), Some(word)));
                addr += 1;
            },
            Statement::Word(es)              => {
                for e in es {
                    let word = eval(addr, e, symbols, 0)?;
                    if word > 0xfff {
                        return Err(format!("word {} out of range", word));
                    }
                    result.push(
                        (addr, Statement::Word(vec![e.clone()]), Some((word & 0xfff) as u16))
                    );
                    addr += 1;
                }
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
