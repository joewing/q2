use crate::allocator::Allocator;
use crate::builtin::{DIVIDE_NAME, MODULUS_NAME, MULTIPLY_NAME, SHIFT_LEFT_NAME, SHIFT_RIGHT_NAME};
use crate::expr::{Expression, UnaryOperator, Word};
use crate::retcheck::ReturnCheck;
use crate::symbol::{SymbolTable, Symbol};
use crate::statement::Statement;
use crate::visitor::StatementVisitor;

struct FunctionEmitter<'a> {
    table: &'a mut SymbolTable,
}

impl FunctionEmitter<'_> {
    pub fn emit_functions(table: &mut SymbolTable, statement: &Statement) -> Result<Statement, String> {
        let mut emitter = FunctionEmitter {
            table: table
        };
        emitter.visit_statement(statement)
    }
}

impl StatementVisitor for FunctionEmitter<'_> {
    fn visit_function(&mut self, name: &String, params: &Vec<String>, body: &Statement) -> Result<Statement, String> {
        let _ = emit_function(&mut self.table, name, params, body)?;
        Ok(Statement::EMPTY)
    }
}

pub const LDA: &str = "lda";
pub const NOR: &str = "nor";
pub const ADD: &str = "add";
pub const SHR: &str = "shr";
pub const LEA: &str = "lea";
pub const STA: &str = "sta";
pub const JFC: &str = "jfc";
pub const JMP: &str = "jmp";

pub fn emit_store(state: &mut SymbolTable, symbol: &Symbol) -> Result<(), String> {
    state.append_code(STA, symbol)
}

pub fn emit_assign(state: &mut SymbolTable, dest: &Expression, src: &Expression) -> Result<(), String> {
    match dest {
        Expression::Symbol(name) => {
            let _ = src.emit(state)?;
            emit_store(state, &state.lookup(name)?)
        },
        Expression::Constant(w) => {
            let _ = src.emit(state)?;
            emit_store(state, &Symbol::Constant(*w))
        },
        _ => {
            let _ = dest.emit(state)?;
            let dest_addr = state.allocate_temp();
            let _ = emit_store(state, &dest_addr)?;
            let _ = src.emit(state)?;
            let _ = state.append_code_indirect(STA, &dest_addr)?;
            state.release_temp();
            Ok(())
        }
    }
}

fn load(state: &mut SymbolTable, expr: &Expression) -> Result<Symbol, String> {
    let temp = state.allocate_temp();
    let _ = expr.emit(state)?;
    let _ = emit_store(state, &temp)?;
    Ok(temp)
}

fn release(state: &mut SymbolTable) {
    state.release_temp();
}

// Load the address of the specified symbol.
pub fn emit_symbol(name: &String, state: &mut SymbolTable) -> Result<bool, String> {
    let symbol = state.lookup(name)?;
    let _ = state.append_code(LEA, &symbol)?;
    Ok(false)
}

pub fn emit_deref(inner: &Expression, state: &mut SymbolTable) -> Result<bool, String> {
    if let Expression::Symbol(name) = inner {
        let _ = state.append_code(LDA, &state.lookup(name)?)?;
        Ok(true)
    } else {
        let addr = load(state, inner)?;
        let _ = state.append_code_indirect(LDA, &addr)?;
        release(state);
        Ok(true)
    }
}

pub fn emit_call(fun: &Expression, args: &Vec<Expression>, state: &mut SymbolTable) -> Result<bool, String> {
    if let Expression::Symbol(name) = fun {
        let symbol = state.lookup(name)?;
        match symbol {
            Symbol::Function(_, params) => {
                if args.len() != params.len() {
                    return Err(
                        format!(
                            "wrong number of arguments for {}: got {}, expected {}",
                            name, args.len(), params.len()
                        )
                    );
                }
                state.enter();
                for i in 0..params.len() {
                    let param = params.get(i).unwrap();
                    let arg = args.get(i).unwrap();
                    let _ = arg.emit(state)?;
                    let _ = emit_store(state, &Symbol::Constant(*param))?;
                    state.update_stack(*param);
                }
                state.leave();
                let label = state.next_label();
                let _ = state.append_code(LEA, &Symbol::Label(label.clone()))?;
                let _ = state.append_code(JMP, &Symbol::Label(name.clone()))?;
                state.append_label(&label);
            },
            _ => return Err(format!("not a function: {}", name)),
        }
    } else {
        if args.len() > 0 {
            return Err(format!("indirect function call can take no arguments"));
        }
        let fun_ptr = load(state, fun)?;
        let label = state.next_label();
        let _ = state.append_code(LEA, &Symbol::Label(label.clone()))?;
        let _ = state.append_code_indirect(JMP, &fun_ptr)?;
        let _ = state.append_label(&label);
        release(state);
    }
    Ok(false)
}

