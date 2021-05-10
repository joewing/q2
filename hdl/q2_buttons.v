
module q2_buttons(
  input wire clk,
  input wire rd,
  inout wire [11:0] dbus
);

  localparam KEY = 2;

  assign dbus[8:0] = rd ?
    (key_timer[7] ? (1 << KEY) ^ 9'h1FF : 9'h1FF) : 9'bz;

  // Continuously press and release a key.
  reg [7:0] key_timer = 0;
  always @(posedge clk) begin
    if (key_timer) key_timer <= key_timer - 1;
    else key_timer <= 8'hFF;
  end

endmodule
