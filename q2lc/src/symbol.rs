use std::collections::{HashMap, HashSet};

#[derive(Clone, Copy, PartialEq, Eq, Hash)]
pub struct Watermark {
    pub(crate) stack: Word
}

use crate::expr::{Expression, Word};

#[derive(Hash, PartialEq, Eq, Clone)]
pub enum Symbol {
    Function(Watermark, Vec<Word>),
    Constant(Word),
    Label(String),
}

impl Watermark {
    pub fn combine(&self, other: Watermark) -> Watermark {
        Watermark {
            stack: Word::max(self.stack, other.stack)
        }
    }

    pub fn update_stack(&mut self, stack: Word) {
        self.stack = Word::max(self.stack, stack);
    }
}

struct Scope {
    symbols: HashMap<String, Symbol>,
    watermark: Watermark,
    stack: Word,
    return_address: Symbol,
    break_label: Option<String>,
}

pub struct SymbolTable {
    code: Vec<String>,
    words: Word,
    data: Vec<(String, Vec<Symbol>)>,
    immediates: HashMap<Symbol, String>,
    local_labels: HashSet<String>,
    scopes: Vec<Scope>,
    index: usize,
    page: Word,
    heap: Word,
}

impl SymbolTable {

    pub const PAGE_SIZE: Word = 128;
    pub const PAGE_COUNT: Word = 32;
    pub const ORIGIN: Word = SymbolTable::PAGE_SIZE;
    pub const ENTRYPOINT: &'static str = "main";
    pub const BASE_HEAP: Word = 0xFFF;
    const BASE_WATERMARK: Watermark = Watermark {
        stack: 4
    };

    pub fn new() -> SymbolTable {
        let global_scope = Scope {
            symbols: HashMap::new(),
            watermark: SymbolTable::BASE_WATERMARK,
            stack: SymbolTable::BASE_WATERMARK.stack,
            return_address: Symbol::Constant(0),
            break_label: None,
        };
        SymbolTable {
            code: Vec::new(),
            data: Vec::new(),
            immediates: HashMap::new(),
            scopes: vec![global_scope],
            local_labels: HashSet::new(),
            words: 0,
            index: 0,
            page: 0,
            heap: SymbolTable::BASE_HEAP,
        }
    }

    fn append(&mut self, line: String) {
        self.code.push(line);
    }

    fn extend(&mut self, lines: Vec<String>) {
        for line in lines {
            self.append(line);
        }
    }

    fn new_page(&mut self) {
        let mut temp = Vec::new();
        for (symbol, label) in self.immediates.iter() {
            temp.push(format!("{}:", label));
            let s = match symbol {
                Symbol::Label(s) => s.clone(),
                Symbol::Constant(w) => (w & 0xFFF).to_string(),
                _ => panic!("undefined immediate: {}", label)
            };
            temp.push(format!("  .dw {}", s));
        }
        self.extend(temp);

        self.append(format!("  .align"));
        self.local_labels.clear();
        self.immediates.clear();
        self.words = 0;
        self.page += 1;
    }

    fn check_size(&self) -> Result<(), String> {
        if self.scopes.len() != 1 {
            return Err(format!("invalid state"));
        }
        let scope = self.scopes.last().unwrap();
        let total_words = SymbolTable::PAGE_COUNT * SymbolTable::PAGE_SIZE - 1;
        let usage = (total_words - self.heap)
            + (self.page - 1) * SymbolTable::PAGE_SIZE
            + scope.watermark.stack;
        println!("memory usage:    {:4} / {:4}", usage, total_words);
        println!("zero-page words: {:4} / {:4}", scope.watermark.stack, SymbolTable::PAGE_SIZE);
        println!("code pages:      {:4} / {:4}", self.page - 1, SymbolTable::PAGE_COUNT - 1);
        println!("heap words:      {:4} / {:4}", total_words - self.heap, total_words);
        if scope.watermark.stack > SymbolTable::PAGE_SIZE {
            return Err(format!("too many vars: {}", scope.watermark.stack));
        }
        if self.page - 1 > SymbolTable::PAGE_COUNT {
            return Err(format!("code requires too many pages: {}", self.page));
        }
        let code_end = self.page * SymbolTable::PAGE_SIZE;
        if code_end > self.heap {
            return Err(
                format!("heap (0x{:x}) and code (0x{:x}) overlap", self.heap, code_end)
            );
        }
        Ok(())
    }

