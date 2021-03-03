
ASM = ./q2asm/target/debug/q2asm
PROG1 = minipro
PROG2 = ./q2prog/target/debug/q2prog
DEVICE = AT28C256

all:
	@echo "Targets:"
	@echo "   clean"
	@echo "   sim-<example>       Build and simulate <example>"
	@echo "   prog-low-<example>  Program low byte ROM"
	@echo "   prog-high-<example> Program high byte ROM"

sim-%: examples/%.hex
	cp $< hdl/test.hex
	(cd hdl && $(MAKE) sim)

examples/%.lst: examples/*.q2
	$(ASM) examples/$*.q2

examples/%.hex: examples/*.q2
	$(ASM) examples/$*.q2

examples/%.q2p: examples/*.q2
	$(ASM) examples/$*.q2

examples/%.low.hex: examples/*.q2
	$(ASM) examples/$*.q2

examples/%.high.hex: examples/*.q2
	$(ASM) examples/$*.q2

prog-low-%: examples/%.low.hex
	$(PROG1) -p $(DEVICE) -w examples/$*.low.hex

prog-high-%: examples/%.high.hex
	$(PROG1) -p $(DEVICE) -w examples/$*.high.hex

prog-%: examples/%.q2p
	$(PROG2) write -f examples/$*.q2p

clean:
	rm -f examples/*.raw examples/*.lst examples/*.hex
	rm -f hdl/test.hdl
	(cd hdl && $(MAKE) clean)
