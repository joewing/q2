
PLD = state opcode slicehigh slicelow io clock
GEN_V = $(foreach f,${PLD},$f.v)
GEN_JED = $(foreach f,${PLD},$f.jed)
DEVICE = ATF16V8CZ

all: a.out ${GEN_JED}

.SUFFIXES: .v .pld

%.v: %.pld
	python3 pld2v.py $<

%.jed: %.pld
	galasm $<

a.out: $(GEN_V) board.v tb.v rom.v ram.v lcd.v buttons.v ttl245.v
	iverilog tb.v

sim: a.out
	echo finish | ./a.out

prog-%: %.jed
	minipro -p "$(DEVICE)" -w $<

clean:
	rm -f a.out $(GEN_V) *.jed *.pin *.fus *.chp dump.vcd

