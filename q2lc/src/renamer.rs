use crate::expr::Expression;
use crate::statement::Statement;
use crate::visitor::StatementVisitor;

pub struct Renamer {
    prefix: Vec<String>,
    symbols: Vec<String>,
}

impl Renamer {

    const SEP: &'static str = "__";

    fn find(&self, name: &String) -> Result<String, String> {
        if name.starts_with("__internal__") {
            return Ok(name.clone());
        } else {
            for p in self.prefix.iter().rev() {
                let temp = format!("{}{}", p, name);
                for s in self.symbols.iter() {
                    if temp == *s {
                        return Ok(temp);
                    }
                }
            }
        }
        return Err(format!("not found: {}", name))
    }

    fn insert(&mut self, name: &String) -> String {
        let prefix = self.prefix.last().unwrap();
        let new_name = format!("{}{}", prefix, name);
        self.symbols.push(new_name.clone());
        new_name
    }

    fn enter(&mut self, name: &String) -> String {
        let new_name = self.insert(name);
        self.prefix.push(format!("{}{}", new_name, Renamer::SEP));
        new_name
    }

    fn leave(&mut self) {
        let _ = self.prefix.pop().unwrap();
    }

    pub fn rename(statements: &Vec<Statement>) -> Result<Vec<Statement>, String> {
        let mut renamer = Renamer {
            prefix: vec![String::new()],
            symbols: Vec::new(),
        };
        renamer.visit_statements(statements)
    }
}

impl StatementVisitor for Renamer {
    fn visit_const(&mut self, name: &String, expr: &Expression) -> Result<Statement, String> {
        let new_name = self.insert(name);
        self.visit_const_default(&new_name, expr)
    }

    fn visit_var(&mut self, name: &String, expr_opt: &Option<Expression>) -> Result<Statement, String> {
        let new_name = self.insert(name);
        self.visit_var_default(&new_name, expr_opt)
    }

    fn visit_symbol(&mut self, name: &String) -> Result<Expression, String> {
        let new_name = self.find(name)?;
        self.visit_symbol_default(&new_name)
    }

    fn visit_function(&mut self, name: &String, params: &Vec<String>, body: &Statement) -> Result<Statement, String> {
        let new_name = self.enter(name);
        let new_params = params.iter().map(|p| self.insert(p)).collect();
        let result = self.visit_function_default(&new_name, &new_params, body)?;
        self.leave();
        Ok(result)
    }
}
