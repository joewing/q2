use crate::expr::{Expression, FlagState, Word};
use crate::symbol::{SymbolTable, Symbol};
use crate::statement::{emit_statements, get_watermark, Statement};

fn emit_store_local(state: &mut SymbolTable, indirect: bool, addr: Word) {
    let operand = if addr < 128 { format!("={}", addr) } else { format!("#{}", addr) };
    if indirect {
        state.append_code(format!("sta @{}", operand));
    } else {
        state.append_code(format!("sta {}", operand));
    }
}

fn emit_store(state: &mut SymbolTable, name: &String) {
    match state.lookup(name) {
        Symbol::Undefined => panic!("undefined: {}", name),
        Symbol::Local(addr) => emit_store_local(state, false, addr),
        Symbol::Constant(addr) => {
            if addr < 128 {
                state.append_code(format!("sta ={}", addr));
            } else {
                state.append_code(format!("sta @#{}", addr));
            }
        },
        _ => state.append_code(format!("sta @#{}", name)),
    }
}

pub fn emit_var(state: &mut SymbolTable, name: &String, expr_opt: &Option<Expression>) {
    match expr_opt {
        Some(expr) => match expr {
            Expression::Constant(value) if state.is_global() =>
                state.declare_var(name, Some(Symbol::Constant(*value))),
            Expression::ArrayLiteral(inner) if state.is_global() => {
                let label = state.append_data(inner);
                state.declare_var(name, Some(Symbol::Global(label)));
            },
            Expression::ArrayDecl(inner) if state.is_global() => {
                if let Expression::Constant(size) = inner.as_ref() {
                    let addr = state.append_heap(*size);
                    state.declare_var(name, Some(Symbol::Constant(addr)));
                } else {
                    panic!("arrays must have constant size")
                }
            },
            _ => {
                if state.is_global() {
                    panic!("initialization of global vars must be constant");
                }
                expr.emit(state);
                state.declare_var(name, None);
                emit_store(state, name);
            }
        }
        None => state.declare_var(name, None),
    }
}

pub fn emit_const(state: &mut SymbolTable, name: &String, expr: &Expression) {
    match expr {
        Expression::Constant(w) => state.declare_const(name, Symbol::Constant(*w)),
        Expression::ArrayLiteral(vs) => {
            let symbol = Symbol::Global(state.append_data(vs));
            state.declare_const(name, symbol)
        },
        Expression::ArrayDecl(size_expr) => {
            if let Expression::Constant(size) = size_expr.as_ref() {
                let symbol = Symbol::Constant(state.append_heap(*size));
                state.declare_const(name, symbol)
            } else {
                panic!("array size must be constant")
            }
        },
        _ => panic!("const must be constant"),
    }
}

pub fn emit_assign(state: &mut SymbolTable, dest: &Expression, src: &Expression) {
    match dest {
        Expression::Symbol(name) => {
            src.emit(state);
            emit_store(state, name);
        },
        _ => {
            dest.emit(state);
            let dest_addr = state.allocate_temp();
            emit_store_local(state, false, dest_addr);
            src.emit(state);
            emit_store_local(state, true, dest_addr);
            state.release_temp();
        }
    }
}

fn push(expr: &Expression, state: &mut SymbolTable) -> Word {
    let temp = state.allocate_temp();
    expr.emit(state);
    state.append_code(format!("sta ={}", temp));
    temp
}

fn pop(state: &mut SymbolTable) {
    state.release_temp();
}

// Load the address of the specified symbol.
pub fn emit_symbol(name: &String, state: &mut SymbolTable) -> FlagState {
    let symbol = state.lookup(name);
    match symbol {
        Symbol::Undefined => panic!("undefined: {}", name),
        Symbol::Local(index) => {
            if index < 128 {
                state.append_code(format!("lea ={}", index));
                FlagState::Unknown
            } else {
                state.append_code(format!("lda #{}", index));
                FlagState::Zero
            }
        },
        Symbol::Function(_, _) => {
            state.append_code(format!("lda #{}", name));
            FlagState::Zero
        },
        Symbol::Constant(w) => {
            if w < 128 {
                state.append_code(format!("lea ={}", w));
                FlagState::Unknown
            } else {
                state.append_code(format!("lda #{}", w));
                FlagState::Zero
            }
        },
        Symbol::Global(label) => {
            state.append_code(format!("lda #{}", label));
            FlagState::Zero
        },

    }
}