    pub fn emit(&mut self) -> Result<Vec<String>, String> {
        let mut result = vec![
            format!("  lea $+3"),
            format!("  jmp @$+1"),
            format!("  .dw {}", SymbolTable::ENTRYPOINT),
            format!("  jmp $"),
            format!("  .org {}", SymbolTable::ORIGIN),
        ];
        self.new_page();
        result.extend(self.code.iter().cloned());
        self.new_page();
        for (label, symbols) in self.data.iter() {
            result.push(format!("{}:", label));
            for symbol in symbols {
                let value = match symbol {
                    Symbol::Label(label) => label.clone(),
                    Symbol::Constant(w) => w.to_string(),
                    _ => panic!("internal error"),
                };
                result.push(format!("  .dw {}", value));
            }
        }
        self.data.clear();
        let _ = self.check_size()?;
        Ok(result)
    }

    fn advance(&mut self) {
        // We need to leave room for:
        //  - The word being emitted.
        //  - An immediate value stored in the same page.
        //  - The jump instruction to the next page.
        //  - A pointer to the next page.
        if self.words + 4 > SymbolTable::PAGE_SIZE {
            let page_label = self.next_label();
            self.append(format!("  jmp @$+1"));
            self.append(format!("  .dw {}", page_label));
            self.new_page();
            self.append_label(&page_label);
        }
        self.words += 1;
    }

    pub fn append_code_indirect(&mut self, opcode: &str, symbol: &Symbol) -> Result<(), String> {
        self.advance();
        let operand_str = self.emit_operand(symbol);
        self.append(format!("  {} @{}", opcode, operand_str));
        Ok(())
    }

    pub fn append_code_immediate(&mut self, opcode: &str, word: Word) -> Result<(), String> {
        self.advance();
        let operand_str = self.append_immediate(&Symbol::Constant(word));
        self.append(format!("  {} {}", opcode, operand_str));
        Ok(())
    }

    pub fn append_code(&mut self, opcode: &str, symbol: &Symbol) -> Result<(), String> {
        self.advance();
        let operand_str = self.emit_operand(symbol);
        self.append(format!("  {} {}", opcode, operand_str));
        Ok(())
    }

    fn emit_operand(&mut self, symbol: &Symbol) -> String {
        match symbol {
            Symbol::Constant(w) if *w < SymbolTable::PAGE_SIZE => format!("={}", w),
            Symbol::Label(s) if self.local_labels.contains(s) => s.clone(),
            _ => format!("@{}", self.append_immediate(symbol)),
        }
    }

    fn append_immediate(&mut self, symbol: &Symbol) -> String {
        let label_opt = self.immediates.get(symbol).map(|x| x.clone());
        if let Some(label) = label_opt {
            label
        } else {
            let label = self.next_label();
            self.immediates.insert(symbol.clone(), label.clone());
            self.words += 1;
            label
        }
    }

    pub fn append_label(&mut self, label: &String) {
        self.local_labels.insert(label.clone());
        self.append(format!("{}:", label));
    }

    pub fn return_address(&self) -> Symbol {
        self.scopes.last().unwrap().return_address.clone()
    }

    pub fn break_label(&self) -> Result<String, String> {
        let last = self.scopes.last().unwrap();
        match &last.break_label {
            Some(s) => Ok(s.clone()),
            None => Err(format!("break not in a loop"))
        }
    }

    pub fn next_label(&mut self) -> String {
        self.index += 1;
        let label = format!("L{}", self.index);
        label
    }

    pub fn append_data(&mut self, exprs: &Vec<Expression>) -> Result<Symbol, String> {
        let mut data = Vec::new();
        for expr in exprs {
            let value = match expr {
                Expression::Constant(w) => Symbol::Constant(*w),
                Expression::Symbol(name) => {
                    let symbol = self.lookup(name)?;
                    match symbol {
                        Symbol::Constant(w) => Symbol::Constant(w),
                        Symbol::Label(s) => Symbol::Label(s),
                        Symbol::Function(_, _) => {
                            Symbol::Label(name.clone())
                        },
                    }
                },
                Expression::ArrayLiteral(inner) => self.append_data(inner)?,
                _ => {
                    return Err(format!("array literal must be constant"));
                },
            };
            data.push(value);
        }
        let label = self.next_label();
        self.data.push((label.clone(), data));
        Ok(Symbol::Label(label))
    }

