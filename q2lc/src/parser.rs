extern crate nom;
use nom::{combinator::*, character::*, branch::*, bytes::complete::*};
use std::str::FromStr;
use crate::expr::{BinaryOperator, Expression, Word};
use crate::statement::Statement;
use self::nom::IResult;
use self::nom::error::VerboseError;
use self::nom::multi::{many0, separated_list0};

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
                nom::character::complete::char(' '),
                nom::character::complete::char('\t'),
                nom::character::complete::char('\r'),
                nom::character::complete::char('\n'),
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
    let (input, equals_opt) = opt(tag("="))(input)?;
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
    create: impl Fn(Box<Expression>) -> Expression
) -> impl Fn(&'a str) -> Res<&'a str, Expression> {
    move |input| {
        let (input, _) = nom::character::complete::char(name)(input)?;
        let (input, inner) = parse_factor(input)?;
        Ok((input, create(Box::from(inner))))
    }
}

fn parse_deref(input: &str) -> Res<&str, Expression> {
    parse_unary('@', |e| Expression::Deref(e))(input)
}

fn parse_nest(input: &str) -> Res<&str, Expression> {
    let (input, _) = tag("(")(input)?;
    let (input, expr) = parse_expr(input)?;
    let (input, _) = tag(")")(input)?;
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
    let (input, _) = tag("(")(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, params) = separated_list0(parse_separator, parse_expr)(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, _) = tag(")")(input)?;
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
            parse_unary(':', |e| Expression::ArrayDecl(e)),
            parse_unary('~', |e| Expression::Not(e)),
            parse_unary('-', |e| Expression::Negate(e)),
            parse_unary('!', |e| Expression::Lnot(e)),
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
    for (name, op) in BINOP_PARSERS[level].iter() {
        match parse_binop(name, &lhs, parse_level(level), *op)(input) {
            Ok((input, rhs)) => return parse_level_cont(level, input, rhs),
            _ => (),
        }
    }
    return Ok((input, lhs))
}

fn parse_level(level: usize) -> impl Fn(&str) -> Res<&str, Expression> {
    move |input| {
        let (input, lhs) = if level > 0 {
            parse_level(level - 1)(input)
        } else {
            parse_factor(input)
        }?;
        parse_level_cont(level, input, lhs)
    }
}

fn parse_expr(input: &str) -> Res<&str, Expression> {
    let (input, _) = eat_whitespace(input)?;
    let (input, lhs) = parse_level(BINOP_PARSERS.len() - 1)(input)?;
    let (input, expr) = parse_level_cont(BINOP_PARSERS.len() - 1, input, lhs)?;
    let (input, _) = eat_whitespace(input)?;
    Ok((input, expr))
}

fn parse_assign(input: &str) -> Res<&str, Statement> {
    let (input, dest) = parse_expr(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, _) = tag("=")(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, src) = parse_expr(input)?;
    let (input, _) = nom::character::complete::char(';')(input)?;
    Ok((input, Statement::Assign(dest, src)))
}

fn parse_if(input: &str) -> Res<&str, Statement> {
    let (input, _) = tag("if")(input)?;
    let (input, cond) = parse_expr(input)?;
    let (input, _) = tag("then")(input)?;
    let (input, t) = parse_statements(input)?;
    let (input, else_opt) = opt(tag("else"))(input)?;
    let (input, result) = if else_opt.is_none() {
        (input, Statement::If(cond, t, Vec::new()))
    } else {
        let (input, f) = parse_statements(input)?;
        (input, Statement::If(cond, t, f))
    };
    let (input, _) = tag("end")(input)?;
    Ok((input, result))
}

fn parse_while(input: &str) -> Res<&str, Statement> {
    let (input, _) = tag("while")(input)?;
    let (input, cond) = parse_expr(input)?;
    let (input, _) = tag("do")(input)?;
    let (input, body) = parse_statements(input)?;
    let (input, _) = tag("end")(input)?;
    Ok((input, Statement::While(cond, body)))
}

fn parse_function(input: &str) -> Res<&str, Statement> {
    let (input, _) = tag("fun")(input)?;
    let (input, name) = parse_ident(input)?;
    let (input, _) = tag("(")(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, args) = separated_list0(parse_separator, parse_ident)(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, _) = tag(")")(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, body) = parse_statements(input)?;
    let (input, _) = tag("end")(input)?;
    let (input, _) = eat_whitespace(input)?;
    Ok((input, Statement::Function(name, args, body)))
}

pub fn parse_builtin(input: &str) -> Statement {
    match parse_function(input) {
        Ok(f) if f.0.is_empty() => f.1,
        Ok(f) => panic!("incomplete parse: {}", f.0),
        Err(e) => panic!("parse failed: {}", e.to_string()),
    }
}

fn parse_call_statement(input: &str) -> Res<&str, Statement> {
    let (input, expr) = parse_call(input)?;
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

fn parse_statement(input: &str) -> Res<&str, Statement> {
    let (input, _) = eat_whitespace(input)?;
    let (input, statement) = alt(
        (
            parse_var,
            parse_assign,
            parse_if,
            parse_while,
            parse_function,
            parse_call_statement,
            parse_return,
            parse_const,
        )
    )(input)?;
    Ok((input, statement))
}

fn parse_statements(input: &str) -> Res<&str, Vec<Statement>> {
    let (input, statements) = many0(parse_statement)(input)?;
    let (input, _) = eat_whitespace(input)?;
    Ok((input, statements))
}

pub fn parse(file_name: &str, input: &str) -> Result<Vec<Statement>, String> {
    match parse_statements(input) {
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
    }
}