pub fn emit_deref(inner: &Expression, state: &mut SymbolTable) -> FlagState {
    if let Expression::Symbol(name) = inner {
        match state.lookup(name) {
            Symbol::Local(addr) => {
                if addr < 128 {
                    state.append_code(format!("lda ={}", addr));
                } else {
                    state.append_code(format!("lda @#{}", addr));
                }
                FlagState::Zero
            },
            Symbol::Function(_, _) => {
                state.append_code(format!("lda @#{}", name));
                FlagState::Zero
            },
            Symbol::Constant(addr) => {
                state.append_code(format!("lda @#{}", addr));
                FlagState::Zero
            },
            Symbol::Global(label) => {
                state.append_code(format!("lda @#{}", label));
                FlagState::Zero
            },
            Symbol::Undefined => panic!("undefined: {}", name),
        }
    } else {
        let index = push(inner, state);
        state.append_code(format!("lda @={}", index));
        pop(state);
        FlagState::Zero
    }
}

pub fn emit_call(fun: &Expression, args: &Vec<Expression>, state: &mut SymbolTable) -> FlagState {
    if let Expression::Symbol(name) = fun {
        let symbol = state.lookup(name);
        match symbol {
            Symbol::Undefined => panic!("function not defined: {}", name),
            Symbol::Function(_, params) => {
                if args.len() != params.len() {
                    panic!("wrong number of arguments for {}", name);
                }
                for i in 0..params.len() {
                    args.get(i).unwrap().emit(state);
                    state.append_code(format!("sta ={}", params.get(i).unwrap()));
                }
                state.append_code2(
                    format!("lea $+2"),
                    format!("jmp @#{}", name)
                );
            },
            _ => panic!("not a function: {}", name),
        }
    } else {
        if args.len() > 0 {
            panic!("indirect function call can take no arguments");
        }
        let fun_ptr = push(fun, state);
        state.append_code2(
            format!("lea $+2"),
            format!("jmp @={}", fun_ptr)
        );
        pop(state);
    }
    FlagState::Unknown
}

pub fn emit_not(inner: &Expression, state: &mut SymbolTable) -> FlagState {
    inner.emit(state);
    state.append_code(format!("nor #0"));
    FlagState::Zero
}

pub fn emit_negate(inner: &Expression, state: &mut SymbolTable) -> FlagState {
    emit_not(inner, state);
    state.append_code(format!("add #1"));
    FlagState::AddCarry
}

pub fn emit_lnot(inner: &Expression, state: &mut SymbolTable) -> FlagState {
    emit_test(state, inner);
    state.append_code(format!("lea = 0"));
    state.append_code2(
        format!("jfc $+2"),
        format!("lea =1")
    );
    FlagState::Unknown
}

