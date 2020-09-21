extern crate nom;
use nom::{
    Err,
    IResult,
    sequence::*,
    combinator::*,
    character::*,
    branch::*,
    bytes::complete::*
};
use std::str::FromStr;
use nom::multi::{many0, many0_count};
use nom::InputTake;
use nom::error::ErrorKind;
use std::fs::read_to_string;
use self::nom::Err::Failure;

pub trait Listing {
    fn emit_listing(&self) -> String;
}

#[derive(Debug, PartialEq, Clone)]
pub enum Expression {
    Add(Box<Expression>, Box<Expression>),
    Sub(Box<Expression>, Box<Expression>),
    Mul(Box<Expression>, Box<Expression>),
    Div(Box<Expression>, Box<Expression>),
    Mod(Box<Expression>, Box<Expression>),
    Negate(Box<Expression>),
    Not(Box<Expression>),
    And(Box<Expression>, Box<Expression>),
    Or(Box<Expression>, Box<Expression>),
    Xor(Box<Expression>, Box<Expression>),
    Shr(Box<Expression>, Box<Expression>),
    Shl(Box<Expression>, Box<Expression>),
    Symbol(String),
    Constant(i64),
    CurrentAddress,
}

impl Listing for Expression {
    fn emit_listing(self: &Self) -> String {
        match self {
            Expression::Add(a, b) => format!("({} + {})", a.emit_listing(), b.emit_listing()),
            Expression::Sub(a, b) => format!("({} - {})", a.emit_listing(), b.emit_listing()),
            Expression::Mul(a, b) => format!("({} * {})", a.emit_listing(), b.emit_listing()),
            Expression::Div(a, b) => format!("({} / {})", a.emit_listing(), b.emit_listing()),
            Expression::Mod(a, b) => format!("({} % {})", a.emit_listing(), b.emit_listing()),
            Expression::Negate(a) => format!("-{}", a.emit_listing()),
            Expression::Not(a)    => format!("~{}", a.emit_listing()),
            Expression::And(a, b) => format!("({} & {})", a.emit_listing(), b.emit_listing()),
            Expression::Or(a, b)  => format!("({} | {})", a.emit_listing(), b.emit_listing()),
            Expression::Xor(a, b) => format!("({} ^ {})", a.emit_listing(), b.emit_listing()),
            Expression::Shr(a, b) => format!("({} >> {})", a.emit_listing(), b.emit_listing()),
            Expression::Shl(a, b) => format!("({} << {})", a.emit_listing(), b.emit_listing()),
            Expression::Symbol(s) => s.clone(),
            Expression::Constant(i) => format!("{}", i),
            Expression::CurrentAddress => format!("$"),
        }
    }
}

#[derive(Debug, PartialEq, Clone, Copy)]
pub enum InstructionType {
    Lda = 0x00,
    Nor = 0x01,
    Add = 0x02,
    Shr = 0x03,
    Lea = 0x04,
    Sta = 0x05,
    Jmp = 0x06,
    Jfc = 0x07,
}

impl InstructionType {
    const MAPPING: &'static [(InstructionType, &'static str)] = &[
        (InstructionType::Lda, "lda"),
        (InstructionType::Nor, "nor"),
        (InstructionType::Add, "add"),
        (InstructionType::Shr, "shr"),
        (InstructionType::Lea, "lea"),
        (InstructionType::Sta, "sta"),
        (InstructionType::Jfc, "jfc"),
        (InstructionType::Jmp, "jmp"),
    ];
}

impl Listing for InstructionType {
    fn emit_listing(self: &Self) -> String {
        for (i, s) in InstructionType::MAPPING {
            if i == self {
                return String::from(*s);
            }
        }
        String::from("invalid")
    }
}

#[derive(Debug, PartialEq, Clone)]
pub enum AddressMode {
    Relative,           // x
    ZeroPage,           // =x
    RelativeIndirect,   // @x
    ZeroPageIndirect,   // @=x
}

