extern crate nom;
use nom::{
    IResult,
    sequence::*,
    combinator::*,
    character::*,
    branch::*,
    bytes::complete::*
};
use std::str::FromStr;
use self::nom::multi::{many0, many0_count};
use std::error::Error;
use self::nom::InputTake;

#[derive(Debug, PartialEq, Clone)]
pub enum Expression {
    Add(Box<Expression>, Box<Expression>),
    Sub(Box<Expression>, Box<Expression>),
    Mul(Box<Expression>, Box<Expression>),
    Div(Box<Expression>, Box<Expression>),
    And(Box<Expression>, Box<Expression>),
    Or(Box<Expression>, Box<Expression>),
    Xor(Box<Expression>, Box<Expression>),
    Shr(Box<Expression>, Box<Expression>),
    Shl(Box<Expression>, Box<Expression>),
    Symbol(String),
    Constant(u64),
    CurrentAddress()
}

#[derive(Debug, PartialEq, Clone, Copy)]
pub enum InstructionType {
    Ld  = 0x0,
    Not = 0x1,
    And = 0x2,
    Or  = 0x3,
    Xor = 0x4,
    Add = 0x5,
    Sub = 0x6,
    Shr = 0x7,
    Nop = 0x8,
    St  = 0x9,
    Jnf = 0xA,
    Jf  = 0xB,
    J   = 0xC,
    Hlt = 0xF
}

#[derive(Debug, PartialEq, Clone)]
pub enum AddressMode {
    Immediate,
    Relative,
    ZeroPage,
    Indirect,
    ZeroPageIndirect,
    Invalid
}

#[derive(Debug, PartialEq, Clone)]
pub enum Statement {
    Define(String, Expression),
    Label(String),
    Origin(Expression),
    Word(Expression),
    Instruction(InstructionType, AddressMode, Expression)
}

fn eat_comment(input: &str) -> IResult<&str, char> {
    let (input, ch) = nom::character::complete::char(';')(input)?;
    let (input, _) = take_while(|c| c != '\n' && c != '\r')(input)?;
    Ok((input, ch))
}

fn eat_whitespace(input: &str) -> IResult<&str, ()> {
    let (input, _) = many0_count(
        alt(
            (
                nom::character::complete::char(' '),
                nom::character::complete::char('\t'),
                nom::character::complete::char('\n'),
                nom::character::complete::char('\r'),
                eat_comment
            )
        )
    )(input)?;
    Ok((input, ()))
}

fn is_ident(chr: char) -> bool {
    is_alphanumeric(chr as u8) || chr == '_'
}

fn parse_flag<'a>(name: char, input: &'a str) -> IResult<&'a str, bool> {
    let (input, o) = opt(nom::character::complete::char(name))(input)?;
    Ok((input, o.is_some()))
}

fn parse_deref(input: &str) -> IResult<&str, bool> {
    parse_flag('@', input)
}

fn parse_zeropage(input: &str) -> IResult<&str, bool> {
    parse_flag('=', input)
}

fn parse_immediate(input: &str) -> IResult<&str, bool> {
    parse_flag('#', input)
}

fn parse_pcplus(input: &str) -> IResult<&str, bool> {
    parse_flag('+', input)
}

fn parse_binop<'a>(
    op: &'a str,
    a: Expression,
    builder: impl Fn(Expression, Expression) -> Expression
) -> impl Fn(&'a str) -> IResult<&'a str, Expression> {
    move |input| {
        let (input, _) = eat_whitespace(input)?;
        let (input, _) = tag(op)(input)?;
        let (input, _) = eat_whitespace(input)?;
        let (input, b) = parse_expr(input)?;
        let result = builder(a.clone(), b);
        Ok((input, result))
    }
}

fn parse_add<'a>(lhs: Expression) -> impl Fn(&'a str) -> IResult<&'a str, Expression> {
    move |input| parse_binop("+", lhs.clone(), move |a, b| Expression::Add(Box::from(a), Box::from(b)))(input)
}

fn parse_sub<'a>(lhs: Expression) -> impl Fn(&'a str) -> IResult<&'a str, Expression> {
    move |input| parse_binop("-", lhs.clone(), move |a, b| Expression::Sub(Box::from(a), Box::from(b)))(input)
}

fn parse_mul<'a>(lhs: Expression) -> impl Fn(&'a str) -> IResult<&'a str, Expression> {
    move |input| parse_binop("*", lhs.clone(), move |a, b| Expression::Mul(Box::from(a), Box::from(b)))(input)
}

fn parse_div<'a>(lhs: Expression) -> impl Fn(&'a str) -> IResult<&'a str, Expression> {
    move |input| parse_binop("/", lhs.clone(), move |a, b| Expression::Div(Box::from(a), Box::from(b)))(input)
}

fn parse_and<'a>(lhs: Expression) -> impl Fn(&'a str) -> IResult<&'a str, Expression> {
    move |input| parse_binop("&", lhs.clone(), move |a, b| Expression::And(Box::from(a), Box::from(b)))(input)
}

