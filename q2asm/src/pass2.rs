use crate::parser::{Statement, Expression, InstructionType, AddressMode, StatementWithContext};
use std::collections::HashMap;
use crate::eval::eval;

pub struct CompiledStatement {
    pub bank: i64,
    pub addr: i64,
    pub code: Option<u16>,
    pub statement: Statement,
    pub line: String
}

impl CompiledStatement {
    pub fn full_addr(&self) -> i64 {
        (self.bank << 12) | self.addr
    }
}

fn mode_bits(mode: &AddressMode) -> u16 {
    match mode {
        AddressMode::Relative         => 0b00,
        AddressMode::ZeroPage         => 0b01,
        AddressMode::RelativeIndirect => 0b10,
        AddressMode::ZeroPageIndirect => 0b11,
        AddressMode::Immediate        => 0b00,
        AddressMode::ImmediateIndirect=> 0b10,
    }
}

fn check_addr_range(value: i64, st: &StatementWithContext) -> Result<u16, String> {
    if value < 0 || value > 127 {
        st.error(format!("operand out of range: {}", value))
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
    st: &StatementWithContext
) -> Result<u16, String> {
    let opcode = ((*i as u16) << 9) | (mode_bits(mode) << 7);
    let operand = eval(addr, expr, symbols)?;
    let offset = match mode {
        AddressMode::Relative | AddressMode::RelativeIndirect | AddressMode::Immediate | AddressMode::ImmediateIndirect => {
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
    statements: &Vec<StatementWithContext>,
    symbols: &HashMap<String, Expression>
) -> Result<Vec<CompiledStatement>, String> {

    let mut result: Vec<CompiledStatement> = Vec::new();
    let mut addr: i64 = 0;
    let mut bank: i64 = 0;

    for st in statements {
        let line = st.line.clone();
        match &st.statement {
            Statement::Define(_, _)         => result.push(
                CompiledStatement { bank, addr, statement: st.statement.clone(), code: None, line }
            ),
            Statement::Label(_)             => result.push(
                CompiledStatement { bank, addr, statement: st.statement.clone(), code: None, line }
            ),
            Statement::Origin(e)            => {
                addr = eval(addr, &e, symbols)?;
                result.push(
                    CompiledStatement { bank, addr, statement: st.statement.clone(), code: None, line }
                );
            },
            Statement::Align(e)             => {
                let alignment = eval(addr, &e, symbols)?;
                if (addr % alignment) != 0 {
                    addr += alignment - addr % alignment;
                }
                result.push(
                    CompiledStatement { bank, addr, statement: st.statement.clone(), code: None, line }
                );
            },
            Statement::Bank(e) => {
                bank = eval(addr, &e, symbols)?;
                result.push(
                    CompiledStatement { bank, addr, statement: st.statement.clone(), code: None, line }
                );
            },
            Statement::Instruction(inst, mode, op) => {
                let word = emit_instruction(addr, &inst, &mode, &op, symbols, &st)?;
                result.push(
                    CompiledStatement { bank, addr, statement: st.statement.clone(), code: Some(word), line }
                );
                addr += 1;
            },
            Statement::Word(es)              => {
                let mut current_line = line;
                for e in es {
                    let word = eval(addr, &e, symbols)?;
                    if word > 0xfff {
                        return st.error(format!("word {} out of range", word));
                    }
                    result.push(
                        CompiledStatement {
                            bank,
                            addr,
                            statement: Statement::Word(vec![e.clone()]),
                            code: Some((word & 0xfff) as u16),
                            line: current_line.clone()
                        }
                    );
                    current_line.clear();
                    addr += 1;
                }
            },
            Statement::Reserve(e)           => {
                let count = eval(addr, &e, symbols)?;
                result.push(
                    CompiledStatement { bank, addr, statement: st.statement.clone(), code: None, line }
                );
                addr += count;
            }
        }
    }

    Ok(result)
}