impl Listing for AddressMode {
    fn emit_listing(&self) -> String {
        match self {
            AddressMode::Relative           => format!(""),
            AddressMode::ZeroPage           => format!("="),
            AddressMode::RelativeIndirect   => format!("@"),
            AddressMode::ZeroPageIndirect   => format!("@="),
        }
    }
}

#[derive(Debug, PartialEq, Clone)]
pub enum Statement {
    Define(String, Expression),
    Label(String),
    Origin(Expression),
    Align(Expression),
    Word(Expression),
    Reserve(Expression),
    Instruction(InstructionType, AddressMode, Expression),
}

impl Listing for Statement {
    fn emit_listing(self: &Self) -> String {
        match self {
            Statement::Define(n, e)         => format!(".def\t{}\t{}", n, e.emit_listing()),
            Statement::Label(n)             => format!("{}:", n),
            Statement::Origin(e)            => format!("\t.org\t{}", e.emit_listing()),
            Statement::Align(e)             => format!("\t.align\t{}", e.emit_listing()),
            Statement::Word(e)              => format!("\t.dw\t{}", e.emit_listing()),
            Statement::Reserve(e)           => format!("\t.bss\t{}", e.emit_listing()),
            Statement::Instruction(t, m, o) =>
                format!("\t{}\t{}{}", t.emit_listing(), m.emit_listing(), o.emit_listing()),
        }
    }
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

fn parse_current_address(input: &str) -> IResult<&str, Expression> {
    let (input, _) = nom::character::complete::char('$')(input)?;
    Ok((input, Expression::CurrentAddress))
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

fn parse_mod<'a>(lhs: Expression) -> impl Fn(&'a str) -> IResult<&'a str, Expression> {
    move |input| parse_binop("/", lhs.clone(), move |a, b| Expression::Mod(Box::from(a), Box::from(b)))(input)
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
    let (input, _) = tag("0b")(input)?;
    let (input, s) = take_while1(|c| c == '0' || c == '1')(input)?;
    let value = i64::from_str_radix(s, 2).unwrap();
    Ok((input, Expression::Constant(value)))
}

fn parse_dec(input: &str) -> IResult<&str, Expression> {
    let (input, s) = take_while1(|c| is_digit(c as u8))(input)?;
    let value = i64::from_str(s).unwrap();
    Ok((input, Expression::Constant(value)))
}

fn parse_oct(input: &str) -> IResult<&str, Expression> {
    let (input, _) = tag("0o")(input)?;
    let (input, s) = take_while1(|c| is_oct_digit(c as u8))(input)?;
    let value = i64::from_str_radix(s, 8).unwrap();
    Ok((input, Expression::Constant(value)))
}

fn parse_hex(input: &str) -> IResult<&str, Expression> {
    let (input, _) = tag("0x")(input)?;
    let (input, s) = take_while1(|c| is_hex_digit(c as u8))(input)?;
    let value = i64::from_str_radix(s, 16).unwrap();
    Ok((input, Expression::Constant(value)))
}

fn parse_char(input: &str) -> IResult<&str, Expression> {
    let (input, _) = nom::character::complete::char('\'')(input)?;
    let (input, ch) = nom::character::complete::anychar(input)?;
    let (input, _) = nom::character::complete::char('\'')(input)?;
    let value = ch as i64;
    Ok((input, Expression::Constant(value)))
}

fn parse_constant(input: &str) -> IResult<&str, Expression> {
    alt((parse_current_address, parse_hex, parse_bin, parse_oct, parse_dec, parse_char))(input)
}

fn parse_not(input: &str) -> IResult<&str, Expression> {
    let (input, _) = nom::character::complete::char('~')(input)?;
    let (input, e) = parse_expr(input)?;
    Ok((input, Expression::Not(Box::new(e))))
}

fn parse_negate(input: &str) -> IResult<&str, Expression> {
    let (input, _) = nom::character::complete::char('-')(input)?;
    let (input, e) = parse_expr(input)?;
    Ok((input, Expression::Negate(Box::new(e))))
}

fn parse_nested(input: &str) -> IResult<&str, Expression> {
    let (input, _) = nom::character::complete::char('(')(input)?;
    let (input, e) = parse_expr(input)?;
    let (input, _) = nom::character::complete::char(')')(input)?;
    Ok((input, e))
}