fn parse_or<'a>(lhs: Expression) -> impl Fn(&'a str) -> IResult<&'a str, Expression> {
    move |input| parse_binop("|", lhs.clone(), move |a, b| Expression::Or(Box::from(a), Box::from(b)))(input)
}

fn parse_xor<'a>(lhs: Expression) -> impl Fn(&'a str) -> IResult<&'a str, Expression> {
    move |input| parse_binop("^", lhs.clone(), move |a, b| Expression::Xor(Box::from(a), Box::from(b)))(input)
}

fn parse_shr<'a>(lhs: Expression) -> impl Fn(&'a str) -> IResult<&'a str, Expression> {
    move |input| parse_binop(">>", lhs.clone(), move |a, b| Expression::Shr(Box::from(a), Box::from(b)))(input)
}

fn parse_shl<'a>(lhs: Expression) -> impl Fn(&'a str) -> IResult<&'a str, Expression> {
    move |input| parse_binop("<<", lhs.clone(), move |a, b| Expression::Shl(Box::from(a), Box::from(b)))(input)
}

fn parse_symbol(input: &str) -> IResult<&str, Expression> {
    let (input, sym) = take_while1(is_ident)(input)?;
    Ok((input, Expression::Symbol(String::from(sym))))
}

fn parse_bin(input: &str) -> IResult<&str, Expression> {
    let (input, _) = nom::character::complete::char('%')(input)?;
    let (input, s) = take_while1(|c| c == '0' || c == '1')(input)?;
    let value = u64::from_str_radix(s, 2).unwrap();
    Ok((input, Expression::Constant(value)))
}

fn parse_dec(input: &str) -> IResult<&str, Expression> {
    let (input, s) = take_while1(|c| is_digit(c as u8))(input)?;
    let value = u64::from_str(s).unwrap();
    Ok((input, Expression::Constant(value)))
}

fn parse_hex(input: &str) -> IResult<&str, Expression> {
    let (input, _) = nom::character::complete::char('$')(input)?;
    let (input, s) = take_while1(|c| is_hex_digit(c as u8))(input)?;
    let value = u64::from_str_radix(s, 16).unwrap();
    Ok((input, Expression::Constant(value)))
}

fn parse_constant(input: &str) -> IResult<&str, Expression> {
    alt((parse_dec, parse_hex, parse_bin))(input)
}

fn parse_nested(input: &str) -> IResult<&str, Expression> {
    let (input, _) = nom::character::complete::char('(')(input)?;
    let (input, e) = parse_expr(input)?;
    let (input, _) = nom::character::complete::char(')')(input)?;
    Ok((input, e))
}

fn parse_term(input: &str) -> IResult<&str, Expression> {
    let (input, lhs) = alt((parse_constant, parse_symbol, parse_nested))(input)?;
    let (input, t_opt) = opt(
        alt(
            (
                parse_mul(lhs.clone()),
                parse_div(lhs.clone()),
            )
        )
    )(input)?;
    match t_opt {
        Some(t) => Ok((input, t)),
        None => Ok((input, lhs.clone()))
    }
}

fn parse_expr(input: &str) -> IResult<&str, Expression> {
    let (input, lhs) = parse_term(input)?;
    let (input, e_opt) = opt(
        alt(
            (
                parse_add(lhs.clone()),
                parse_sub(lhs.clone()),
                parse_and(lhs.clone()),
                parse_or(lhs.clone()),
                parse_xor(lhs.clone()),
                parse_shr(lhs.clone()),
                parse_shl(lhs.clone())
            )
        )
    )(input)?;
    if let Some(e) = e_opt {
        Ok((input, e))
    } else {
        Ok((input, lhs.clone()))
    }
}

fn parse_instruction_type(input: &str) -> IResult<&str, InstructionType> {
    let (input, instr) = alt(
        (
            map(tag("ld"), |_| InstructionType::Ld),
            map(tag("not"), |_| InstructionType::Not),
            map(tag("and"), |_| InstructionType::And),
            map(tag("or"), |_| InstructionType::Or),
            map(tag("xor"), |_| InstructionType::Xor),
            map(tag("add"), |_| InstructionType::Add),
            map(tag("sub"), |_| InstructionType::Sub),
            map(tag("shr"), |_| InstructionType::Shr),
            map(tag("nop"), |_| InstructionType::Nop),
            map(tag("st"), |_| InstructionType::St),
            map(tag("jnf"), |_| InstructionType::Jnf),
            map(tag("jf"), |_| InstructionType::Jf),
            map(tag("j"), |_| InstructionType::J),
            map(tag("hlt"), |_| InstructionType::Hlt)
        )
    )(input)?;
    Ok((input, instr))
}

