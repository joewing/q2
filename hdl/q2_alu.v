
module q2_alu(
  input wire a0,
  input wire x0,
  input wire x1,
  input wire f,
  input wire o0,
  input wire o1,
  output wire alu_out,
  output wire alu_cout
);

  wire alu_nor = ~(a0 | x0);

  wire #0.4 t0 = ~(a0 & x0);
  wire #0.4 t1 = ~(t0 & a0);
  wire #0.4 t2 = ~(t0 & x0);
  wire #0.7 t3 = ~(t1 & t2);

  wire #0.7 t4 = ~(t3 & f);
  wire #0.4 t6 = ~(t3 & t4);
  wire #0.4 t7 = ~(f & t4);
  wire #0.4 alu_sum = ~(t6 & t7);

  wire #0.4 alu_carry = ~(t4 & t0);

  assign #0.4 alu_out = (
      (x0 & ~o0 & ~o1)
    | (alu_nor & o0 & ~o1)
    | (alu_sum & ~o0 & o1)
    | (x1 & o0 & o1)
  );

  assign #0.4 alu_cout = (
      (~alu_out & f & ~o1)
    | (alu_carry & ~o0 & o1)
    | (f & o0 & o1)
  );

endmodule
