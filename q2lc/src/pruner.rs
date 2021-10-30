use std::collections::HashSet;
use crate::expr::Expression;
use crate::statement::Statement;
use crate::symbol::SymbolTable;
use crate::visitor::StatementVisitor;

pub struct Pruner {
    used: HashSet<String>,
    updated: bool,
}

impl Pruner {
    pub fn prune(statements: &Vec<Statement>) -> Result<Vec<Statement>, String> {
        let mut pruner = Pruner {
            used: HashSet::new(),
            updated: false,
        };
        pruner.used.insert(SymbolTable::ENTRYPOINT.to_string());
        loop {
            pruner.updated = false;
            let new_statements = pruner.visit_statements(statements)?;
            if !pruner.updated {
                return Ok(new_statements);
            }
        }
    }

    fn insert(&mut self, name: &str) {
        if !self.used.contains(name) {
            self.used.insert(name.to_string());
            self.updated = true;
        }
    }
}

impl StatementVisitor for Pruner {

    fn visit_symbol(&mut self, name: &String) -> Result<Expression, String> {
        self.insert(name);
        self.visit_symbol_default(name)
    }

    fn visit_const(&mut self, name: &String, expr: &Expression) -> Result<Statement, String> {
        if self.used.contains(name) {
            self.visit_const_default(name, expr)
        } else {
            Ok(Statement::EMPTY)
        }
    }

    fn visit_var(&mut self, name: &String, expr_opt: &Option<Expression>) -> Result<Statement, String> {
        if self.used.contains(name) {
            self.visit_var_default(name, expr_opt)
        } else {
            Ok(Statement::EMPTY)
        }
    }


    fn visit_function(&mut self, name: &String, params: &Vec<String>, body: &Statement) -> Result<Statement, String> {
        if self.used.contains(name) {
            self.visit_function_default(name, params, body)
        } else {
            Ok(Statement::EMPTY)
        }
    }

}

