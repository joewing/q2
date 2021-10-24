
use std::str::FromStr;
use crate::expr::{BinaryOperator, Expression, UnaryOperator, Word};
use crate::statement::Statement;
use crate::tokenizer::Tokenizer;

fn parse(tokenizer: &mut Tokenizer) -> Result<Statement, String> {
    let block = parse_block(tokenizer)?;
    let _ = tokenizer.expect("")?;
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

fn parse_while(tokenizer: &mut Tokenizer) -> Result<Statement, String> {
    tokenizer.next_token();
    let cond = parse_expr(tokenizer)?;
    let _ = tokenizer.expect("do")?;
    let body = parse_block(tokenizer)?;
    let _ = tokenizer.expect("end")?;
    Ok(Statement::While(cond, Box::from(body)))
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

fn parse_var(tokenizer: &mut Tokenizer) -> Result<Statement, String> {
    let _ = tokenizer.expect("var")?;
    let ident = parse_ident(tokenizer)?;
    let expr_opt = if tokenizer.check("=") {
        tokenizer.next_token();
        let expr = parse_expr(tokenizer)?;
        Some(expr)
    } else {
        None
    };
    let _ = tokenizer.expect(";")?;
    Ok(Statement::Var(ident, expr_opt))
}

fn parse_const(tokenizer: &mut Tokenizer) -> Result<Statement, String> {
    let _ = tokenizer.expect("const")?;
    let ident = parse_ident(tokenizer)?;
    let _ = tokenizer.expect("=")?;
    let expr = parse_expr(tokenizer)?;
    let _ = tokenizer.expect(";")?;
    Ok(Statement::Const(ident, expr))
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

fn parse_char(tokenizer: &mut Tokenizer) -> Result<Word, String> {
    let tok = tokenizer.peek_token();
    tokenizer.next_token();
    let chars: Vec<char> = tok.value.chars().collect();
    if chars.len() == 3 && *chars.get(0).unwrap() == '\'' && *chars.get(2).unwrap() == '\'' {
        let ch = *chars.get(1).unwrap() as Word;
        Ok(ch)
    } else {
        tok.error(format!("invalid character literal: {}", tok.value))
    }
}

fn parse_string_literal(tokenizer: &mut Tokenizer) -> Result<Expression, String> {
    let tok = tokenizer.peek_token();
    tokenizer.next_token();
    let mut words: Vec<Expression> = tok.value.chars().skip(1).take_while(|c| *c != '\"').map(|c| Expression::Constant(c as Word)).collect();
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

fn parse_unary(tokenizer: &mut Tokenizer, op: UnaryOperator) -> Result<Expression, String> {
    tokenizer.next_token();
    let inner = parse_factor(tokenizer)?;
    Ok(Expression::Unary(op, Box::new(inner)))
}

fn parse_deref(tokenizer: &mut Tokenizer) -> Result<Expression, String> {
    parse_unary(tokenizer, UnaryOperator::Deref)
}

fn parse_nest(tokenizer: &mut Tokenizer) -> Result<Expression, String> {
    tokenizer.next_token();
    let expr = parse_expr(tokenizer)?;
    let _ = tokenizer.expect(")")?;
    Ok(expr)
}

fn is_alpha(c: char) -> bool {
    (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || c == '_'
}

fn parse_factor(tokenizer: &mut Tokenizer) -> Result<Expression, String> {
    let tok = tokenizer.peek_token();
    let factor = if tok.value.starts_with("\"") {
        parse_string_literal(tokenizer)
    } else if tok.value == "[" {
        parse_array_literal(tokenizer)
    } else if tok.value == "@" {
        parse_deref(tokenizer)
    } else if tok.value == ":" {
        parse_unary(tokenizer, UnaryOperator::ArrayDecl)
    } else if tok.value == "~" {
        parse_unary(tokenizer, UnaryOperator::Not)
    } else if tok.value == "-" {
        parse_unary(tokenizer, UnaryOperator::Negate)
    } else if tok.value == "!" {
        parse_unary(tokenizer, UnaryOperator::Lnot)
    } else if tok.value == "(" {
        parse_nest(tokenizer)
    } else if tok.value.starts_with(is_alpha) {
        parse_symbol(tokenizer)
    } else {
        parse_literal(tokenizer)
    }?;
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

fn parse_if(tokenizer: &mut Tokenizer) -> Result<Statement, String> {
    let _ = tokenizer.expect("if")?;
    let cond = parse_expr(tokenizer)?;
    let _ = tokenizer.expect("then")?;
    let t = parse_block(tokenizer)?;
    let mut nested = Vec::new();
    while tokenizer.check("elseif") {
        tokenizer.next_token();
        let econd = parse_expr(tokenizer)?;
        let _ = tokenizer.expect("then")?;
        let s = parse_block(tokenizer)?;
        nested.push((econd, s));
    }
    let else_statement = if tokenizer.check("else") {
        tokenizer.next_token();
        parse_block(tokenizer)?
    } else {
        Statement::Block(Vec::new())
    };
    let _ = tokenizer.expect("end")?;

    let tails = nested.iter().rev().fold(else_statement, |s, (c, ns)|
        Statement::If(c.clone(), Box::from(ns.clone()), Box::from(s))
    );
    Ok(Statement::If(cond, Box::from(t), Box::from(tails)))
}

fn parse_ifcarry(tokenizer: &mut Tokenizer) -> Result<Statement, String> {
    let _ = tokenizer.expect("ifcarry")?;
    let cond = parse_expr(tokenizer)?;
    let _ = tokenizer.expect("then")?;
    let t = parse_block(tokenizer)?;
    let f = if tokenizer.check("else") {
        tokenizer.next_token();
        parse_block(tokenizer)?
    } else {
        Statement::Block(Vec::new())
    };
    let _ = tokenizer.expect("end")?;
    Ok(Statement::IfCarry(cond, Box::from(t), Box::from(f)))
}

fn parse_function(tokenizer: &mut Tokenizer) -> Result<Statement, String> {
    let _ = tokenizer.expect("fun")?;
    let name = parse_ident(tokenizer)?;
    let _ = tokenizer.expect("(")?;
    let mut params = Vec::new();
    if !tokenizer.check(")") {
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
    let _ = tokenizer.expect("return")?;
    let expr = parse_expr(tokenizer)?;
    let _ = tokenizer.expect(";")?;
    Ok(Statement::Return(expr))
}

fn parse_break(tokenizer: &mut Tokenizer) -> Result<Statement, String> {
    let _ = tokenizer.expect("break")?;
    let _ = tokenizer.expect(";")?;
    Ok(Statement::Break)
}

fn parse_include(tokenizer: &mut Tokenizer) -> Result<Statement, String> {
    let _ = tokenizer.expect("include")?;
    let tok = tokenizer.peek_token();
    tokenizer.next_token();
    let name: String = tok.value.chars().skip(1).take_while(|c| *c != '\"').collect();
    let _ = tokenizer.expect(";")?;
    parse_file(name.as_str())
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
    let _ = tokenizer.expect(";")?;
    Ok(statement)
}

const STATEMENT_PARSERS: &[(&str, fn(&mut Tokenizer) -> Result<Statement, String>)] = &[
    ("if", parse_if),
    ("var", parse_var),
    ("ifcarry", parse_ifcarry),
    ("while", parse_while),
    ("fun", parse_function),
    ("const", parse_const),
    ("break", parse_break),
    ("include", parse_include),
    ("return", parse_return),
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
            if value.is_empty() || value == "end" || value == "else" || value == "elseif" {
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
    fn parse_expr_tests(input: &str, expected: Expression) {
        let expr = parser::tests::parse_expr_str(input).unwrap();
        assert_eq!(expr, expected);
    }
}
