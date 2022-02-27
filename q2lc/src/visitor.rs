use crate::expr::{BinaryOperator, Expression, UnaryOperator, Word};
use crate::statement::Statement;

pub trait StatementVisitor {

    fn visit_constant_default(&mut self, word: Word) -> Result<Expression, String> {
        Ok(Expression::Constant(word))
    }
    fn visit_constant(&mut self, word: Word) -> Result<Expression, String> {
        self.visit_constant_default(word)
    }

    fn visit_symbol_default(&mut self, name: &String) -> Result<Expression, String> {
        Ok(Expression::Symbol(name.clone()))
    }
    fn visit_symbol(&mut self, name: &String) -> Result<Expression, String> {
        self.visit_symbol_default(name)
    }

    fn visit_array_literal(&mut self, exprs: &Vec<Expression>) -> Result<Expression, String> {
        let mut new_exprs = Vec::new();
        for e in exprs {
            new_exprs.push(self.visit_expr(e)?);
        }
        Ok(Expression::ArrayLiteral(new_exprs))
    }

    fn visit_call(&mut self, func: &Expression, args: &Vec<Expression>) -> Result<Expression, String> {
        let new_func = self.visit_expr(func)?;
        let mut new_args = Vec::new();
        for e in args {
            new_args.push(self.visit_expr(e)?);
        }
        Ok(Expression::Call(Box::new(new_func), new_args))
    }

    fn visit_unary_default(&mut self, op: UnaryOperator, inner: &Expression) -> Result<Expression, String> {
        let new_inner = self.visit_expr(inner)?;
        Ok(Expression::Unary(op, Box::new(new_inner)))
    }
    fn visit_unary(&mut self, op: UnaryOperator, inner: &Expression) -> Result<Expression, String> {
        self.visit_unary_default(op, inner)
    }

    fn visit_binary_default(&mut self, op: BinaryOperator, lhs: &Expression, rhs: &Expression) -> Result<Expression, String> {
        let new_lhs = self.visit_expr(lhs)?;
        let new_rhs = self.visit_expr(rhs)?;
        Ok(Expression::Binary(op, Box::new(new_lhs), Box::new(new_rhs)))
    }
    fn visit_binary(&mut self, op: BinaryOperator, lhs: &Expression, rhs: &Expression) -> Result<Expression, String> {
        self.visit_binary_default(op, lhs, rhs)
    }

    fn visit_expr(&mut self, expr: &Expression) -> Result<Expression, String> {
        match expr {
            Expression::Symbol(name) => self.visit_symbol(name),
            Expression::Constant(w) => self.visit_constant(*w),
            Expression::ArrayLiteral(exprs) => self.visit_array_literal(exprs),
            Expression::Call(func, args) => self.visit_call(func, args),
            Expression::Unary(op, inner) => self.visit_unary(*op, inner),
            Expression::Binary(op, lhs, rhs) => self.visit_binary(*op, lhs, rhs),
        }
    }

    fn visit_const_default(&mut self, name: &String, expr: &Expression) -> Result<Statement, String> {
        let new_expr = self.visit_expr(expr)?;
        Ok(Statement::Const(name.clone(), new_expr))
    }
    fn visit_const(&mut self, name: &String, expr: &Expression) -> Result<Statement, String> {
        self.visit_const_default(name, expr)
    }

    fn visit_var_default(&mut self, name: &String, expr_opt: &Option<Expression>) -> Result<Statement, String> {
        let new_expr_opt = match expr_opt {
            Some(expr) => Some(self.visit_expr(expr)?),
            None => None,
        };
        Ok(Statement::Var(name.clone(), new_expr_opt))
    }
    fn visit_var(&mut self, name: &String, expr_opt: &Option<Expression>) -> Result<Statement, String> {
        self.visit_var_default(name, expr_opt)
    }

    fn visit_ifcarry_default(&mut self, t: &Statement, f: &Statement) -> Result<Statement, String> {
        let new_t = self.visit_statement(t)?;
        let new_f = self.visit_statement(f)?;
        Ok(Statement::IfCarry(Box::new(new_t), Box::new(new_f)))
    }
    fn visit_ifcarry(&mut self, t: &Statement, f: &Statement) -> Result<Statement, String> {
        self.visit_ifcarry_default(t, f)
    }

