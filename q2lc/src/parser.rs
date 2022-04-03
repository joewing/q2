use std::fs::File;
use std::io::{BufRead, BufReader};
use std::str::FromStr;
use crate::expr::{BinaryOperator, Expression, UnaryOperator, Word};
use crate::statement::Statement;
use crate::tokenizer::{Token, Tokenizer};

const IF: &str = "if";
const IFCARRY: &str = "ifcarry";
const THEN: &str = "then";
const ELSEIF: &str = "elseif";
const ELSE: &str = "else";
const END: &str = "end";
const WHILE: &str = "while";
const DO: &str = "do";
const FUN: &str = "fun";
const BREAK: &str = "break";
const RETURN: &str = "return";
const INCLUDE: &str = "include";
const CONST: &str = "const";
const VAR: &str = "var";
const LPAREN: &str = "(";
const RPAREN: &str = ")";
const EOF: &str = "";
const TERM: &str = ";";

fn parse(tokenizer: &mut Tokenizer) -> Result<Statement, String> {
    let block = parse_block(tokenizer)?;
    let _ = tokenizer.expect(EOF)?;
    Ok(block)
}

pub fn parse_file(file_name: &str) -> Result<Statement, String> {
    let mut tokenizer = Tokenizer::from_file(file_name)?;
    parse(&mut tokenizer)
}

pub fn parse_str(input: &str) -> Result<Statement, String> {
    let mut tokenizer = Tokenizer::from_str(input)?;
    parse(&mut tokenizer)
}

fn parse_ident(tokenizer: &mut Tokenizer) -> Result<String, String> {
    let result = tokenizer.peek_token();
    tokenizer.next_token();
    if result.value.is_empty() {
        result.error("identifier expected".to_string())
    } else {
        Ok(result.value)
    }
}

fn parse_var_inner(tokenizer: &mut Tokenizer) -> Result<Statement, String> {
    let ident = parse_ident(tokenizer)?;
    let expr_opt = if tokenizer.check("=") {
        tokenizer.next_token();
        let expr = parse_expr(tokenizer)?;
        Some(expr)
    } else {
        None
    };
    Ok(Statement::Var(ident, expr_opt))
}

fn parse_var(tokenizer: &mut Tokenizer) -> Result<Statement, String> {
    let mut result = Vec::new();
    let _ = tokenizer.expect(VAR)?;
    result.push(parse_var_inner(tokenizer)?);
    while tokenizer.check(",") {
        tokenizer.next_token();
        result.push(parse_var_inner(tokenizer)?);
    }
    let _ = tokenizer.expect(TERM)?;
    if result.len() == 1 {
        Ok(result.pop().unwrap())
    } else {
        Ok(Statement::Block(result))
    }
}

fn parse_const_inner(tokenizer: &mut Tokenizer) -> Result<Statement, String> {
    let ident = parse_ident(tokenizer)?;
    let _ = tokenizer.expect("=")?;
    let expr = parse_expr(tokenizer)?;
    Ok(Statement::Const(ident, expr))
}

fn parse_const(tokenizer: &mut Tokenizer) -> Result<Statement, String> {
    let mut result = Vec::new();
    let _ = tokenizer.expect(CONST)?;
    result.push(parse_const_inner(tokenizer)?);
    while tokenizer.check(",") {
        tokenizer.next_token();
        result.push(parse_const_inner(tokenizer)?);
    }
    let _ = tokenizer.expect(TERM)?;
    if result.len() == 1 {
        Ok(result.pop().unwrap())
    } else {
        Ok(Statement::Block(result))
    }
}

fn parse_bin(tokenizer: &mut Tokenizer) -> Result<Word, String> {
    let tok = tokenizer.peek_token();
    tokenizer.next_token();
    let input = tok.value.as_str();
    match Word::from_str_radix(&input[2..], 2) {
        Ok(value) => Ok(value),
        Err(_) => tok.error(format!("invalid binary number: {}", input))
    }
}

fn parse_dec(tokenizer: &mut Tokenizer) -> Result<Word, String> {
    let tok = tokenizer.peek_token();
    tokenizer.next_token();
    let input = tok.value.as_str();
    match Word::from_str(input) {
        Ok(value) => Ok(value),
        Err(_) => tok.error(format!("invalid decimal number: {}", input))
    }
}

