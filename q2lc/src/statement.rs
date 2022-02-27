use crate::emit;
use crate::expr::{Expression, UnaryOperator};
use crate::symbol::{Symbol, SymbolTable};

#[derive(Clone)]
pub enum Statement {
    Var(String, Option<Expression>),
    Const(String, Expression),
    Assign(Expression, Expression),
    If(Expression, Box<Statement>, Box<Statement>),
    IfCarry(Box<Statement>, Box<Statement>),
    While(Expression, Box<Statement>),
    Function(String, Vec<String>, Box<Statement>),
    Return(Expression),
    Expression(Expression),
    Break,
    Block(Vec<Statement>),
    Asm(String, Expression),
}

impl Statement {

    pub const EMPTY: Statement = Statement::Block(Vec::new());

    pub fn is_empty(&self) -> bool {
        match self {
            Statement::Block(ss) => ss.is_empty(),
            _ => false
        }
    }

    pub fn emit(&self, state: &mut SymbolTable) -> Result<(), String> {
        match self {
            Statement::Var(name, expr_opt) => emit_var(state, name, expr_opt),
            Statement::Const(name, expr) => emit_const(state, name, expr),
            Statement::Assign(dest, src) => emit::emit_assign(state, dest, src),
            Statement::If(cond, t, f) => emit::emit_if(state, cond, t, f),
            Statement::IfCarry(t, f) => emit::emit_ifcarry(state, t, f),
            Statement::While(cond, body) => emit::emit_while(state, cond, body),
            Statement::Function(_, _, _) => Ok(()),
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
            Statement::Asm(opcode, dest) => emit::emit_asm(state, opcode, dest),
        }
    }

    pub fn emit_globals(&self, state: &mut SymbolTable) -> Result<(), String> {
        match self {
            Statement::Var(name, expr_opt) => emit_var(state, name, expr_opt),
            Statement::Const(name, expr) => emit_const(state, name, expr),
            Statement::Function(name, args, body) => {
                emit::emit_function(state, name, args, body)
            },
            Statement::Block(ss) => {
                for s in ss {
                    let _ = s.emit_globals(state)?;
                }
                Ok(())
            },
            _ => Err(format!("invalid top-level statement")),
        }
    }
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
        Expression::Symbol(other) => {
            let symbol = state.lookup(other)?;
            state.declare_const(name, symbol);
            Ok(())
        },
        _ => Err(format!("const must be constant")),
    }
}

