
module dff(
  input wire clk,
  input wire d,
  input wire set,
  input wire clr,
  output wire q,
  output wire nq
);

  wire t1, t2, t3, t4, t5, t6, t7, t8, t9;

  nfet q1(t2, t3, t4);
  nfet q2(set, t1, t2);

  nfet q3(t5, clk, t3);
  nfet q4(clr, t4, t5);

  nfet q5(t6, clk, t7);
  nfet q6(t2, t3, t6);

  nfet q7(t8, d, t1);
  nfet q8(clr, t7, t8);

  nfet q9(t9, t3, q);
  nfet q10(set, nq, t9);

  nfet q11(t8, q, nq);

endmodule
