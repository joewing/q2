
use std::fs;
use std::io::{BufReader, Read};

#[derive(Clone)]
pub struct Token {
    pub file_name: String,
    pub line_number: usize,
    pub value: String,
}

impl Token {
    pub fn error<T>(&self, msg: String) -> Result<T, String> {
        Err(format!("ERROR: {}[{}]: {}", self.file_name, self.line_number, msg))
    }
}

pub struct Tokenizer {
    file_name: String,
    line_number: usize,
    current_char: Option<char>,
    bytes: Box<dyn Iterator<Item = u8>>,
    current_token: Option<Token>,
}

impl Tokenizer {

    fn read_char(&mut self) -> Option<char> {
        match self.bytes.next() {
            Some(b) => Some(b as char),
            None => None,
        }
    }

    fn peek_char(&mut self) -> Option<char> {
        match self.current_char {
            Some(c) => Some(c),
            None => {
                self.current_char = self.read_char();
                self.current_char
            },
        }
    }

    fn next_char(&mut self) -> Option<char> {
        match self.current_char {
            Some(c) => {
                if c == '\n' {
                    self.line_number += 1;
                }
                self.current_char = None;
                Some(c)
            },
            None => {
                let result = self.read_char();
                if result.unwrap_or(' ') == '\n' {
                    self.line_number += 1;
                }
                result
            },
        }
    }

    fn read_token(&mut self) -> Token {
        let mut result = String::new();
        let mut in_comment = false;
        let mut in_string = false;
        let mut in_char = false;
        let mut in_control = false;
        let mut in_hex = 0;
        let mut in_op = false;
        loop {
            match self.peek_char() {
                Some(c) if in_comment => {
                    let _ = self.next_char();
                    if c == '\n' {
                        in_comment = false;
                    }
                },
                Some(c) if in_hex > 0 => {
                    let _ = self.next_char();
                    result.push(c);
                    in_hex = in_hex - 1;
                },
                Some(c) if in_control => {
                    let _ = self.next_char();
                    result.push(c);
                    in_control = false;
                    if c == 'x' || c == 'X' {
                        in_hex = 3;
                    }
                },
                Some(c) if in_string => {
                    let _ = self.next_char();
                    result.push(c);
                    if c == '\\' {
                        in_control = true;
                    } else if c == '\"' {
                        break;
                    }
                },
                Some(c) if in_char => {
                    let _ = self.next_char();
                    result.push(c);
                    if c == '\\' {
                        in_control = true;
                    } else if c == '\'' {
                        break;
                    }
                },
                Some(c) if in_op => {
                    if c == '=' || c == '>' || c == '<' || c == '&' || c == '|' {
                        let _ = self.next_char();
                        result.push(c)
                    }
                    break;
                },
                Some(c) => match c {
                    '#' => {
                        if result.is_empty() {
                            let _ = self.next_char();
                            in_comment = true;
                        } else {
                            break;
                        }
                    },
                    '\"' => {
                        if result.is_empty() {
                            let _ = self.next_char();
                            result.push(c);
                            in_string = true;
                        } else {
                            break;
                        }
                    },
                    '\'' => {
                        if result.is_empty() {
                            let _ = self.next_char();
                            result.push(c);
                            in_char = true;
                        } else {
                            break;
                        }
                    },
                    ' ' | '\n' | '\t' | '\r' => {
                        if result.is_empty() {
                            let _ = self.next_char();
                        } else {
                            break;
                        }
                    },
                    _ => {
                        if is_operator(c) {
                            if result.is_empty() {
                                let _ = self.next_char();
                                result.push(c);
                                in_op = true;
                            } else {
                                break;
                            }
                        } else {
                            let _ = self.next_char();
                            result.push(c);
                        }
                    },
                },
                None => break,
            }
        }
        Token {
            value: result,
            line_number: self.line_number,
            file_name: self.file_name.clone(),
        }
    }

    pub fn peek_token(&mut self) -> Token {
        match &self.current_token {
            Some(t) => t.clone(),
            None => {
                let t = self.read_token();
                self.current_token = Some(t.clone());
                t
            },
        }
    }

    pub fn next_token(&mut self) {
        if self.current_token.is_some() {
            self.current_token = None;
        } else {
            let _ = self.read_token();
        }
    }

    pub fn expect(&mut self, s: &str) -> Result<(), String> {
        let t = self.peek_token();
        if t.value == s {
            self.next_token();
            Ok(())
        } else {
            t.error(format!("expected '{}', got '{}'", s, t.value))
        }
    }

    pub fn check(&mut self, s: &str) -> bool {
        self.peek_token().value == s
    }

    pub fn from_file(file_name: &str) -> Result<Tokenizer, String> {
        let reader = match fs::File::open(file_name) {
            Ok(f) => BufReader::new(f),
            Err(e) => {
                return Err(format!("could not open {}: {}", file_name, e.to_string()));
            },
        };
        Ok(
            Tokenizer {
                file_name: file_name.to_string(),
                line_number: 1,
                current_char: None,
                current_token: None,
                bytes: Box::from(reader.bytes().map(|x| x.unwrap())),
            }
        )
    }

    pub fn from_str(input: &str) -> Result<Tokenizer, String> {
        let bytes = input.to_string().into_bytes().into_iter();
        Ok(
            Tokenizer {
                file_name: "<internal>".to_string(),
                line_number: 1,
                current_char: None,
                current_token: None,
                bytes: Box::from(bytes),
            }
        )
    }
}

fn is_whitespace(ch: char) -> bool {
    ch == ' ' || ch == '\n' || ch == '\t' || ch == '\r'
}

fn is_operator(ch: char) -> bool {
    if ch >= '0' && ch <= '9' {
        false
    } else if ch >= 'a' && ch <= 'z' {
        false
    } else if ch >= 'A' && ch <= 'Z' {
        false
    } else if ch == '_' {
        false
    } else if is_whitespace(ch) {
        false
    } else {
        true
    }
}

#[cfg(test)]
mod tests {
    use test_case::test_case;
    use crate::tokenizer::Tokenizer;

    #[test_case("asdf", vec!["asdf"])]
    #[test_case("@x", vec!["@", "x"])]
    #[test_case("!= +-", vec!["!=", "+", "-"])]
    #[test_case("5;", vec!["5", ";"])]
    #[test_case("'0'", vec!["'0'"])]
    #[test_case("x = @x >> 1;", vec!["x", "=", "@", "x", ">>", "1", ";"])]
    fn tokenize_test(input: &str, expected: Vec<&str>) {
        let mut tokenizer = Tokenizer::from_str(input).unwrap();
        for tok in expected {
            assert_eq!(tokenizer.peek_token().value, tok.to_string());
            tokenizer.next_token();
        }
        assert_eq!(tokenizer.peek_token().value, "".to_string());
    }
}
