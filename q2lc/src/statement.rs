use std::collections::HashSet;
use crate::emit;
use crate::expr::{Expression, Word};
use crate::symbol::{Symbol, SymbolTable};

pub enum Statement {
    Var(String, Option<Expression>),
    Const(String, Expression),
    Assign(Expression, Expression),
    If(Expression, Vec<Statement>, Vec<Statement>),
    While(Expression, Vec<Statement>),
    Function(String, Vec<String>, Vec<Statement>),
    Return(Expression),
    Expression(Expression),
}

impl Statement {

    pub fn get_watermark(&self, state: &SymbolTable) -> Word {
        match self {
            Statement::Var(_, expr_opt) => match expr_opt {
                Some(expr) => expr.get_watermark(state),
                None => SymbolTable::BASE_WATERMARK,
            },
            Statement::Const(_, expr) => expr.get_watermark(state),
            Statement::Assign(dest, src) => Word::max(
                dest.get_watermark(state), src.get_watermark(state)
            ),
            Statement::If(cond, t, f) => Word::max(
                cond.get_watermark(state),
                Word::max(get_watermark(state, t), get_watermark(state, f))
            ),
            Statement::While(cond, body) => Word::max(
                cond.get_watermark(state),
                get_watermark(state, body)
            ),
            Statement::Expression(expr) => expr.get_watermark(state),
            Statement::Function(_, _, _) => SymbolTable::BASE_WATERMARK,
            Statement::Return(expr) => expr.get_watermark(state),
        }
    }

    pub fn used_functions(&self, funs: &mut HashSet<String>) {
        match self {
            Statement::Var(_, expr_opt) => match expr_opt {
                Some(expr) => expr.used_functions(funs),
                None => (),
            },
            Statement::Const(_, expr) => expr.used_functions(funs),
            Statement::Assign(dest, src) => {
                dest.used_functions(funs);
                src.used_functions(funs);
            },
            Statement::If(cond, t, f) => {
                cond.used_functions(funs);
                used_functions(t, funs);
                used_functions(f, funs);
            },
            Statement::While(cond, body) => {
                cond.used_functions(funs);
                used_functions(body, funs);
            },
            Statement::Function(n, _, body) => {
                if funs.contains(n) {
                    used_functions(body, funs);
                }
            },
            Statement::Expression(expr) => expr.used_functions(funs),
            Statement::Return(expr) => expr.used_functions(funs),
        }
    }

    pub fn simplify(&self, state: &mut SymbolTable) -> Statement {
        match self {
            Statement::Var(name, expr_opt) => match expr_opt {
                Some(expr) => Statement::Var(name.clone(), Some(expr.simplify(state))),
                None => Statement::Var(name.clone(), None),
            },
            Statement::Const(name, expr) => {
                let simplified = expr.simplify(state);
                match simplified {
                    Expression::Constant(w) => state.declare_const(name, Symbol::Constant(w)),
                    _ => (),
                };
                Statement::Const(name.clone(), simplified)
            },
            Statement::Assign(dest, src) => Statement::Assign(dest.simplify(state), src.simplify(state)),
            Statement::If(cond, t, f) => {
                Statement::If(cond.simplify(state), simplify_statements(state, t), simplify_statements(state, f))
            },
            Statement::While(cond, body) => Statement::While(cond.simplify(state), simplify_statements(state, body)),
            Statement::Function(name, args, body) => Statement::Function(name.clone(), args.clone(), simplify_statements(state, body)),
            Statement::Expression(expr) => Statement::Expression(expr.simplify(state)),
            Statement::Return(expr) => Statement::Return(expr.simplify(state)),
        }
    }

    pub fn emit(&self, state: &mut SymbolTable) {
        match self {
            Statement::Var(name, expr_opt) => emit::emit_var(state, name, expr_opt),
            Statement::Const(name, expr) => emit::emit_const(state, name, expr),
            Statement::Assign(dest, src) => emit::emit_assign(state, dest, src),
            Statement::If(cond, t, f) => emit::emit_if(state, cond, t, f),
            Statement::While(cond, body) => emit::emit_while(state, cond, body),
            Statement::Function(name, args, body) => emit::emit_function(state, name, args, body),
            Statement::Expression(expr) => {
                let _ = expr.emit(state);
            },
            Statement::Return(expr) => emit::emit_return(state, expr),
        }
    }
}

fn simplify_statements(state: &mut SymbolTable, statements: &Vec<Statement>) -> Vec<Statement> {
    let mut new_statements = Vec::new();
    for statement in statements {
        new_statements.push(statement.simplify(state));
    }
    new_statements
}

pub fn simplify(state: &mut SymbolTable, statements: &Vec<Statement>) -> Vec<Statement> {
    let simplified_statements = simplify_statements(state, statements);

    let mut used = HashSet::new();
    used.insert(SymbolTable::ENTRYPOINT.to_string());
    used_functions(&simplified_statements, &mut used);

    let mut used_statements = Vec::new();
    for statement in simplified_statements {
        match &statement {
            Statement::Function(name, _, _) => {
                if used.contains(name) {
                    used_statements.push(statement);
                }
            },
            _ => used_statements.push(statement),
        }
    }

    used_statements
}

pub fn emit_statements(state: &mut SymbolTable, statements: &Vec<Statement>) {
    state.enter();
    for statement in statements {
        statement.emit(state);
    }
    state.leave();
}

pub fn get_watermark(state: &SymbolTable, statements: &Vec<Statement>) -> Word {
    let mut watermark = 0;
    for statement in statements {
        watermark = Word::max(watermark, statement.get_watermark(state));
    }
    watermark
}

fn used_functions(statements: &Vec<Statement>, funs: &mut HashSet<String>) {
    for statement in statements.iter().rev() {
        statement.used_functions(funs);
    }
}
