use crate::expr::{Expression, Word};
use crate::statement::Statement;
use crate::symbol::{Symbol, SymbolTable};
use crate::visitor::StatementVisitor;

pub struct Allocator<'a> {
    table: &'a SymbolTable,
    watermark: Word,
}

impl Allocator<'_> {
    pub fn watermark(table: &SymbolTable, statement: &Statement) -> Result<Word, String> {
        let mut allocator = Allocator {
            table: table,
            watermark: table.current_watermark(),
        };
        let _ = allocator.visit_statement(statement)?;
        Ok(allocator.watermark)
    }
}

impl StatementVisitor for Allocator<'_> {
    fn visit_symbol(&mut self, name: &String) -> Result<Expression, String> {
        match self.table.lookup(name) {
            Ok(Symbol::Function(w, _)) => self.watermark = Word::max(self.watermark, w),
            _ => (),
        }
        self.visit_symbol_default(name)
    }
}
