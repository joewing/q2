
ASM = ./q2asm/target/debug/q2asm
Q2LC = ./q2lc/target/debug/q2lc
PROGOLD = minipro
PROG = ./q2prog/target/debug/q2prog
#DEVICE = AT28C256
DEVICE = AT28C64B

all:
	@echo "Targets:"
	@echo "   clean"
	@echo "   sim-<example>   Build and simulate <example>"
	@echo "   prog-<example>  Program <example>"

sim-%: examples/%.hex
	cp $< hdl/test.hex
	(cd hdl && $(MAKE) sim)

examples/%.lst: $(ASM) examples/%.q2
	$(ASM) examples/$*.q2

examples/%.hex: $(ASM) examples/%.q2
	$(ASM) examples/$*.q2

examples/%.q2p: $(ASM) examples/%.q2
	$(ASM) examples/$*.q2

examples/%.low.hex: $(ASM) examples/%.q2
	$(ASM) examples/$*.q2

examples/%.high.hex: $(ASM) examples/%.q2
	$(ASM) examples/$*.q2

examples/%.q2: $(Q2LC) examples/%.q2l
	$(Q2LC) examples/$*.q2l

prog-low-%: examples/%.low.hex
	$(PROGOLD) -p $(DEVICE) -w examples/$*.low.hex

prog-high-%: examples/%.high.hex
	$(PROGOLD) -p $(DEVICE) -w examples/$*.high.hex

prog-%: $(PROG) examples/%.q2p
	$(PROG) write -f examples/$*.q2p

verify-%: $(PROG) examples/%.q2p
	$(PROG) verify -f examples/$*.q2p

$(ASM): q2asm/src/*.rs
	(cd q2asm && cargo build)

$(PROG): q2prog/src/*.rs
	(cd q2prog && cargo build)

$(Q2LC): q2lc/src/*.rs
	(cd q2lc && cargo build)

clean:
	rm -f examples/*.lst examples/*.hex examples/*.q2p
	rm -f hdl/test.hex
	(cd hdl && $(MAKE) clean)
	(cd q2asm && cargo clean)
	(cd q2prog && cargo clean)
