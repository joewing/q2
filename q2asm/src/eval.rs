
use super::parser;
use super::parser::Expression;

use std::collections::HashMap;

fn reduce_binop(
    addr: i64,
    expr: &Expression,
    left: &Expression,
    right: &Expression,
    symbols: &HashMap<String, Expression>,
    depth: u32,
    func: impl Fn(i64, i64) -> i64
) -> (Expression, Option<String>) {
    let (simp_left, msg_left) = reduce(addr, left, symbols, depth);
    let (simp_right, msg_right) = reduce(addr, right, symbols, depth);
    let msg = msg_left.or(msg_right);
    match (simp_left, simp_right) {
        (Expression::Constant(va), Expression::Constant(vb)) => {
            let result = func(va, vb);
            (Expression::Constant(result), msg)
        },
        _ => (expr.clone(), msg)
    }
}

fn reduce(
    addr: i64,
    expr: &Expression,
    symbols: &HashMap<String, Expression>,
    depth: u32
) -> (Expression, Option<String>) {
    let next = depth + 1;
    match expr {
        Expression::Add(a, b) => reduce_binop(addr, expr, a, b, symbols, next, move |a, b| a + b),
        Expression::Sub(a, b) => reduce_binop(addr, expr, a, b, symbols, next, move |a, b| a - b),
        Expression::Mul(a, b) => reduce_binop(addr, expr, a, b, symbols, next, move |a, b| a * b),
        Expression::Div(a, b) => reduce_binop(addr, expr, a, b, symbols, next, move |a, b| a / b),
        Expression::Mod(a, b) => reduce_binop(addr, expr, a, b, symbols, next, move |a, b| a % b),
        Expression::And(a, b) => reduce_binop(addr, expr, a, b, symbols, next, move |a, b| a & b),
        Expression::Or(a, b)  => reduce_binop(addr, expr, a, b, symbols, next, move |a, b| a | b),
        Expression::Xor(a, b) => reduce_binop(addr, expr, a, b, symbols, next, move |a, b| a ^ b),
        Expression::Shr(a, b) => reduce_binop(addr, expr, a, b, symbols, next, move |a, b| a >> b),
        Expression::Shl(a, b) => reduce_binop(addr, expr, a, b, symbols, next, move |a, b| a << b),
        Expression::Negate(a)        => match reduce(addr, a, symbols, next) {
            (Expression::Constant(v), msg) => (Expression::Constant(-v), msg),
            (simplified, msg) => (simplified, msg)
        },
        Expression::Not(a)           => match reduce(addr, a, symbols, next) {
            (Expression::Constant(v), msg) => (Expression::Constant(!v), msg),
            (simplified, msg) => (simplified, msg)
        },
        Expression::Symbol(s) => match lookup(s, symbols, next) {
            Ok(inner) => reduce(addr, inner, symbols, next),
            Err(msg) => (expr.clone(), Some(msg))
        },
        Expression::Constant(v)    => (Expression::Constant(*v), None),
        Expression::CurrentAddress => (Expression::Constant(addr), None),
    }
}

pub fn simplify(
    addr: i64,
    expr: &Expression,
    symbols: &HashMap<String, Expression>
) -> Expression {
    let (simplified, _) = reduce(addr, expr, symbols, 0);
    simplified
}

pub fn eval(
    addr: i64,
    expr: &parser::Expression,
    symbols: &HashMap<String, parser::Expression>
) -> Result<i64, String> {
    match reduce(addr, expr, symbols, 0) {
        (Expression::Constant(v), None) => Ok(v),
        (_, Some(msg)) => Err(msg),
        _ => Err(format!("invalid expression"))
    }
}

fn lookup<'a>(
    key: &str,
    symbols: &'a HashMap<String, parser::Expression>,
    depth: u32
) -> Result<&'a parser::Expression, String> {
    let max_depth = 16;
    if depth > max_depth {
        Err(format!("exceeded max depth ({}) evaluating {}", max_depth, key))
    } else {
        match symbols.get(key) {
            Some(v) => Ok(v),
            None => Err(format!("{} not found", key))
        }
    }
}
