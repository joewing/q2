
# Q2

A 12-bit discrete transistor computer.

This repo contains the following subdirectories:
  - hdl - A Verilog model of the computer and test bench
    for simulating Q2 programs.
  - scad - An OpenSCAD 3d model for the case.
  - q2asm - A Q2 assembler (in Rust).
  - examples - Q2 assembly language examples.
  - pcb - Schematics and PCBs in KiCad
    - slice - Register bit slice
    - clock - Clock generator
    - alu - ALU 
    - control - Control signal driver
    - ram - RAM board
    - backplane - Backplane board
    - io - Input/Output board (optional)
    - terminal - Terminal board (optional)

## Frontpanel

The frontpanel provides the main interface to the computer.

  - 12 address LEDs
  - 12 data LEDs
  - 12 toggle switches for input
  - 1 toggle switch for clock speed
  - 1 power switch
  - Buttons:
    - Reset/Set Address
    - Increment Address
    - Deposit
    - Start
    - Stop

## Power estimation

Total transistor count: ~1148
Total current draw: 482.5 mA (2.4 Watts)

LEDs are driven through a 1k resistor. Assuming a 5v power
supply and 2v voltage drop through an LED, we can assume ~3mA
for each 1k resistor.  Each gate uses a 10k resistor pull up,
so we assume 0.5mA for each 10k resistor. This provides an
absolute worst case estimate since we don't expect all gates
and LEDs to be on.

We assume each 6116 RAM chip uses ~20mA.
We assume the MCU used on the terminal board uses ~1mA.
We assume the LCD draws ~200mA.
The total combined worst-case current draw is ~683.55mA.

## Sections

### Slice

The registers are divided into 12 slices each consisting of
4 flip-flops. Each slice contains one bit of the A register
(accumulator), one bit of X register (operand), one bit of
the P register (program counter), and one bit of the state
register.

### ALU

The ALU is bit-serial, supporting the following operations:

  - 00 - Load
  - 01 - NOR
  - 10 - Add
  - 11 - Shift right

All writes to the A register happen through the ALU, shifting
into the most significant bit.

### Clock

A two phase, non-overlapping clock is generated using
a relaxation oscillator (CLK signal) tied to a positive
edge-triggered flip-flop. Two NOR gates are used to
generate the phases.
The output of the flip-flop is Q:

```
  WS = ~(Q | CLK)
  SC = ~(~Q | CLK)
```

When not running, CLK is high. At reset Q is set to 0.
This means that on reset we have CLK=1 and Q=0. Thus,
the starting sequence looks like this:

  RUN | RST | CLK | Q | WS | SC | Notes
  --- | --- | --- | - | -- | -- | --------------------------------
   0  |  1  |  1  | 0 |  0 |  0 | Reset button pressed
   0  |  0  |  1  | 0 |  0 |  0 | Reset button released
   1  |  0  |  0  | 0 |  1 |  0 | Run button pressed (and latched)
   1  |  0  |  1  | 1 |  0 |  0 |
   1  |  0  |  0  | 1 |  0 |  1 |
   1  |  0  |  1  | 0 |  0 |  0 |
   1  |  0  |  0  | 0 |  1 |  0 |

## Registers

  Name  | Size  | Description
  ----- | ----- | ----------------
  A     | 12    | Accumulator
  P     | 12    | Program counter
  X     | 12    | Operand
  O     | 6     | Opcode
  F     | 1     | Flag
  S     | 4     | State
  C     | 1     | Clock divider

## Instructions

All instructions are 1 word with the following format

```
  FFF D Z XXXXXXXX
   \  \ \    \____ Operand
    \  \ \________ Zero-Page    
     \  \_________ Dereference 
      \___________ Opcode
```

Instruction summary:

  Opcode  | Name  | F | Description
  ------- | ----- | - | ----------------
  000     | lda x | Z | A = X
  001     | nor x | Z | A = A NOR X
  010     | add x | C | A = A + X
  011     | shr x | C | A = X >> 1
  100     | lea x | - | A = &X
  101     | sta x | - | [X] = A
  110     | jmp x | - | Jump
  111     | jfc x | - | Jump if F clear

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
; Push x0 on to the stack
push:
  sta   =ra
  lda   =sp
  add   =neg1
  sta   =sp
  lda   =x0
  sta   @=sp
  jmp   @=ra
```

```
; Pop x0 off the stack
pop:
  sta   =ra
  lda   @=sp
  sta   =x0
  lda   =sp
  add   =one
  sta   =sp
  jmp   @=ra
```

## Memory Map

The address space is 4096 12-bit words.

  Address   | Description
  --------- | --------------
  000 - 7FF | RAM
  800 - FFE | ROM
  FFF       | I/O

## Zero-Page Layout

The zero page is the first 128 words, which can be accessed directly by
any instruction from anywhere.
Here is a possible layout:

  Addr  | Name  | Description
  ----- | ----- | ------------------------------
  000   | -     | Jump to the entry point (jmp @=init)
  001   | =init | Address of the entry point
  002   | =t0   | Temporary 0
  003   | =t1   | Temporary 1
  004   | =t2   | Temporary 2
  005   | =t3   | Temporary 3
  006   | =sp   | Stack pointer
  007   | =ra   | Return address for function calls
  008   | =x0   | Argument 0 for function calls
  009   | =x1   | Argument 1 for function calls
  00A   | =x2   | Argument 2 for function calls
  00B   | =x3   | Argument 3 for function calls
  00C   | =x4   | Argument 4 for function calls
  00D   | =x5   | Argument 5 for function calls
  00E   | =x6   | Argument 6 for function calls
  00F   | =x7   | Argument 7 for function calls
  010   | =zero | 0
  011   | =one  | 1
  012   | =two  | 2
  013   | =neg1 | -1
  014   | =push | Pointer to push
  015   | =pop  | Pointer to pop

