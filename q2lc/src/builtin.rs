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
    MULT24,
    RAND,
    MEMSET,
    MEMCPY,
    OUTPUT,
    DELAY,
    PUTS,
    ITOA,
    PUTINT,
    I2C_EN,
    I2C_SCL,
    I2C_SDA,
    I2C_START,
    I2C_STOP,
    I2C_WRITE,
    I2C_READ,
    CLEAR,
    GETKEY,
    WAITKEY,
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
    "    x = @x >> 1;\n",
    "    ifcarry\n",
    "      result = @result + @y;\n",
    "    end\n",
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
    "    x = @x + @x;\n",
    "    ifcarry\n",
    "      @rem = @@rem + 1;\n",
    "    end\n",
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

const MULT24: &str = concat!(
    "fun mult24(a, b, high, low)\n",
    "  var c = 0;\n",
    "  @high = 0;\n",
    "  @low = 0;\n",
    "  while @a do\n",
    "    a = @a >> 1;\n",
    "    ifcarry\n",
    "      @high = @@high + @c;\n",
    "      var temp = @@low + @b;\n",
    "      ifcarry\n",
    "        @high = @@high + 1;\n",
    "      end\n",
    "      @low = @temp;\n",
    "    end\n",
    "    c = @c << 1;\n",
    "    b = @b + @b;\n",
    "    ifcarry\n",
    "      c = @c + 1;\n",
    "    end\n",
    "  end\n",
    "end\n",
);

const RAND: &str = concat!(
    "const rseed = :1;\n",
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

// Instruction count: 5 + 5 * i
// Assuming each instruction takes 4 cycles:
//      Time (s): 4 * (5 + 5 * i) / FREQUENCY_HZ
// To delay for x ms (1000 * x s):
//      x / 1000 == 4 * (5 + 5 * i) / FREQUENCY_HZ
//      i = x * FREQUENCY_HZ / 20000 - 1
const DELAY: &str = concat!(
    "fun delay(i)\n",
    "  while @i do\n",
    "    i = @i - 1;\n",
    "  end\n",
    "end\n"
);

const PUTS: &str = concat!(
    "fun puts(ptr)\n",
    "  while @@ptr do\n",
    "    OUTPUT = @@ptr;\n",
    "    delay(__internal__OUTPUT_DELAY);\n",
    "    ptr = @ptr + 1;\n",
    "  end\n",
    "end\n",
);

const ITOA: &str = concat!(
    "fun itoa(v)\n",
    "  const BUFFER = :5;\n",
    "  var shift = [ 1000, 100, 10, 1, 0 ];\n",
    "  var ptr = BUFFER;\n",
    "  while @@shift do\n",
    "    @ptr = '0';\n",
    "    var s = @@shift;\n",
    "    while @v >= @s do\n",
    "      @ptr = @@ptr + 1;\n",
    "      v = @v - @s;\n",
    "    end\n",
    "    ptr = @ptr + 1;\n",
    "    shift = @shift + 1;\n",
    "  end\n",
    "  @ptr = 0;\n",
    "  return BUFFER;\n",
    "end\n",
);

const PUTINT: &str = concat!(
    "fun putint(v)\n",
    "  puts(itoa(@v));\n",
    "end\n",
);

const I2C_EN: &str = "const I2C_EN = 0x800;";
const I2C_SCL: &str = "const I2C_SCL = 0x200;";
const I2C_SDA: &str = "const I2C_SDA = 0x100;";

const I2C_START: &str = concat!(
    "fun i2c_start()\n",
    "  OUTPUT = I2C_EN;\n",
    "  OUTPUT = I2C_EN | I2C_SDA;\n",
    "  OUTPUT = I2C_EN | I2C_SDA | I2C_SCL;\n",
    "end\n",
);

const I2C_STOP: &str = concat!(
    "fun i2c_stop()\n",
    "  OUTPUT = I2C_EN | I2C_SDA | I2C_SCL;\n",
    "  OUTPUT = I2C_EN | I2C_SDA;\n",
    "  OUTPUT = I2C_EN;\n",
    "end\n",
);

const I2C_WRITE: &str = concat!(
    "fun i2c_write(v)\n",
    "  v = @v << 1;\n",
    "  v = @v << 1;\n",
    "  v = @v << 1;\n",
    "  v = @v << 1;\n",
    "  var i = 8;\n",
    "  while @i do\n",
    "    v = @v + @v;\n",
    "    ifcarry\n",
    "      OUTPUT = I2C_EN | I2C_SCL;\n",
    "      OUTPUT = I2C_EN;\n",
    "      OUTPUT = I2C_EN | I2C_SCL;\n",
    "    else\n",
    "      OUTPUT = I2C_EN | I2C_SCL | I2C_SDA;\n",
    "      OUTPUT = I2C_EN | I2C_SDA;\n",
    "      OUTPUT = I2C_EN | I2C_SCL | I2C_SDA;\n",
    "    end\n",
    "    i = @i + -1;\n",
    "  end\n",
    "  OUTPUT = I2C_EN | I2C_SCL;\n",
    "  OUTPUT = I2C_EN;\n",
    "  OUTPUT = I2C_EN | I2C_SCL;\n",
    "end\n",
);

const I2C_READ: &str = concat!(
    "fun i2c_read(ack)\n",
    "  var result = 0;\n",
    "  var i = 8;\n",
    "  while @i do\n",
    "    OUTPUT = I2C_EN | I2C_SCL;\n",
    "    OUTPUT = I2C_EN;\n",
    "    result = @result << 1;\n",
    "    if !(@OUTPUT & I2C_SDA) then\n",
    "      result = @result + 1;\n",
    "    end\n",
    "    i = @i - 1;\n",
    "  end\n",
    "  OUTPUT = I2C_EN | I2C_SCL;\n",
    "  if @ack then\n",
    "    OUTPUT = I2C_EN | I2C_SCL | I2C_SDA;\n",
    "    OUTPUT = I2C_EN | I2C_SDA;\n",
    "    OUTPUT = I2C_EN | I2C_SCL | I2C_SDA;\n",
    "  else\n",
    "    OUTPUT = I2C_EN;\n",
    "  end\n",
    "  OUTPUT = I2C_EN | I2C_SCL;\n",
    "  return @result;\n",
    "end\n",
);

const CLEAR: &str = concat!(
    "fun clear()\n",
    "  puts([0x138, 0x10C, 0x106, 0x101, 0x000]);\n",
    "end\n",
);

const GETKEY: &str = concat!(
    "fun getkey()\n",
    "  return ~@OUTPUT & 31;\n",
    "end\n",
);

const WAITKEY: &str = concat!(
    "fun waitkey()\n",
    "  while getkey() do\n",
    "  end\n",
    "  var key = 0;\n",
    "  while @key == 0 do\n",
    "    key = getkey();\n",
    "  end\n",
    "  while getkey() do\n",
    "  end\n",
    "  return @key;\n",
    "end\n",
);
