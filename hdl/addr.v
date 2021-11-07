
module address_decoder(
  input wire [11:0] dbus,
  input wire nwrm,
  input wire state_fetch,
  input wire state_exec,
  inout wire io,
  output wire nio,
  output wire io_rd,
  output wire lcd_wr,
  output wire i2c_wr,
  output wire df_wr
);

  nfet #(7) q1(1'b0, nio, io_rd);
  nfet #(7) q2(1'b0, state_exec, io_rd);

  wire t1;
  nfet #(2) q3(1'b0, dbus[11], t1);

  wire nio_wr, io_wr;
  nfet #(3) q4(1'b0, nio, io_wr);
  nfet #(3) q5(1'b0, nwrm, io_wr);
  nfet #(3) q6(1'b0, io_wr, nio_wr);

  nfet q7(1'b0, dbus[11], lcd_wr);
  nfet q8(1'b0, nio_wr, lcd_wr);

  nfet #(4) q9(1'b0, t1, i2c_wr);
  nfet #(4) q10(1'b0, dbus[10], i2c_wr);
  nfet #(4) q11(1'b0, nio_wr, i2c_wr);

  wire t3;
  nfet #(2) q12(1'b0, dbus[10], t3);
  nfet #(2) q13(1'b0, t3, df_wr);
  nfet #(2) q14(1'b0, t1, df_wr);
  nfet #(2) q15(1'b0, nio_wr, df_wr);

  nfet #(1) q16(1'b0, state_fetch, io);
  nfet #(4) q17(1'b0, io, nio);

endmodule
