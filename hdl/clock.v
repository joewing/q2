
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
  localparam DELAY_FAST = 1.0 / 107_000;
  localparam DELAY_SLOW = 1.0 / 100;

  localparam RAW_DELAY_US = DELAY_SLOW + (DELAY_FAST - DELAY_SLOW) * FAST;
  localparam DELAY_US = 1000000.0 * RAW_DELAY_US / 2.0;

  nfet #(2, 4700, 5, 2) q1(1'b0, clk, sc);
  nfet #(2, 4700, 5, 2) q2(1'b0, ncdiv, sc);

  nfet #(2, 4700, 5, 2) q3(1'b0, clk, ws);
  nfet #(2, 4700, 5, 2) q4(1'b0, cdiv, ws);

  wire delayed;
  assign #DELAY_US delayed = clk;
  assign clk = ~delayed | nstart;

  nfet #(1, 10000) q11(1'b0, nstart, nstop);
  nfet #(2, 1000, 3.0) q12(1'b0, nstop, nstart);

endmodule
