
# Q2

A 16-bit discrete transistor computer inspired by 1960s minicomputers.

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

The computer is comprised of several PCBs. Other than the backplane,
all PCBs have 2x 20 pin male headers to plug into a 2-row, 40-pin
headers on the backplane.

  Name        | Quantity  | Description
  ----------- | --------- | ----------------
  Slice       | 12        | A/P/X/S slice
  RAM         | 1         | 16-bit RAM module
  Control     | 1         | Control module
  Clock       | 1         | Clock generator
  Backplane   | 1         | Backplane

The tops of the boards face right, with slice boards ordered
from bit 15 at the left side to bit 0 on the right.
Pins are arranged such that pin 1 for a slice board goes in the
upper left side.  Pins 1-20 are on the bottom side and pins 21-40
are on the top.  Pins are numbered counter-clockwise.

### Backplane Layout

  | | | | | | | | | | | | | | | |
  S S S S S S S S S S S S S S S S
  F E D C B A 9 8 7 6 5 4 3 2 1 0
  | | | | | | | | | | | | | | | |
    --- CLK ---     --- CTL ---
    --- RAM ---     --- RAM ---
    --- RAM ---     --- RAM ---

### Clock Board

  Pin | Name          | Description
  --- | ------------- | -------------
  1   | VCC           | +5v
  2   | FAST_IN       | To fast clock switch
  3   | FAST_OUT      | To fast clock switch
  4   | ~START_SW_IN  | Start switch
  5   | ~STOP_SW_IN   | Stop switch
  6   | RST_IN        | Reset switch
  7   | HALT_IN       | Halt signal from control board
  8   | ~DEP_SW_IN    | Deposit switch
  9   | ~INCP_SW_IN   | Increment P switch
  10  | ~RAM_CE_IO    | RAM CE bus (RAM enable)
  11  | ~RAM_WE_IO    | RAM WE bus (RAM write)
  12  | ~WRN_IO       | WRN bus (write next P)
  13  | ~WRP_IO       | WRP bus (load P from N)
  14  | WRN_OUT       | WRN signal to slice boards
  15  | WRP_OUT       | WRP signal to slice boards
  16  | RDSW_OUT      | Read switch signal to slice boards
  17  | N/C           | No connection
  18  | CLK1_OUT      | Clock phase 1
  19  | CLK2_OUT      | Clock phase 2
  20  | GND           | Ground

Note that pins 21-40 mirror 1-20.

### Control Board

  Pin | Name          | Description
  --- | ------------- | ---------------
  1   | VCC           | +5v
  2   | RDP_OUT       | Read P to ABUS
  3   | RDX_OUT       | Read X to ABUS
  4   | XHIN_ABUS_OUT | XH input from ABUS
  5   | XHIN_DBUS_OUT | XH input from DBUS
  6   | WRX_OUT       | Write X
  7   | WRA_OUT       | Write A
  8   | RDA_OUT       | Read A to DBUS
  9   | PIN_NEXT_OUT  | P input from N
  10  | PIN_X_OUT     | P input from X
  11  | ~WRN_IO       | WRN bus (write next P)
  12  | N/C           |
  13  | N/C           |
  14  | HALT_OUT      | Halt signal to clock board
  15  | N/C           |
  16  | N/C           |
  17  | CLK1_IN       | Clock phase 1
  18  | CLK2_IN       | Clock phase 2
  19  | RST_IN        | Reset
  20  | GND           | Ground
  21  | GND           | Ground
  22  | SHR_OUT       | ALU Shift right
  23  | SUB_OUT       | ALU Subtract
  24  | ADD_OUT       | ALU Add
  25  | XOR_OUT       | ALU Exclusive OR
  26  | OR_OUT        | ALU OR
  27  | AND_OUT       | ALU AND
  28  | NOT_OUT       | ALU NOT
  29  | LD_OUT        | ALU Load
  30  | FIN           | Flag input
  31  | ~RAM_WE_IO    | RAM write enable bus
  32  | ~RAM_OE_IO    | RAM output enable bus
  33  | DBUS9_IN      | Data bus bit 9 (ZP)
  34  | DBUS10_IN     | Data bus bit 10 (DEREF)
  35  | DBUS11_IN     | Data bus bit 11 (LOAD)
  36  | DBUS12_IN     | Data bus bit 12 (F0)
  37  | DBUS13_IN     | Data bus bit 13 (F1)
  38  | DBUS14_IN     | Data bus bit 14 (F2)
  39  | DBUS15_IN     | Data bus bit 15 (T)
  40  | VCC           | +5v

