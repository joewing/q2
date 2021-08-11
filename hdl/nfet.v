
module nfet #(
  parameter FANOUT  = 1,      // Fanout
  parameter RPU     = 10000,  // Size of the pull-up resistor.
  parameter VCC     = 5.0,    // Pull up voltage.
  parameter VTH     = 2.4,    // Output level required to be considered 1.
  parameter CISS_PF = 50.0,   // FET input capacitance.
  parameter RDS     = 3.0     // Drain-source resistance.
) (
  input wire  source,
  input wire  gate,
  output wire drain
);

  localparam HIGH_US    = $max(
    0.1,
    $ln(1.0 / (1.0 - VTH / VCC)) * FANOUT * RPU * CISS_PF / 1000000.0
  );
  localparam LOW_US     = $max(
    0.1,
    $ln(1.0 / (VTH / VCC)) * FANOUT * RDS * CISS_PF / 1000000.0
  );

  wire #LOW_US  low_out   = ~gate | source;
  wire #HIGH_US high_out  = ~gate | source;
  assign (strong0, weak1) drain = low_out & high_out;

endmodule
