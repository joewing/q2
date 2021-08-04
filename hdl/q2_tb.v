

`timescale 1us/100ns

`include "q2.v"

module q2_tb;

  localparam FAST_HZ = 50_000;
  localparam SLOW_HZ = 50;

  reg clk = 1;
  reg [11:0] sw = 12'h000;
  reg incp_sw = 0;
  reg dep_sw = 0;
  reg start_sw = 0;
  reg stop_sw = 0;
  reg rst = 0;
  wire run;

  integer i;
  initial begin

    //$dumpvars;

    #20 rst = 0; stop_sw = 1;
    #20 rst = 0; stop_sw = 0;
    #20 rst = 1; stop_sw = 0;
    #20 rst = 0; stop_sw = 0;
    #20 start_sw = 1;
    #20 start_sw = 0;
    for (i = 0; i < 50000000; i = i + 1) begin
      #10 clk <= 1;
      #10 clk <= 0;
      if (!run) begin
        $display("halted after ", i, " clocks");
        $display(
          "%1d seconds at %1d kHz, %1d seconds at %1d Hz",
          i / FAST_HZ, FAST_HZ / 1000, i / SLOW_HZ, SLOW_HZ
        );
        $stop;
      end else if (i % 100000 == 0) begin
        $display(
          "%1d seconds at %1d kHz, %1d seconds at %1d Hz",
          i / FAST_HZ, FAST_HZ / 1000, i / SLOW_HZ, SLOW_HZ
        );
      end
    end
    $stop;
  end

  q2 dut(
    .rst(rst),
    .clk(clk),
    .sw(sw),
    .incp_sw(incp_sw),
    .dep_sw(dep_sw),
    .start_sw(start_sw),
    .stop_sw(stop_sw),
    .run(run)
  );

endmodule
