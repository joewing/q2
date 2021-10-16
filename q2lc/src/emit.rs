use crate::expr::{Expression, FlagState, UnaryOperator, Word};
use crate::symbol::{SymbolTable, Symbol};
use crate::statement::{emit_statements, get_watermark, Statement};

const LDA: &str = "lda";
const NOR: &str = "nor";
const ADD: &str = "add";
const SHR: &str = "shr";
const LEA: &str = "lea";
const STA: &str = "sta";
const JFC: &str = "jfc";
const JMP: &str = "jmp";

fn emit_store(state: &mut SymbolTable, symbol: &Symbol) {
    state.append_code(STA, symbol);
}

pub fn emit_var(state: &mut SymbolTable, name: &String, expr_opt: &Option<Expression>) {
    match expr_opt {
        Some(expr) => match expr {
            Expression::Constant(value) if state.is_global() =>
                state.declare_var(name, Some(Symbol::Constant(*value))),
            Expression::ArrayLiteral(inner) if state.is_global() => {
                let label = state.append_data(inner);
                state.declare_var(name, Some(label));
            },
            Expression::Unary(op, inner) if *op == UnaryOperator::ArrayDecl && state.is_global() => {
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
                emit_store(state, &state.lookup(name));
            }
        }
        None => state.declare_var(name, None),
    }
}

pub fn emit_const(state: &mut SymbolTable, name: &String, expr: &Expression) {
    match expr {
        Expression::Constant(w) => state.declare_const(name, Symbol::Constant(*w)),
        Expression::ArrayLiteral(vs) => {
            let symbol = state.append_data(vs);
            state.declare_const(name, symbol)
        },
        Expression::Unary(op, size_expr) if *op == UnaryOperator::ArrayDecl => {
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
            emit_store(state, &state.lookup(name));
        },
        Expression::Constant(w) => {
            src.emit(state);
            emit_store(state, &Symbol::Constant(*w));
        },
        _ => {
            dest.emit(state);
            let dest_addr = state.allocate_temp();
            emit_store(state, &dest_addr);
            src.emit(state);
            state.append_code_indirect(STA, &dest_addr);
            state.release_temp();
        }
    }
}

fn push(expr: &Expression, state: &mut SymbolTable) -> Symbol {
    let temp = state.allocate_temp();
    expr.emit(state);
    emit_store(state, &temp);
    temp
}

fn pop(state: &mut SymbolTable) {
    state.release_temp();
}

// Load the address of the specified symbol.
pub fn emit_symbol(name: &String, state: &mut SymbolTable) -> FlagState {
    let symbol = state.lookup(name);
    state.append_code(LEA, &symbol);
    FlagState::Unknown
}

pub fn emit_deref(inner: &Expression, state: &mut SymbolTable) -> FlagState {
    if let Expression::Symbol(name) = inner {
        state.append_code(LDA, &state.lookup(name));
        FlagState::Zero
    } else {
        let addr = push(inner, state);
        state.append_code_indirect(LDA, &addr);
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
                    emit_store(state, &Symbol::Constant(*params.get(i).unwrap()));
                }
                let label = state.next_label();
                state.append_code(LEA, &Symbol::Label(label.clone()));
                state.append_code(JMP, &Symbol::Label(name.clone()));
                state.append_label(&label);
            },
            _ => panic!("not a function: {}", name),
        }
    } else {
        if args.len() > 0 {
            panic!("indirect function call can take no arguments");
        }
        let fun_ptr = push(fun, state);
        let label = state.next_label();
        state.append_code(LEA, &Symbol::Label(label.clone()));
        state.append_code(JMP, &fun_ptr);
        state.append_label(&label);
        pop(state);
    }
    FlagState::Unknown
}

pub fn emit_not(inner: &Expression, state: &mut SymbolTable) -> FlagState {
    inner.emit(state);
    state.append_code_immediate(NOR, 0);
    FlagState::Zero
}

pub fn emit_negate(inner: &Expression, state: &mut SymbolTable) -> FlagState {
    emit_not(inner, state);
    state.append_code_immediate(ADD, 1);
    FlagState::AddCarry
}

pub fn emit_lnot(inner: &Expression, state: &mut SymbolTable) -> FlagState {
    emit_test(state, inner);
    state.append_code_immediate(LEA, 0);
    let label = state.next_label();
    state.append_code(JFC, &Symbol::Label(label.clone()));
    state.append_code_immediate(LEA, 1);
    state.append_label(&label);
    FlagState::Unknown
}

