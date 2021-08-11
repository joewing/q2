
module q2_ram(
  input wire nce,
  input wire nwe,
  input wire noe,
  input wire [11:0] abus,
  inout wire [11:0] dbus
);

  reg [11:0] ram[0:4095];

  always @(*) begin
    if (!nwe & !nce) ram[abus] <= dbus;
  end
  assign #0.1 dbus = (!nce & !noe) ? ram[abus] : 12'bz;

  initial begin
    $readmemh("test.hex", ram);
  end

endmodule