fn parse_term(input: &str) -> IResult<&str, Expression> {
    let (input, lhs) = alt(
        (
            parse_constant,
            parse_symbol,
            parse_nested,
            parse_negate,
            parse_not,
        )
    )(input)?;
    let (input, t_opt) = opt(
        alt(
            (
                parse_mul(lhs.clone()),
                parse_div(lhs.clone()),
                parse_mod(lhs.clone()),
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
    for (i, s) in InstructionType::MAPPING {
        if input.starts_with(*s) {
            return Ok((&input[s.len()..], *i));
        }
    }
    Err(Err::Error((input, ErrorKind::Alpha)))
}

fn parse_mode(input: &str) -> IResult<&str, AddressMode> {
    let (input, deref) = parse_deref(input)?;
    let (input, zp) = parse_zeropage(input)?;
    match (deref, zp) {
        (false, false)  => Ok((input, AddressMode::Relative)),
        (false, true)  => Ok((input, AddressMode::ZeroPage)),
        (true, false)  => Ok((input, AddressMode::RelativeIndirect)),
        (true, true)  => Ok((input, AddressMode::ZeroPageIndirect)),
    }
}

fn parse_instruction(input: &str) -> IResult<&str, Statement> {
    let (input, inst_type) = parse_instruction_type(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, m) = parse_mode(input)?;
    let (input, exp) = parse_expr(input)?;
    Ok((input, Statement::Instruction(inst_type, m, exp)))
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

fn parse_align(input: &str) -> IResult<&str, Statement> {
    let (input, _) = tag(".align")(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, expr) = parse_expr(input)?;
    Ok((input, Statement::Align(expr)))
}

fn parse_word(input: &str) -> IResult<&str, Statement> {
    let (input, _) = tag(".dw")(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, expr) = parse_expr(input)?;
    Ok((input, Statement::Word(expr)))
}

fn parse_reserve(input: &str) -> IResult<&str, Statement> {
    let (input, _) = tag(".bss")(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, expr) = parse_expr(input)?;
    Ok((input, Statement::Reserve(expr)))
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
            parse_align,
            parse_word,
            parse_reserve,
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

fn parse_include(input: &str) -> IResult<&str, Vec<Statement>> {
    let (input, _) = eat_whitespace(input)?;
    let (input, _) = tag(".include")(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, path) = take_till(|c| c == '\r' || c == '\n')(input)?;
    match read_to_string(path) {
        Ok(inner) => {
            match parse(&inner) {
                Ok(sl) => Ok((input, sl)),
                Err(s) => panic!("could not parse include {}: {}", path, s)
            }
        },
        Err(e) => panic!("could not read include {}: {}", path, e)
    }
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
        assert_eq!(parse_instruction_type("lda"), Ok(("", InstructionType::Lda)))
    }

    #[test]
    fn test_parse_mode() {
        assert_eq!(parse_mode("asdf"), Ok(("asdf", AddressMode::Relative)));
        assert_eq!(parse_mode("@x"), Ok(("x", AddressMode::RelativeIndirect)));
        assert_eq!(parse_mode("=asdf"), Ok(("asdf", AddressMode::ZeroPage)));
        assert_eq!(parse_mode("@=asdf"), Ok(("asdf", AddressMode::ZeroPageIndirect)));
    }

    #[test]
    fn test_parse_inst() {
        assert_eq!(
            parse_instruction("add asdf"),
            Ok(("", Statement::Instruction(
                InstructionType::Add,
                AddressMode::Relative,
                Expression::Symbol(String::from("asdf")))
            ))
        )
    }

    #[test]
    fn test_parse_multiple() {
        assert_eq!(
            parse("label:\n  add =5\n\n").unwrap(),
            vec![
                Statement::Label(String::from("label")),
                Statement::Instruction(
                    InstructionType::Add,
                    AddressMode::ZeroPage,
                    Expression::Constant(5)
                )
            ]
        )
    }
}

