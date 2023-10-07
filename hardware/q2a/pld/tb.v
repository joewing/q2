
`include "board.v"

module tb;

  reg clk = 0;
  reg rst = 1;
  reg [11:0] sw;
  reg start = 0;
  reg stop = 0;
  reg depsw = 0;
  reg incpsw = 0;

  board dut(
    .bclk(clk),
    .rst(rst),
    .dep(depsw),
    .incp(incpsw),
    .start(start),
    .stop(stop),
    .sw(sw)
  );

  integer i;
  initial begin

    //$dumpvars;

    // Reset
    sw = 12'h000;
    rst = 1;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    rst = 0;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;

    // Deposit a test value.
    sw = 12'h555;
    depsw = 1;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    depsw = 0;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;

    // Increment address.
    incpsw = 1;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    incpsw = 0;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;

    // Deposit another test value.
    sw = 12'hAAA;
    depsw = 1;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    depsw = 0;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;

    // Set entry point
    sw = 12'h800;
    rst = 1;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    rst = 0;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;

    // Single step a few times.
    stop = 1;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    stop = 0;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    stop = 1;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    stop = 0;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    stop = 1;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    stop = 0;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;
    #10 clk = 1; #10 clk = 0;

    // Start
    start = 1;
    #10 clk = 1; #10 clk = 0;
    start = 0;
    #10 clk = 1; #10 clk = 0;

    for (i = 0; i < 1000000; i = i + 1) begin
      #10 clk = 1; #10 clk = 0;
    end
  end

endmodule

