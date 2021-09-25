
module q2_i2c(
  input wire rst,
  input wire rd,
  input wire i2c_scl_out,
  input wire i2c_sda_out,
  inout wire [11:0] dbus
);

  reg [3:0] state;
  reg [7:0] byte;
  reg last_scl;
  reg last_sda;

  wire scl = i2c_scl_out;
  wire sda = i2c_sda_out;

  wire t1, t2;
  nfet q1(1'b0, 1'b0, t1);
  nfet q2(t1, rd, dbus[9]);
  nfet q3(1'b0, 1'b0, t2);
  nfet q4(t2, rd, dbus[10]);

  assign dbus[11:10] = rd ? 2'b11 : 2'bzz;

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
