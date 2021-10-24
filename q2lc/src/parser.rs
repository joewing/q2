extern crate nom;

use nom::{combinator::*, character::*, branch::*, bytes::complete::*};
use std::str::FromStr;
use std::fs;

use crate::expr::{BinaryOperator, Expression, UnaryOperator, Word};
use crate::statement::Statement;
use self::nom::IResult;
use self::nom::error::{context, VerboseError, VerboseErrorKind};
use self::nom::multi::{many0, separated_list0};
use self::nom::sequence::tuple;

type Res<I, O> = IResult<I, O, VerboseError<I>>;

fn eat_comment(input: &str) -> Res<&str, char> {
    let (input, ch) = nom::character::complete::char('#')(input)?;
    let (input, _) = take_while(|c| c != '\n' && c != '\r')(input)?;
    Ok((input, ch))
}

fn eat_whitespace(input: &str) -> Res<&str, ()> {
    let (input, _) = nom::multi::many0(
        alt(
            (
                nom::character::complete::one_of(" \t\r\n"),
                eat_comment
            )
        )
    )(input)?;
    Ok((input, ()))
}

fn parse_ident(input: &str) -> Res<&str, String> {
    let (input, _) = eat_whitespace(input)?;
    let (input, prefix) = take_while1(|c| nom::character::is_alphabetic(c as u8) || c == '_')(input)?;
    let (input, suffix) = take_while(|c| nom::character::is_alphanumeric(c as u8) || c == '_')(input)?;
    let (input, _) = eat_whitespace(input)?;
    Ok((input, format!("{}{}", prefix, suffix)))
}

fn parse_separator(input: &str) -> Res<&str, ()> {
    let (input, _) = eat_whitespace(input)?;
    let (input, _) = nom::character::complete::char(',')(input)?;
    let (input, _) = eat_whitespace(input)?;
    Ok((input, ()))
}

fn parse_var(input: &str) -> Res<&str, Statement> {
    let (input, _) = tag("var")(input)?;
    let (input, ident) = parse_ident(input)?;
    let (input, equals_opt) = opt(nom::character::complete::char('='))(input)?;
    if equals_opt.is_some() {
        let (input, expr) = parse_expr(input)?;
        let (input, _) = nom::character::complete::char(';')(input)?;
        Ok((input, Statement::Var(ident, Some(expr))))
    } else {
        let (input, _) = nom::character::complete::char(';')(input)?;
        Ok((input, Statement::Var(ident, None)))
    }
}

fn parse_const(input: &str) -> Res<&str, Statement> {
    let (input, _) = tag("const")(input)?;
    let (input, ident) = parse_ident(input)?;
    let (input, _) = nom::character::complete::char('=')(input)?;
    let (input, expr) = parse_expr(input)?;
    let (input, _) = nom::character::complete::char(';')(input)?;
    Ok((input, Statement::Const(ident, expr)))
}

fn parse_bin(input: &str) -> Res<&str, Word> {
    let (input, _) = tag("0b")(input)?;
    let (input, s) = take_while1(|c| c == '0' || c == '1')(input)?;
    let value = i64::from_str_radix(s, 2).unwrap();
    Ok((input, value as Word))
}

fn parse_dec(input: &str) -> Res<&str, Word> {
    let (input, s) = take_while1(|c| is_digit(c as u8))(input)?;
    let value = i64::from_str(s).unwrap();
    Ok((input, value as Word))
}

fn parse_oct(input: &str) -> Res<&str, Word> {
    let (input, _) = tag("0o")(input)?;
    let (input, s) = take_while1(|c| is_oct_digit(c as u8))(input)?;
    let value = i64::from_str_radix(s, 8).unwrap();
    Ok((input, value as Word))
}

fn parse_hex(input: &str) -> Res<&str, Word> {
    let (input, _) = tag("0x")(input)?;
    let (input, s) = take_while1(|c| is_hex_digit(c as u8))(input)?;
    let value = i64::from_str_radix(s, 16).unwrap();
    Ok((input, value as Word))
}

fn parse_char(input: &str) -> Res<&str, Word> {
    let (input, _) = nom::character::complete::char('\'')(input)?;
    let (input, ch) = nom::character::complete::anychar(input)?;
    let (input, _) = nom::character::complete::char('\'')(input)?;
    Ok((input, ch as Word))
}