    pub fn append_heap(&mut self, size: Word) -> Result<Word, String> {
        self.heap = match self.heap.overflowing_sub(size) {
            (v, false) => v,
            (_, true) => {
                return Err(format!("out of heap space"));
            },
        };
        Ok(self.heap)
    }

    pub fn enter(&mut self) {
        let last = self.scopes.last().unwrap();
        let watermark = last.watermark;
        let return_address = last.return_address.clone();
        let break_label = last.break_label.clone();
        self.scopes.push(
            Scope {
                symbols: HashMap::new(),
                watermark: watermark,
                stack: watermark.stack,
                return_address: return_address,
                break_label: break_label,
            }
        );
    }

    pub fn leave(&mut self) {
        let last = self.scopes.pop().unwrap();
        let current = self.scopes.last_mut().unwrap();
        current.watermark = last.watermark.combine(current.watermark);
    }

    /** Update current stack to account for an argument to a function call. */
    pub fn update_stack(&mut self, param: Word) {
        let mut last = self.scopes.last_mut().unwrap();
        last.stack = Word::max(last.stack, param + 1);
        last.watermark.update_stack(last.stack);
    }

    pub fn enter_loop(&mut self, break_label: &String) {
        let last = self.scopes.last().unwrap();
        let watermark = last.watermark;
        let return_address = last.return_address.clone();
        self.scopes.push(
            Scope {
                symbols: HashMap::new(),
                watermark: watermark,
                stack: watermark.stack,
                return_address: return_address,
                break_label: Some(break_label.clone()),
            }
        );
    }

    pub fn leave_loop(&mut self) -> Result<(), String> {
        let break_label = self.break_label()?;
        self.leave();
        self.append_label(&break_label);
        Ok(())
    }

    pub fn enter_function(&mut self, watermark: Watermark) -> Symbol {
        self.scopes.push(
            Scope {
                symbols: HashMap::new(),
                watermark: watermark,
                stack: watermark.stack,
                return_address: Symbol::Constant(0),
                break_label: None,
            }
        );
        let return_address = self.allocate_temp();
        self.scopes.last_mut().unwrap().return_address = return_address.clone();
        return_address
    }

    pub fn leave_function(&mut self, name: &String, args: Vec<Word>) {
        let func_scope = self.scopes.pop().unwrap();
        let watermark = func_scope.watermark;
        let symbol = Symbol::Function(watermark, args);
        let scope = self.scopes.last_mut().unwrap();
        scope.watermark = scope.watermark.combine(watermark);
        scope.symbols.insert(name.clone(), symbol);
    }

    pub fn allocate_temp(&mut self) -> Symbol {
        let mut scope = self.scopes.last_mut().unwrap();
        let addr = scope.stack;
        scope.stack += 1;
        scope.watermark.update_stack(scope.stack);
        Symbol::Constant(addr)
    }

    pub fn release_temp(&mut self) {
        self.scopes.last_mut().unwrap().stack -= 1;
    }

    pub fn current_watermark(&self) -> Watermark {
        let scope = self.scopes.last().unwrap();
        Watermark {
            stack: scope.stack
        }
    }

    pub fn declare_var(&mut self, name: &String, value: Option<Symbol>) -> Result<(), String> {
        let symbol = if self.is_global() {
            self.data.push((name.clone(), vec![value.unwrap_or(Symbol::Constant(0))]));
            Symbol::Label(name.clone())
        } else {
            self.allocate_temp()
        };
        let scope = self.scopes.last_mut().unwrap();
        scope.symbols.insert(name.clone(), symbol);
        Ok(())
    }

    pub fn declare_const(&mut self, name: &String, symbol: Symbol) {
        let scope = self.scopes.last_mut().unwrap();
        scope.symbols.insert(name.clone(), symbol);
    }

    pub fn declare_arg(&mut self, name: &String) -> Word {
        let addr = self.allocate_temp();
        let scope = self.scopes.last_mut().unwrap();
        scope.symbols.insert(name.clone(), addr.clone());
        if let Symbol::Constant(w) = addr {
            w
        } else {
            panic!("internal error")
        }
    }

    pub fn lookup(&self, name: &String) -> Result<Symbol, String> {
        for scope in self.scopes.iter() {
            match scope.symbols.get(name) {
                Some(s) => return Ok(s.clone()),
                None => ()
            }
        }
        Err(format!("undefined: {}", name))
    }

    pub fn is_global(&self) -> bool {
        self.scopes.last().unwrap().return_address == Symbol::Constant(0)
    }
}
