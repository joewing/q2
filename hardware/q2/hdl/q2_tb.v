
`timescale 1us/100ns

`include "q2.v"

module q2_tb;

  reg [11:0] nsw = 12'hFFF;
  reg ndep_sw = 1;
  reg nincp_sw = 1;
  reg do_start = 0;
  reg nrst = 0;
  wire run;

  integer i;
  initial begin

    $timeformat(0, 3, " seconds", 10);

    //$dumpvars;

    #20000 nrst = 0;
    #20000 nrst = 1;
    #20000 do_start = 1;
    #20000 do_start = 0;
    for (i = 0; i < 100000000; i = i + 1) begin
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

  wire (strong0, weak1) nstart_sw = ~do_start;
  wire (strong0, weak1) nstop_sw = nrst;

  q2 dut(
    .nrst(nrst),
    .nsw(nsw),
    .nincp_sw(nincp_sw),
    .ndep_sw(ndep_sw),
    .nstart_sw(nstart_sw),
    .nstop_sw(nstop_sw),
    .run(run)
  );

endmodule
