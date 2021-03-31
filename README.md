
# Q2

A 12-bit discrete transistor computer.

This repo contains the following subdirectories:
  - hdl - A Verilog model and test bench for simulating Q2 programs.
  - scad - An OpenSCAD 3d model for the case.
  - q2asm - A Q2 assembler (in Rust).
  - q2prog - A Q2 programmer (in Rust) for a Raspberry Pi.
  - examples - Q2 assembly language examples.
  - pcb - Schematics and PCB in KiCad

## Frontpanel

The frontpanel provides the main interface to the computer.

  - 12 address LEDs
  - 12 data LEDs
  - 12 toggle switches for input
  - Buttons:
    - Reset/Set Address
    - Increment Address
    - Deposit
    - Start
    - Stop

## Programmer Interface

A 40-pin connector provides an interface to the front-panel switches,
deposit switch, reset switch, and data output. The pinout is designed
to align with the GPIO pins of a Raspberry Pi so that the Pi can be
used to both program and backup the Q2.

The pins are configured such that the original Raspberry Pi with a
26-pin connector can be used for programming the Q2 (though it will
not be able to read from the Q2).

## Power Estimation

Each LED is driven through a 4.7k resistor. Assuming a 5v power
supply and 2v voltage drop through an LED, we can assume ~0.64mA
for each 4.7k resistor.  Each gate uses a 10k, 1k, or a 100k resistor
pull-up (depending on fanout and required speed), so we assume 0.5mA
for each 10k resistor, 5mA for each 1k resistor, and 0.05mA for each
100k resistor.  This provides an absolute worst case estimate since we
don't expect all gates and LEDs to be active.
We assume the RAM chips and the LCD use ~20mA each.

This gives the following:
  - 71 4.7k resistors x 0.64 = 45mA
  - 376 10k resistors x 0.5 = 188mA
  - 19 100k resistors x 0.05 = 1mA
  - 17 1k resistors x 5 = 85mA
  - 2 RAMs, 1 LCD = 60mA

So we get a worst-case draw of ~379mA or ~1.9 Watts.

## Sections

### Slice

The registers are divided into 12 slices each consisting of
4 flip-flops. Each slice contains one bit of the A register
(accumulator), one bit of X register (operand), one bit of
the P register (program counter), and one bit of the state
register. Note that only 10 bits are used for state:
one for the flag register, four for the state machine,
one for the clock divider, and four for the opcode. We don't
need to save the zero-page bit because it is only used during
the fetch state.

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
  O     | 4     | Opcode
  F     | 1     | Flag
  S     | 4     | State
  C     | 1     | Clock divider

## Instructions

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

## Zero-Page Layout

The zero page is the first 128 words, which can be accessed directly by
any instruction from anywhere.
Here is a possible layout:

  Addr  | Name  | Description
  ----- | ----- | ------------------------------
  000   |       | jmp @$+1 (jump to entry point)
  001   | =init | Entry point 
  002   | =x0   | Temporary
  003   | =x1   | Temporary
  004   | =x2   | Temporary
  005   | =x3   | Temporary
  006   | =x4   | Temporary
  007   | =x5   | Temporary
  008   | =x6   | Temporary
  009   | =x7   | Tempoarary
  00A   | =x8   | Tempoarary
  00B   | =x9   | Tempoarary
  00C   | =x10  | Tempoarary
  00D   | =x11  | Tempoarary
  00E   | =x12  | Tempoarary
  00F   | =x13  | Tempoarary
  010   | =x14  | Tempoarary
  011   | =x15  | Tempoarary
  012   | =zero | 0
  013   | =one  | 1
  014   | =two  | 2
  015   | =neg1 | -1

