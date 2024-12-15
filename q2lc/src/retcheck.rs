use crate::expr::Expression;
use crate::Statement;
use crate::visitor::StatementVisitor;

pub struct ReturnCheck {
    has_return: bool
}

impl ReturnCheck {
    pub fn check(statement: &Statement) -> bool {
        let mut rc = ReturnCheck { has_return: false };
        let _ = rc.visit_statement(statement);
        rc.has_return
    }
}

impl StatementVisitor for ReturnCheck {
    fn visit_statement(&mut self, statement: &Statement) -> Result<Statement, String> {
        self.has_return = false;
        self.visit_statement_default(statement)
    }

    fn visit_return(&mut self, expr: &Expression) -> Result<Statement, String> {
        self.has_return = true;
        Ok(Statement::Return(expr.clone()))
    }
}
