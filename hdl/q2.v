
`define VCC 5.0

// FET input capacitance.
`define CISS_NF   0.04

// FET threshold.
`define VTH 2.0

`include "nfet.v"
`include "dff.v"
`include "q2_clock.v"
`include "q2_control.v"
`include "q2_alu.v"
`include "q2_slice.v"
`include "q2_ram.v"
`include "q2_i2c.v"
`include "q2_lcd.v"
`include "q2_buttons.v"

module q2(
  input wire [11:0] sw,
  input wire incp_sw,
  input wire dep_sw,
  input wire start_sw,
  input wire stop_sw,
  input wire rst,
  output reg run
);

  wire [11:0] abus;
  wire [11:0] dbus;

  // Control lines
  wire wro;
  wire wra;
  wire rda;
  wire wrx;
  wire rdx;
  wire xhin_shift;
  wire xhin_p;
  wire xhin_zero;
  wire xhin_dbus;
  wire xlin_shift;
  wire xlin_dbus;
  wire incp_clk;
  wire nwrp;
  wire rdp;
  wire wrf;
  wire s2in;

  // State bits
  wire ni2c_sda_out;
  wire ni2c_scl_out;
  wire cdiv, ncdiv;
  wire s0, ns0;
  wire s1, ns1;
  wire s2;
  wire s3;
  wire f;
  wire deref;
  wire o2;
  wire o1;
  wire o0;


  // ALU connections.
  wire alu_cout;
  wire f_in;

  // Clock generation.
  wire sc, ws;
  q2_clock clock(
    .clk(clk),
    .nstart(~start_sw),
    .nstop(~stop_sw),
    .cdiv(cdiv),
    .ncdiv(ncdiv),
    .ws(ws),
    .sc(sc)
  );

  // Halt condition for simulation.
  // Halt when executing "jmp $".
  wire halt = ~s0 & s1 & ~s2 & ~s3 && o2 & o1 & ~o0 & ~deref && (x == p - 1);
  always @(posedge halt or posedge start_sw or posedge stop_sw) begin
    run = start_sw & ~stop_sw & ~halt;
  end

  // Memory and I/O.
  wire nwrm;
  wire io;
  wire nio;

  nfet adq1(1'b0, nio, io_rd);
  nfet adq2(1'b0, rda, io_rd);

  wire adt1, adt2;
  nfet adq3(1'b0, dbus[11], adt1);
  nfet adq4(1'b0, adt1, adt2);
  nfet adq5(1'b0, adt2, lcd_wr);
  nfet adq6(1'b0, nio, lcd_wr);
  nfet adq7(1'b0, nwrm, lcd_wr);
  nfet adq8(1'b0, adt1, i2c_wr);
  nfet adq9(1'b0, nio, i2c_wr);
  nfet adq10(1'b0, nwrm, i2c_wr);

  wire ram_nce;
  nfet rq1(1'b0, nio, ram_nce);

  wire ram_noe;
  nfet rq2(1'b0, nstate_exec, ram_noe);

  // Show writes to output for debugging.
  wire show_output = ~(nwrm | nio) & ~dbus[11];
  always @(posedge show_output) begin
    $display("OUTPUT: %03x (%d)", dbus, dbus);
  end

  q2_lcd lcd(
    .wr(lcd_wr),
    .dbus(dbus)
  );

  q2_i2c i2c(
    .rst(rst),
    .rd(io_rd),
    .i2c_scl_out(i2c_scl_out),
    .i2c_sda_out(i2c_sda_out),
    .dbus(dbus)
  );

  q2_ram ram(
    .nce(ram_nce),
    .noe(ram_noe),
    .nwe(nwrm),
    .abus(abus),
    .dbus(dbus)
  );

  q2_buttons buttons(
    .clk(clk),
    .rd(io_rd),
    .dbus(dbus)
  );

  q2_control control(
    .nx0(nx[0]),
    .s0(s0),
    .ns0(ns0),
    .s1(s1),
    .ns1(ns1),
    .s2(s2),
    .s3(s3),
    .f(f),
    .deref(deref),
    .o0(o0),
    .o1(o1),
    .o2(o2),
    .dbus7(dbus[7]),
    .ws(ws),
    .incp_db(incp_sw),
    .dep_sw(dep_sw),
    .alu_cout(alu_cout),
    .wro(wro),
    .wra(wra),
    .rda(rda),
    .wrx(wrx),
    .rdx(rdx),
    .xhin_shift(xhin_shift),
    .xhin_p(xhin_p),
    .xhin_zero(xhin_zero),
    .xhin_dbus(xhin_dbus),
    .xlin_shift(xlin_shift),
    .xlin_dbus(xlin_dbus),
    .nwrp(nwrp),
    .incp_clk(incp_clk),
    .rdp(rdp),
    .nwrm(nwrm),
    .wrf(wrf),
    .fout(f_in),
    .s2in(s2in),
    .io(io),
    .nio(nio),
    .nstate_exec(nstate_exec)
  );

  wire [11:0] a;
  wire [11:0] x;
  wire [11:0] nx;
  wire [11:0] p;

  wire alu_out;
  q2_alu alu(
    .a0(a[0]),
    .x0(x[0]),
    .x1(x[1]),
    .f(f),
    .o0(o0),
    .o1(o1),
    .alu_out(alu_out),
    .alu_cout(alu_cout)
  );

  wire nrst = ~rst; // TODO
  wire [11:0] nsw = ~sw;    // TODO

  q2_slice slice0(
    .nrst(nrst),
    .dep(dep_sw),
    .dbus(dbus[0]),
    .abus(abus[0]),
    .nsw(nsw[0]),
    .wra(wra),
    .rda(rda),
    .ain(a[1]),
    .incp_clk(incp_clk),
    .nwrp(nwrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .nxin(nx[1]),
    .xin_zero(1'b0),
    .xin_shift(xlin_shift),
    .xin_p(1'b0),
    .xin_dbus(xlin_dbus),
    .wrs(i2c_wr),
    .sin(dbus[9]),
    .nsout(i2c_sda_out),
    .aout(a[0]),
    .nxout(nx[0]),
    .xout(x[0]),
    .pout(p[0]),
    .io(io)
  );

  q2_slice slice1(
    .nrst(nrst),
    .dep(dep_sw),
    .dbus(dbus[1]),
    .abus(abus[1]),
    .nsw(nsw[1]),
    .wra(wra),
    .rda(rda),
    .ain(a[2]),
    .incp_clk(~p[0]),
    .nwrp(nwrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .nxin(nx[2]),
    .xin_zero(1'b0),
    .xin_shift(xlin_shift),
    .xin_p(1'b0),
    .xin_dbus(xlin_dbus),
    .wrs(i2c_wr),
    .sin(dbus[10]),
    .nsout(i2c_scl_out),
    .aout(a[1]),
    .nxout(nx[1]),
    .xout(x[1]),
    .pout(p[1]),
    .io(io)
  );

  q2_slice slice2(
    .nrst(nrst),
    .dep(dep_sw),
    .dbus(dbus[2]),
    .abus(abus[2]),
    .nsw(nsw[2]),
    .wra(wra),
    .rda(rda),
    .ain(a[3]),
    .incp_clk(~p[1]),
    .nwrp(nwrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .nxin(nx[3]),
    .xin_zero(1'b0),
    .xin_shift(xlin_shift),
    .xin_p(1'b0),
    .xin_dbus(xlin_dbus),
    .wrs(clk),
    .sin(ncdiv),
    .sout(cdiv),
    .nsout(ncdiv),
    .aout(a[2]),
    .nxout(nx[2]),
    .xout(x[2]),
    .pout(p[2]),
    .io(io)
  );

  q2_slice slice3(
    .nrst(nrst),
    .dep(dep_sw),
    .dbus(dbus[3]),
    .abus(abus[3]),
    .nsw(nsw[3]),
    .wra(wra),
    .rda(rda),
    .ain(a[4]),
    .incp_clk(~p[2]),
    .nwrp(nwrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .nxin(nx[4]),
    .xin_zero(1'b0),
    .xin_shift(xlin_shift),
    .xin_p(1'b0),
    .xin_dbus(xlin_dbus),
    .wrs(~sc),
    .sin(ns0),
    .sout(s0),
    .nsout(ns0),
    .aout(a[3]),
    .nxout(nx[3]),
    .xout(x[3]),
    .pout(p[3]),
    .io(io)
  );

  q2_slice slice4(
    .nrst(nrst),
    .dep(dep_sw),
    .dbus(dbus[4]),
    .abus(abus[4]),
    .nsw(nsw[4]),
    .wra(wra),
    .rda(rda),
    .ain(a[5]),
    .incp_clk(~p[3]),
    .nwrp(nwrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .nxin(nx[5]),
    .xin_zero(1'b0),
    .xin_shift(xlin_shift),
    .xin_p(1'b0),
    .xin_dbus(xlin_dbus),
    .wrs(ns0),
    .sin(ns1),
    .sout(s1),
    .nsout(ns1),
    .aout(a[4]),
    .nxout(nx[4]),
    .xout(x[4]),
    .pout(p[4]),
    .io(io)
  );

  q2_slice slice5(
    .nrst(nrst),
    .dep(dep_sw),
    .dbus(dbus[5]),
    .abus(abus[5]),
    .nsw(nsw[5]),
    .wra(wra),
    .rda(rda),
    .ain(a[6]),
    .incp_clk(~p[4]),
    .nwrp(nwrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .nxin(nx[6]),
    .xin_zero(1'b0),
    .xin_shift(xlin_shift),
    .xin_p(1'b0),
    .xin_dbus(xlin_dbus),
    .wrs(ns1),
    .sin(s2in),
    .sout(s2),
    .aout(a[5]),
    .nxout(nx[5]),
    .xout(x[5]),
    .pout(p[5]),
    .io(io)
  );

  q2_slice slice6(
    .nrst(nrst),
    .dep(dep_sw),
    .dbus(dbus[6]),
    .abus(abus[6]),
    .nsw(nsw[6]),
    .wra(wra),
    .rda(rda),
    .ain(a[7]),
    .incp_clk(~p[5]),
    .nwrp(nwrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .nxin(nx[7]),
    .xin_zero(1'b0),
    .xin_shift(xlin_shift),
    .xin_p(1'b0),
    .xin_dbus(xlin_dbus),
    .wrs(~s2),
    .sin(~s3),
    .sout(s3),
    .aout(a[6]),
    .nxout(nx[6]),
    .xout(x[6]),
    .pout(p[6]),
    .io(io)
  );

  q2_slice slice7(
    .nrst(nrst),
    .dep(dep_sw),
    .dbus(dbus[7]),
    .abus(abus[7]),
    .nsw(nsw[7]),
    .wra(wra),
    .rda(rda),
    .ain(a[8]),
    .incp_clk(~p[6]),
    .nwrp(nwrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .nxin(nx[8]),
    .xin_zero(xhin_zero),
    .xin_shift(xhin_shift),
    .xin_p(xhin_p),
    .xin_dbus(xhin_dbus),
    .wrs(wrf),
    .aout(a[7]),
    .sin(f_in),
    .sout(f),
    .nxout(nx[7]),
    .xout(x[7]),
    .pout(p[7]),
    .io(io)
  );

  q2_slice slice8(
    .nrst(nrst),
    .dep(dep_sw),
    .dbus(dbus[8]),
    .abus(abus[8]),
    .nsw(nsw[8]),
    .wra(wra),
    .rda(rda),
    .ain(a[9]),
    .incp_clk(~p[7]),
    .nwrp(nwrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .nxin(nx[9]),
    .xin_zero(xhin_zero),
    .xin_shift(xhin_shift),
    .xin_p(xhin_p),
    .xin_dbus(xhin_dbus),
    .wrs(wro),
    .sin(dbus[8]),
    .sout(deref),
    .aout(a[8]),
    .nxout(nx[8]),
    .xout(x[8]),
    .pout(p[8]),
    .io(io)
  );

  q2_slice slice9(
    .nrst(nrst),
    .dep(dep_sw),
    .dbus(dbus[9]),
    .abus(abus[9]),
    .nsw(nsw[9]),
    .wra(wra),
    .rda(rda),
    .ain(a[10]),
    .incp_clk(~p[8]),
    .nwrp(nwrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .nxin(nx[10]),
    .xin_zero(xhin_zero),
    .xin_shift(xhin_shift),
    .xin_p(xhin_p),
    .xin_dbus(xhin_dbus),
    .wrs(wro),
    .sin(dbus[9]),
    .sout(o0),
    .aout(a[9]),
    .nxout(nx[9]),
    .xout(x[9]),
    .pout(p[9]),
    .io(io)
  );

  q2_slice slice10(
    .nrst(nrst),
    .dep(dep_sw),
    .dbus(dbus[10]),
    .abus(abus[10]),
    .nsw(nsw[10]),
    .wra(wra),
    .rda(rda),
    .ain(a[11]),
    .incp_clk(~p[9]),
    .nwrp(nwrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .nxin(nx[11]),
    .xin_zero(xhin_zero),
    .xin_shift(xhin_shift),
    .xin_p(xhin_p),
    .xin_dbus(xhin_dbus),
    .wrs(wro),
    .sin(dbus[10]),
    .sout(o1),
    .aout(a[10]),
    .nxout(nx[10]),
    .xout(x[10]),
    .pout(p[10]),
    .io(io)
  );

  q2_slice slice11(
    .nrst(nrst),
    .dep(dep_sw),
    .dbus(dbus[11]),
    .abus(abus[11]),
    .nsw(nsw[11]),
    .wra(wra),
    .rda(rda),
    .ain(alu_out),
    .incp_clk(~p[10]),
    .nwrp(nwrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .nxin(1'b1),
    .xin_zero(xhin_zero),
    .xin_shift(xhin_shift),
    .xin_p(xhin_p),
    .xin_dbus(xhin_dbus),
    .wrs(wro),
    .sin(dbus[11]),
    .sout(o2),
    .aout(a[11]),
    .nxout(nx[11]),
    .xout(x[11]),
    .pout(p[11]),
    .io(io)
  );

endmodule
