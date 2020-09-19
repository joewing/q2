use std::collections::HashMap;
use crate::parser::{Expression, Statement};

pub fn pass1(statements: &Vec<Statement>) -> HashMap<String, Expression> {
    let mut result = HashMap::new();
    let mut addr = 0;
    let mut origin = Expression::Constant(0);

    for st in statements {
        match st {
            Statement::Define(s, expr)          => {
                result.insert(s.clone(), expr.clone());
            },
            Statement::Instruction(_, _, _)     => addr += 1,
            Statement::Word(_)                  => addr += 1,
            Statement::Reserve(expr)            => {
                origin = Expression::Add(
                    Box::new(expr.clone()),
                    Box::new(Expression::Constant(addr))
                );
                addr = 0;
            },
            Statement::Origin(expr)             => {
                addr = 0;
                origin = expr.clone();
            },
            Statement::Align(expr) => {
                // addr + expr - addr % expr
                origin = Expression::Add(
                    Box::new(Expression::Constant(addr)),
                    Box::new(
                        Expression::Sub(
                            Box::new(expr.clone()),
                            Box::new(
                                Expression::Mod(
                                    Box::new(Expression::Constant(addr)),
                                    Box::new(expr.clone())
                                )
                            )
                        )
                    )
                );
                addr = 0;
            },
            Statement::Label(s)                 => {
                // Current position in the file is the address plus the last origin.
                let pos = Expression::Add(
                    Box::new(origin.clone()),
                    Box::new(Expression::Constant(addr))
                );
                result.insert(s.clone(), pos);
            },
        }
    }

    result
}

mod tests {
    use super::*;

    #[test]
    fn test_define() {
        let map = pass1(&vec![Statement::Define(String::from("asdf"), Expression::Constant(3))]);
        assert_eq!(map.get("asdf"), Some(&Expression::Constant(3)))
    }
}
