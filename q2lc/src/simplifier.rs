use std::collections::HashMap;
use std::ops::Not;
use crate::expr::{BinaryOperator, Expression, UnaryOperator, Word};
use crate::statement::Statement;
use crate::visitor::StatementVisitor;

pub struct Simplifier {
    constants: HashMap<String, Word>
}

impl Simplifier {
    pub fn simplify(statements: &Vec<Statement>) -> Result<Vec<Statement>, String> {
        let mut simplifier = Simplifier {
            constants: HashMap::new()
        };
        simplifier.visit_statements(statements)
    }
}

impl StatementVisitor for Simplifier {

    fn visit_symbol(&mut self, name: &String) -> Result<Expression, String> {
        if let Some(word) = self.constants.get(name) {
            wrap(*word)
        } else {
            self.visit_symbol_default(name)
        }
    }

    fn visit_const(&mut self, name: &String, expr: &Expression) -> Result<Statement, String> {
        let new_expr = self.visit_expr(expr)?;
        if let Expression::Constant(word) = new_expr {
            self.constants.insert(name.clone(), word);
        }
        self.visit_const_default(name, expr)
    }

    fn visit_binary(&mut self, op: BinaryOperator, lhs: &Expression, rhs: &Expression) -> Result<Expression, String> {
        let new_lhs = self.visit_expr(lhs)?;
        let new_rhs = self.visit_expr(rhs)?;
        match (&new_lhs, &new_rhs) {
            (Expression::Constant(a), Expression::Constant(b)) => {
                match op {
                    BinaryOperator::Add => wrap(a.wrapping_add(*b)),
                    BinaryOperator::Sub => wrap(a.wrapping_sub(*b)),
                    BinaryOperator::Mul => wrap(a.wrapping_mul(*b)),
                    BinaryOperator::Div => wrap(a.wrapping_div(*b)),
                    BinaryOperator::Mod => wrap(a.wrapping_rem(*b)),
                    BinaryOperator::Shl => wrap(a.wrapping_shl(*b as u32)),
                    BinaryOperator::Shr => wrap(a.wrapping_shr(*b as u32)),
                    BinaryOperator::And => wrap(a & b),
                    BinaryOperator::Or => wrap(a | b),
                    BinaryOperator::Nor => wrap((a | b).not()),
                    BinaryOperator::Xor => wrap(a ^ b),
                    BinaryOperator::Eq => wrap(if a == b { 1 } else { 0 }),
                    BinaryOperator::Ne => wrap(if a != b { 1 } else { 0 }),
                    BinaryOperator::Gt => wrap(if a > b { 1 } else { 0 }),
                    BinaryOperator::Ge => wrap(if a >= b { 1 } else { 0 }),
                    BinaryOperator::Lt => wrap(if a < b { 1 } else { 0 }),
                    BinaryOperator::Le => wrap(if a <= b { 1 } else { 0 }),
                    BinaryOperator::Land => wrap(if *a != 0 && *b != 0 { 1 } else { 0 }),
                    BinaryOperator::Lor => wrap(if *a != 0 || *b != 0 { 1 } else { 0 }),
                }
            },
            _ => Ok(Expression::Binary(op, Box::new(new_lhs), Box::new(new_rhs)))
        }
    }

    fn visit_unary(&mut self, op: UnaryOperator, inner: &Expression) -> Result<Expression, String> {
        let new_inner = self.visit_expr(inner)?;
        if let Expression::Constant(a) = new_inner {
            match op {
                UnaryOperator::Not => wrap(a.not() & 0xFFF),
                UnaryOperator::Negate => wrap((a.not() + 1) & 0xFFF),
                UnaryOperator::Lnot => wrap(if a != 0 { 0 } else { 1 }),
                _ => Ok(Expression::Unary(op, Box::new(new_inner)))
            }
        } else if op == UnaryOperator::Not {
            if let Expression::Binary(BinaryOperator::Or, b, c) = new_inner {
                Ok(Expression::Binary(BinaryOperator::Nor, b, c))
            } else {
                Ok(Expression::Unary(op, Box::new(new_inner)))
            }
        } else {
            Ok(Expression::Unary(op, Box::new(new_inner)))
        }
    }
}

fn wrap(word: Word) -> Result<Expression, String> {
    Ok(Expression::Constant(word))
}
