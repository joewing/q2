use std::collections::HashMap;
use crate::parser::{Expression, Statement, StatementWithContext, AddressMode};
use crate::eval::{eval, simplify};

struct Pass1 {
    id: i64,
    addr: i64,
    immediates: HashMap<Expression, String>,
    symbols: HashMap<String, Expression>,
    instructions: Vec<StatementWithContext>
}

impl Pass1 {
    fn create_label(&mut self) -> String {
        let label = format!("#L{}", self.id);
        self.id += 1;
        label
    }

    fn insert_immediate(&mut self, statement: &Statement) -> Statement {
        if let Statement::Instruction(t, m, expr) = statement {
            if *m == AddressMode::Immediate || *m == AddressMode::ImmediateIndirect {
                let simplified_expr = simplify(self.addr, expr, &self.symbols);
                match self.immediates.get(&simplified_expr) {
                    Some(s) => Statement::Instruction(*t, *m, Expression::Symbol(s.clone())),
                    None => {
                        let label = self.create_label();
                        self.immediates.insert(simplified_expr, label.clone());
                        Statement::Instruction(*t, *m, Expression::Symbol(label))
                    }
                }
            } else {
                statement.clone()
            }
        } else {
            statement.clone()
        }
    }

    fn dump_immediates(&mut self) {
        for (value, label) in self.immediates.iter() {
            self.symbols.insert(label.clone(), Expression::Constant(self.addr));
            self.instructions.push(
                StatementWithContext {
                    statement: Statement::Word(vec![value.clone()]),
                    file: "".to_string(),
                    line_number: 0,
                    line: "; immediate".to_string()
                }
            );
            self.addr += 1;
        }
        self.immediates.clear();
    }
}

pub fn pass1(statements: Vec<StatementWithContext>) -> Result<(HashMap<String, Expression>, Vec<StatementWithContext>), String> {
    let mut pass = Pass1 {
        id: 0,
        addr: 0,
        immediates: HashMap::new(),
        symbols: HashMap::new(),
        instructions: Vec::new()
    };

    for st in statements {
        match &st.statement {
            Statement::Define(s, expr)          => {
                pass.symbols.insert(s.clone(), simplify(pass.addr, expr, &pass.symbols));
                pass.instructions.push(st.clone());
            },
            Statement::Instruction(_, _, _)     => {
                let updated_statement = StatementWithContext {
                    statement: pass.insert_immediate(&st.statement),
                    ..st
                };
                pass.instructions.push(updated_statement);
                pass.addr += 1;
            },
            Statement::Word(expr)               => {
                pass.addr += expr.len() as i64;
                pass.instructions.push(st.clone());
            },
            Statement::Reserve(expr)            => {
                pass.addr += eval(pass.addr, &expr, &pass.symbols)?;
                pass.instructions.push(st.clone());
            },
            Statement::Origin(expr)             => {
                pass.dump_immediates();
                pass.addr = eval(pass.addr, &expr, &pass.symbols)?;
                pass.instructions.push(st.clone());
            },
            Statement::Align(expr) => {
                pass.dump_immediates();
                let alignment = eval(pass.addr, &expr, &pass.symbols)?;
                if (pass.addr % alignment) != 0 {
                    pass.addr += alignment - pass.addr % alignment;
                }
                pass.instructions.push(st.clone());
            },
            Statement::Bank(_)                  => {
                pass.dump_immediates();
                pass.instructions.push(st.clone());
                pass.addr = 0;
            },
            Statement::Label(s)                 => {
                pass.symbols.insert(s.clone(), Expression::Constant(pass.addr));
                pass.instructions.push(st.clone());
            }
        }
    }

    pass.dump_immediates();

    Ok((pass.symbols, pass.instructions))
}

mod tests {
    use super::*;

    #[test]
    fn test_define() {
        let (map, _) = pass1(vec![
            StatementWithContext {
                file: String::from("file"),
                line_number: 1,
                line: String::from(""),
                statement: Statement::Define(String::from("asdf"), Expression::Constant(3))
            }
        ]).unwrap();
        assert_eq!(map.get("asdf"), Some(&Expression::Constant(3)))
    }
}
