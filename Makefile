
ASM = ./q2asm/target/debug/q2asm
PROG = minipro
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

examples/%.lst: examples/%.q2
	$(ASM) $<

examples/%.hex: examples/%.q2
	$(ASM) $<

examples/%.low.hex: examples/%.q2
	$(ASM) $<

examples/%.high.hex: examples/%.q2
	$(ASM) $<

prog-low-%: examples/%.low.hex
	$(PROG) -p $(DEVICE) -w $<

prog-high-%: examples/%.high.hex
	$(PROG) -p $(DEVICE) -w $<

clean:
	rm -f examples/*.raw examples/*.lst examples/*.hex
	rm -f hdl/test.hdl
	(cd hdl && $(MAKE) clean)
