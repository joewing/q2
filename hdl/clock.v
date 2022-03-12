
module clock(
  output wire clk,
  inout wire nstart,
  inout wire nstop,
  input wire cdiv,
  input wire ncdiv,
  output wire sc,
  output wire ws
);

  localparam FAST = 1;

  // RC delay for clock generation.
  localparam OSC_RES      = (10000 + 2200);
  localparam OSC_CAP_NF   = 0.47 + 1000 * (1 - FAST);

  localparam RC_DELAY_US = $ln(2) * (
    OSC_RES * OSC_CAP_NF / 1000.0
  );

  nfet #(2, 4700, 5, 2) q1(1'b0, clk, sc);
  nfet #(2, 4700, 5, 2) q2(1'b0, ncdiv, sc);

  nfet #(2, 4700, 5, 2) q3(1'b0, clk, ws);
  nfet #(2, 4700, 5, 2) q4(1'b0, cdiv, ws);

  wire t1, t2, feedback;
  wire delay_out, delay_in;
  nfet #(1, 10000, 5.0, 1) q5(1'b0, nstop, t1);
  nfet #(1, 10000, 5.0, 1) q6(t1, feedback, delay_in);
  nfet #(1, 10000, 5.0, 2) q7(1'b0, delay_out, t2);
  nfet #(1, 10000, 5.0, 1) q8(1'b0, t2, feedback);

  assign #RC_DELAY_US delay_out = delay_in;

  wire t3, t4;
  nfet #(2, 4700) q10(1'b0, t2, clk);

  nfet #(1, 10000) q11(1'b0, nstart, nstop);
  nfet #(2, 1000, 3.0) q12(1'b0, nstop, nstart);

endmodule