    fn visit_if_default(&mut self, cond: &Expression, t: &Statement, f: &Statement) -> Result<Statement, String> {
        let new_cond = self.visit_expr(cond)?;
        let new_t = self.visit_statement(t)?;
        let new_f = self.visit_statement(f)?;
        Ok(Statement::If(new_cond, Box::new(new_t), Box::new(new_f)))
    }
    fn visit_if(&mut self, cond: &Expression, t: &Statement, f: &Statement) -> Result<Statement, String> {
        self.visit_if_default(cond, t, f)
    }

    fn visit_while_default(&mut self, cond: &Expression, body: &Statement) -> Result<Statement, String> {
        let new_cond = self.visit_expr(cond)?;
        let new_body = self.visit_statement(body)?;
        Ok(Statement::While(new_cond, Box::new(new_body)))
    }
    fn visit_while(&mut self, cond: &Expression, body: &Statement) -> Result<Statement, String> {
        self.visit_while_default(cond, body)
    }

    fn visit_asm(&mut self, opcode: &String, dest: &Expression) -> Result<Statement, String> {
        let new_dest = self.visit_expr(dest)?;
        Ok(Statement::Asm(opcode.clone(), new_dest))
    }

    fn visit_expr_statement(&mut self, expr: &Expression) -> Result<Statement, String> {
        let new_expr = self.visit_expr(expr)?;
        Ok(Statement::Expression(new_expr))
    }

    fn visit_break_default(&mut self) -> Result<Statement, String> {
        Ok(Statement::Break)
    }
    fn visit_break(&mut self) -> Result<Statement, String> {
        self.visit_break_default()
    }

    fn visit_assign_default(&mut self, dest: &Expression, src: &Expression) -> Result<Statement, String> {
        let new_dest = self.visit_expr(dest)?;
        let new_src = self.visit_expr(src)?;
        Ok(Statement::Assign(new_dest, new_src))
    }
    fn visit_assign(&mut self, dest: &Expression, src: &Expression) -> Result<Statement, String> {
        self.visit_assign_default(dest, src)
    }

    fn visit_block(&mut self, ss: &Vec<Statement>) -> Result<Statement, String> {
        let mut new_ss = Vec::new();
        for s in ss {
            new_ss.push(self.visit_statement(s)?);
        }
        Ok(Statement::Block(new_ss))
    }

    fn visit_return(&mut self, expr: &Expression) -> Result<Statement, String> {
        let new_expr = self.visit_expr(expr)?;
        Ok(Statement::Return(new_expr))
    }

    fn visit_function_default(&mut self, name: &String, params: &Vec<String>, body: &Statement) -> Result<Statement, String> {
        let new_body = self.visit_statement(body)?;
        Ok(Statement::Function(name.clone(), params.clone(), Box::new(new_body)))
    }
    fn visit_function(&mut self, name: &String, params: &Vec<String>, body: &Statement) -> Result<Statement, String> {
        self.visit_function_default(name, params, body)
    }

    fn visit_statement(&mut self, statement: &Statement) -> Result<Statement, String> {
        match statement {
            Statement::Const(name, expr) => self.visit_const(name, expr),
            Statement::Var(name, expr_opt) => self.visit_var(name, expr_opt),
            Statement::Function(name, params, body) => self.visit_function(name, params, body),
            Statement::IfCarry(t, f) => self.visit_ifcarry(t, f),
            Statement::If(cond, t, f) => self.visit_if(cond, t, f),
            Statement::Expression(expr) => self.visit_expr_statement(expr),
            Statement::Break => self.visit_break(),
            Statement::Assign(dest, src) => self.visit_assign(dest, src),
            Statement::Block(ss) => self.visit_block(ss),
            Statement::Return(expr) => self.visit_return(expr),
            Statement::While(cond, body) => self.visit_while(cond, body),
            Statement::Asm(opcode, dest) => self.visit_asm(opcode, dest),
        }
    }

    fn visit_statements(&mut self, statements: &Vec<Statement>) -> Result<Vec<Statement>, String> {
        let mut new_statements = Vec::new();
        for s in statements {
            new_statements.push(self.visit_statement(s)?);
        }
        Ok(new_statements)
    }
}
