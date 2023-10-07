
module lcd(
  input wire wr,
  input wire cmd,
  input wire [7:0] dbus
);

  reg [6:0] disp_addr = 0;
  reg [7:0] disp [0:127];
  integer i, j;

  always @(posedge wr) begin
    $write("OUTPUT: [%d]\n", dbus);
    if (cmd) begin
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
      disp[disp_addr] = (dbus[7:0] < 8'h20 || dbus[7:0] > 8'h7E)
                      ? 8'h3F : dbus[7:0];
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

endmodule
