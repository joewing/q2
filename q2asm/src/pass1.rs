use std::collections::HashMap;
use crate::parser::{Expression, Statement, StatementWithContext};

pub fn pass1(statements: &Vec<StatementWithContext>) -> HashMap<String, Expression> {
    let mut result = HashMap::new();
    let mut addr: i64 = 0;
    let mut origin = Expression::Constant(0);

    for st in statements {
        match &st.statement {
            Statement::Define(s, expr)          => {
                result.insert(s.clone(), expr.clone());
            },
            Statement::Instruction(_, _, _)     => addr += 1,
            Statement::Word(expr)               => addr += expr.len() as i64,
            Statement::Reserve(expr)            => {
                origin = Expression::Add(
                    Box::new(expr.clone()),
                    Box::new(origin.clone())
                );
            },
            Statement::Origin(expr)             => {
                addr = 0;
                origin = expr.clone();
            },
            Statement::Align(expr) => {
                // addr + expr - addr % expr
                origin = Expression::Add(
                    Box::new(origin.clone()),
                    Box::new(
                        Expression::Sub(
                            Box::new(expr.clone()),
                            Box::new(
                                Expression::Mod(
                                    Box::new(
                                        Expression::Add(
                                            Box::new(Expression::Constant(addr)),
                                            Box::new(origin.clone())
                                        )
                                    ),
                                    Box::new(expr.clone())
                                )
                            )
                        )
                    )
                );
            },
            Statement::Bank(_)                  => {
                addr = 0;
                origin = Expression::Constant(0);
            },
            Statement::Label(s)                 => {
                // Current position in the file is the address plus the last origin.
                let pos = Expression::Add(
                    Box::new(origin.clone()),
                    Box::new(Expression::Constant(addr))
                );
                result.insert(s.clone(), pos);
            },
            Statement::Macro(_, _) => (),
        }
    }

    result
}

mod tests {
    use super::*;

    #[test]
    fn test_define() {
        let map = pass1(&vec![
            StatementWithContext {
                file: String::from("file"),
                line: 1,
                statement: Statement::Define(String::from("asdf"), Expression::Constant(3))
            }
        ]);
        assert_eq!(map.get("asdf"), Some(&Expression::Constant(3)))
    }
}
