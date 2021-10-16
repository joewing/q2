use std::collections::HashMap;
use crate::expr::{Expression, Word};

#[derive(PartialEq, Clone)]
pub enum Symbol {
    Undefined,
    Local(Word),
    Function(Word, Vec<Word>),
    Constant(Word),
    Global(String),
}

pub struct Scope {
    symbols: HashMap<String, Symbol>,
    watermark: Word,
    stack: Word,
    heap: Word,
    return_address: Word,
}

pub struct SymbolTable {
    code: Vec<String>,
    words: usize,
    decls: Vec<(String, Symbol)>,
    data: Vec<(String, Vec<String>)>,
    scopes: Vec<Scope>,
    index: usize
}

impl SymbolTable {

    pub const ORIGIN: Word = 0x100;
    pub const ENTRYPOINT: &'static str = "main";
    pub const BASE_WATERMARK: Word = 4;
    pub const HEAP_START: Word = 0xFFF;

    pub fn new() -> SymbolTable {
        let global_scope = Scope {
            symbols: HashMap::new(),
            watermark: SymbolTable::BASE_WATERMARK,
            heap: SymbolTable::HEAP_START,
            stack: SymbolTable::BASE_WATERMARK,
            return_address: 0,
        };
        SymbolTable {
            code: Vec::new(),
            decls: Vec::new(),
            data: Vec::new(),
            scopes: vec![global_scope],
            words: 0,
            index: 0,
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

    pub fn new_page(&mut self) {
        let mut temp = Vec::new();
        for (decl, symbol) in self.decls.iter() {
            temp.push(format!("{}:", decl));
            let value = match symbol {
                Symbol::Local(w) => w.to_string(),
                Symbol::Global(label) => label.clone(),
                Symbol::Constant(w) => w.to_string(),
                _ => panic!("internal error"),
            };
            temp.push(format!("  .dw {}", value));
        }
        self.extend(temp);
        self.append(format!("  .align"));
        self.decls.clear();
        self.words = 0;
    }

    pub fn emit(&mut self) -> Vec<String> {
        let mut result = vec![
            format!("  lea $+3"),
            format!("  jmp @$+1"),
            format!("  .dw {}", SymbolTable::ENTRYPOINT),
            format!("  jmp $"),
            format!("  .org {}", SymbolTable::ORIGIN),
        ];
        self.new_page();
        for line in self.code.iter() {
            result.push(line.clone());
        }
        self.new_page();
        for (label, words) in self.data.iter() {
            result.push(format!("{}:", label));
            for word in words {
                result.push(format!("  .dw {}", word));
            }
        }
        result
    }

    fn code_size(line: &String) -> usize {
        if line.contains(|c| c == '#') { 2 } else { 1 }
    }

    fn advance(&mut self, size: usize) {
        if self.words + size > 126 {
            let page_label = self.next_label();
            self.append(format!("  jmp @#{}", page_label));
            self.new_page();
            self.append_label(&page_label);
        }
        self.words += size;
    }

    pub fn append_code(&mut self, line: String) {
        let size = SymbolTable::code_size(&line);
        self.advance(size);
        self.append(format!("  {}", line));
    }

    pub fn append_code2(&mut self, line1: String, line2: String) {
        let size = SymbolTable::code_size(&line1) + SymbolTable::code_size(&line2);
        self.advance(size);
        self.append(format!("  {}", line1));
        self.append(format!("  {}", line2));
    }

    pub fn append_label(&mut self, label: &String) {
        self.append(format!("{}:", label));
    }

    pub fn return_address(&self) -> Word {
        self.scopes.last().unwrap().return_address
    }

    pub fn next_label(&mut self) -> String {
        self.index += 1;
        format!("L{}", self.index)
    }

    pub fn append_data(&mut self, exprs: &Vec<Expression>) -> String {
        let mut data = Vec::new();
        for expr in exprs {
            let value = match expr {
                Expression::Constant(w) => w.to_string(),
                Expression::Symbol(name) => {
                    match self.lookup(name) {
                        Symbol::Constant(w) => w.to_string(),
                        Symbol::Local(w) => w.to_string(),
                        Symbol::Global(label) => label.clone(),
                        Symbol::Function(_, _) => name.clone(),
                        Symbol::Undefined => panic!("undefined: {}", name),
                    }
                },
                Expression::ArrayLiteral(inner) => self.append_data(inner),
                _ => panic!("array literal must be constant"),
            };
            data.push(value);
        }
        let label = self.next_label();
        self.data.push((label.clone(), data));
        label
    }

    pub fn append_heap(&mut self, size: Word) -> Word {
        let mut scope = self.scopes.last_mut().unwrap();
        scope.heap -= size;
        scope.heap
    }

    pub fn enter(&mut self) {
        let last = self.scopes.last().unwrap();
        let watermark = last.watermark;
        let heap = last.heap;
        let return_address = last.return_address;
        self.scopes.push(
            Scope {
                symbols: HashMap::new(),
                watermark: watermark,
                stack: watermark,
                heap: heap,
                return_address: return_address,
            }
        );
    }

    pub fn leave(&mut self) {
        let last = self.scopes.pop().unwrap();
        let current = self.scopes.last_mut().unwrap();
        current.watermark = Word::max(last.watermark, current.watermark);
    }

    pub fn enter_function(&mut self, watermark: Word) -> Word {
        let last = self.scopes.last().unwrap();
        let heap = last.heap;
        let return_address = last.return_address;
        self.scopes.push(
            Scope {
                symbols: HashMap::new(),
                watermark: watermark,
                stack: watermark,
                heap: heap,
                return_address: return_address,
            }
        );
        let return_address = self.allocate_temp();
        self.scopes.last_mut().unwrap().return_address = return_address;
        return_address
    }

    pub fn leave_function(&mut self, name: &String, args: Vec<Word>) {
        let func_scope = self.scopes.pop().unwrap();
        let symbol = Symbol::Function(func_scope.watermark + 1, args);
        let scope = self.scopes.last_mut().unwrap();
        scope.symbols.insert(name.clone(), symbol);
    }

    pub fn allocate_temp(&mut self) -> Word {
        let mut scope = self.scopes.last_mut().unwrap();
        let index = scope.stack;
        scope.stack += 1;
        scope.watermark = Word::max(scope.watermark, scope.stack);
        index
    }

    pub fn release_temp(&mut self) {
        self.scopes.last_mut().unwrap().stack -= 1;
    }

    pub fn declare_var(&mut self, name: &String, value: Option<Symbol>) {
        let symbol = if self.is_global() {
            self.decls.push((name.clone(), value.unwrap_or(Symbol::Constant(0))));
            self.words += 1;
            if self.words >= 127 {
                self.new_page();
            }
            Symbol::Global(name.clone())
        } else {
            Symbol::Local(self.allocate_temp())
        };
        let scope = self.scopes.last_mut().unwrap();
        scope.symbols.insert(name.clone(), symbol);
    }

    pub fn declare_const(&mut self, name: &String, symbol: Symbol) {
        let scope = self.scopes.last_mut().unwrap();
        scope.symbols.insert(name.clone(), symbol);
    }

    pub fn declare_arg(&mut self, name: &String) -> Word {
        let addr = self.allocate_temp();
        let symbol = Symbol::Local(addr);
        let scope = self.scopes.last_mut().unwrap();
        scope.symbols.insert(name.clone(), symbol);
        addr
    }

    pub fn lookup(&self, name: &String) -> Symbol {
        for scope in self.scopes.iter() {
            match scope.symbols.get(name) {
                Some(s) => return s.clone(),
                None => ()
            }
        }
        return Symbol::Undefined
    }

    pub fn is_global(&self) -> bool {
        self.scopes.last().unwrap().return_address == 0
    }
}
