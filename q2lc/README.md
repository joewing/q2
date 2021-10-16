
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

To allocate a word and initialize with with a pointer to
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
through global variables is possible.  Also note that using funciton
pointers to recursively call a function will likely result in an
infinite loop.

