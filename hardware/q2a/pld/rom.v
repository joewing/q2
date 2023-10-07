
module rom(
  input wire ce,
  input wire oe,
  input wire [10:0] abus,
  inout wire [11:0] dbus
);

  reg [11:0] rom[0:2047];

  assign dbus = (ce & oe) ? rom[abus] : 12'bz;

  integer i;
  initial begin
    for (i = 0; i < 2048; i = i + 1) rom[i] = 12'hFFF;
    $readmemh("rom.hex", rom);
  end

endmodule
