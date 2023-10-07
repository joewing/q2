
module dff #(
  parameter FANOUT_Q  = 3,
  parameter FANOUT_NQ = 3
)(
  input wire clk,
  input wire d,
  input wire set,
  input wire clr,
  output wire q,
  output wire nq
);

  wire t1, t2, t3, t4, t5, t6, t7, t8, t9;

  // 4x 26k
  nfet #(1, 10000) q2(set, t1, t2);
  nfet #(1, 10000) q1(t2, t3, t4);

  // 3x 19k
  nfet #(3, 10000) q4(clr, t4, t5);
  nfet #(3, 10000) q3(t5, clk, t3);

  // 10x 70k
  nfet #(1, 22000) q6(t2, t3, t6);
  nfet #(1, 22000) q5(t6, clk, t7);

  // 1x 6k
  nfet #(1, 10000) q8(clr, t7, t8);
  nfet #(1, 10000) q7(t8, d, t1);

  // 1.5x 9k
  nfet #(FANOUT_Q + 1, 6800) q9(t9, t3, q);
  nfet #(FANOUT_Q + 1, 6800) q10(set, nq, t9);

  // LED with 2v drop.
  nfet #(FANOUT_NQ + 1, 1000, 3.0) q11(t8, q, nq);

endmodule
