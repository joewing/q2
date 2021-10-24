use std::collections::HashSet;
use crate::emit;
use crate::expr::{Expression, UnaryOperator};
use crate::symbol::{Symbol, SymbolTable, Watermark};

#[derive(Clone)]
pub enum Statement {
    Var(String, Option<Expression>),
    Const(String, Expression),
    Assign(Expression, Expression),
    If(Expression, Box<Statement>, Box<Statement>),
    IfCarry(Expression, Box<Statement>, Box<Statement>),
    While(Expression, Box<Statement>),
    Function(String, Vec<String>, Box<Statement>),
    Return(Expression),
    Expression(Expression),
    Break,
    Block(Vec<Statement>),
}

impl Statement {

    pub fn is_empty(&self) -> bool {
        match self {
            Statement::Block(ss) => ss.is_empty(),
            _ => false
        }
    }

    pub fn get_watermark(&self, state: &SymbolTable) -> Watermark {
        match self {
            Statement::Var(_, expr_opt) => match expr_opt {
                Some(expr) => expr.get_watermark(state),
                None => SymbolTable::BASE_WATERMARK,
            },
            Statement::Const(_, expr) => expr.get_watermark(state),
            Statement::Assign(dest, src) => {
                dest.get_watermark(state).combine(src.get_watermark(state))
            },
            Statement::If(cond, t, f) => {
                cond.get_watermark(state).combine(
                    t.get_watermark(state)
                ).combine(f.get_watermark(state))
            },
            Statement::IfCarry(cond, t, f) => {
                cond.get_watermark(state)
                    .combine(t.get_watermark(state))
                    .combine(f.get_watermark(state))
            },
            Statement::While(cond, body) => {
                cond.get_watermark(state).combine(body.get_watermark(state))
            },
            Statement::Expression(expr) => expr.get_watermark(state),
            Statement::Function(_, _, _) => SymbolTable::BASE_WATERMARK,
            Statement::Return(expr) => expr.get_watermark(state),
            Statement::Break => SymbolTable::BASE_WATERMARK,
            Statement::Block(ss) => {
                ss.iter().fold(SymbolTable::BASE_WATERMARK, |w, s| w.combine(s.get_watermark(state)))
            },
        }
    }

    pub fn used_symbols(&self, symbols: &mut HashSet<String>) {
        match self {
            Statement::Var(_, expr_opt) => match expr_opt {
                Some(expr) => expr.used_symbols(symbols),
                None => (),
            },
            Statement::Const(_, expr) => expr.used_symbols(symbols),
            Statement::Assign(dest, src) => {
                dest.used_symbols(symbols);
                src.used_symbols(symbols);
            },
            Statement::If(cond, t, f) => {
                cond.used_symbols(symbols);
                t.used_symbols(symbols);
                f.used_symbols(symbols);
            },
            Statement::IfCarry(cond, t, f) => {
                cond.used_symbols(symbols);
                t.used_symbols(symbols);
                f.used_symbols(symbols);
            },
            Statement::While(cond, body) => {
                cond.used_symbols(symbols);
                body.used_symbols(symbols);
            },
            Statement::Function(n, _, body) => {
                if symbols.contains(n) {
                    body.used_symbols(symbols);
                }
            },
            Statement::Expression(expr) => expr.used_symbols(symbols),
            Statement::Return(expr) => expr.used_symbols(symbols),
            Statement::Break => (),
            Statement::Block(ss) => ss.iter().rev().for_each(|s| s.used_symbols(symbols)),
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
                Statement::If(cond.simplify(state), Box::from(t.simplify(state)), Box::from(f.simplify(state)))
            },
            Statement::IfCarry(cond, t, f) => {
                Statement::IfCarry(cond.simplify(state), Box::from(t.simplify(state)), Box::from(f.simplify(state)))
            },
            Statement::While(cond, body) => Statement::While(cond.simplify(state), Box::from(body.simplify(state))),
            Statement::Function(name, args, body) => Statement::Function(name.clone(), args.clone(), Box::from(body.simplify(state))),
            Statement::Expression(expr) => Statement::Expression(expr.simplify(state)),
            Statement::Return(expr) => Statement::Return(expr.simplify(state)),
            Statement::Break => Statement::Break,
            Statement::Block(ss) => Statement::Block(ss.iter().map(|s| s.simplify(state)).collect()),
        }
    }

    pub fn prune(&self, symbols: &HashSet<String>) -> Statement {
        match self {
            Statement::Var(name, _) if !symbols.contains(name) => Statement::Block(Vec::new()),
            Statement::Function(name, _, _) if !symbols.contains(name) => Statement::Block(Vec::new()),
            Statement::Const(name, _) if !symbols.contains(name) => Statement::Block(Vec::new()),
            Statement::Block(ss) => Statement::Block(ss.iter().map(|s| s.prune(symbols)).collect()),
            s => s.clone()
        }
    }

    pub fn emit(&self, state: &mut SymbolTable) -> Result<(), String> {
        match self {
            Statement::Var(name, expr_opt) => emit_var(state, name, expr_opt),
            Statement::Const(name, expr) => emit_const(state, name, expr),
            Statement::Assign(dest, src) => emit::emit_assign(state, dest, src),
            Statement::If(cond, t, f) => emit::emit_if(state, cond, t, f),
            Statement::IfCarry(cond, t, f) => emit::emit_ifcarry(state, cond, t, f),
            Statement::While(cond, body) => emit::emit_while(state, cond, body),
            Statement::Function(name, args, body) => emit::emit_function(state, name, args, body),
            Statement::Expression(expr) => {
                let _ = expr.emit(state)?;
                Ok(())
            },
            Statement::Return(expr) => emit::emit_return(state, expr),
            Statement::Break => emit::emit_break(state),
            Statement::Block(ss) => {
                for s in ss {
                    let _ = s.emit(state)?;
                }
                Ok(())
            },
        }
    }
}

