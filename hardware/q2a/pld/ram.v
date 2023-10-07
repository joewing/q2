
module ram(
  input wire ce,
  input wire we,
  input wire oe,
  input wire [10:0] abus,
  inout wire [11:0] dbus
);

  reg [11:0] ram[0:(1<<11)-1];

  always @(*) begin
    if (we & ce) ram[abus] <= dbus;
  end
  assign dbus = (ce & oe) ? ram[abus] : 12'bz;

  integer i;
  initial begin
    for (i = 0; i < 2048; i = i + 1) begin
      ram[i] = 12'hEEE;
    end
  end

endmodule
