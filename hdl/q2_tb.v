
`timescale 1us/100ns

`include "q2.v"

module q2_tb;

  reg [11:0] sw = 12'h000;
  reg incp_sw = 0;
  reg dep_sw = 0;
  reg start_sw = 0;
  reg stop_sw = 1;
  reg rst = 1;
  wire run;

  integer i;
  initial begin

    $timeformat(0, 3, " seconds", 10);

    //$dumpvars;

    #5000 rst = 1; stop_sw = 0;
    #5000 rst = 0; stop_sw = 0;
    #5000 start_sw = 1;
    #5000 start_sw = 0;
    for (i = 0; i < 10000000; i = i + 1) begin
      #100
      if (!run) begin
        $display("halted after %t", $realtime);
        $stop;
      end else if (i % 5000 == 0) begin
        $display("%t", $realtime);
      end
    end
    $stop;
  end

  q2 dut(
    .rst(rst),
    .sw(sw),
    .incp_sw(incp_sw),
    .dep_sw(dep_sw),
    .start_sw(start_sw),
    .stop_sw(stop_sw),
    .run(run)
  );

endmodule
