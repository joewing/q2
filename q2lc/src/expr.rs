use std::collections::HashSet;
use std::ops::Not;

use crate::builtin::{DIVIDE_NAME, MODULUS_NAME, MULTIPLY_NAME, SHIFT_LEFT_NAME, SHIFT_RIGHT_NAME};
use crate::emit;
use crate::symbol::{SymbolTable, Symbol, Watermark};

pub type Word = u16;

#[derive(Clone, Copy, PartialEq, Debug)]
pub enum UnaryOperator {
    ArrayDecl,
    Deref,
    Not,
    Negate,
    Lnot,
}

#[derive(Clone, Copy, PartialEq, Debug)]
pub enum BinaryOperator {
    Add,
    Sub,
    Mul,
    Div,
    Mod,
    Shl,
    Shr,
    And,
    Or,
    Nor,
    Xor,
    Eq,
    Ne,
    Gt,
    Ge,
    Lt,
    Le,
    Land,
    Lor,
}

#[derive(PartialEq, Clone, Debug)]
pub enum Expression {
    Constant(Word),
    ArrayLiteral(Vec<Expression>),
    Symbol(String),
    Call(Box<Expression>, Vec<Expression>),
    Binary(BinaryOperator, Box<Expression>, Box<Expression>),
    Unary(UnaryOperator, Box<Expression>),
}

impl Expression {

    pub fn used_symbols(&self, funs: &mut HashSet<String>) {
        match self {
            Expression::Constant(_) => (),
            Expression::ArrayLiteral(exprs) => used_functions(exprs, funs),
            Expression::Symbol(s) => {
                funs.insert(s.clone());
            },
            Expression::Call(expr, args) => {
                expr.used_symbols(funs);
                used_functions(args, funs)
            },
            Expression::Binary(_, lhs, rhs) => {
                lhs.used_symbols(funs);
                rhs.used_symbols(funs)
            },
            Expression::Unary(_, inner) => {
                inner.used_symbols(funs)
            },
        }
    }

    pub fn get_watermark(&self, state: &SymbolTable) -> Watermark {
        match self {
            Expression::Constant(_) => SymbolTable::BASE_WATERMARK,
            Expression::ArrayLiteral(exprs) => {
                exprs.iter().fold(
                    SymbolTable::BASE_WATERMARK, |w, e| w.combine(e.get_watermark(state))
                )
            },
            Expression::Symbol(name) => {
                match state.lookup(name) {
                    Ok(Symbol::Function(w, _)) => w,
                    _ => SymbolTable::BASE_WATERMARK,
                }
            },
            Expression::Call(fun, args) => {
                args.iter().fold(
                    fun.get_watermark(state),
                    |w, a| w.combine(a.get_watermark(state))
                )
            },
            Expression::Binary(_, lhs, rhs) => {
                lhs.get_watermark(state).combine(rhs.get_watermark(state))
            },
            Expression::Unary(_, inner) => inner.get_watermark(state),
        }
    }

    pub fn simplify(&self, state: &mut SymbolTable) -> Expression {
        match self {
            Expression::Constant(w) => Expression::Constant(w.clone()),
            Expression::ArrayLiteral(exprs) => Expression::ArrayLiteral(simplify_exprs(exprs, state)),
            Expression::Symbol(s) => match state.lookup(s) {
                Ok(Symbol::Constant(w)) => Expression::Constant(w),
                _ => Expression::Symbol(s.clone())
            },
            Expression::Call(fun, params) => {
                Expression::Call(Box::from(fun.simplify(state)), simplify_exprs(params, state))
            },
            Expression::Binary(op, lhs, rhs) => {
                let new_lhs = lhs.simplify(state);
                let new_rhs = rhs.simplify(state);
                match (&new_lhs, &new_rhs) {
                    (Expression::Constant(a), Expression::Constant(b)) => {
                        let value = match op {
                            BinaryOperator::Add => a.wrapping_add(*b),
                            BinaryOperator::Sub => a.wrapping_sub(*b),
                            BinaryOperator::Mul => a.wrapping_mul(*b),
                            BinaryOperator::Div => a.wrapping_div(*b),
                            BinaryOperator::Mod => a.wrapping_rem(*b),
                            BinaryOperator::Shl => a.wrapping_shl(*b as u32),
                            BinaryOperator::Shr => a.wrapping_shr(*b as u32),
                            BinaryOperator::And => a & b,
                            BinaryOperator::Or => a | b,
                            BinaryOperator::Nor => (a | b).not(),
                            BinaryOperator::Xor => a ^ b,
                            BinaryOperator::Eq => if a == b { 1 } else { 0 },
                            BinaryOperator::Ne => if a != b { 1 } else { 0 },
                            BinaryOperator::Gt => if a > b { 1 } else { 0 },
                            BinaryOperator::Ge => if a >= b { 1 } else { 0 },
                            BinaryOperator::Lt => if a < b { 1 } else { 0 },
                            BinaryOperator::Le => if a <= b { 1 } else { 0 },
                            BinaryOperator::Land => if *a != 0 && *b != 0 { 1 } else { 0 },
                            BinaryOperator::Lor => if *a != 0 || *b != 0 { 1 } else { 0 },
                        };
                        Expression::Constant(value & 0xFFF)
                    },
                    _ => match op {
                        BinaryOperator::Shl if !is_constant(&new_rhs, 1) =>
                            create_binary_function(SHIFT_LEFT_NAME, new_lhs, new_rhs),
                        BinaryOperator::Shr if !is_constant(&new_rhs, 1) =>
                            create_binary_function(SHIFT_RIGHT_NAME, new_lhs, new_rhs),
                        BinaryOperator::Mul =>
                            create_binary_function(MULTIPLY_NAME, new_lhs, new_rhs),
                        BinaryOperator::Div =>
                            create_binary_function(DIVIDE_NAME, new_lhs, new_rhs),
                        BinaryOperator::Mod =>
                            create_binary_function(MODULUS_NAME, new_lhs, new_rhs),
                        _ => Expression::Binary(*op, Box::from(new_lhs), Box::from(new_rhs)),
                    },
                }
            },
            Expression::Unary(op, inner) => {
                let new_inner = inner.simplify(state);
                if let Expression::Constant(a) = new_inner {
                    match op {
                        UnaryOperator::Not => Expression::Constant(a.not() & 0xFFF),
                        UnaryOperator::Negate => Expression::Constant((a.not() + 1) & 0xFFF),
                        UnaryOperator::Lnot => Expression::Constant(if a != 0 { 0 } else { 1 }),
                        _ => Expression::Unary(*op, Box::from(new_inner))
                    }
                } else if *op == UnaryOperator::Not {
                    if let Expression::Binary(BinaryOperator::Or, b, c) = new_inner {
                        Expression::Binary(BinaryOperator::Nor, b, c)
                    } else {
                        Expression::Unary(*op, Box::from(new_inner))
                    }
                } else {
                    Expression::Unary(*op, Box::from(new_inner))
                }
            },
        }
    }