### Slice Board

  Pin | Name          | Description
  --- | ------------- | ---------------
  1   | VCC           | +5v
  2   | Xn            | Next X, for SHR
  3   | FOUT          | Flag out
  4   | PCOUT         | P carry output
  5   | PIN_X         | Set P input to X
  6   | PIN_NEXT      | Set P input to P+1
  7   | WRN           | Write N (next P)
  8   | WRP           | Write P from N
  9   | RDP_ABUS      | Read P to ABUS
  10  | XIN_ABUS      | Set X input to ABUS
  11  | XIN_DBUS      | Set X input to DBUS
  12  | RDX_ABUS      | Read X to ABUS
  13  | RDX_DBUS      | Read X to DBUS
  14  | WRX           | Write X
  15  | ~SW           | Switch input
  16  | DEP           | Deposit input (DBUS = SW)
  17  | CLK2          | Clock phase 2
  18  | ABUS          | Address bus
  19  | DBUS          | Data bus
  20  | GND           | Ground
  21  | GND           | Ground
  22  | DBUS          | Data bus
  23  | ABUS          | Address bus
  24  | CLK2          | Clock phase 2
  25  | N/C           |
  26  | WRA           | Write A
  27  | RDA_DBUS      | Read A to DBUS
  28  | SHR           | ALU shift right
  29  | SUB           | ALU subtract
  30  | ADD           | ALU add
  31  | XOR           | ALU XOR
  32  | OR            | ALU OR
  33  | AND           | ALU AND
  34  | NOT           | ALU NOT
  35  | LD            | ALU load
  36  | RST           | Reset
  37  | PCIN          | P carry input
  38  | FIN           | Flag in
  39  | X             | X output
  40  | VCC           | +5v
  

## Clock generation

A two phase, non-overlapping clock is generated using
a relaxation oscillator (CLK signal) tied to a master-slave
flip-flop.  Two NOR gates are used to generate the phases.
The output of the flip-flop is Q:

  CLK1 = ~(Q | CLK)
  CLK2 = ~(~Q | CLK)

