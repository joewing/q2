
module q2_ram(
  input wire ce,
  input wire we,
  input wire oe,
  input wire [11:0] abus,
  inout wire [11:0] dbus
);

  reg [11:0] ram[0:4095];

  always @(*) begin
    if (we & ce) ram[abus] <= dbus;
  end
  assign dbus = (ce & oe) ? ram[abus] : 12'bz;

  initial begin
    $readmemh("test.hex", ram);
  end

endmodule
