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
use nom::multi::many0;
use nom::error::ErrorKind;
use std::fs::read_to_string;
use self::nom::multi::separated_nonempty_list;
use self::nom::character::complete::char;
use self::nom::error::ParseError;

#[derive(Debug, PartialEq, Clone)]
enum CustomError<I> {
    CustomError(String),
    NomError(I, ErrorKind)
}

impl<I> CustomError<I> {
    fn description(&self) -> String {
        match self {
            CustomError::CustomError(s) => s.clone(),
            CustomError::NomError(_, k) => format!("parse error: {}", k.description())
        }
    }
}

impl<I> ParseError<I> for CustomError<I> {
    fn from_error_kind(input: I, kind: ErrorKind) -> Self {
        CustomError::NomError(input, kind)
    }

    fn append(_: I, _: ErrorKind, other: Self) -> Self {
        other
    }
}

type CustomResult<I, O> = IResult<I, O, CustomError<I>>;

#[derive(Debug, PartialEq, Clone, Eq, Hash)]
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
    Jal = 0x80,     // lea / jmp
    Shl = 0x81,     // lda / add
    Jfs = 0x82,     // jfc / jmp
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
        (InstructionType::Jal, "jal"),
        (InstructionType::Shl, "shl"),
        (InstructionType::Jfs, "jfs"),
    ];
}

#[derive(Debug, PartialEq, Clone, Copy)]
pub enum AddressMode {
    Relative,           // x
    ZeroPage,           // =x
    RelativeIndirect,   // @x
    ZeroPageIndirect,   // @=x
    Immediate,          // #x
    ImmediateIndirect,  // @#x
}

#[derive(Debug, PartialEq, Clone)]
pub enum Statement {
    Define(String, Expression),
    Label(String),
    Origin(Expression),
    Align(Expression),
    Bank(Expression),
    Word(Vec<Expression>),
    Reserve(Expression),
    Instruction(InstructionType, AddressMode, Expression)
}

#[derive(Debug, PartialEq, Clone)]
pub struct StatementWithContext {
    pub statement: Statement,
    pub file: String,
    pub line_number: usize,
    pub line: String
}

impl StatementWithContext {
    pub fn error<T>(&self, msg: String) -> Result<T, String> {
        Err(format!("{}[{}]: {}", self.file, self.line_number, msg))
    }
}

fn eat_comment(input: &str) -> CustomResult<&str, char> {
    let (input, ch) = nom::character::complete::char(';')(input)?;
    let (input, _) = take_while(|c| c != '\n' && c != '\r')(input)?;
    Ok((input, ch))
}

fn eat_whitespace(input: &str) -> CustomResult<&str, ()> {
    let (input, _) = many0(
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

fn parse_flag<'a>(name: char, input: &'a str) -> CustomResult<&'a str, bool> {
    let (input, o) = opt(nom::character::complete::char(name))(input)?;
    Ok((input, o.is_some()))
}

fn parse_deref(input: &str) -> CustomResult<&str, bool> {
    parse_flag('@', input)
}

fn parse_zeropage(input: &str) -> CustomResult<&str, bool> {
    parse_flag('=', input)
}

fn parse_immediate(input: &str) -> CustomResult<&str, bool> {
    parse_flag('#', input)
}

fn parse_current_address(input: &str) -> CustomResult<&str, Expression> {
    let (input, _) = nom::character::complete::char('$')(input)?;
    Ok((input, Expression::CurrentAddress))
}

