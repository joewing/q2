
# Q2

A 12-bit discrete transistor computer.

## Frontpanel

The frontpanel provides the main interface to the computer.

  - 12 Address LEDs
  - 12 Data LEDs
  - 12 Toggle switches
  - Buttons:
    - Reset/Set Address
    - Increment Address
    - Deposit
    - Start
    - Stop

## Boards

The computer is comprised of several PCBs that plug into
the backplane.

  Name      | Quantity  | Qs Each | Description
  --------- | --------- | ------- | -----------------------
  Slice     | 12        | 82      | 1-bit A/P/X/S slice
  Clock     | 1         | 17      | Clock generator
  ALU       | 1         | 41      | Bit-serial ALU
  Control   | 1         | 53      | Control signal decoder
  RAM       | 1         | 2       | 12-bit RAM
  I/O       | 1         |         | I/O interface
  Backplane | 1         | 25      | Backplane

Total transistor count: ~1122

The tops of the boards face right, with slice boards ordered
from bit 11 at the left side to bit 0 on the right.

### Control Board

The control board drives the control lines.

### Slice Board

Each slice board has 4 positive edge-triggerd flip-flops: A, X, P, and S.
Note that 12 bits are needed for state, which is divided among the slices.

### ALU Board

The ALU is bit-serial, supporting the following operations:

  - 00 - Load
  - 01 - NOR
  - 10 - Add
  - 11 - Shift right

### Clock Board

A two phase, non-overlapping clock is generated using
a relaxation oscillator (CLK signal) tied to a positive
edge-triggered flip-flop.  Two NOR gates are used to
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

All instructions are 1 word with the following format:

  FFF LDZ XXXXXX

where FFF is the opcode, L is the load flag,
D is the dereference flag, Z is the zero-page flag,
and XXXXXX is the operand.

Instruction summary:

  Opcode  | Name  | F | Description
  ------- | ----- | - | ----------------
  000     | lda x | Z | A = X
  001     | nor x | Z | A = ~(A | X)
  010     | add x | C | A = A + X
  011     | shr x | C | A = X >> 1
  100     | sta x | - | [X] = A
  101     | hlt x | - | Halt
  110     | jmp x | - | Jump
  111     | jnf x | - | Jump if not F

The flag is set if carry ('C'), zero ('Z'), or left unchanged ('-').

The following address modes are supported:

  Value | LDZ | Meaning
  ----- | --- | --------------------------------
  #x    | 001 | immediate (zero-page address)
  #@x   | 000 | immediate address
  x     | 100 | current-page relative
  @x    | 110 | indirect through current page
  =x    | 101 | zero-page relative
  @=x   | 111 | indirect through zero page
  x     | 010 | alternate encoding for current-page relative
  =x    | 011 | alternate encoding for zero-page relative

Note that store/jump instructions do not set 'L'. This means that
specifying "#@x" and "x" is equivalent for a store instruction.

## Examples

```
; Negate: A = -A
  nor   #0
  add   #1
```

```
; Subtract: A - v
  nor   #0
  add   v     ; A = v - A - 1
  nor   #0    ; A = A - v
```

```
; Decrement A
  nor   #0
  add   #1
  nor   #0
```

```
; NOT: A = ~A
  nor   #0
```

```
; OR: A = A | v
  nor   v
  nor   #0
```

```
; AND: A = A & v
  nor   #0
  sta   =t0   ; t0 = ~A
  lda   v
  nor   #0    ; A = ~v
  nor   =t0   ; A = ~(~A | ~v) = A & v
```

```
; Function call:
  lda   #$+2   ; A = return address
  jmp   func

;...
func:
  sta   =ra   ; Save return address
  ; ...
  jmp   @=ra  ; Return

```

```
; Rotate right function
; x0 >>> 1
ror:
  sta   =ra       ; save return address
  shr   =x0       ; A = x0 >> 1
  jnf   @=ra      ; return if no carry
  add   rortopbit
  jmp   @=ra
rortopbit:
  .dw   0x800
```

```
; Multiply x2 = x0 * x1
; Destroys x0, x1, and x2
; 18 words
mult:
  sta   =ra
  lda   #0
  sta   =x2
multLoop:
  lda   =x0
  jnf   multCont
  jmp  @=ra     ; done when x0 is 0
multCont:
  nor   multn2  ; zero if bit 1 is set
  jnf   multNext
  lda   =x1   ; bit is set, x2 += x1
  add   =x2
  sta   =x2
multNext:
  shr   =x0   ; x0 >>= 1
  sta   =x0
  lda   =x1   ; x1 <<= 1
  add   =x1
  sta   =x1
  jmp   multLoop
multn2:
  .dw   -2
```

```
; Push x0 on to the stack
; 8 words
push:
  sta   =ra
  lda   #0
  nor   #0
  add   =sp
  sta   =sp
  lda   =x0
  sta   @=sp
  jmp   @=ra
```

```
; Pop x0 off the stack
; 7 words
pop:
  sta   =ra
  lda   @=sp
  sta   =x0
  lda   =sp
  add   #1
  sta   =sp
  jmp   @=ra
```

### Zero-Page Layout

The zero page is the first 64 words, which can be accessed directly by
any instruction from anywhere.
Here is a possible layout:

  Addr  | Name  | Description
  ----- | ----- | ------------------------------
  0000  | -     | Jump to the entry point (jmp @=init)
  0001  | =init | Address of the entry point
  0002  | =t0   | Temporary 0
  0003  | =t1   | Temporary 1
  0004  | =t2   | Temporary 2
  0005  | =t3   | Temporary 3
  0006  | =sp   | Stack pointer
  0007  | =ra   | Return address for function calls
  0010  | =x0   | Argument 0 for function calls
  0011  | =x1   | Argument 1 for function calls
  0012  | =x2   | Argument 2 for function calls
  0013  | =x3   | Argument 3 for function calls
  0014  | =x4   | Argument 4 for function calls
  0015  | =x5   | Argument 5 for function calls
  0016  | =x6   | Argument 6 for function calls
  0017  | =x7   | Argument 7 for function calls
  0020  | =push | Pointer to push
  0021  | =pop  | Pointer to pop


