
# Q2 Language Compiler

A compiler for a simple language for the Q2 (Q2L).

## Background

Q2L is a small language designed to make programming the Q2 easier
without introducing features that are expensive to implement. To that
end, all values in Q2L are 12-bit words and Q2L does not support
recursive function calls.

## Program Structure

Q2L programs are organized into functions. Execution starts in the _main_
function. All functions must be defined before use.

Here is a small example:
```
# Comments start with a `#` and continue to the end of the line.

# Declare a constant.
# Note that 0xFFF is the address of the output device.
const OUTPUT = 0xFFF;

# Function to output a value.
fun output(v)
  # Here we load the word at v and write it to 0xFFF.
  OUTPUT = @v;
end

# Function to output a string.
fun puts(ptr)
  while @@ptr do    # While the character is non-zero...
    output(@@ptr);  # Output the character.
    ptr = @ptr + 1; # Move to the next character.
  end
end

# The main function. Execution starts here.
fun main()
  puts("Hello!");   # Call the "puts" function with a pointer to a string.
end
```

## Variables

A variable is created using the `var` keyword. This statically
allocates one word of memory. Here are some examples.

To allocate a word and leave it uninitialized:

```
var x;
```

To allocate a word and initialize it with 5:
```
var x = 5;
```

To allocate a word and initialize it with a pointer to
an array of 15 (uninitialized) words:
```
var y = :15;
```

To allocate a word and initialize it with a pointer to
a null-terminated string:
```
var ptr = "asdf";
```

To allocate a word and initialize it with a pointer to
an array of 3 words:
```
var values = [1, 2, 3];
```

Variables can be declared either outside a function (globally),
or inside a function (locally). Although all variables are statically
allocated, the storage for variables that are declared locally is
re-used in other functions or scopes if their use does not overlap.
Function parameters behave in the same way as local variables, but
are initialized with a value when the function is invoked.

Unlike most familar languages (though similar to BLISS), when
a variable is referenced its address is returned. Thus, to load
the value from a variable, it is necessary to use the '@' (dereference)
operator.

The assignment operator ('='), stores the value computed from the
right-hand side at the address computed on the left-hand side. Thus,
to increment the variable "x", one would do:

```
x = @x + 1
```

Because variables always return their address rather than their value,
it is easy to pass around references to variables for manipulation in
other functions. For example, the following will replace the values
at x and y with the result from calling divmod:

```
  var x = 12;
  var y = 5;
  divmod(@x, @y, x, y);
```

## Constants

Constants are values computed at compile-time. Unlike variables, there
is no address associated with a constant. Instead, its value is
substituted whenever the constant is referenced.

A constant is introduced using `const`:
```
const THREE = 1 + 2;
```

It is often convenient to use const to point to the beginning of an
array:
```
const ARRAY = :256;   # Get a pointer to an array of 256 words.
ARRAY + 1 = 3;        # Set the second element of the array to 3.
```

## Functions

Functions are declared using the `fun` keyword. A function may take
zero or more arguments and can return a single value.
Here is an example that takes two arguments, adds them together,
and then returns the result:

```
fun add2(x, y)
  return @x + @y;
end
```

Functions are invoked by referencing their name and providing the
necessary arguments between '(' and ')':
```
  var result = add2(2, 3);
```

Functions may be called directly or as part of an expression.

## Function Pointers

The name of a function returns a pointer to the function and can be
used in lookup tables, etc. For example:

```
fun zero()
  puts("zero");
end

fun one()
  puts("one");
end

fun main()
  var funs = [zero, one];
  var i = 1;
  @(@funs + @i)();  # Calls "one"
end
```

Due to the static nature of Q2L, it is not possible to use function
pointers for functions that receive arguments, though communication
through global variables is possible.  Also note that using function
pointers to recursively call a function will likely result in an
infinite loop.

## Nested Functions

Functions may be nested. Nested functions are able to access
the parameters of the outer function as well as any values or
functions defined earlier in the function:

```
fun outer(x)

  fun nested(y)
    putint(@x + @y);
  end

  nested(1);  # @x + 1
  nested(2);  # @x + 2
end
```

Mixing nested functions and function pointers is also possible:

```
fun doit(x, zero_or_one)

  fun zero(@x);
    putint(@x);
  end

  fun one()
    putint(@x + 1);
  end

  const FUNS = [zero, one];
  @(FUNS + @zero_or_one)();

end
```

## Operators

The following operators are supported:

  Operator  | Description       | Precedence
  --------- | ----------------- | ----------
  `~`       | Unary bitwise NOT | 1
  `-`       | Unary negation    | 1
  `!`       | Unary logical NOT | 1
  `@`       | Dereference       | 1
  `*`       | Multiply          | 2
  `/`       | Divide            | 2
  `%`       | Modulus           | 2
  `&`       | Bitwise AND       | 3
  `^`       | Bitwise XOR       | 3
  `\|`      | Bitwise OR        | 3
  `<<`      | Shift left        | 4
  `>>`      | Shift right       | 4
  `==`      | Equal             | 5
  `!=`      | Not equal         | 5
  `<=`      | Less or equal     | 5
  `>=`      | Greater or equal  | 5
  `<`       | Less than         | 5
  `>`       | Greater than      | 5
  `&&`      | Logical AND       | 6
  `\|\|`    | Logical OR        | 6

Some notes:
  * All numbers are assumed to be unsigned.
  * Comparison operators return 0 if false and a non-zero, but
    unspecified value if true.
  * Logical AND and OR are short-circuiting.

## Conditionals

The usual "if-then-else" is supported as follows:

```
  if condition then
    # body
  else
    # else part
  end
```

The `else` portion is optional. It is also possible to add
more branches using one or more `elseif` sections:

```
  if cond1 then
    # body 1
  elseif cond2 then
    # body 2
  elseif cond3 then
    # body 3
  else
    # body 4
  end
```

Zero is false and any non-zero value is true.

To enable more efficient code using the flag, `ifcarry` can
be used to execute conditional on the flag being set.

## Loops

The only supported loop construct is the `while` loop:

```
  while condition do
    # body
  end
```

This will execute the body of the loop until the condition
evaluates to 0. The `break` keyword can be used to exit the
inner-most loop.

## Builtins

The following built-in function are available:

 * `divmod(x, y, a, b)` - Computes `a = x / y` and `b = x % y`.
 * `memset(dest, count, value)` - Sets `count` words at `dest` to `value`.
 * `memcpy(dest, src, count)` - Copy `count` words from `src` to `dest`.
 * `itoa(i)` - Return a pointer to a 5 word zero-terminated ASCII string representing `i`.
 * `clear()` - Reset and clear the LCD.
 * `puts(s)` - Write a zero-terminated string to the output device.
 * `putint(i)` - Write the word `i` to the output device (`puts(itoa(i))`).
 * `rand()` - Return a random number between 0x000 and 0xFFF inclusive.
 * `i2c_start()` - Start an I2C transaction.
 * `i2c_stop()` - Stop an I2C transaction.
 * `i2c_write(v)` - Write byte v to the I2C interface.
 * `i2c_read()` - Read a byte from the I2C interface.

## Include Files

Include files are supported using the `include` keyword:

```
  include "path/file.q2l";
```


