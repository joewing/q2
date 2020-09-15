
ASM = ./q2asm/target/debug/q2asm

all:
	@echo "Targets:"
	@echo "   clean"
	@echo "   sim-<example>       Build and simulate <example>"

sim-%: examples/%.hex
	cp $< hdl/test.hex
	(cd hdl && $(MAKE) sim)

examples/%.lst: examples/%.q2
	$(ASM) -f lst $<

examples/%.hex: examples/%.q2
	$(ASM) -f hex $<

clean:
	rm -f examples/*.raw examples/*.lst examples/*.hex
	rm -f hdl/test.hdl
	(cd hdl && $(MAKE) clean)