pub fn simplify(state: &mut SymbolTable, statements: Vec<Statement>) -> Statement {
    let simplified_statements: Vec<Statement> = statements.iter().map(|s| s.simplify(state)).collect();
    let mut used = HashSet::new();
    used.insert(SymbolTable::ENTRYPOINT.to_string());
    simplified_statements.iter().rev().for_each(|s| s.used_symbols(&mut used));
    Statement::Block(simplified_statements.iter().map(|s| s.prune(&used)).collect())
}

fn emit_var(state: &mut SymbolTable, name: &String, expr_opt: &Option<Expression>) -> Result<(), String> {
    match expr_opt {
        Some(expr) => match expr {
            Expression::Constant(value) if state.is_global() =>
                state.declare_var(name, Some(Symbol::Constant(*value))),
            Expression::ArrayLiteral(inner) if state.is_global() => {
                let label = state.append_data(inner)?;
                state.declare_var(name, Some(label))
            },
            Expression::Unary(op, inner) if *op == UnaryOperator::ArrayDecl && state.is_global() => {
                if let Expression::Constant(size) = inner.as_ref() {
                    let addr = state.append_heap(*size)?;
                    state.declare_var(name, Some(Symbol::Constant(addr)))
                } else {
                    Err(format!("array '{}' does not have constant size", name))
                }
            },
            _ => {
                if state.is_global() {
                    Err(format!("global var '{}' not constant", name))
                } else {
                    let _ = expr.emit(state)?;
                    let _ = state.declare_var(name, None)?;
                    emit::emit_store(state, &state.lookup(name)?)
                }
            }
        }
        None => state.declare_var(name, None),
    }
}

fn emit_const(state: &mut SymbolTable, name: &String, expr: &Expression) -> Result<(), String> {
    match expr {
        Expression::Constant(w) => {
            state.declare_const(name, Symbol::Constant(*w));
            Ok(())
        },
        Expression::ArrayLiteral(vs) => {
            let symbol = state.append_data(vs)?;
            state.declare_const(name, symbol);
            Ok(())
        },
        Expression::Unary(op, size_expr) if *op == UnaryOperator::ArrayDecl => {
            if let Expression::Constant(size) = size_expr.as_ref() {
                let symbol = Symbol::Constant(state.append_heap(*size)?);
                state.declare_const(name, symbol);
                Ok(())
            } else {
                Err(format!("array size must be constant"))
            }
        },
        _ => Err(format!("const must be constant")),
    }
}