fn parse_binop<'a, 'b>(
    op: &'a str,
    a: &'b Expression,
    parse_rhs: impl Fn(&'a str) -> CustomResult<&'a str, Expression>,
    builder: impl Fn(Box<Expression>, Box<Expression>) -> Expression
) -> impl Fn(&'a str) -> CustomResult<&'a str, Expression> {
    let a_clone = a.clone();
    move |input| {
        let (input, _) = eat_whitespace(input)?;
        let (input, _) = tag(op)(input)?;
        let (input, _) = eat_whitespace(input)?;
        let (input, b) = parse_rhs(input)?;
        let result = builder(Box::from(a_clone.clone()), Box::from(b));
        Ok((input, result))
    }
}

fn parse_symbol(input: &str) -> CustomResult<&str, Expression> {
    let (input, sym) = take_while1(is_ident)(input)?;
    Ok((input, Expression::Symbol(String::from(sym))))
}

fn parse_bin(input: &str) -> CustomResult<&str, Expression> {
    let (input, _) = tag("0b")(input)?;
    let (input, s) = take_while1(|c| c == '0' || c == '1')(input)?;
    let value = i64::from_str_radix(s, 2).unwrap();
    Ok((input, Expression::Constant(value)))
}

fn parse_dec(input: &str) -> CustomResult<&str, Expression> {
    let (input, s) = take_while1(|c| is_digit(c as u8))(input)?;
    let value = i64::from_str(s).unwrap();
    Ok((input, Expression::Constant(value)))
}

fn parse_oct(input: &str) -> CustomResult<&str, Expression> {
    let (input, _) = tag("0o")(input)?;
    let (input, s) = take_while1(|c| is_oct_digit(c as u8))(input)?;
    let value = i64::from_str_radix(s, 8).unwrap();
    Ok((input, Expression::Constant(value)))
}

fn parse_hex(input: &str) -> CustomResult<&str, Expression> {
    let (input, _) = tag("0x")(input)?;
    let (input, s) = take_while1(|c| is_hex_digit(c as u8))(input)?;
    let value = i64::from_str_radix(s, 16).unwrap();
    Ok((input, Expression::Constant(value)))
}

fn parse_char(input: &str) -> CustomResult<&str, Expression> {
    let (input, _) = nom::character::complete::char('\'')(input)?;
    let (input, ch) = nom::character::complete::anychar(input)?;
    let (input, _) = nom::character::complete::char('\'')(input)?;
    let value = ch as i64;
    Ok((input, Expression::Constant(value)))
}

fn parse_constant(input: &str) -> CustomResult<&str, Expression> {
    alt((parse_current_address, parse_hex, parse_bin, parse_oct, parse_dec, parse_char))(input)
}

fn parse_not(input: &str) -> CustomResult<&str, Expression> {
    let (input, _) = nom::character::complete::char('~')(input)?;
    let (input, e) = parse_expr(input)?;
    Ok((input, Expression::Not(Box::new(e))))
}

fn parse_negate(input: &str) -> CustomResult<&str, Expression> {
    let (input, _) = nom::character::complete::char('-')(input)?;
    let (input, e) = parse_expr(input)?;
    Ok((input, Expression::Negate(Box::new(e))))
}

fn parse_nested(input: &str) -> CustomResult<&str, Expression> {
    let (input, _) = nom::character::complete::char('(')(input)?;
    let (input, e) = parse_expr(input)?;
    let (input, _) = nom::character::complete::char(')')(input)?;
    Ok((input, e))
}

fn parse_factor(input: &str) -> CustomResult<&str, Expression> {
    let (input, factor) = alt(
        (
            parse_constant,
            parse_symbol,
            parse_nested,
            parse_negate,
            parse_not,
        )
    )(input)?;
    Ok((input, factor))
}

fn parse_term_cont<'a>(input: &'a str, lhs: Expression) -> CustomResult<&'a str, Expression> {
    let (input, t_opt) = opt(
        alt(
            (
                parse_binop("*", &lhs, parse_factor, |a, b| Expression::Mul(a, b)),
                parse_binop("/", &lhs, parse_factor, |a, b| Expression::Div(a, b)),
                parse_binop("%", &lhs, parse_factor, |a, b| Expression::Mod(a, b)),
            )
        )
    )(input)?;
    match t_opt {
        Some(term) => parse_term_cont(input, term),
        None => Ok((input, lhs.clone()))
    }
}

fn parse_term(input: &str) -> CustomResult<&str, Expression> {
    let (input, lhs) = parse_factor(input)?;
    parse_term_cont(input, lhs)
}