fn parse_oct(tokenizer: &mut Tokenizer) -> Result<Word, String> {
    let tok = tokenizer.peek_token();
    tokenizer.next_token();
    let input = tok.value.as_str();
    match Word::from_str_radix(&input[2..], 8) {
        Ok(value) => Ok(value),
        Err(_) => tok.error(format!("invalid octal number: {}", input))
    }
}

fn parse_hex(tokenizer: &mut Tokenizer) -> Result<Word, String> {
    let tok = tokenizer.peek_token();
    tokenizer.next_token();
    let input = tok.value.as_str();
    match Word::from_str_radix(&input[2..], 16) {
        Ok(value) => Ok(value),
        Err(_) => tok.error(format!("invalid hex number: {}", input))
    }
}

fn parse_hex_digit(tok: &Token, ch: char) -> Result<Word, String> {
    match ch {
        '0'..='9' => Ok((ch as Word) - ('0' as Word)),
        'a'..='f' => Ok((ch as Word) - ('a' as Word) + 10),
        'A'..='F' => Ok((ch as Word) - ('A' as Word) + 10),
        _ => tok.error(format!("invalid hex character: {}", ch))
    }
}

fn parse_escape_char(ch: char) -> Word {
    match ch {
        'n' | 'N' => '\n' as Word,
        _ => ch as Word
    }
}

fn parse_char(tokenizer: &mut Tokenizer) -> Result<Word, String> {
    let tok = tokenizer.peek_token();
    tokenizer.next_token();
    let chars: Vec<char> = tok.value.chars().collect();
    if chars.len() == 3 {
        // 'X'
        Ok(*chars.get(1).unwrap() as Word)
    } else if chars.len() == 4 && *chars.get(1).unwrap() == '\\' {
        // '\X'
        Ok(parse_escape_char(*chars.get(2).unwrap()))
    } else if chars.len() == 7 && *chars.get(1).unwrap() == '\n' && *chars.get(2).unwrap() == 'x' {
        // '\xXXX'
        let mut w = 0;
        for i in 3..6 {
            let digit = parse_hex_digit(&tok, *chars.get(i).unwrap())?;
            w = (w << 4) | digit;
        }
        Ok(w)
    } else {
        tok.error(format!("invalid character literal: {}", tok.value))
    }
}

fn parse_string_literal(tokenizer: &mut Tokenizer) -> Result<Expression, String> {
    let tok = tokenizer.peek_token();
    tokenizer.next_token();
    let mut words = Vec::new();
    let mut in_control = false;
    let mut in_hex = 0;
    let mut hex_word: Word = 0;
    let mut i = 1;
    while i < tok.value.len() - 1 {
        let ch = tok.value.as_bytes()[i] as char;
        match ch {
            _ if in_hex > 0 => {
                let digit = parse_hex_digit(&tok, ch)?;
                hex_word = (hex_word << 4) | digit;
                in_hex -= 1;
                if in_hex == 0 {
                    words.push(Expression::Constant(hex_word));
                }
            },
            'x' | 'X' if in_control => {
                in_control = false;
                in_hex = 3;
                hex_word = 0;
            },
            'n' | 'N' if in_control => {
                in_control = false;
                words.push(Expression::Constant('\n' as Word));
            },
            _ if in_control => {
                words.push(Expression::Constant(ch as Word));
            },
            '\\' => {
                in_control = true;
            },
            _ => {
                words.push(Expression::Constant(ch as Word));
            }
        }
        i += 1;
    }
    words.push(Expression::Constant(0));
    Ok(Expression::ArrayLiteral(words))
}

fn parse_array_literal(tokenizer: &mut Tokenizer) -> Result<Expression, String> {
    let _ = tokenizer.expect("[")?;
    let mut exprs = Vec::new();
    loop {
        exprs.push(parse_expr(tokenizer)?);
        if !tokenizer.check(",") {
            break;
        }
        tokenizer.next_token();
    }
    let _ = tokenizer.expect("]")?;
    Ok(Expression::ArrayLiteral(exprs))
}

