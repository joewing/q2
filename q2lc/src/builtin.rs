use crate::parser::parse_builtin;
use crate::statement::Statement;

pub fn generate_builtins() -> Vec<Statement> {
    let mut result = Vec::new();
    for body in BUILTINS {
        result.push(parse_builtin(body));
    }
    result
}

const BUILTINS: &[&str] = &[
    SHIFT_RIGHT,
    SHIFT_LEFT,
    MULTIPLY,
    DIVMOD,
    DIVIDE,
    MODULUS,
];

pub const SHIFT_RIGHT_NAME: &str = "shift_right";
const SHIFT_RIGHT: &str = concat!(
    "fun shift_right(x, n)\n",
    "  while @n do\n",
    "    x = @x >> 1;\n",
    "    n = @n + -1;\n",
    "  end\n",
    "  return @x;\n",
    "end\n",
);

pub const SHIFT_LEFT_NAME: &str = "shift_left";
const SHIFT_LEFT: &str = concat!(
    "fun shift_left(x, n)\n",
    "  while @n do\n",
    "    x = @x + @x;\n",
    "    n = @n + -1;\n",
    "  end\n",
    "  return @x;\n",
    "end\n",
);

pub const MULTIPLY_NAME: &str = "multiply";
const MULTIPLY: &str = concat!(
    "fun multiply(x, y)\n",
    "  var result = 0;\n",
    "  while @x do\n",
    "    if @x & 1 then\n",
    "      result = @result + @y;",
    "    end",
    "    x = @x >> 1;\n",
    "    y = @y + @y;\n",
    "  end\n",
    "  return @result;\n",
    "end\n",
);

const DIVMOD: &str = concat!(
    "fun divmod(x, y, result, rem)\n",
    "  var n = 12;\n",
    "  @result = 0;\n",
    "  @rem = 0;\n",
    "  while @n do\n",
    "    @result = @@result << 1;\n",
    "    @rem = @@rem << 1;\n",
    "    if @x & 0x800 then\n",
    "      @rem = @@rem + 1;\n",
    "    end\n",
    "    x = @x + @x;\n",
    "    if @@rem >= @y then\n",
    "      @rem = @@rem - @y;\n",
    "      @result = @@result + 1;\n",
    "    end\n",
    "    n = @n + -1;\n",
    "  end\n",
    "end\n",
);

pub const DIVIDE_NAME: &str = "divide";
const DIVIDE: &str = concat!(
    "fun divide(x, y)\n",
    "  divmod(@x, @y, x, y);\n",
    "  return @x;\n",
    "end\n",
);

pub const MODULUS_NAME: &str = "modulus";
const MODULUS: &str = concat!(
    "fun modulus(x, y)\n",
    "  divmod(@x, @y, x, y);\n",
    "  return @y;\n",
    "end\n",
);