pub fn emit_not(inner: &Expression, state: &mut SymbolTable) -> Result<bool, String> {
    let _ = inner.emit(state)?;
    let _ = state.append_code_immediate(NOR, 0)?;
    Ok(true)
}

pub fn emit_negate(inner: &Expression, state: &mut SymbolTable) -> Result<bool, String> {
    let _ = emit_not(inner, state)?;
    let _ = state.append_code_immediate(ADD, 1)?;
    Ok(false)
}

pub fn emit_lnot(inner: &Expression, state: &mut SymbolTable) -> Result<bool, String> {
    let _ = emit_test(state, inner)?;
    let _ = state.append_code(LEA, &Symbol::Constant(0))?;
    let label = state.next_label();
    let _ = state.append_code(JFC, &Symbol::Label(label.clone()))?;
    let _ = state.append_code(LEA, &Symbol::Constant(1))?;
    state.append_label(&label);
    Ok(false)
}

fn extract_deref(state: &SymbolTable, expr: &Expression) -> Result<Option<Symbol>, String> {
    if let Expression::Unary(UnaryOperator::Deref, inner) = expr {
        if let Expression::Symbol(name) = inner.as_ref() {
            let symbol = state.lookup(name)?;
            return Ok(Some(symbol));
        }
    }
    Ok(None)
}

