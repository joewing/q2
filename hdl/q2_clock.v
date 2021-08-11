
module q2_clock(
  output wire clk,
  input wire nstart,
  input wire nstop,
  input wire cdiv,
  input wire ncdiv,
  output wire sc,
  output wire ws
);


  // RC delay for clock generation.
  localparam OSC_RES      = 7000;
  localparam OSC_CAP_NF   = 1.0;

  localparam RC_DELAY_US  = (0.8 * OSC_RES * OSC_CAP_NF / 1000.0);

  initial begin
    $display(
      "R = %1d ohms, C = %.1f nF, delay = %.1f us",
      OSC_RES, OSC_CAP_NF, RC_DELAY_US
    );
    $display("Clock frequency is %.3f kHz", 1000.0 / (2 * RC_DELAY_US));
  end

  nfet #(2, 1000) q1(1'b0, clk, sc);
  nfet #(2, 1000) q2(1'b0, ncdiv, sc);

  nfet #(2, 1000) q3(1'b0, clk, ws);
  nfet #(2, 1000) q4(1'b0, cdiv, ws);

  wire t1, t2;
  wire feedback_out, feedback_in;
  nfet q5(1'b0, nstop, t1);
  nfet q6(t1, feedback_in, t2);
  nfet q7(t2, feedback_in, feedback_out);
  nfet q8(1'b1, feedback_out, t2);

  assign #RC_DELAY_US feedback_in = feedback_out;

  wire t3, t4;
  nfet #(1, 10000) q9(1'b0, feedback_out, t4);
  nfet #(2, 1000) q10(1'b0, t4, clk);

endmodule
