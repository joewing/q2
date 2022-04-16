
// n-channel FET model.
module nfet #(
  parameter FANOUT  = 1,      // Fanout (to determine load capacitance).
  parameter RPU     = 10000,  // Size of the pull-up resistor.
  parameter VCC     = 5.0,    // Pull up voltage.
  parameter DRIVERS = 1,      // Number of transistors driving the output.

  // 2N7002K parameters:
  parameter VTH     = 2.4,    // Output level required to be considered 1.
  parameter CISS_PF = 45.0,   // FET input capacitance.
  parameter COSS_PF = 8.0,    // FET output capacitance.
  parameter RDS     = 2.5     // Drain-source resistance.

) (
  input wire  source,
  input wire  gate,
  output wire drain
);

  localparam PS_PER_US = 1.0 / 1000000.0; // Scale to convert PS to US.
  localparam TOTAL_CAP_PF = CISS_PF * FANOUT + COSS_PF * DRIVERS;
  localparam HIGH_US    = $max(
    0.1,
    $ln(VCC / (VCC - VTH)) * RPU * TOTAL_CAP_PF * PS_PER_US
  );
  localparam LOW_US     = $max(
    0.0,
    $ln(VCC / VTH) * RDS * TOTAL_CAP_PF * PS_PER_US
  );

  assign (strong0, weak1) #(HIGH_US, LOW_US, LOW_US) drain = ~gate | source;

endmodule