pub fn emit_add(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> FlagState {
    let temp = push(lhs, state);
    rhs.emit(state);
    state.append_code(format!("add ={}", temp));
    pop(state);
    FlagState::AddCarry
}

pub fn emit_sub(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> FlagState {
    let temp = push(rhs, state);
    lhs.emit(state);
    state.append_code(format!("nor #0"));
    state.append_code(format!("add ={}", temp));
    state.append_code(format!("nor #0"));
    pop(state);
    FlagState::Zero
}

pub fn emit_and(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> FlagState {
    let not_lhs = state.allocate_temp();
    lhs.emit(state);
    state.append_code(format!("nor #0"));
    state.append_code(format!("sta ={}", not_lhs));
    emit_not(rhs, state);
    state.append_code(format!("nor ={}", not_lhs));
    state.release_temp();
    FlagState::Zero
}

pub fn emit_or(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> FlagState {
    let temp = push(lhs, state);
    rhs.emit(state);
    state.append_code(format!("nor ={}", temp));
    state.append_code(format!("nor #0"));
    pop(state);
    FlagState::Zero
}

pub fn emit_nor(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> FlagState {
    let temp = push(lhs, state);
    rhs.emit(state);
    state.append_code(format!("nor ={}", temp));
    pop(state);
    FlagState::Zero
}

pub fn emit_shr(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> FlagState {
    match rhs {
        Expression::Constant(w) if *w == 0 => FlagState::Unknown,
        Expression::Constant(w) if *w == 1 => {
            let temp = push(lhs, state);
            state.append_code(format!("shr ={}", temp));
            pop(state);
            FlagState::ShrCarry
        },
        _ => panic!("not implemented")
    }
}

pub fn emit_shl(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> FlagState {
    match rhs {
        Expression::Constant(w) if *w == 0 => FlagState::Unknown,
        Expression::Constant(w) if *w == 1 => {
            let temp = push(lhs, state);
            state.append_code(format!("add ={}", temp));
            pop(state);
            FlagState::AddCarry
        },
        _ => panic!("not implemented")
    }
}

pub fn emit_eq(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> FlagState {
    emit_sub(lhs, rhs, state);
    state.append_code(format!("lea =0"));
    state.append_code2(
        format!("jfc $+2"),
        format!("lea =1"),
    );
    FlagState::Unknown
}

pub fn emit_ne(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> FlagState {
    emit_sub(lhs, rhs, state)
}

pub fn emit_ge(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> FlagState {
    emit_sub(lhs, rhs, state);
    state.append_code(format!("nor #0x7FF"));
    FlagState::Zero
}

pub fn emit_le(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> FlagState {
    emit_sub(rhs, lhs, state);
    state.append_code(format!("nor #0x7FF"));
    FlagState::Zero
}

pub fn emit_gt(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> FlagState {
    emit_sub(lhs, rhs, state);
    state.append_code(format!("add #-1"));
    state.append_code(format!("nor #0x7FF"));
    FlagState::Zero
}

pub fn emit_lt(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> FlagState {
    emit_sub(rhs, lhs, state);
    state.append_code(format!("add #-1"));
    state.append_code(format!("nor #0x7FF"));
    FlagState::Zero
}

pub fn emit_test(state: &mut SymbolTable, expr: &Expression) {
    if expr.emit(state) != FlagState::Zero {
        let addr = state.allocate_temp();
        state.append_code(format!("sta ={}", addr));
        state.append_code(format!("lda ={}", addr));
        state.release_temp();
    }
}

pub fn emit_land(state: &mut SymbolTable, lhs: &Expression, rhs: &Expression) -> FlagState {
    let done_label = state.next_label();
    emit_test(state, lhs);
    state.append_code2(
        format!("jfc $+2"),
        format!("jmp @#{}", done_label)
    );
    emit_test(state, rhs);
    state.append_code(format!("jfc @#{}", done_label));
    state.append_label(&done_label);
    FlagState::Zero
}

pub fn emit_lor(state: &mut SymbolTable, lhs: &Expression, rhs: &Expression) -> FlagState {
    let true_label = state.next_label();
    emit_test(state, lhs);
    state.append_code(format!("jfc @#{}", true_label));
    emit_test(state, rhs);
    state.append_label(&true_label);
    FlagState::Zero
}

pub fn emit_if(state: &mut SymbolTable, cond: &Expression, t: &Vec<Statement>, f: &Vec<Statement>) {
    let true_label = state.next_label();
    let end_label = state.next_label();
    emit_test(state, cond);
    state.append_code(format!("jfc @#{}", true_label));
    emit_statements(state, f);
    state.append_code(format!("jmp @#{}", end_label));
    state.append_label(&true_label);
    emit_statements(state, t);
    state.append_label(&end_label);
}

pub fn emit_while(state: &mut SymbolTable, cond: &Expression, body: &Vec<Statement>) {
    let cond_label = state.next_label();
    let top_label = state.next_label();
    state.append_code(format!("jmp @#{}", cond_label));
    state.append_label(&top_label);
    emit_statements(state, body);
    state.append_label(&cond_label);
    emit_test(state, cond);
    state.append_code(format!("jfc @#{}", top_label));
}

pub fn emit_return(state: &mut SymbolTable, expr: &Expression) {
    expr.emit(state);
    let return_address = state.return_address();
    state.append_code(format!("jmp @={}", return_address));
}

pub fn emit_function(state: &mut SymbolTable, name: &String, args: &Vec<String>, body: &Vec<Statement>) {
    let return_addr = state.enter_function(get_watermark(state, body));
    state.append_label(name);
    state.append_code(format!("sta ={}", return_addr));
    let mut arg_addrs = Vec::new();
    for arg in args {
        arg_addrs.push(state.declare_arg(arg));
    }
    emit_statements(state, body);
    state.append_code(format!("jmp @={}", return_addr));
    state.leave_function(name, arg_addrs);
}

pub fn emit_array_literal(state: &mut SymbolTable, exprs: &Vec<Expression>) -> FlagState {
    let label = state.append_data(exprs);
    state.append_code(format!("lda #{}", label));
    FlagState::Zero
}

pub fn emit_constant(state: &mut SymbolTable, value: Word) -> FlagState {
    if value < 128 {
        state.append_code(format!("lea ={}", value));
        FlagState::Unknown
    } else {
        state.append_code(format!("lda #{}", value));
        FlagState::Zero
    }
}
