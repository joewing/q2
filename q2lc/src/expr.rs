
use crate::emit;
use crate::symbol::SymbolTable;

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
                    BinaryOperator::Mul => emit::emit_mul(state, lhs, rhs),
                    BinaryOperator::Div => emit::emit_div(state, lhs, rhs),
                    BinaryOperator::Mod => emit::emit_mod(state, lhs, rhs),
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
