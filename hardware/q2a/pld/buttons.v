
module buttons(
  input wire clk,
  input wire rd,
  inout wire [7:0] dbus
);

  localparam KEY = 8;

  assign dbus = rd ?
    (key_timer[7] ? (1 << KEY) ^ 8'hFF : 8'hFF) : 8'bz;

  // Continuously press and release a key.
  reg [7:0] key_timer = 0;
  always @(posedge clk) begin
    if (key_timer) key_timer <= key_timer - 1;
    else key_timer <= 8'hFF;
  end

endmodule
