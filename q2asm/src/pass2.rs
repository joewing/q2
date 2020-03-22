use crate::parser::{Statement, Expression, AddressMode, InstructionType};
use std::collections::HashMap;
use crate::eval::eval;

fn mode_bits(m: &AddressMode, load: bool) -> u16 {
    // Format: T FFF L D Z XXXXXXXXX
    let load_mask = if load { 0b100 } else { 0b000 };
    match m {
        //                                    LDZ
        AddressMode::Immediate          =>  0b001,
        AddressMode::Relative           =>  0b000 | load_mask,
        AddressMode::Indirect           =>  0b010 | load_mask,
        AddressMode::ZeroPage           =>  0b001 | load_mask,
        AddressMode::ZeroPageIndirect   =>  0b011 | load_mask
    }
}

fn emit_instruction(
    addr: u64,
    i: &InstructionType,
    m: &AddressMode,
    offset: u64
) -> Result<u16, String> {
    let opcode = (*i as u16) << 12;
    let load = (opcode & 0x8000) == 0;
    let mode = mode_bits(m, load) << 9;
    let page = addr & !0x01ff;
    let value = match m {
        AddressMode::Immediate          => offset,
        AddressMode::Relative           => offset - page,
        AddressMode::ZeroPage           => offset,
        AddressMode::ZeroPageIndirect   => offset,
        AddressMode::Indirect           => offset - page
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
) -> Result<Vec<(u64, Statement, Option<u16>)>, String> {

    let mut result: Vec<(u64, Statement, Option<u16>)> = Vec::new();
    let mut addr: u64 = 0;

    for st in statements {
        match st {
            Statement::Define(_, _)         => result.push((addr, st.clone(), None)),
            Statement::Label(_)             => result.push((addr, st.clone(), None)),
            Statement::Origin(e)            => {
                addr = eval(addr, e, symbols, 0)?;
                result.push((addr, st.clone(), None));
            },
            Statement::Instruction(i, m, e) => {
                let offset = eval(addr, e, symbols, 0)?;
                let code = emit_instruction(addr, i, m, offset)?;
                result.push((addr, st.clone(), Some(code)));
                addr += 1;
            },
            Statement::Word(e)              => {
                let word = eval(addr, e, symbols, 0)?;
                if word > 0xffff {
                    return Err(format!("word {} out of range", word));
                }
                result.push((addr, st.clone(), Some(word as u16)));
                addr += 1;
            }
        }
    }

    Ok(result)
}
