
`include "q2.v"

module q2_tb;

  localparam KEY = 3;
  localparam FAST_HZ = 100000;
  localparam SLOW_HZ = 32;

  reg clk = 1;
  reg [11:0] sw = 12'h800;
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

  reg [6:0] disp_addr = 0;
  reg [7:0] disp [0:127];
  integer i, j;

  reg [11:0] ram[0:4095];
  always @(posedge wrm) begin
    if (abus == 12'hFFF) begin
      $display("OUTPUT %03x: %03x (%d)", abus, dbus, dbus);
      if (dbus[8]) begin
        if (dbus[7]) begin
          // Set address
          disp_addr <= dbus[6:0];
        end else if (dbus[0]) begin
          // Clear screen.
          for (j = 0; j < 128; j = j + 1) begin
            disp[j] <= 8'h20;
          end
          disp_addr <= 0;
        end
      end else begin
        disp[disp_addr] = (dbus[7:0] < 8'h20 || dbus[7:0] > 8'h7E) ? 8'h3F : dbus[7:0];
        disp_addr <= disp_addr + 1;
        $write("+----------------+\n|");
        for (j = 0; j < 16; j = j + 1) begin
          $write("%c", disp[j]);
        end
        $write("|\n|");
        for (j = 0; j < 16; j = j + 1) begin
          $write("%c", disp[j + 64]);
        end
        $write("|\n+----------------+\n");
        $fflush();
      end
    end
    ram[abus] <= dbus;
  end
  assign dbus = rdm
              ? (abus == 12'hFFF
                  ? (key_timer < 64 ? (1 << KEY) ^ 12'hFFF : 12'hFFF)
                  : ram[abus]
              ) : 12'bz;

  reg [7:0] key_timer = 0;
  always @(posedge clk) begin
    if (key_timer) key_timer = key_timer - 1;
    else key_timer = 8'hFF;
  end

  initial begin

    $readmemh("test.hex", ram);
    //$dumpvars;

    #10 rst = 0; stop_sw = 1;
    #10 rst = 0; stop_sw = 0;
    #10 rst = 1; stop_sw = 0;
    #10 rst = 0; stop_sw = 0;
    #10 start_sw = 1;
    #10 start_sw = 0;
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