fn parse_expr_cont<'a>(input: &'a str, lhs: Expression) -> CustomResult<&'a str, Expression> {
    let (input, e_opt) = opt(
        alt(
            (
                parse_binop("+", &lhs, parse_term, |a, b| Expression::Add(a, b)),
                parse_binop("-", &lhs, parse_term, |a, b| Expression::Sub(a, b)),
                parse_binop("&", &lhs, parse_term, |a, b| Expression::And(a, b)),
                parse_binop("|", &lhs, parse_term, |a, b| Expression::Or(a, b)),
                parse_binop("^", &lhs, parse_term, |a, b| Expression::Xor(a, b)),
                parse_binop(">>", &lhs, parse_term, |a, b| Expression::Shr(a, b)),
                parse_binop("<<", &lhs, parse_term, |a, b| Expression::Shl(a, b)),
            )
        )
    )(input)?;
    match e_opt {
        Some(expr) => parse_expr_cont(input, expr),
        None => Ok((input, lhs.clone()))
    }
}

fn parse_expr(input: &str) -> CustomResult<&str, Expression> {
    let (input, _) = eat_whitespace(input)?;
    let (input, lhs) = parse_term(input)?;
    parse_expr_cont(input, lhs)
}

fn parse_instruction_type(input: &str) -> CustomResult<&str, InstructionType> {
    for (i, s) in InstructionType::MAPPING {
        if input.starts_with(*s) {
            return Ok((&input[s.len()..], *i));
        }
    }
    Err(Err::Error(CustomError::NomError(input, ErrorKind::Alpha)))
}

fn parse_mode(input: &str) -> CustomResult<&str, AddressMode> {
    let (input, deref) = parse_deref(input)?;
    let (input, zp) = parse_zeropage(input)?;
    let (input, imm) = parse_immediate(input)?;
    match (deref, zp, imm) {
        (false, false, false)   => Ok((input, AddressMode::Relative)),
        (false, true, false)    => Ok((input, AddressMode::ZeroPage)),
        (true, false, false)    => Ok((input, AddressMode::RelativeIndirect)),
        (true, true, false)     => Ok((input, AddressMode::ZeroPageIndirect)),
        (false, false, true)    => Ok((input, AddressMode::Immediate)),
        (false, true, true)     => Ok((input, AddressMode::Immediate)),
        (true, false, true)     => Ok((input, AddressMode::ImmediateIndirect)),
        (true, true, true)      => Ok((input, AddressMode::ImmediateIndirect)),
    }
}

fn parse_instruction(input: &str) -> CustomResult<&str, Statement> {
    let (input, inst_type) = parse_instruction_type(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, m) = parse_mode(input)?;
    let (input, exp) = parse_expr(input)?;
    Ok((input, Statement::Instruction(inst_type, m, exp)))
}

fn parse_label(input: &str) -> CustomResult<&str, Statement> {
    let (input, (label, _)) = tuple((take_while1(is_ident), tag(":")))(input)?;
    Ok((input, Statement::Label(String::from(label))))
}

fn parse_origin(input: &str) -> CustomResult<&str, Statement> {
    let (input, _) = tag(".org")(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, expr) = parse_expr(input)?;
    Ok((input, Statement::Origin(expr)))
}

fn parse_align(input: &str) -> CustomResult<&str, Statement> {
    let (input, _) = tag(".align")(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, expr_opt) = opt(parse_expr)(input)?;
    let expr = expr_opt.unwrap_or(Expression::Constant(128));
    Ok((input, Statement::Align(expr)))
}

fn parse_bank(input: &str) -> CustomResult<&str, Statement> {
    let (input, _) = tag(".bank")(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, expr) = parse_expr(input)?;
    Ok((input, Statement::Bank(expr)))
}

fn parse_string(input: &str) -> CustomResult<&str, Vec<Expression>> {
    let (input, _) = tag("\"")(input)?;
    let (input, s) = take_while(|c| c != '\"')(input)?;
    let (input, _) = tag("\"")(input)?;
    let mut result = Vec::new();
    for c in s.bytes() {
        result.push(Expression::Constant(c as i64));
    }
    Ok((input, result))
}

