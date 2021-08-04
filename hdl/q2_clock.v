
module q2_clock(
input wire clk,

  input wire nstart,
  input wire nstop,
  input wire cdiv,
  input wire ncdiv,
  output wire sc,
  output wire ws
);

  nfet q1(1'b0, clk, sc);
  nfet q2(1'b0, ncdiv, sc);

  nfet q3(1'b0, clk, ws);
  nfet q4(1'b0, cdiv, ws);

endmodule
