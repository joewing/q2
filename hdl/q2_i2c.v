
module q2_i2c(
  input wire rst,
  input wire wr,
  input wire rd,
  inout wire [11:0] dbus
);

  reg [3:0] state;
  reg [7:0] byte;
  reg last_scl;
  reg last_sda;

  reg scl;
  reg sda;
  always @(rst or negedge wr) begin
    scl <= ~dbus[10];
    sda <= ~dbus[9];
  end

  assign dbus[9] = rd ? 1'b0 : 1'bz;

  always @(scl or sda or rst) begin
    if (rst) begin
      state <= 0;
    end else if (last_sda == 1 && sda == 0 && last_scl == 1 && scl == 1) begin
      // start: sda 1 -> 0
      $display("I2C START");
      state <= 0;
      byte <= 0;
    end else if (last_sda == 0 && sda == 1 && last_scl == 1 && scl == 1) begin
      // stop: sda 0 -> 1
      $display("I2C STOP");
      state <= 0;
    end else if (last_scl == 0 && scl == 1) begin
      if (state == 8) begin
        // Acknowledge
        $display("I2C: %02X", byte);
        state <= 0;
      end else begin
        byte <= {byte[6:0], sda};
        state <= state + 1;
      end;
    end
    last_scl <= scl;
    last_sda <= sda;
  end

endmodule
