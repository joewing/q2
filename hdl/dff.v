module dff(
  input wire clk,
  input wire d,
  input wire set,
  input wire clr,
  output wire q
);

  wire a0 = ~t3 | set;
  wire a1 = ~t2 | clr;
  wire #0.1 t0 = ~t1 | a0;
  wire #0.1 t1 = ~(clk & t0) | clr;
  wire #0.1 t2 = ~(clk & t1) | a0;
  wire #0.1 t3 = ~d | a1;

  assign #0.1 q = ~(t1 & nq) | set;
  wire #0.1 nq = ~q | a1;

endmodule
