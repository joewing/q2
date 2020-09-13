
`include "q2.v"

module q2_tb;

  reg clk = 1;
  reg [11:0] sw = 0;
  wire [11:0] dbus;
  wire [11:0] abus;
  reg incp_sw = 0;
  reg dep_sw = 0;
  reg start_sw = 0;
  reg stop_sw = 0;
  reg rst = 0;
  wire run;
  wire wrm;
  wire rdm;

  reg [11:0] ram[0:4095];
  always @(posedge wrm) begin
    if (abus == 12'hFFF) begin
      $display("OUTPUT %03x (%d)", dbus, dbus);
    end
    ram[abus] <= dbus;
  end
  assign dbus = rdm ? ram[abus] : 12'bz;

  integer i;
  initial begin

    $readmemh("test.hex", ram);
    $dumpvars;

    #10 rst = 0; stop_sw = 1;
    #10 rst = 1; stop_sw = 1;
    #10 rst = 0; stop_sw = 0;
    #10 start_sw = 1;
    #10 start_sw = 0;
    for (i = 0; i < 100000; i = i + 1) begin
      #10 clk <= 1;
      #10 clk <= 0;
      if (!run) begin
        $display("halted after ", i, " clocks");
        $display(i / 5000, " seconds at 5kHz, ", i / 10, " seconds at 10Hz");
        $stop;
      end
    end
    $stop;
  end

  q2 dut(
    .rst(rst),
    .clk(clk),
    .sw(sw),
    .dbus(dbus),
    .abus(abus),
    .wrm(wrm),
    .rdm(rdm),
    .incp_sw(incp_sw),
    .dep_sw(dep_sw),
    .start_sw(start_sw),
    .stop_sw(stop_sw),
    .run(run)
  );

endmodule
