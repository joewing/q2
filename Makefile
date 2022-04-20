
# Installation directory.
BINDIR=/usr/local/bin

ASM = ./q2asm/target/debug/q2asm
Q2LC = ./q2lc/target/debug/q2lc
PROG = ./q2prog/target/debug/q2prog

all:
	@echo "Targets:"
	@echo "   install          Install executables to $(BINDIR)"
	@echo "   uninstall        Remove executables from $(BINDIR)"
	@echo "   clean            Remove build artifacts"
	@echo "   sim-<example>    Build and simulate <example>"
	@echo "   prog-<example>   Program <example>"
	@echo "   verify-<example> Verfiy <example>"
	@echo "   reset            Reset device"

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

prog-%: $(PROG) examples/%.q2p
	$(PROG) write -f examples/$*.q2p

verify-%: $(PROG) examples/%.q2p
	$(PROG) verify -f examples/$*.q2p

reset: $(PROG)
	$(PROG) reset

$(ASM): q2asm/src/*.rs
	(cd q2asm && cargo build)

$(PROG): q2prog/src/*.rs
	(cd q2prog && cargo build)

$(Q2LC): q2lc/src/*.rs
	(cd q2lc && cargo build)

install: $(ASM) $(Q2LC) $(PROG) $(Q2MAKE)
	cp $(ASM) $(BINDIR)
	cp $(Q2LC) $(BINDIR)
	cp $(PROG) $(BINDIR)
	cp $(Q2MAKE) $(BINDIR)

uninstall:
	rm -f $(BINDIR)/q2asm
	rm -f $(BINDIR)/q2lc
	rm -f $(BINDIR)/q2prog
	rm -f $(BINDIR)/q2make

clean:
	rm -f examples/*.lst examples/*.hex examples/*.q2p
	rm -f hdl/test.hex
	(cd hdl && $(MAKE) clean)
	(cd q2asm && cargo clean)
	(cd q2prog && cargo clean)
