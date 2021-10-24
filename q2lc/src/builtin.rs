use crate::parser::parse_builtin;
use crate::statement::Statement;

pub fn generate_builtins() -> Vec<Statement> {
    BUILTINS.iter().map(|body| parse_builtin(body)).collect()
}

const BUILTINS: &[&str] = &[
    SHIFT_RIGHT,
    SHIFT_LEFT,
    MULTIPLY,
    DIVMOD,
    DIVIDE,
    MODULUS,
    RAND,
    MEMSET,
    MEMCPY,
    OUTPUT,
    PUTS,
    ITOA,
    PUTINT,
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
    "    ifcarry @x >> 1 then\n",
    "      result = @result + @y;\n",
    "    end\n",
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
    "    ifcarry @x << 1 then\n",
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

const RAND: &str = concat!(
    "var rseed = 1;\n",
    "fun rand()\n",
    "  rseed = @rseed * 2917 + 353;\n",
    "  return @rseed;",
    "end\n",
);

const MEMSET: &str = concat!(
    "fun memset(ptr, count, value)\n",
    "  while @count do\n",
    "    @ptr = @value;\n",
    "    count = @count - 1;\n",
    "    ptr = @ptr + 1;\n",
    "  end\n",
    "end\n",
);

const MEMCPY: &str = concat!(
    "fun memcpy(dest, src, count)\n",
    "  while @count do\n",
    "    @dest = @@src;\n",
    "    dest = @dest + 1;\n",
    "    src = @src + 1;\n",
    "    count = @count - 1;\n",
    "  end\n",
    "end\n",
);

const OUTPUT: &str = "const OUTPUT = 0xFFF;";

const PUTS: &str = concat!(
    "fun puts(ptr)\n",
    "  while @@ptr do\n",
    "    OUTPUT = @@ptr;\n",
    "    ptr = @ptr + 1;\n",
    "  end\n",
    "end\n",
);

const ITOA: &str = concat!(
    "fun itoa(v)\n",
    "  var temp = :5;\n",
    "  var i = 4;\n",
    "  while @i do\n",
    "    i = @i - 1;\n",
    "    var m;\n",
    "    divmod(@v, 10, v, m);\n",
    "    @temp + @i = @m + '0';\n",
    "  end\n",
    "  @temp + 4 = 0;\n",
    "  return @temp;\n",
    "end\n",
);

const PUTINT: &str = concat!(
    "fun putint(v)\n",
    "  puts(itoa(@v));\n",
    "end\n",
);