fn parse_word(input: &str) -> CustomResult<&str, Statement> {
    let (input, _) = tag(".dw")(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, exprs) = separated_nonempty_list(
        char(','),
        alt(
            (
                |i| parse_expr(i).map(|r| (r.0, vec![r.1])),
                parse_string
            )
        )
    )(input)?;
    Ok((input, Statement::Word(exprs.into_iter().flatten().collect())))
}

fn parse_reserve(input: &str) -> CustomResult<&str, Statement> {
    let (input, _) = tag(".bss")(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, expr) = parse_expr(input)?;
    Ok((input, Statement::Reserve(expr)))
}

fn parse_define(input: &str) -> CustomResult<&str, Statement> {
    let (input, _) = tag(".def")(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, name) = take_while1(is_ident)(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, expr) = parse_expr(input)?;
    Ok((input, Statement::Define(String::from(name), expr)))
}

fn expand(statement: Statement, file: &str, line_number: usize, line: &str) -> Vec<StatementWithContext> {
    match &statement {
        Statement::Instruction(t, m, e) => match t {
            InstructionType::Jal => vec![
                StatementWithContext {
                    statement: Statement::Instruction(
                        InstructionType::Lea,
                        AddressMode::Relative,
                        Expression::Add(
                            Box::new(Expression::CurrentAddress),
                            Box::new(Expression::Constant(2))
                        )
                    ),
                    file: String::from(file),
                    line_number,
                    line: String::from(line)
                },
                StatementWithContext {
                    statement: Statement::Instruction(InstructionType::Jmp, *m, e.clone()),
                    file: String::from(file),
                    line_number,
                    line: "".to_string()
                }
            ],
            InstructionType::Jfs => vec![
                StatementWithContext {
                    statement: Statement::Instruction(
                        InstructionType::Jfc,
                        AddressMode::Relative,
                        Expression::Add(
                            Box::new(Expression::CurrentAddress),
                            Box::new(Expression::Constant(2))
                        )
                    ),
                    file: String::from(file),
                    line_number,
                    line: String::from(line)
                },
                StatementWithContext {
                    statement: Statement::Instruction(InstructionType::Jmp, *m, e.clone()),
                    file: String::from(file),
                    line_number,
                    line: "".to_string()
                }
            ],
            InstructionType::Shl => vec![
                StatementWithContext {
                    statement: Statement::Instruction(InstructionType::Lda, *m, e.clone()),
                    file: String::from(file),
                    line_number,
                    line: String::from(line)
                },
                StatementWithContext {
                    statement: Statement::Instruction(InstructionType::Add, *m, e.clone()),
                    file: String::from(file),
                    line_number,
                    line: "".to_string()
                }
            ],
            _ => vec![
                StatementWithContext {
                    statement,
                    file: String::from(file),
                    line_number,
                    line: String::from(line)
                }
            ]
        },
        _ => vec![
            StatementWithContext {
                statement,
                file: String::from(file),
                line_number,
                line: String::from(line)
            }
        ]
    }
}

