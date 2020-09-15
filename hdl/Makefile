

all: a.out

a.out: *.v
	iverilog q2_tb.v

sim:	a.out
	echo finish | ./a.out

clean:
	rm -f a.out dump.vcd