pub fn emit_add(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> FlagState {
    let temp = push(lhs, state);
    rhs.emit(state);
    state.append_code(ADD, &temp);
    pop(state);
    FlagState::AddCarry
}

pub fn emit_sub(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> FlagState {
    let temp = push(rhs, state);
    lhs.emit(state);
    state.append_code_immediate(NOR, 0);
    state.append_code(ADD, &temp);
    state.append_code_immediate(NOR, 0);
    pop(state);
    FlagState::Zero
}

pub fn emit_and(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> FlagState {
    let not_lhs = state.allocate_temp();
    lhs.emit(state);
    state.append_code_immediate(NOR, 0);
    state.append_code(STA, &not_lhs);
    emit_not(rhs, state);
    state.append_code(NOR, &not_lhs);
    state.release_temp();
    FlagState::Zero
}

pub fn emit_or(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> FlagState {
    let temp = push(lhs, state);
    rhs.emit(state);
    state.append_code(NOR, &temp);
    state.append_code_immediate(NOR, 0);
    pop(state);
    FlagState::Zero
}

pub fn emit_nor(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> FlagState {
    let temp = push(lhs, state);
    rhs.emit(state);
    state.append_code(NOR, &temp);
    pop(state);
    FlagState::Zero
}

pub fn emit_shr(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> FlagState {
    match rhs {
        Expression::Constant(w) if *w == 0 => FlagState::Unknown,
        Expression::Constant(w) if *w == 1 => {
            let temp = push(lhs, state);
            state.append_code(SHR, &temp);
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
            state.append_code(ADD, &temp);
            pop(state);
            FlagState::AddCarry
        },
        _ => panic!("not implemented")
    }
}

pub fn emit_eq(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> FlagState {
    emit_sub(lhs, rhs, state);
    state.append_code(LEA, &Symbol::Constant(0));
    let label = state.next_label();
    state.append_code(JFC, &Symbol::Label(label.clone()));
    state.append_code(LEA, &Symbol::Constant(1));
    state.append_label(&label);
    FlagState::Unknown
}

pub fn emit_ne(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> FlagState {
    emit_sub(lhs, rhs, state)
}

pub fn emit_le(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> FlagState {
    emit_sub(rhs, lhs, state);
    state.append_code_immediate(NOR, 0x7FF);
    FlagState::Zero
}

pub fn emit_ge(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> FlagState {
    emit_le(rhs, lhs, state)
}

pub fn emit_lt(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> FlagState {
    emit_sub(rhs, lhs, state);
    state.append_code_immediate(ADD, 0xFFF);
    state.append_code_immediate(NOR, 0x7FF);
    FlagState::Zero
}

pub fn emit_gt(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> FlagState {
    emit_lt(rhs, lhs, state)
}

pub fn emit_test(state: &mut SymbolTable, expr: &Expression) {
    if expr.emit(state) != FlagState::Zero {
        let addr = state.allocate_temp();
        state.append_code(STA, &addr);
        state.append_code(LDA, &addr);
        state.release_temp();
    }
}

pub fn emit_land(state: &mut SymbolTable, lhs: &Expression, rhs: &Expression) -> FlagState {
    let done_label = state.next_label();
    let true_label = state.next_label();
    emit_test(state, lhs);
    state.append_code(JFC, &Symbol::Label(true_label.clone()));
    state.append_code(JMP, &Symbol::Label(done_label.clone()));
    state.append_label(&true_label);
    emit_test(state, rhs);
    state.append_label(&done_label);
    FlagState::Zero
}

pub fn emit_lor(state: &mut SymbolTable, lhs: &Expression, rhs: &Expression) -> FlagState {
    let true_label = state.next_label();
    emit_test(state, lhs);
    state.append_code_indirect(JFC, &Symbol::Label(true_label.clone()));
    emit_test(state, rhs);
    state.append_label(&true_label);
    FlagState::Zero
}

pub fn emit_if(state: &mut SymbolTable, cond: &Expression, t: &Vec<Statement>, f: &Vec<Statement>) {
    let true_label = state.next_label();
    let end_label = state.next_label();
    emit_test(state, cond);
    state.append_code(JFC, &Symbol::Label(true_label.clone()));
    emit_statements(state, f);
    state.append_code(JMP, &Symbol::Label(end_label.clone()));
    state.append_label(&true_label);
    emit_statements(state, t);
    state.append_label(&end_label);
}

pub fn emit_while(state: &mut SymbolTable, cond: &Expression, body: &Vec<Statement>) {
    let cond_label = state.next_label();
    let top_label = state.next_label();
    state.append_code(JMP, &Symbol::Label(cond_label.clone()));
    state.append_label(&top_label);
    emit_statements(state, body);
    state.append_label(&cond_label);
    emit_test(state, cond);
    state.append_code(JFC, &Symbol::Label(top_label));
}

pub fn emit_return(state: &mut SymbolTable, expr: &Expression) {
    expr.emit(state);
    let return_address = state.return_address();
    state.append_code_indirect(JMP, &return_address);
}

pub fn emit_function(state: &mut SymbolTable, name: &String, args: &Vec<String>, body: &Vec<Statement>) {
    let return_addr = state.enter_function(get_watermark(state, body));
    state.append_label(name);
    emit_store(state, &return_addr);
    let arg_addrs = args.iter().map(|arg| state.declare_arg(arg)).collect();
    emit_statements(state, body);
    state.append_code_indirect(JMP, &return_addr);
    state.leave_function(name, arg_addrs);
}

pub fn emit_array_decl(state: &mut SymbolTable, expr: &Expression) -> FlagState {
    if let Expression::Constant(size) = expr {
        let addr = state.append_heap(*size);
        state.append_code_immediate(LDA, addr);
        FlagState::Zero
    } else {
        panic!("array size must be constant");
    }
}

pub fn emit_array_literal(state: &mut SymbolTable, exprs: &Vec<Expression>) -> FlagState {
    let label = state.append_data(exprs);
    state.append_code(LEA, &label);
    FlagState::Unknown
}

pub fn emit_constant(state: &mut SymbolTable, value: Word) -> FlagState {
    state.append_code(LEA, &Symbol::Constant(value));
    FlagState::Unknown
}