fn parse_instruction(input: &str) -> IResult<&str, Statement> {
    let (input, inst_type) = parse_instruction_type(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, deref) = parse_deref(input)?;
    let (input, imm) = parse_immediate(input)?;
    let (input, zp) = parse_zeropage(input)?;
    let (input, pcplus) = parse_pcplus(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, raw_expr) = parse_expr(input)?;
    let expr = if pcplus {
        Expression::Add(Box::from(Expression::CurrentAddress()), Box::from(raw_expr))
    } else { raw_expr };
    let mode = match (imm, zp, deref) {
        (true, false, false)       => AddressMode::Immediate,
        (false, false, false)      => AddressMode::Relative,
        (false, false, true)       => AddressMode::Indirect,
        (false, true, false)       => AddressMode::ZeroPage,
        (false, true, true)        => AddressMode::ZeroPageIndirect,
        _                           => AddressMode::Invalid
    };
    Ok(
        (
            input, Statement::Instruction(inst_type, mode, expr)
        )
    )
}

fn parse_label(input: &str) -> IResult<&str, Statement> {
    let (input, (label, _)) = tuple((take_while1(is_ident), tag(":")))(input)?;
    Ok((input, Statement::Label(String::from(label))))
}

fn parse_origin(input: &str) -> IResult<&str, Statement> {
    let (input, _) = tag(".org")(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, expr) = parse_expr(input)?;
    Ok((input, Statement::Origin(expr)))
}

fn parse_word(input: &str) -> IResult<&str, Statement> {
    let (input, _) = tag(".dw")(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, expr) = parse_expr(input)?;
    Ok((input, Statement::Word(expr)))
}

fn parse_define(input: &str) -> IResult<&str, Statement> {
    let (input, _) = tag(".def")(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, name) = take_while1(is_ident)(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, expr) = parse_expr(input)?;
    Ok((input, Statement::Define(String::from(name), expr)))
}

fn parse_statement(input: &str) -> IResult<&str, Statement> {
    let (input, _) = eat_whitespace(input)?;
    let (input, statement) = alt(
        (
            parse_label,
            parse_instruction,
            parse_origin,
            parse_word,
            parse_define
        )
    )(input)?;
    Ok((input, statement))
}

fn parse_statement_list(input: &str) -> IResult<&str, Vec<Statement>> {
    let (input, ss) = many0(parse_statement)(input)?;
    let (input, _) = eat_whitespace(input)?;
    Ok((input, ss))
}

pub fn parse(input: &str) -> Result<Vec<Statement>, String> {
    match parse_statement_list(input) {
        Ok((remaining, ss)) =>
            if remaining.is_empty() {
                Ok(ss)
            } else {
                Err(format!("parse failed at '{}'", remaining.take(10)))
            },
        Err(_) => panic!("parse failed")
    }
}

mod tests {
    use super::*;

    #[test]
    fn test_parse_label() {
        assert_eq!(parse_label("label:"), Ok(("", Statement::Label(String::from("label")))));
    }

    #[test]
    fn test_parse_deref() {
        assert_eq!(parse_deref("@asdf"), Ok(("asdf", true)));
        assert_eq!(parse_deref("what"), Ok(("what", false)));
    }

    #[test]
    fn test_parse_add() {
        assert_eq!(
            parse_expr("a+b"),
            Ok(
                (
                    "",
                    Expression::Add(
                        Box::from(Expression::Symbol(String::from("a"))),
                        Box::from(Expression::Symbol(String::from("b")))
                    )
                )
            )
        )
    }

    #[test]
    fn test_parse_sub() {
        assert_eq!(
            parse_expr("a-b"),
            Ok(
                (
                    "",
                    Expression::Sub(
                        Box::from(Expression::Symbol(String::from("a"))),
                        Box::from(Expression::Symbol(String::from("b")))
                    )
                )
            )
        )
    }

    #[test]
    fn test_parse_order() {
        assert_eq!(
            parse_expr("a-b*c"),
            Ok(
                (
                    "",
                    Expression::Sub(
                        Box::from(Expression::Symbol(String::from("a"))),
                        Box::from(
                            Expression::Mul(
                                Box::from(Expression::Symbol(String::from("b"))),
                                Box::from(Expression::Symbol(String::from("c")))
                            )
                        )
                    )
                )
            )
        )
    }

    #[test]
    fn test_parse_inst_type() {
        assert_eq!(parse_instruction_type("ld"), Ok(("", InstructionType::Ld)))
    }

    #[test]
    fn test_parse_inst() {
        assert_eq!(
            parse_instruction("add @=asdf"),
            Ok(("", Statement::Instruction(
                InstructionType::Add,
                AddressMode::ZeroPageIndirect,
                Expression::Symbol(String::from("asdf")))
            ))
        )
    }

    #[test]
    fn test_parse_multiple() {
        assert_eq!(
            parse("label:\n  add #5\n\n").unwrap(),
            vec![
                Statement::Label(String::from("label")),
                Statement::Instruction(
                    InstructionType::Add,
                    AddressMode::Immediate,
                    Expression::Constant(5)
                )
            ]
        )
    }
}

