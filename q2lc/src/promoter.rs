use crate::builtin::{DIVIDE_NAME, MODULUS_NAME, MULTIPLY_NAME, SHIFT_LEFT_NAME, SHIFT_RIGHT_NAME};
use crate::expr::{BinaryOperator, Expression, Word};
use crate::statement::Statement;
use crate::visitor::StatementVisitor;

pub struct Promoter;

impl Promoter {
    pub fn promote(statements: &Vec<Statement>) -> Result<Vec<Statement>, String> {
        let mut promoter = Promoter;
        promoter.visit_statements(statements)
    }
}

impl StatementVisitor for Promoter {
    fn visit_binary(&mut self, op: BinaryOperator, lhs: &Expression, rhs: &Expression) -> Result<Expression, String> {
        let new_lhs = self.visit_expr(lhs)?;
        let new_rhs = self.visit_expr(rhs)?;
        match op {
            BinaryOperator::Shr if !is_constant(&new_rhs, 1) => create_binary_function(SHIFT_RIGHT_NAME, new_lhs, new_rhs),
            BinaryOperator::Shl if !is_constant(&new_rhs, 1) => create_binary_function(SHIFT_LEFT_NAME, new_lhs, new_rhs),
            BinaryOperator::Mul => create_binary_function(MULTIPLY_NAME, new_lhs, new_rhs),
            BinaryOperator::Div => create_binary_function(DIVIDE_NAME, new_lhs, new_rhs),
            BinaryOperator::Mod => create_binary_function(MODULUS_NAME, new_lhs, new_rhs),
            _ => Ok(Expression::Binary(op, Box::new(new_lhs), Box::new(new_rhs))),
        }
    }
}

fn create_binary_function(name: &str, lhs: Expression, rhs: Expression) -> Result<Expression, String> {
    Ok(
        Expression::Call(
            Box::new(Expression::Symbol(name.to_string())),
            vec![lhs, rhs]
        )
    )
}

fn is_constant(expr: &Expression, value: Word) -> bool {
    if let Expression::Constant(w) = expr {
        *w == value
    } else {
        false
    }
}