fn parse_literal(tokenizer: &mut Tokenizer) -> Result<Expression, String> {
    let tok = tokenizer.peek_token();
    let word = if tok.value.starts_with("0b") {
        parse_bin(tokenizer)
    } else if tok.value.starts_with("0o") {
        parse_oct(tokenizer)
    } else if tok.value.starts_with("0x") {
        parse_hex(tokenizer)
    } else if tok.value.starts_with("\'") {
        parse_char(tokenizer)
    } else {
        parse_dec(tokenizer)
    }?;
    Ok(Expression::Constant(word))
}

fn parse_symbol(tokenizer: &mut Tokenizer) -> Result<Expression, String> {
    let name = parse_ident(tokenizer)?;
    Ok(Expression::Symbol(name))
}

fn parse_nest(tokenizer: &mut Tokenizer) -> Result<Expression, String> {
    tokenizer.next_token();
    let expr = parse_expr(tokenizer)?;
    let _ = tokenizer.expect(RPAREN)?;
    Ok(expr)
}

fn is_alpha(c: char) -> bool {
    (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || c == '_'
}

fn parse_factor_cont(tokenizer: &mut Tokenizer, factor: Expression) -> Result<Expression, String> {
    if tokenizer.check("(") {
        tokenizer.next_token();
        let mut args = Vec::new();
        if !tokenizer.check(")") {
            loop {
                args.push(parse_expr(tokenizer)?);
                if !tokenizer.check(",") {
                    break;
                }
                tokenizer.next_token();
            }
        }
        let _ = tokenizer.expect(")")?;
        Ok(Expression::Call(Box::from(factor), args))
    } else {
        Ok(factor)
    }
}

const FACTOR_OPS: &[(&str, UnaryOperator)] = &[
    ("@", UnaryOperator::Deref),
    ("-", UnaryOperator::Negate),
    ("~", UnaryOperator::Not),
    ("!", UnaryOperator::Lnot),
    (":", UnaryOperator::ArrayDecl),
];

fn parse_factor(tokenizer: &mut Tokenizer) -> Result<Expression, String> {
    let tok = tokenizer.peek_token();
    for (value, op) in FACTOR_OPS {
        if tok.value == *value {
            tokenizer.next_token();
            let inner = parse_factor(tokenizer)?;
            let factor = Expression::Unary(*op, Box::new(inner));
            return parse_factor_cont(tokenizer, factor);
        }
    }
    let factor = if tok.value.starts_with("\"") {
        parse_string_literal(tokenizer)
    } else if tok.value == "[" {
        parse_array_literal(tokenizer)
    } else if tok.value == LPAREN  {
        parse_nest(tokenizer)
    } else if tok.value.starts_with(is_alpha) {
        parse_symbol(tokenizer)
    } else {
        parse_literal(tokenizer)
    }?;
    parse_factor_cont(tokenizer, factor)
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

fn parse_level_cont(
    tokenizer: &mut Tokenizer,
    level: usize,
    lhs: Expression
) -> Result<Expression, String> {
    for (name, op) in BINOP_PARSERS[level - 1].iter() {
        if tokenizer.check(name) {
            tokenizer.next_token();
            let rhs = parse_level(tokenizer, level - 1)?;
            let new_lhs = Expression::Binary(*op, Box::new(lhs.clone()), Box::new(rhs));
            return parse_level_cont(tokenizer, level, new_lhs);
        }
    }
    Ok(lhs)
}

fn parse_level(tokenizer: &mut Tokenizer, level: usize) -> Result<Expression, String> {
    if level == 0 {
        parse_factor(tokenizer)
    } else {
        let lhs = parse_level(tokenizer, level - 1)?;
        parse_level_cont(tokenizer, level, lhs)
    }
}

fn parse_expr(tokenizer: &mut Tokenizer) -> Result<Expression, String> {
    let lhs = parse_level(tokenizer, BINOP_PARSERS.len())?;
    parse_level_cont(tokenizer, BINOP_PARSERS.len(), lhs)
}

fn parse_while(tokenizer: &mut Tokenizer) -> Result<Statement, String> {
    tokenizer.next_token();
    let cond = parse_expr(tokenizer)?;
    let _ = tokenizer.expect(DO)?;
    let body = parse_block(tokenizer)?;
    let _ = tokenizer.expect(END)?;
    Ok(Statement::While(cond, Box::from(body)))
}

fn parse_if(tokenizer: &mut Tokenizer) -> Result<Statement, String> {
    let _ = tokenizer.expect(IF)?;
    let cond = parse_expr(tokenizer)?;
    let _ = tokenizer.expect(THEN)?;
    let t = parse_block(tokenizer)?;
    let mut nested = Vec::new();
    while tokenizer.check(ELSEIF) {
        tokenizer.next_token();
        let econd = parse_expr(tokenizer)?;
        let _ = tokenizer.expect(THEN)?;
        let s = parse_block(tokenizer)?;
        nested.push((econd, s));
    }
    let else_statement = if tokenizer.check(ELSE) {
        tokenizer.next_token();
        parse_block(tokenizer)?
    } else {
        Statement::Block(Vec::new())
    };
    let _ = tokenizer.expect(END)?;

    let tails = nested.iter().rev().fold(else_statement, |s, (c, ns)|
        Statement::If(c.clone(), Box::from(ns.clone()), Box::from(s))
    );
    Ok(Statement::If(cond, Box::from(t), Box::from(tails)))
}

fn parse_ifcarry(tokenizer: &mut Tokenizer) -> Result<Statement, String> {
    let _ = tokenizer.expect(IFCARRY)?;
    let t = parse_block(tokenizer)?;
    let f = if tokenizer.check(ELSE) {
        tokenizer.next_token();
        parse_block(tokenizer)?
    } else {
        Statement::Block(Vec::new())
    };
    let _ = tokenizer.expect(END)?;
    Ok(Statement::IfCarry(Box::from(t), Box::from(f)))
}

fn parse_function(tokenizer: &mut Tokenizer) -> Result<Statement, String> {
    let _ = tokenizer.expect(FUN)?;
    let name = parse_ident(tokenizer)?;
    let _ = tokenizer.expect(LPAREN)?;
    let mut params = Vec::new();
    if !tokenizer.check(RPAREN) {
        loop {
            params.push(parse_ident(tokenizer)?);
            if !tokenizer.check(",") {
                break;
            }
            let _ = tokenizer.expect(",")?;
        }
    }
    let _ = tokenizer.expect(")")?;
    let body = parse_block(tokenizer)?;
    let _ = tokenizer.expect("end")?;
    Ok(Statement::Function(name, params, Box::from(body)))
}

pub fn parse_builtin(input: &str) -> Statement {
    match parse_str(input) {
        Ok(block) => block,
        Err(e) => panic!("parse failed: {}, when parsing:\n{}", e, input)
    }
}

fn parse_return(tokenizer: &mut Tokenizer) -> Result<Statement, String> {
    let _ = tokenizer.expect(RETURN)?;
    let expr = parse_expr(tokenizer)?;
    let _ = tokenizer.expect(TERM)?;
    Ok(Statement::Return(expr))
}

fn parse_break(tokenizer: &mut Tokenizer) -> Result<Statement, String> {
    let _ = tokenizer.expect(BREAK)?;
    let _ = tokenizer.expect(TERM)?;
    Ok(Statement::Break)
}

const HEX_SUFFIX: &'static str = ".hex";

fn parse_module(name: String) -> Result<Statement, String> {
    let start = name.rfind('/').map(|x| x + 1).unwrap_or(0);
    let mod_name = &name[start..name.len() - HEX_SUFFIX.len()];
    let f = File::open(name.as_str()).or(Err(format!("could not open {}", name)))?;
    let br = BufReader::new(f);
    let mut exprs = Vec::new();
    let mut line_number = 0;
    let mut word_count = 0;
    for line_opt in br.lines() {
        line_number += 1;
        if line_number > 128 {
            let line = line_opt.unwrap();
            if line.starts_with("XX") {
                exprs.push(Expression::Constant(0x000));
            } else {
                let word = Word::from_str_radix(&line[0..3], 16).unwrap();
                exprs.push(Expression::Constant(word));
            }
            word_count += 1;
        }
    }
    Ok(
        Statement::Block(
            vec![
                Statement::Const(format!("{}", mod_name), Expression::ArrayLiteral(exprs)),
                Statement::Const(format!("{}_size", mod_name), Expression::Constant(word_count))
            ]
        )
    )
}

fn parse_include(tokenizer: &mut Tokenizer) -> Result<Statement, String> {
    let _ = tokenizer.expect(INCLUDE)?;
    let tok = tokenizer.peek_token();
    tokenizer.next_token();
    let name: String = tok.value.chars().skip(1).take_while(|c| *c != '\"').collect();
    let _ = tokenizer.expect(TERM)?;
    if name.ends_with(HEX_SUFFIX) {
        parse_module(name)
    } else {
        parse_file(name.as_str())
    }
}

fn parse_asm(tokenizer: &mut Tokenizer) -> Result<Statement, String> {
    let opcode_tok = tokenizer.peek_token();
    let mut opcode = opcode_tok.value;
    opcode.remove(0);
    tokenizer.next_token();
    let dest = parse_expr(tokenizer)?;
    let _ = tokenizer.expect(TERM)?;
    Ok(Statement::Asm(opcode, dest))
}

fn parse_assign(tokenizer: &mut Tokenizer) -> Result<Statement, String> {
    let lhs = parse_expr(tokenizer)?;
    let statement = if tokenizer.check("=") {
        tokenizer.next_token();
        let rhs = parse_expr(tokenizer)?;
        Statement::Assign(lhs, rhs)
    } else {
        Statement::Expression(lhs)
    };
    let _ = tokenizer.expect(TERM)?;
    Ok(statement)
}

const STATEMENT_PARSERS: &[(&str, fn(&mut Tokenizer) -> Result<Statement, String>)] = &[
    (IF, parse_if),
    (VAR, parse_var),
    (IFCARRY, parse_ifcarry),
    (WHILE, parse_while),
    (FUN, parse_function),
    (CONST, parse_const),
    (BREAK, parse_break),
    (INCLUDE, parse_include),
    (RETURN, parse_return),
    ("_lea", parse_asm),
    ("_sta", parse_asm),
    ("_lda", parse_asm),
    ("_nor", parse_asm),
    ("_add", parse_asm),
    ("_shr", parse_asm),
    ("_jmp", parse_asm),
    ("_jfc", parse_asm),
];

fn parse_block(tokenizer: &mut Tokenizer) -> Result<Statement, String> {
    let mut statements = Vec::new();
    loop {
        let tok = tokenizer.peek_token();
        let value = &tok.value;
        let mut found = false;
        for (start, parser) in STATEMENT_PARSERS {
            if value == *start {
                statements.push(parser(tokenizer)?);
                found = true;
                break;
            }
        }
        if !found {
            if value.is_empty() || value == END || value == ELSE || value == ELSEIF {
                return Ok(Statement::Block(statements));
            } else {
                statements.push(parse_assign(tokenizer)?);
            }
        }
    }
}

#[cfg(test)]
pub(crate) mod tests {
    use test_case::test_case;
    use crate::expr::*;
    use crate::parser;
    use crate::tokenizer::Tokenizer;

    pub fn parse_expr_str(input: &str) -> Result<Expression, String> {
        let mut tokenizer = Tokenizer::from_str(input)?;
        let expr = parser::parse_expr(&mut tokenizer)?;
        let _ = tokenizer.expect("")?;
        Ok(expr)
    }

    #[test_case("x_y123", Expression::Symbol("x_y123".to_string()))]
    #[test_case("5", Expression::Constant(5))]
    #[test_case("-5", Expression::Unary(UnaryOperator::Negate, Box::from(Expression::Constant(5))))]
    #[test_case("@6", Expression::Unary(UnaryOperator::Deref, Box::from(Expression::Constant(6))))]
    #[test_case("@x + 1",
        Expression::Binary(BinaryOperator::Add,
            Box::new(Expression::Unary(UnaryOperator::Deref, Box::from(Expression::Symbol("x".to_string())))),
            Box::new(Expression::Constant(1))
        )
    )]
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
    #[test_case("\"\\xAb1q\"",
        Expression::ArrayLiteral(
            vec![
                Expression::Constant(0x0ab1),
                Expression::Constant('q' as Word),
                Expression::Constant(0)
            ]
        )
    )]
    fn parse_expr_tests(input: &str, expected: Expression) {
        let expr = parser::tests::parse_expr_str(input).unwrap();
        assert_eq!(expr, expected);
    }
}