    pub fn emit(&self, state: &mut SymbolTable) -> Result<bool, String> {
        match self {
            Expression::Constant(w) => emit::emit_constant(state, *w),
            Expression::ArrayLiteral(exprs) => emit::emit_array_literal(state, exprs),
            Expression::Symbol(s) => emit::emit_symbol(s, state),
            Expression::Call(fun, args) => emit::emit_call(fun, args, state),
            Expression::Binary(op, l, r) => {
                let lhs = l.as_ref();
                let rhs = r.as_ref();
                match op {
                    BinaryOperator::Add => emit::emit_add(lhs, rhs, state),
                    BinaryOperator::Sub => emit::emit_sub(lhs, rhs, state),
                    BinaryOperator::And => emit::emit_and(lhs, rhs, state),
                    BinaryOperator::Or  => emit::emit_or(lhs, rhs, state),
                    BinaryOperator::Xor => emit::emit_xor(lhs, rhs, state),
                    BinaryOperator::Nor => emit::emit_nor(lhs, rhs, state),
                    BinaryOperator::Shr => emit::emit_shr(lhs, rhs, state),
                    BinaryOperator::Shl => emit::emit_shl(lhs, rhs, state),
                    BinaryOperator::Eq => emit::emit_eq(lhs, rhs, state),
                    BinaryOperator::Ne => emit::emit_ne(lhs, rhs, state),
                    BinaryOperator::Gt => emit::emit_gt(lhs, rhs, state),
                    BinaryOperator::Ge => emit::emit_ge(lhs, rhs, state),
                    BinaryOperator::Lt => emit::emit_lt(lhs, rhs, state),
                    BinaryOperator::Le => emit::emit_le(lhs, rhs, state),
                    BinaryOperator::Land => emit::emit_land(state, lhs, rhs),
                    BinaryOperator::Lor => emit::emit_lor(state, lhs, rhs),
                    _ => panic!("not implemented"),
                }
            },
            Expression::Unary(op, inner) => match op {
                UnaryOperator::Deref => emit::emit_deref(inner.as_ref(), state),
                UnaryOperator::Not => emit::emit_not(inner.as_ref(), state),
                UnaryOperator::Negate => emit::emit_negate(inner.as_ref(), state),
                UnaryOperator::Lnot => emit::emit_lnot(inner.as_ref(), state),
                UnaryOperator::ArrayDecl => emit::emit_array_decl(state, inner.as_ref()),
            },
        }
    }
}

fn create_binary_function(name: &str, lhs: Expression, rhs: Expression) -> Expression {
    Expression::Call(
        Box::from(Expression::Symbol(name.to_string())),
        vec![lhs, rhs]
    )
}

fn is_constant(expr: &Expression, value: Word) -> bool {
    if let Expression::Constant(w) = expr {
        *w == value
    } else {
        false
    }
}

fn used_functions(exprs: &Vec<Expression>, symbols: &mut HashSet<String>) {
    exprs.iter().for_each(|e| e.used_symbols(symbols));
}

fn simplify_exprs(exprs: &Vec<Expression>, state: &mut SymbolTable) -> Vec<Expression> {
    exprs.iter().map(|e| e.simplify(state)).collect()
}

#[cfg(test)]
mod tests {
    use test_case::test_case;
    use crate::expr::*;
    use crate::parser;
    use crate::symbol::SymbolTable;

    #[test_case("5 + 3", Expression::Constant(8))]
    #[test_case("1 * 2 + 3", Expression::Constant(5))]
    #[test_case("2 - 3", Expression::Constant(0xFFF))]
    #[test_case("1 + 2 * 3", Expression::Constant(7))]
    #[test_case("1 + 2 + x", Expression::Binary(BinaryOperator::Add, Box::from(Expression::Constant(3)), Box::from(Expression::Symbol("x".to_string()))))]
    fn simplify_tests(input: &str, expected: Expression) {
        let expr = parser::tests::parse_expr_str(input).unwrap();
        let mut symbols = SymbolTable::new();
        assert_eq!(expr.simplify(&mut symbols), expected)
    }
}