fn parse_string(input: &str) -> Res<&str, Expression> {
    let (input, _) = nom::character::complete::char('\"')(input)?;
    let (input, s) = take_while(|c| c != '\"')(input)?;
    let (input, _) = nom::character::complete::char('\"')(input)?;
    let mut words = Vec::new();
    words.extend(s.as_bytes().iter().map(|c| Expression::Constant(*c as Word)));
    words.push(Expression::Constant(0));
    Ok((input, Expression::ArrayLiteral(words)))
}

fn parse_array_literal(input: &str) -> Res<&str, Expression> {
    let (input, _) = nom::character::complete::char('[')(input)?;
    let (input, exprs) = separated_list0(nom::character::complete::char(','), parse_expr)(input)?;
    let (input, _) = nom::character::complete::char(']')(input)?;
    Ok((input, Expression::ArrayLiteral(exprs)))
}

fn parse_constant(input: &str) -> Res<&str, Expression> {
    let (input, value) = alt(
        (
            parse_hex,
            parse_bin,
            parse_oct,
            parse_dec,
            parse_char,
        )
    )(input)?;
    Ok((input, Expression::Constant(value)))
}

fn parse_symbol(input: &str) -> Res<&str, Expression> {
    let (input, name) = parse_ident(input)?;
    Ok((input, Expression::Symbol(name)))
}

