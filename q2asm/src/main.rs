
use std::fs;
use std::env;
use std::process;
use std::error::Error;

mod parser;
mod eval;
mod pass1;
mod pass2;

fn get_output_name(name: &str) -> String {
    if name.ends_with(".q2") {
        let mut s = String::from(name);
        s.truncate(name.len() - 3);
        s
    } else {
        String::from("a.out")
    }
}

fn assemble(input_name: &String, output_name: &String) -> Result<(), Box<dyn Error>> {
    let content = fs::read_to_string(&input_name)?;
    let statements = parser::parse(&content)?;
    let symbols = pass1::pass1(&statements);
    let result = pass2::pass2(&statements, &symbols)?;
    for word in result {
        println!("[{:4x}]", word)
    };
    Ok(())
}

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() != 2 {
        eprintln!("usage: {} <file.q2>", args[0]);
        process::exit(-1);
    }
    let input_name = String::from(&args[1]);
    let output_name = get_output_name(&args[1]);
    match assemble(&input_name, &output_name) {
        Ok(_) => println!("done"),
        Err(e) => eprintln!("ERROR: {}", e)
    };
}