pub fn emit_add(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> Result<bool, String> {
    if let Some(lhs_symbol) = extract_deref(state, lhs)? {
        let _ = rhs.emit(state)?;
        let _ = state.append_code(ADD, &lhs_symbol)?;
    } else if let Some(rhs_symbol) = extract_deref(state, rhs)? {
        let _ = lhs.emit(state)?;
        let _ = state.append_code(ADD, &rhs_symbol)?;
    } else {
        let temp = load(state, rhs)?;
        let _ = lhs.emit(state)?;
        let _ = state.append_code(ADD, &temp)?;
        release(state);
    }
    Ok(false)
}

pub fn emit_sub(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> Result<bool, String> {
    if let Some(rhs_symbol) = extract_deref(state, rhs)? {
        let _ = lhs.emit(state)?;
        let _ = state.append_code_immediate(NOR, 0)?;
        let _ = state.append_code(ADD, &rhs_symbol)?;
        let _ = state.append_code_immediate(NOR, 0)?;
    } else {
        let temp = load(state, rhs)?;
        let _ = lhs.emit(state)?;
        let _ = state.append_code_immediate(NOR, 0)?;
        let _ = state.append_code(ADD, &temp)?;
        let _ = state.append_code_immediate(NOR, 0)?;
        release(state);
    }
    Ok(true)
}

pub fn emit_mul(state: &mut SymbolTable, lhs: &Expression, rhs: &Expression) -> Result<bool, String> {
    emit_call_builtin(state, MULTIPLY_NAME, lhs, rhs)
}

pub fn emit_div(state: &mut SymbolTable, lhs: &Expression, rhs: &Expression) -> Result<bool, String> {
    emit_call_builtin(state, DIVIDE_NAME, lhs, rhs)
}

pub fn emit_mod(state: &mut SymbolTable, lhs: &Expression, rhs: &Expression) -> Result<bool, String> {
    emit_call_builtin(state, MODULUS_NAME, lhs, rhs)
}

pub fn emit_and(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> Result<bool, String> {
    let not_lhs = state.allocate_temp();
    let _ = lhs.emit(state)?;
    let _ = state.append_code_immediate(NOR, 0)?;
    let _ = state.append_code(STA, &not_lhs)?;
    let _ = emit_not(rhs, state)?;
    let _ = state.append_code(NOR, &not_lhs)?;
    state.release_temp();
    Ok(true)
}

pub fn emit_or(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> Result<bool, String> {
    if let Some(lhs_symbol) = extract_deref(state, lhs)? {
        let _ = rhs.emit(state)?;
        let _ = state.append_code(NOR, &lhs_symbol)?;
        let _ = state.append_code_immediate(NOR, 0)?;
    } else if let Some(rhs_symbol) = extract_deref(state, rhs)? {
        let _ = lhs.emit(state)?;
        let _ = state.append_code(NOR, &rhs_symbol)?;
        let _ = state.append_code_immediate(NOR, 0)?;
    } else {
        let temp = load(state, lhs)?;
        let _ = rhs.emit(state)?;
        let _ = state.append_code(NOR, &temp)?;
        let _ = state.append_code_immediate(NOR, 0)?;
        release(state);
    }
    Ok(true)
}

fn emit_xor_inner(state: &mut SymbolTable, lhs_addr: &Symbol, rhs_addr: &Symbol) -> Result<bool, String> {
    let temp = state.allocate_temp();
    let _ = state.append_code(LDA, &lhs_addr)?;     // A = lhs
    let _ = state.append_code_immediate(NOR, 0)?;   // A = ~lhs
    let _ = emit_store(state, &temp)?;              // temp = ~lhs
    let _ = state.append_code(LDA, &rhs_addr)?;     // A = rhs
    let _ = state.append_code_immediate(NOR, 0)?;   // A = ~rhs
    let _ = state.append_code(NOR, &temp)?;         // A = ~rhs NOR ~lhs
    let _ = emit_store(state, &temp)?;              // temp = ~lhs NOR ~rhs
    let _ = state.append_code(LDA, &rhs_addr)?;
    let _ = state.append_code(NOR, &lhs_addr)?;
    let _ = state.append_code(NOR, &temp)?;      // temp = (~lhs NOR ~rhs) NOR (lhs NOR rhs)
    state.release_temp();
    Ok(true)
}

pub fn emit_xor(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> Result<bool, String> {
    if let Some(lhs_symbol) = extract_deref(state, lhs)? {
        let rhs_temp = load(state, rhs)?;
        let result = emit_xor_inner(state, &lhs_symbol, &rhs_temp)?;
        release(state);
        Ok(result)
    } else if let Some(rhs_symbol) = extract_deref(state, rhs)? {
        let lhs_temp = load(state, lhs)?;
        let result = emit_xor_inner(state, &lhs_temp, &rhs_symbol)?;
        release(state);
        Ok(result)
    } else {
        let rhs_temp = load(state, rhs)?;
        let lhs_temp = load(state, lhs)?;
        let result = emit_xor_inner(state, &rhs_temp, &lhs_temp)?;
        release(state);
        release(state);
        Ok(result)
    }
}

pub fn emit_nor(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> Result<bool, String> {
    if let Some(lhs_symbol) = extract_deref(state, lhs)? {
        let _ = rhs.emit(state)?;
        let _ = state.append_code(NOR, &lhs_symbol)?;
    } else if let Some(rhs_symbol) = extract_deref(state, rhs)? {
        let _ = lhs.emit(state)?;
        let _ = state.append_code(NOR, &rhs_symbol)?;
    } else {
        let temp = load(state, lhs)?;
        let _ = rhs.emit(state)?;
        let _ = state.append_code(NOR, &temp)?;
        release(state);
    }
    Ok(true)
}

fn emit_call_builtin(state: &mut SymbolTable, name: &str, lhs: &Expression, rhs: &Expression) -> Result<bool, String> {
    emit_call(
        &Expression::Symbol(name.to_string()),
        &vec![lhs.clone(), rhs.clone()],
        state
    )
}

pub fn emit_shr(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> Result<bool, String> {
    match rhs {
        Expression::Constant(w) if *w == 0 => Ok(false),
        Expression::Constant(w) if *w == 1 => {
            if let Some(lhs_symbol) = extract_deref(state, lhs)? {
                let _ = state.append_code(SHR, &lhs_symbol)?;
            } else {
                let temp = load(state, lhs)?;
                let _ = state.append_code(SHR, &temp)?;
                release(state);
            }
            Ok(false)
        },
        _ => emit_call_builtin(state, SHIFT_RIGHT_NAME, lhs, rhs)
    }
}

pub fn emit_shl(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> Result<bool, String> {
    match rhs {
        Expression::Constant(w) if *w == 0 => Ok(false),
        Expression::Constant(w) if *w == 1 => {
            if let Some(lhs_symbol) = extract_deref(state, lhs)? {
                let _ = state.append_code(LDA, &lhs_symbol)?;
                let _ = state.append_code(ADD, &lhs_symbol)?;
            } else {
                let temp = load(state, lhs)?;
                let _ = state.append_code(ADD, &temp)?;
                release(state);
            }
            Ok(false)
        },
        _ => emit_call_builtin(state, SHIFT_LEFT_NAME, lhs, rhs)
    }
}

pub fn emit_eq(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> Result<bool, String> {
    let _ = emit_sub(lhs, rhs, state)?;
    let _ = state.append_code(LEA, &Symbol::Constant(0))?;
    let label = state.next_label();
    let _ = state.append_code(JFC, &Symbol::Label(label.clone()))?;
    let _ = state.append_code(LEA, &Symbol::Constant(1))?;
    state.append_label(&label);
    Ok(false)
}

pub fn emit_ne(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> Result<bool, String> {
    emit_sub(lhs, rhs, state)
}

pub fn emit_le(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> Result<bool, String> {
    let _ = emit_sub(rhs, lhs, state)?;
    let _ = state.append_code_immediate(NOR, 0x7FF)?;
    Ok(true)
}

pub fn emit_ge(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> Result<bool, String> {
    emit_le(rhs, lhs, state)
}

pub fn emit_lt(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> Result<bool, String> {
    let _ = emit_sub(rhs, lhs, state)?;
    let _ = state.append_code_immediate(ADD, 0xFFF)?;
    let _ = state.append_code_immediate(NOR, 0x7FF)?;
    Ok(true)
}

pub fn emit_gt(lhs: &Expression, rhs: &Expression, state: &mut SymbolTable) -> Result<bool, String> {
    emit_lt(rhs, lhs, state)
}

pub fn emit_test(state: &mut SymbolTable, expr: &Expression) -> Result<bool, String> {
    if !expr.emit(state)?  {
        let addr = state.allocate_temp();
        let _ = state.append_code(STA, &addr)?;
        let _ = state.append_code(LDA, &addr)?;
        state.release_temp();
    }
    Ok(true)
}

pub fn emit_land(state: &mut SymbolTable, lhs: &Expression, rhs: &Expression) -> Result<bool, String> {
    let done_label = state.next_label();
    let true_label = state.next_label();
    let _ = emit_test(state, lhs)?;
    let _ = state.append_code(JFC, &Symbol::Label(true_label.clone()))?;
    let _ = state.append_code(JMP, &Symbol::Label(done_label.clone()))?;
    state.append_label(&true_label);
    let _ = emit_test(state, rhs)?;
    state.append_label(&done_label);
    Ok(true)
}

pub fn emit_lor(state: &mut SymbolTable, lhs: &Expression, rhs: &Expression) -> Result<bool, String> {
    let true_label = state.next_label();
    let _ = emit_test(state, lhs)?;
    let _ = state.append_code(JFC, &Symbol::Label(true_label.clone()))?;
    let _ = emit_test(state, rhs)?;
    state.append_label(&true_label);
    Ok(true)
}

pub fn emit_if(state: &mut SymbolTable, cond: &Expression, t: &Statement, f: &Statement) -> Result<(), String> {
    let true_label = state.next_label();
    let end_label = state.next_label();
    let _ = emit_test(state, cond)?;
    let _ = state.append_code(JFC, &Symbol::Label(true_label.clone()))?;
    state.enter();
    let _ = f.emit(state)?;
    state.leave();
    let _ = state.append_code(JMP, &Symbol::Label(end_label.clone()))?;
    state.append_label(&true_label);
    state.enter();
    let _ = t.emit(state)?;
    state.leave();
    state.append_label(&end_label);
    Ok(())
}

pub fn emit_ifcarry(state: &mut SymbolTable, t: &Statement, f: &Statement) -> Result<(), String> {
    let false_label = state.next_label();
    let _ = state.append_code(JFC, &Symbol::Label(false_label.clone()))?;
    state.enter();
    let _ = t.emit(state)?;
    state.leave();
    if f.is_empty() {
        state.append_label(&false_label);
    } else {
        let end_label = state.next_label();
        let _ = state.append_code(JMP, &Symbol::Label(end_label.clone()))?;
        state.append_label(&false_label);
        state.enter();
        let _ = f.emit(state)?;
        state.leave();
        state.append_label(&end_label);
    }
    Ok(())
}

pub fn emit_while(state: &mut SymbolTable, cond: &Expression, body: &Statement) -> Result<(), String> {
    if let Expression::Constant(w) = cond {
        if *w != 0 {
            let top_label = state.next_label();
            let break_label = state.next_label();
            state.append_label(&top_label);
            state.enter_loop(&break_label);
            let _ = body.emit(state)?;
            let _ = state.append_code(JMP, &Symbol::Label(top_label))?;
            state.leave_loop()
        } else {
            Ok(())
        }
    } else {
        let cond_label = state.next_label();
        let top_label = state.next_label();
        let break_label = state.next_label();
        let _ = state.append_code(JMP, &Symbol::Label(cond_label.clone()))?;
        state.append_label(&top_label);
        state.enter_loop(&break_label);
        let _ = body.emit(state)?;
        state.append_label(&cond_label);
        let _ = emit_test(state, cond)?;
        let _ = state.append_code(JFC, &Symbol::Label(top_label))?;
        state.leave_loop()
    }
}

pub fn emit_break(state: &mut SymbolTable) -> Result<(), String> {
    let label = state.break_label()?;
    state.append_code(JMP, &Symbol::Label(label))
}

pub fn emit_return(state: &mut SymbolTable, expr: &Expression) -> Result<(), String> {
    let _ = expr.emit(state)?;
    let return_address = state.return_address();
    state.append_code_indirect(JMP, &return_address)
}

pub fn emit_function(
    state: &mut SymbolTable,
    name: &String,
    args: &Vec<String>,
    body: &Statement
) -> Result<(), String> {
    let watermark = Allocator::watermark(state, body)?;
    let return_addr = state.enter_function(watermark);
    let arg_addrs = args.iter().map(|arg| state.declare_arg(arg)).collect();
    let _ = FunctionEmitter::emit_functions(state, body)?;
    state.append_label(name);
    let _ = emit_store(state, &return_addr)?;
    let _ = body.emit(state)?;
    if !ReturnCheck::check(body) {
        let _ = state.append_code_indirect(JMP, &return_addr)?;
    }
    state.leave_function(name, arg_addrs);
    Ok(())
}

pub fn emit_asm(
    state: &mut SymbolTable,
    opcode: &str,
    dest: &Expression
) -> Result<(), String> {
    match dest {
        Expression::Symbol(name) => state.append_code(opcode, &state.lookup(name)?),
        Expression::Unary(UnaryOperator::Deref, inner) => {
            match inner.as_ref() {
                Expression::Symbol(name) => state.append_code_indirect(opcode, &state.lookup(name)?),
                Expression::Constant(w) => state.append_code_indirect(opcode, &Symbol::Constant(*w)),
                _ => Err(format!("{} destination must be constant", opcode))
            }
        },
        Expression::Constant(w) => state.append_code(opcode, &Symbol::Constant(*w)),
        _ => Err(format!("{} destination must be constant", opcode))
    }
}

pub fn emit_array_decl(state: &mut SymbolTable, expr: &Expression) -> Result<bool, String> {
    let size = extract_constant(expr, "array size")?;
    let addr = state.append_heap(size)?;
    let _ = state.append_code_immediate(LDA, addr)?;
    Ok(true)
}

pub fn emit_array_literal(state: &mut SymbolTable, exprs: &Vec<Expression>) -> Result<bool, String> {
    let label = state.append_data(exprs)?;
    let _ = state.append_code(LEA, &label)?;
    Ok(false)
}

pub fn emit_constant(state: &mut SymbolTable, value: Word) -> Result<bool, String> {
    let _ = state.append_code(LEA, &Symbol::Constant(value));
    Ok(false)
}

fn extract_constant(expr: &Expression, msg: &str) -> Result<Word, String> {
    if let Expression::Constant(w) = expr {
        Ok(*w)
    } else {
        Err(format!("{} must be constant", msg))
    }
}