When not running, CLK is high. At reset Q is set to 0.
This means that on reset we have CLK=1 and Q=0. Thus,
the starting sequence looks like this:

  RUN | RST | CLK | Q | C1 | C2 | Notes
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
  A     | 16    | Accumulator
  P     | 16    | Program counter
  X     | 16    | Operand
  O     | 6     | Opcode Latch (don't need to store Z)
  F     | 1     | Flag
  S     | 2     | State

## Instructions

Instructions are 1 word with the following format:

  15    | 14 - 12   | 11    | 10          | 9         | 8 - 0
  ----- | --------- | ----- | ----------- | --------- | -------
  Type  | Function  | Load  | Dereference | Zero page | Operand

All instructions have the same format.  The low bits of X are loaded
from the operand. If the zero page bit is set, the upper bits of X
are set to 0, otherwise the upper bits of X are set to the upper bits
of P.  If the load bit is set, X is loaded from memory ([X]). If the
derefence bit is set, X is loaded again from memory ([X]).
Note that setting either one of load or derefence does not matter,
but they can be combined for indirect addressing.
Setting neither load nor derefence and setting the zero page bit
allows an immediate value to be used for loads. Note that there
is no sign extension.

Instruction summary:

  Opcode  | Mnemonic  | F | Description
  ------- | --------- | - | ---------------------
  0000    | ld x      | Z | Load: A = x
  0001    | not x     | Z | NOT: A = ~x
  0010    | and x     | Z | AND: A = A & x
  0011    | or x      | Z | OR: A = A | x
  0100    | xor x     | Z | XOR: A = A ^ x
  0101    | add x     | C | Add: A = A + x
  0110    | sub x     | C | Subtract: A = A - x
  0111    | shr x     | C | Shift right: A = x >> 1
  1000    | nop x     | - | No operation
  1001    | st x      | - | Store A: [x] = A
  1010    | jnf x     | - | Jump if zero/no carry (F not set)
  1011    | jf x      | - | Jump if not-zero/carry (F set)
  1100    | j x       | - | Jump: P = x
  1101    | unused    | - | Unused
  1110    | unused    | - | Unused
  1111    | halt x    | - | Wait for x

The flag is set if carry ('C'), non-zero ('Z'), or left unchanged ('-').

Address modes are indicated as follows:

  Value | LDZ | Meaning
  ----- | --- | --------------------------------
  #x    | 001 | immediate (zero-page address)
  #@x   | 000 | relative address
  x     | 100 | current-page relative
  @x    | 110 | indirect through current page
  =x    | 101 | zero-page relative
  @=x   | 111 | indirect through zero page
        | 010 | alternate encoding for current-page relative
        | 011 | alternate encoding for zero-page relative

Note that store instructions do not set 'L'. This means that
specifying "#@x" and "x" is equivalent for a store instruction.

## Control Lines

  - RDP_ABUS = STATE_FETCH
  - RDX_ABUS = STATE_LOAD | STATE_DEFER | STATE_EXEC
  - WRO_DBUS = STATE_FETCH & WS
  - XHIN_ABUS = STATE_FETCH & DBUS[ZBIT]
  - XLIN_ABUS = 0
  - XHIN_DBUS = STATE_LOAD | STATE_DEREF
  - XLIN_DBUS = 1
  - WRX = (STATE_FETCH & WS)
        | (STATE_LOAD & WS & OP[LOAD_BIT])
        | (STATE_DEREF & WS & OP[DEREF_BIT])
  - WRA = WRF = STATE_EXEC & TYPE0 & WS
  - RDA_DBUS = STATE_EXEC & TYPE1 & FUNC1
  - PIN_NEXT = STATE_FETCH
  - PIN_X = STATE_EXEC
  - RDM_DBUS = ~STATE_EXEC
  - WRP = (STATE_FETCH & WS) | JUMP
        | (STATE_EXEC & TYPE1 & WS & FUNC4)
        | (STATE_EXEC & TYPE1 & WS & FUNC3 & F)
        | (STATE_EXEC & TYPE1 & WS & FUNC2 & ~F)
  - WRM_DBUS = STATE_EXEC & TYPE1 & WS & (FUNC1 | FUNC6)
  - HALT = STATE_EXEC & TYPE1 & FUNC7 & WS

## States

  - FETCH  - Fetch instruction
    - RDP_ABUS
    - RDM_DBUS
    - WRO_DBUS
    - XHIN_ABUS = DBUSL[Z_BIT]
    - XLIN_DBUS
    - WRX
    - PIN_NEXT
    - WRP
  - LOAD    - Load memory
    - RDX_ABUS
    - RDM_DBUS
    - XHIN_DBUS
    - XLIN_DBUS
    - WRX = O[LBIT]
  - DEREF   - Dereference
    - RDX_ABUS
    - RDM_DBUS
    - XHIN_DBUS
    - XLIN_DBUS
    - WRX = O[DBIT]
  - EXEC    - Execute
    - RDX_ABUS

## Examples

; Call a function
  ld    #+2   ; return pointer in A
  j     func
  ; function returns here

; Return to caller, return pointer in A
func:
  st    =ra
  ; do some stuff
  j     @=ra

; push =x onto the stack
; Return address in A.
; Assumes =x, =ra, and =sp are in the zero page.
; 7 words
push:
  st    =ra   ; save return address
  ld    =x    ; load value to save
  st    @=sp  ; save to the stack
  ld    =sp   ; load stack pointer
  sub   #1    ; decrement
  st    =sp   ; save updated stack pointer
  j     @=ra  ; return

; pop A off the stack
; Assumes =ra and =sp are in the zero page.
; 6 words
pop:
  st    =ra   ; save return address
  ld    =sp   ; load current stack pointer
  add   #1    ; increment
  st    =sp   ; save updated stack pointer
  ld    @=sp  ; load top of the stack
  j     @=ra  ; return

; Set =n bytes at =ptr to =x
; Destroys =n and =ptr
; Assumes A is the return address
; 11 words
memset:
  st    =ra   ; save return address
memset_loop:
  ld    =n    ; load current count
  jnf   @=ra  ; return if zero
  sub   #1    ; decrement
  st    =n    ; save updated count
  ld    =x    ; load value to save
  st    @=ptr ; save it
  ld    =ptr  ; increment pointer
  add   #1
  st    =ptr
  j     memset_loop

; Copy =src to =dest
; 11 words
strcpy:
  st    =ra
strcpy_loop:
  ld    @=src
  st    @=dest
  jnf   @=ra
  ld    =src
  add   #1
  st    =src
  ld    =dest
  add   #1
  st    =dest
  j     strcpy_loop

; Shift =x right =n bits
unsignedShiftRight:
  st    =ra
unsignedShiftRightLoop:
  ld    =n
  jnf   @=ra
  sub   #1
  st    =n
  shr   =x
  st    =x
  j     unsignedShiftRightLoop


; Add two 32 bit numbers, at =x and =y, result in =x (little-endian)
add32:
  st    =ra
  ld    =x
  add   =y
  st    =x
  jf    add32_carry
  ld    =x+1
  j     add32_cont
add32_carry:
  ld    =x+1
  add   #1
add32_cont:
  add   =y+1
  st    =x+1
  j     @=ra


