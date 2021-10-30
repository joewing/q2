
# Q2

A single-board 12-bit discrete transistor computer.

This repo contains the following subdirectories:
  - hdl - A Verilog model and test bench for simulating Q2 programs.
  - scad - An OpenSCAD 3d model for the case.
  - q2asm - A Q2 assembler (in Rust).
  - q2lc - A compiler for a simple language (in Rust).
  - q2prog - A Q2 programmer (in Rust) for a Raspberry Pi.
  - examples - Q2 assembly language examples.
  - pcb - Schematics and PCB in KiCad

See [joewing.net/projects/q2](https://joewing.net/projects/q2) for
more information.

## Requirements

### For software development:

 * Rust - q2lc, q2asm, and q2prog are written in Rust.
  Install instructions are available
  [here](https://www.rust-lang.org/tools/install).
  Note that rustup will also install cargo, which is required.

### For programming:

 * Raspberry Pi - The GPIO pins on a
  [Raspberry Pi](https://www.raspberrypi.org) are used to
  program the Q2. The exact model does not matter, though older
  Pis with only 26 GPIO pins will not be able to read programs
  back from the Q2. If desired, a Raspberry Pi can be used as
  a complete development environment for the Q2.

### For simulation:

 * iverilog - [Icarus Verilog](http://iverilog.icarus.com) can be
  used to run the Verilog model.

### To make the hardware:

 * OpenSCAD - The 3D model for the case is written in
  [OpenSCAD](http://www.openscad.org). To print the case you
  will also need a 3D printer and the necessary slicer program.
 * KiCad - The PCB and schematics are in
  [KiCad](https://kicad.org).

## q2lc

q2lc is a compiler for Q2 programs. It is built using 'cargo build'
in the q2lc directory.

The Makefile will take care of compiling and assembling Q2L
programs in the examples directory automatically:

```
make examples/sieve.lst
```

This will compile sieve.q2l into sieve.q2 and then assemble
sieve.q2 using q2asm to generate sieve.lst along with sieve.q2p.

## q2asm

q2asm is the assembler for Q2 programs. It is built using 'cargo build'
in the q2asm directory.

The Makefile will take care of assembling programs in the examples
directory automatically:

```
make examples/hello.lst
```

This will generate the listing file for examples/hello.q2 as
examples/hello.lst.

## q2prog

q2prog is run on a Raspberry Pi to program the Q2.
It is built using 'cargo build' in the q2prog directory.

To program the Q2, connect a 40-pin connector to both the GPIO pins
of the Raspberry Pi and the Q2 (be sure the pins line up correctly).
Make sure all input switches on the Q2 are "off". Some of the data LEDs
will glow, but that is just due to pull-downs on some of the GPIO pins.

To write a program (examples/hello.q2) to the Q2 (this will also build
examples/hello.q2p if necessary):

```
make prog-hello
```

To verify that the program was correctly written:

```
make verify-hello
```

Note that if q2prog is killed, the Raspberry Pi will hold the switches
in some state that is likely not zero. This means you will either
need to disconnect the Raspberry Pi or run q2prog to completion before
using the Q2.

## Simulation

Simulation of Q2 programs can be performed using the Verilog model.
The model reads in "test.hex" and runs the simulation outputting
a simulated 16x2 LCD (characters only) every time it is updated.

For convenience, the Makefile will take care of setting everything
up. Simply place the program to be simulated in the examples
directory and run 'make sim-name'. This will assemble and
simulate 'examples/name.q2'.

## Instruction Set

All instructions are 1 word with the following format

```
  FFF D Z XXXXXXX
   \  \ \    \____ Operand
    \  \ \________ Zero-Page    
     \  \_________ Dereference 
      \___________ Opcode
```

Instruction summary:

  Opcode  | Name  | F | Description
  ------- | ----- | - | ----------------
  000     | LDA   | Z | A = [X]
  001     | NOR   | Z | A = A NOR [X]
  010     | ADD   | C | A = A + [X]
  011     | SHR   | C | A = [X] >> 1
  100     | LEA   | - | A = X
  101     | STA   | - | [X] = A
  110     | JMP   | - | P = X
  111     | JFC   | - | if !F, P = X

The flag is set if carry ('C'), zero ('Z'), or left unchanged ('-').

The following address modes are supported:

  Value | DZ | Meaning
  ----- | --- | --------------------------------
  x     | 00 | current-page relative
  @x    | 10 | indirect through current page
  =x    | 01 | zero-page relative
  @=x   | 11 | indirect through zero page

## Examples

```
; Negate: A = -A
  nor   =zero
  add   =one
```

```
; Subtract: A - v
  nor   =zero
  add   v       ; A = v - A - 1
  nor   =zero   ; A = A - v
```

```
; Decrement A
  add   =neg1
```

```
; NOT: A = ~A
  nor   =zero
```

```
; OR: A = A | v
  nor   v
  nor   =zero
```

```
; AND: A = A & v
  nor   =zero
  sta   =t0   ; t0 = ~A
  lda   v
  nor   =zero ; A = ~v
  nor   =t0   ; A = ~(~A | ~v) = A & v
```

```
; Jump if F set
  jfc   $+2
  jmp   label
```

```
; Jump if a >= b
  lda   a
  nor   =zero
  add   b
  jfc   ge
```

```
; Jump if a != b
  lda   a
  nor   =zero
  add   b
  nor   =zero
  jfc   ne
```

```
; Function call:
  lea   $+2   ; A = return address
  jmp   func

;...
func:
  sta   =ra   ; Save return address
  ; ...
  jmp   @=ra  ; Return

```

```
; Long jump
  jmp   @$+1
  .dw   addr
```

```
; Long call
  lea   $+3
  jmp   @$+1
  .dw   addr
```

```
; Rotate right function
; x0 >>> 1
ror:
  sta   =ra       ; save return address
  shr   =x0       ; A = x0 >> 1
  jfc   @=ra      ; return if no carry
  add   rortopbit
  jmp   @=ra
rortopbit:
  .dw   0x800
```

```
; Push A on to the stack
  sta   @=sp
  lda   =sp
  add   =neg1
  sta   =sp
```

```
; Pop A off the stack
  lea   =1
  add   =sp
  sta   =sp
  lda   @=sp
```

## Memory Map

The address space is 4096 12-bit words.

  Address   | Description
  --------- | --------------
  000 - FFE | RAM
  FFF       | I/O