fn parse_statement<'a>(file: &'a str, line_number: usize) -> impl Fn(&'a str) -> CustomResult<&'a str, Vec<StatementWithContext>> {
    move |line| {
        let (input, _) = eat_whitespace(line)?;
        let (input, statement) = alt(
            (
                parse_label,
                parse_instruction,
                parse_origin,
                parse_align,
                parse_bank,
                parse_word,
                parse_reserve,
                parse_define
            )
        )(input)?;
        let (input, _) = eat_whitespace(input)?;
        Ok((input, expand(statement, file, line_number, line)))
    }
}

fn parse_blank_line(input: &str) -> CustomResult<&str, Vec<StatementWithContext>> {
    if !input.is_empty() {
        let (input, _) = eat_whitespace(input)?;
        if input.is_empty() {
            Ok((input, Vec::new()))
        } else {
            Err(Err::Error(CustomError::NomError(input, ErrorKind::Space)))
        }
    } else {
        Err(Err::Error(CustomError::NomError(input, ErrorKind::Space)))
    }
}

fn parse_include_name(input: &str) -> CustomResult<&str, &str> {
    let (input, _) = eat_whitespace(input)?;
    let (input, _) = tag(".include")(input)?;
    let (input, _) = eat_whitespace(input)?;
    let (input, path) = take_while(|c| c != '\r' && c != '\n' && c != ';')(input)?;
    let (input, _) = eat_whitespace(input)?;
    if input.is_empty() {
        Ok((input, path))
    } else {
        Err(Err::Error(CustomError::NomError(input, ErrorKind::Space)))
    }
}

fn parse_include(input: &str) -> CustomResult<&str, Vec<StatementWithContext>> {
    let (input, path) = parse_include_name(input)?;
    match read_to_string(path) {
        Ok(inner) => {
            match parse(path, &inner) {
                Ok(sl) => Ok((input, sl)),
                Err(s) => Err(Err::Failure(CustomError::CustomError(s)))
            }
        },
        Err(e) => Err(
            Err::Failure(
                CustomError::CustomError(format!("could not read {}: {}", path, e.to_string()))
            )
        )
    }
}

fn parse_statement_list<'a>(name: &'a str, line_number: usize, input: &'a str) -> CustomResult<&'a str, Vec<StatementWithContext>> {
    let (input, sss) = many0(
        alt(
            (
                parse_statement(name, line_number),
                parse_include,
                parse_blank_line,
            )
        )
    )(input)?;
    let mut result = Vec::new();
    for ss in sss {
        result.extend(ss);
    }
    Ok((input, result))
}

pub fn parse(name: &str, input: &str) -> Result<Vec<StatementWithContext>, String> {
    let mut result: Vec<StatementWithContext> = Vec::new();
    for (index, line) in input.split(|c| c == '\n').enumerate() {
        let line_number = index + 1;
        let line_statements = match parse_statement_list(name, line_number, line) {
            Ok((input, ss)) => {
                if input.is_empty() {
                    Ok(ss)
                } else {
                    Result::Err(format!("{}[{}]: parse error at '{}'", name, line_number, input))
                }
            },
            Err(Err::Error(e)) =>
                Result::Err(format!("{}[{}]: {}", name, line_number, e.description())),
            Err(Err::Failure(e)) =>
                Result::Err(format!("{}[{}]: {}", name, line_number, e.description())),
            Err(Err::Incomplete(_n)) =>
                Result::Err(format!("{}[{}]: incomplete parse", name, line_number))
        }?;
        result.extend(line_statements);
    };
    Ok(result)
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
    fn test_parse_multiple_expr() {
        assert_eq!(
            parse_expr("a-b+c"),
            Ok(
                (
                    "",
                    Expression::Add(
                        Box::from(
                            Expression::Sub(
                                Box::from(Expression::Symbol(String::from("a"))),
                                Box::from(Expression::Symbol(String::from("b")))
                            )
                        ),
                        Box::from(Expression::Symbol(String::from("c")))
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
    fn test_parse_expr() {
        assert_eq!(
            parse_expr("a*(b-c)+d"),
            Ok(
                (
                    "",
                    Expression::Add(
                        Box::from(
                            Expression::Mul(
                                Box::from(Expression::Symbol(String::from("a"))),
                                Box::from(
                                    Expression::Sub(
                                        Box::from(Expression::Symbol(String::from("b"))),
                                        Box::from(Expression::Symbol(String::from("c")))
                                    )
                                )
                            )
                        ),
                        Box::from(Expression::Symbol(String::from("d")))
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
        assert_eq!(parse_mode("#asdf"), Ok(("asdf", AddressMode::Immediate)));
        assert_eq!(parse_mode("@#asdf"), Ok(("asdf", AddressMode::ImmediateIndirect)));
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
            parse("file", "label:\n  add =5\n\n").unwrap(),
            vec![
                StatementWithContext {
                    file: String::from("file"),
                    line_number: 1,
                    statement: Statement::Label(String::from("label")),
                    line: String::from("label:")
                },
                StatementWithContext {
                    file: String::from("file"),
                    line_number: 2,
                    line: String::from("  add =5"),
                    statement: Statement::Instruction(
                        InstructionType::Add,
                        AddressMode::ZeroPage,
                        Expression::Constant(5)
                    )
                }
            ]
        )
    }
}

