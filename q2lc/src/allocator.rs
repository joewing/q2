use crate::expr::Expression;
use crate::statement::Statement;
use crate::symbol::{Symbol, SymbolTable, Watermark};
use crate::visitor::StatementVisitor;

pub struct Allocator<'a> {
    table: &'a SymbolTable,
    watermark: Watermark,
}

impl Allocator<'_> {
    pub fn watermark(table: &SymbolTable, statement: &Statement) -> Result<Watermark, String> {
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
            Ok(Symbol::Function(w, _)) => {
                self.watermark = self.watermark.combine(w);
            },
            _ => (),
        }
        self.visit_symbol_default(name)
    }
}
