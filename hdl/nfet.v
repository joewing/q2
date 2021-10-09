
/*
  // 2N7002K parameters:
  parameter VTH     = 2.0,    // Output level required to be considered 1.
  parameter CISS_PF = 31.0,   // FET input capacitance.
  parameter COSS_PF = 7.0,    // FET output capacitance.
  parameter RDS     = 5.0    // Drain-source resistance.
*/

// n-channel FET model.
module nfet #(
  parameter FANOUT  = 1,      // Fanout (to determine load capacitance).
  parameter RPU     = 10000,  // Size of the pull-up resistor.
  parameter VCC     = 5.0,    // Pull up voltage.

  // 2SK3018 parameters:
  parameter VTH     = 1.5,    // Output level required to be considered 1.
  parameter CISS_PF = 13.0,   // FET input capacitance.
  parameter COSS_PF = 9.0,    // FET output capacitance.
  parameter RDS     = 13.0    // Drain-source resistance.
) (
  input wire  source,
  input wire  gate,
  output wire drain
);

  localparam SCALE = 1.0 / 1000000.0; // Scale to convert PS to US.
  localparam TOTAL_CAP_PF = CISS_PF * FANOUT + COSS_PF;
  localparam HIGH_US    = $max(
    0.1,
    $ln(1.0 / (1.0 - VTH / VCC)) * RPU * TOTAL_CAP_PF * SCALE
  );
  localparam LOW_US     = $max(
    0.1,
    $ln(1.0 / (VTH / VCC)) * RDS * TOTAL_CAP_PF * SCALE
  );

  wire #(HIGH_US, LOW_US) result = ~gate | source;
  assign (strong0, weak1) drain = result;

endmodule