fn parse_unary<'a>(
    name: char,
    op: UnaryOperator
) -> impl Fn(&'a str) -> Res<&'a str, Expression> {
    move |input| {
        let (input, _) = nom::character::complete::char(name)(input)?;
        let (input, inner) = parse_factor(input)?;
        Ok((input, Expression::Unary(op, Box::from(inner))))
    }
}

fn parse_deref(input: &str) -> Res<&str, Expression> {
    parse_unary('@', UnaryOperator::Deref)(input)
}

fn parse_nest(input: &str) -> Res<&str, Expression> {
    let (input, _) = nom::character::complete::char('(')(input)?;
    let (input, expr) = parse_expr(input)?;
    let (input, _) = nom::character::complete::char(')')(input)?;
    Ok((input, expr))
}

fn parse_call(input: &str) -> Res<&str, Expression> {
    let (input, fun) = alt(
        (
            parse_deref,
            parse_symbol,
        )
    )(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, _) = nom::character::complete::char('(')(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, params) = separated_list0(parse_separator, parse_expr)(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, _) = nom::character::complete::char(')')(input)?;
    Ok((input, Expression::Call(Box::from(fun), params)))
}

fn parse_factor(input: &str) -> Res<&str, Expression> {
    let (input, factor) = alt(
        (
            parse_constant,
            parse_string,
            parse_array_literal,
            parse_call,
            parse_symbol,
            parse_deref,
            parse_unary(':', UnaryOperator::ArrayDecl),
            parse_unary('~', UnaryOperator::Not),
            parse_unary('-', UnaryOperator::Negate),
            parse_unary('!', UnaryOperator::Lnot),
            parse_nest,
        )
    )(input)?;
    Ok((input, factor))
}

fn parse_binop<'a, 'b>(
    name: &'a str,
    a: &'b Expression,
    parse_rhs: impl Fn(&'a str) -> Res<&'a str, Expression>,
    op: BinaryOperator
) -> impl Fn(&'a str) -> Res<&'a str, Expression> {
    let clone_a = a.clone();
    move |input| {
        let (input, _) = eat_whitespace(input)?;
        let (input, _) = tag(name)(input)?;
        let (input, _) = eat_whitespace(input)?;
        let (input, b) = parse_rhs(input)?;
        let result = Expression::Binary(op, Box::new(clone_a.clone()), Box::new(b));
        Ok((input, result))
    }
}

const BINOP_PARSERS: &[&[(&str, BinaryOperator)]] = &[
    &[
        ("*", BinaryOperator::Mul),
        ("/", BinaryOperator::Div),
        ("%", BinaryOperator::Mod),
    ], &[
        ("+", BinaryOperator::Add),
        ("-", BinaryOperator::Sub),
    ], &[
        ("&", BinaryOperator::And),
    ], &[
        ("|", BinaryOperator::Or),
        ("^", BinaryOperator::Xor),
    ], &[
        (">>", BinaryOperator::Shr),
        ("<<", BinaryOperator::Shl),
    ], &[
        ("==", BinaryOperator::Eq),
        ("!=", BinaryOperator::Ne),
        (">=", BinaryOperator::Ge),
        ("<=", BinaryOperator::Le),
        (">", BinaryOperator::Gt),
        ("<", BinaryOperator::Lt),
    ], &[
        ("&&", BinaryOperator::Land),
    ], &[
        ("||", BinaryOperator::Lor),
    ]
];

fn parse_level_cont(level: usize, input: &str, lhs: Expression) -> Res<&str, Expression> {
    for (name, op) in BINOP_PARSERS[level - 1].iter() {
        match parse_binop(name, &lhs, parse_level(level - 1), *op)(input) {
            Ok((input, rhs)) => return parse_level_cont(level, input, rhs),
            _ => (),
        }
    }
    return Ok((input, lhs))
}

fn parse_level(level: usize) -> impl Fn(&str) -> Res<&str, Expression> {
    move |input| {
        if level == 0 {
            parse_factor(input)
        } else {
            let (input, lhs) = parse_level(level - 1)(input)?;
            parse_level_cont(level, input, lhs)
        }
    }
}

pub(crate) fn parse_expr(input: &str) -> Res<&str, Expression> {
    let (input, _) = eat_whitespace(input)?;
    let (input, lhs) = parse_level(BINOP_PARSERS.len())(input)?;
    let (input, expr) = parse_level_cont(BINOP_PARSERS.len(), input, lhs)?;
    let (input, _) = eat_whitespace(input)?;
    Ok((input, expr))
}

fn parse_assign(input: &str) -> Res<&str, Statement> {
    let (input, dest) = parse_expr(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, _) = nom::character::complete::char('=')(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, src) = parse_expr(input)?;
    let (input, _) = nom::character::complete::char(';')(input)?;
    Ok((input, Statement::Assign(dest, src)))
}

fn parse_if(input: &str) -> Res<&str, Statement> {
    let (input, _) = tag("if")(input)?;
    let (input, cond) = context("if-expr", parse_expr)(input)?;
    let (input, _) = tag("then")(input)?;
    let (input, t) = parse_statements(input)?;
    let (input, nested) = many0(
        tuple((tag("elseif"), parse_expr, tag("then"), parse_statements))
    )(input)?;
    let (input, else_opt) = opt(tuple((tag("else"), parse_statements)))(input)?;
    let (input, _) = tag("end")(input)?;
    let else_statements = else_opt.map(|(_, ss)| ss).unwrap_or(Statement::Block(Vec::new()));
    let tails = nested.iter().rev().fold(else_statements, |s, (_, c, _, ns)|
        Statement::If(c.clone(), Box::from(ns.clone()), Box::from(s))
    );
    let result = Statement::If(cond, Box::from(t), Box::from(tails));
    Ok((input, result))
}

fn parse_ifcarry(input: &str) -> Res<&str, Statement> {
    let (input, _) = tag("ifcarry")(input)?;
    let (input, cond) = parse_expr(input)?;
    let (input, _) = tag("then")(input)?;
    let (input, t) = parse_statements(input)?;
    let (input, else_opt) = opt(tuple((tag("else"), parse_statements)))(input)?;
    let (input, _) = tag("end")(input)?;
    let f = else_opt.map(|x| x.1).unwrap_or(Statement::Block(Vec::new()));
    Ok((input, Statement::IfCarry(cond, Box::from(t), Box::from(f))))
}

fn parse_while(input: &str) -> Res<&str, Statement> {
    let (input, _) = tag("while")(input)?;
    let (input, cond) = parse_expr(input)?;
    let (input, _) = tag("do")(input)?;
    let (input, body) = parse_statements(input)?;
    let (input, _) = tag("end")(input)?;
    Ok((input, Statement::While(cond, Box::from(body))))
}

fn parse_function(input: &str) -> Res<&str, Statement> {
    let (input, _) = tag("fun")(input)?;
    let (input, name) = parse_ident(input)?;
    let (input, _) = nom::character::complete::char('(')(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, args) = separated_list0(parse_separator, parse_ident)(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, _) = nom::character::complete::char(')')(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, body) = parse_statements(input)?;
    let (input, _) = tag("end")(input)?;
    let (input, _) = eat_whitespace(input)?;
    Ok((input, Statement::Function(name, args, Box::from(body))))
}

pub fn parse_builtin(input: &str) -> Statement {
    match parse_statements(input) {
        Ok(f) if f.0.is_empty() => f.1,
        Ok(f) => panic!("incomplete parse: {}", f.0),
        Err(e) => panic!("parse failed: {}", e.to_string()),
    }
}

fn parse_expr_statement(input: &str) -> Res<&str, Statement> {
    let (input, expr) = parse_expr(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, _) = nom::character::complete::char(';')(input)?;
    Ok((input, Statement::Expression(expr)))
}

fn parse_return(input: &str) -> Res<&str, Statement> {
    let (input, _) = tag("return")(input)?;
    let (input, expr) = parse_expr(input)?;
    let (input, _) = nom::character::complete::char(';')(input)?;
    Ok((input, Statement::Return(expr)))
}

fn parse_break(input: &str) -> Res<&str, Statement> {
    let (input, _) = tag("break")(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, _) = nom::character::complete::char(';')(input)?;
    Ok((input, Statement::Break))
}

fn parse_include(input: &str) -> Res<&str, Statement> {
    let (input, _) = tag("include")(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, _) = nom::character::complete::char('\"')(input)?;
    let (input, name) = take_while1(|c| c != '\"')(input)?;
    let (input, _) = nom::character::complete::char('\"')(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, _) = nom::character::complete::char(';')(input)?;
    match parse(name) {
        Ok(statement) => Ok((input, statement)),
        Err(_) => Err(
            nom::Err::Failure(
                VerboseError {
                    errors: vec![
                        (name, VerboseErrorKind::Context("error parsing include file"))
                    ]
                }
            )
        )
    }
}

fn parse_statement(input: &str) -> Res<&str, Statement> {
    let (input, _) = eat_whitespace(input)?;
    let (input, statement) = alt(
        (
            parse_var,
            parse_assign,
            parse_if,
            parse_ifcarry,
            parse_while,
            parse_function,
            parse_return,
            parse_const,
            parse_break,
            parse_include,
            parse_expr_statement,
        )
    )(input)?;
    Ok((input, statement))
}

fn parse_statements(input: &str) -> Res<&str, Statement> {
    let (input, statements) = many0(parse_statement)(input)?;
    let (input, _) = eat_whitespace(input)?;
    Ok((input, Statement::Block(statements)))
}

pub fn parse(file_name: &str) -> Result<Statement, String> {
    match fs::read_to_string(file_name) {
        Ok(input) =>
            match parse_statements(input.as_str()) {
                Ok((remaining, statements)) => {
                    if remaining.is_empty() {
                        Ok(statements)
                    } else {
                        let offset = input.len() - remaining.len();
                        let line = input[0..offset].chars().filter(|c| *c == '\n').count() + 1;
                        Err(format!("{}[{}]: syntax error", file_name, line))
                    }
                },
                Err(e) => Err(e.to_string())
            },
        Err(e) => Err(e.to_string())
    }
}

#[cfg(test)]
mod tests {
    use test_case::test_case;
    use crate::expr::*;
    use crate::parser::parse_expr;

    #[test_case("x_y123", Expression::Symbol("x_y123".to_string()))]
    #[test_case("5", Expression::Constant(5))]
    #[test_case("-5", Expression::Unary(UnaryOperator::Negate, Box::from(Expression::Constant(5))))]
    #[test_case("@6", Expression::Unary(UnaryOperator::Deref, Box::from(Expression::Constant(6))))]
    #[test_case("5 + 10",
        Expression::Binary(
            BinaryOperator::Add, Box::from(Expression::Constant(5)), Box::from(Expression::Constant(10))
        )
    )]
    #[test_case("5 - 10",
        Expression::Binary(
            BinaryOperator::Sub, Box::from(Expression::Constant(5)), Box::from(Expression::Constant(10))
        )
    )]
    #[test_case("5 + 10 + 15",
        Expression::Binary(
            BinaryOperator::Add,
            Box::from(
                Expression::Binary(
                    BinaryOperator::Add,
                    Box::from(Expression::Constant(5)),
                    Box::from(Expression::Constant(10))
                )
            ),
            Box::from(Expression::Constant(15))
        )
    )]
    #[test_case("5 + 10 * 15",
        Expression::Binary(
            BinaryOperator::Add,
            Box::from(Expression::Constant(5)),
            Box::from(
                Expression::Binary(
                    BinaryOperator::Mul,
                    Box::from(Expression::Constant(10)),
                    Box::from(Expression::Constant(15))
                )
            )
        )
    )]
    fn parse_expr_tests(input: &str, expected: Expression) {
        let (input, expr) = parse_expr(input).unwrap();
        assert_eq!(input, "");
        assert_eq!(expr, expected);
    }
}
