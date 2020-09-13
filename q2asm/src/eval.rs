
use super::parser;
use std::collections::HashMap;

pub fn eval(
    addr: i64,
    expr: &parser::Expression,
    symbols: &HashMap<String, parser::Expression>,
    depth: u32
) -> Result<i64, String> {
    let next = depth + 1;
    let value = match expr {
        parser::Expression::Add(a, b)        =>
            eval(addr, a, symbols, next)? + eval(addr, b, symbols, next)?,
        parser::Expression::Sub(a, b)        =>
            eval(addr, a, symbols, next)? - eval(addr, b, symbols, next)?,
        parser::Expression::Mul(a, b)        =>
            eval(addr, a, symbols, next)? * eval(addr, b, symbols, next)?,
        parser::Expression::Div(a, b)        =>
            eval(addr, a, symbols, next)? / eval(addr, b, symbols, next)?,
        parser::Expression::And(a, b)        =>
            eval(addr, a, symbols, next)? & eval(addr, b, symbols, next)?,
        parser::Expression::Or(a, b)         =>
            eval(addr, a, symbols, next)? | eval(addr, b, symbols, next)?,
        parser::Expression::Xor(a, b)        =>
            eval(addr, a, symbols, next)? ^ eval(addr, b, symbols, next)?,
        parser::Expression::Shr(a, b)        =>
            eval(addr, a, symbols, next)? >> eval(addr, b, symbols, next)?,
        parser::Expression::Shl(a, b)        =>
            eval(addr, a, symbols, next)? << eval(addr, b, symbols, next)?,
        parser::Expression::Symbol(s)        => {
            let inner = lookup(s, symbols, next)?;
            eval(addr, inner, symbols, next)?
        },
        parser::Expression::Constant(v)      => *v,
    };
    Ok(value)
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
