
module ram(
  input wire nce,
  input wire nwe,
  input wire noe,
  input wire [12:0] abus,
  inout wire [11:0] dbus
);

  reg [11:0] ram[0:8191];

  always @(*) begin
    if (!nwe & !nce) ram[abus] <= dbus;
  end
  assign #0.1 dbus = (!nce & !noe) ? ram[abus] : 12'bz;

  integer i;
  initial begin
    for (i = 0; i < 8192; i = i + 1) ram[i] = 12'hFFF;
    $readmemh("test.hex", ram);
  end

endmodule
