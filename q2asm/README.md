
# Q2 Assembler

q2asm is an assembler for Q2 programs.

## Building

* q2asm is written in Rust, so the first step is to
  [install Rust](https://www.rust-lang.org/tools/install)
  (note that rustup will also install cargo, which is required).
* Once rust and cargo are installed, run `cargo build`
  from this directory.
* The q2asm will be available as `target/debug/q2asm`, which can
  be used from this location or copied to a location in your path.

## Directives

* .align [_expr_] - Align the current address to a boundary (128 if not specified).
* .def _name_ _expr_ - Define _name_ as _expr_.
* .dw _expr_ [, _expr_ ...] - Declare words.
* .org _expr_ - Set the current address to _expr_.
* .include _file_ - Include the contents of _file_.

## Address Modes

The following address modes are available and correspond directly to
the address modes supported by the Q2.

* `x` - Page relative.
* `=x` - Zero page.
* `@x` - Indirect through the current page.
* `@=x` - Indirect through the zero page.

Since the Q2 does not support 12-bit immediates, q2asm supports the following
additional modes. These replace the specified immediate value with an address
at the end of the current page. The immediate values are emitted at
the end of the program or when an `.align` or `.org` directive is used.

* `#x` - Immediate.
* `@#x` - Indirect through immediate.

The immediate modes allow things such as:

```
; Add 523 to A.
  add #523
  
; Jump to "label" in a different page.
  jmp @#label
```

## Instructions

The following eight instructions are supported and correspond directly
to Q2 machine code instructions:

* `lea` - Load effective address (A = X).
* `sta` - Store accumulator ([X] = A).
* `jfc` - Jump if flag clear (if !F: P = X).
* `jmp` - Jump (P = X).
* `lda` - Load accumulator (A = [X], F set if not zero).
* `nor` - Not-OR (A = A NOR [X], F set if not zero).
* `add` - Add (A = A + [X], F set on carry).
* `shr` - Shift right (A = A >> 1, F set on carry).

## Pseudo-Instructions

The following pseudo-instructions are supported:

* `jal` - Jump and link (`lea $+2` followed by `jmp x`).
* `jfs` - Jump flag set (`jfc $+2` followed by `jmp x`).
* `shl` - Shift left (`lda x` followed by `add x`).
