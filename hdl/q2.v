
`define VCC 5.0

`include "nfet.v"
`include "dff.v"
`include "clock.v"
`include "control.v"
`include "alu.v"
`include "areg.v"
`include "xreg.v"
`include "preg.v"
`include "slice.v"
`include "addr.v"
`include "field.v"
`include "ram.v"
`include "i2c.v"
`include "lcd.v"
`include "buttons.v"

module q2(
  input wire [11:0] nsw,
  input wire nincp_sw,
  input wire ndep_sw,
  inout wire nstart_sw,
  inout wire nstop_sw,
  input wire nrst,
  output reg run
);

  wire [12:0] abus;
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
  wire s2, ns2;
  wire s3, ns3;
  wire f;
  wire nf;
  wire deref, nderef;
  wire o2;
  wire o1;
  wire o0;
  wire nstate_load;
  wire nstate_exec;

  // ALU connections.
  wire nalu_cout;
  wire f_in;

  // Clock generation.
  wire sc, ws;
  clock clock(
    .clk(clk),
    .nstart(nstart_sw),
    .nstop(nstop_sw),
    .cdiv(cdiv),
    .ncdiv(ncdiv),
    .ws(ws),
    .sc(sc)
  );

  // Report clock frequency.
  realtime start;
  integer freq_count;
  always @(posedge clk) begin
    if (~nrst) begin
      freq_count <= 0;
    end else if (freq_count == 0) begin
      start <= $realtime;
      freq_count <= 1;
    end else if (freq_count == 1000) begin
      $display(
        "Clock frequency: %g kHz",
        (1000.0 * 1000000.0 / ($realtime - start)) / freq_count
      );
      freq_count <= 1001;
      start <= $realtime;
    end else begin
      freq_count <= freq_count + 1;
    end
  end

  // Halt condition for simulation.
  // Halt when executing "jmp $".
  wire [11:0] p = ~np;
  wire halt = ~s0 & s1 & ~s2 & ~s3 && o2 & o1 & ~o0 & ~deref && (x == p - 1);
  always @(posedge halt or negedge nstart_sw or negedge nstop_sw) begin
    run = ~halt;
  end

  // Memory and I/O.
  wire nwrm;
  wire io;
  wire nio;
  wire dep;

  wire io_rd, lcd_wr, i2c_wr, df_wr;
  address_decoder ad(
    .dbus(dbus),
    .nwrm(nwrm),
    .state_fetch(state_fetch),
    .state_exec(rda),
    .io(io),
    .nio(nio),
    .io_rd(io_rd),
    .lcd_wr(lcd_wr),
    .i2c_wr(i2c_wr),
    .df_wr(df_wr)
  );

  wire ram_nce;
  nfet rq1(1'b0, nio, ram_nce);

  wire ram_noe;
  nfet rq2(1'b0, nstate_exec, ram_noe);

  // Show writes to output for debugging.
  wire show_output = ~(nwrm | nio) & ~dbus[11];
  always @(posedge show_output) begin
    $display("OUTPUT: %03x (%d)", dbus, dbus);
  end

  lcd lcd(
    .wr(lcd_wr),
    .dbus(dbus)
  );

  i2c i2c(
    .nrst(nrst),
    .rd(io_rd),
    .i2c_scl_out(i2c_scl_out),
    .i2c_sda_out(i2c_sda_out),
    .dbus(dbus)
  );

  field field(
    .nrst(nrst),
    .nwrp(nwrp),
    .nderef(nderef),
    .nstate_load(nstate_load),
    .nstate_exec(nstate_exec),
    .df_wr(df_wr),
    .dbus0(dbus[0]),
    .abus12(abus[12])
  );

  ram ram(
    .nce(ram_nce),
    .noe(ram_noe),
    .nwe(nwrm),
    .abus(abus),
    .dbus(dbus)
  );

  buttons buttons(
    .clk(clk),
    .rd(io_rd),
    .dbus(dbus)
  );

  control control(
    .nx0(nx[0]),
    .s0(s0),
    .ns0(ns0),
    .s1(s1),
    .ns1(ns1),
    .s2(s2),
    .ns2(ns2),
    .s3(s3),
    .ns3(ns3),
    .nf(nf),
    .deref(deref),
    .o0(o0),
    .no0(no0),
    .o1(o1),
    .no1(no1),
    .o2(o2),
    .no2(no2),
    .dbus7(dbus[7]),
    .ws(ws),
    .nincp_sw(nincp_sw),
    .ndep_sw(ndep_sw),
    .alu_ncout(alu_ncout),
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
    .state_fetch(state_fetch),
    .nstate_exec(nstate_exec),
    .nstate_load(nstate_load),
    .dep(dep)
  );

  wire [11:0] a;
  wire [11:0] x;
  wire [11:0] nx;
  wire [11:0] np;

  wire alu_out;
  alu alu(
    .a0(a[0]),
    .x0(x[0]),
    .x1(x[1]),
    .f(f),
    .o0(o0),
    .no0(no0),
    .o1(o1),
    .no1(no1),
    .alu_out(alu_out),
    .alu_ncout(alu_ncout)
  );

  slice slice0(
    .nrst(nrst),
    .dep(dep),
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
    .sin(dbus[8]),
    .nsout(i2c_sda_out),
    .aout(a[0]),
    .nxout(nx[0]),
    .xout(x[0]),
    .npout(np[0]),
    .io(io)
  );

  slice slice1(
    .nrst(nrst),
    .dep(dep),
    .dbus(dbus[1]),
    .abus(abus[1]),
    .nsw(nsw[1]),
    .wra(wra),
    .rda(rda),
    .ain(a[2]),
    .incp_clk(np[0]),
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
    .sin(dbus[9]),
    .nsout(i2c_scl_out),
    .aout(a[1]),
    .nxout(nx[1]),
    .xout(x[1]),
    .npout(np[1]),
    .io(io)
  );

  slice slice2(
    .nrst(nrst),
    .dep(dep),
    .dbus(dbus[2]),
    .abus(abus[2]),
    .nsw(nsw[2]),
    .wra(wra),
    .rda(rda),
    .ain(a[3]),
    .incp_clk(np[1]),
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
    .npout(np[2]),
    .io(io)
  );

  slice slice3(
    .nrst(nrst),
    .dep(dep),
    .dbus(dbus[3]),
    .abus(abus[3]),
    .nsw(nsw[3]),
    .wra(wra),
    .rda(rda),
    .ain(a[4]),
    .incp_clk(np[2]),
    .nwrp(nwrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .nxin(nx[4]),
    .xin_zero(1'b0),
    .xin_shift(xlin_shift),
    .xin_p(1'b0),
    .xin_dbus(xlin_dbus),
    .wrs(sc),
    .sin(ns0),
    .sout(s0),
    .nsout(ns0),
    .aout(a[3]),
    .nxout(nx[3]),
    .xout(x[3]),
    .npout(np[3]),
    .io(io)
  );

  slice slice4(
    .nrst(nrst),
    .dep(dep),
    .dbus(dbus[4]),
    .abus(abus[4]),
    .nsw(nsw[4]),
    .wra(wra),
    .rda(rda),
    .ain(a[5]),
    .incp_clk(np[3]),
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
    .npout(np[4]),
    .io(io)
  );

  slice slice5(
    .nrst(nrst),
    .dep(dep),
    .dbus(dbus[5]),
    .abus(abus[5]),
    .nsw(nsw[5]),
    .wra(wra),
    .rda(rda),
    .ain(a[6]),
    .incp_clk(np[4]),
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
    .nsout(ns2),
    .aout(a[5]),
    .nxout(nx[5]),
    .xout(x[5]),
    .npout(np[5]),
    .io(io)
  );

  slice slice6(
    .nrst(nrst),
    .dep(dep),
    .dbus(dbus[6]),
    .abus(abus[6]),
    .nsw(nsw[6]),
    .wra(wra),
    .rda(rda),
    .ain(a[7]),
    .incp_clk(np[5]),
    .nwrp(nwrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .nxin(nx[7]),
    .xin_zero(1'b0),
    .xin_shift(xlin_shift),
    .xin_p(1'b0),
    .xin_dbus(xlin_dbus),
    .wrs(ns2),
    .sin(ns3),
    .sout(s3),
    .nsout(ns3),
    .aout(a[6]),
    .nxout(nx[6]),
    .xout(x[6]),
    .npout(np[6]),
    .io(io)
  );

  slice slice7(
    .nrst(nrst),
    .dep(dep),
    .dbus(dbus[7]),
    .abus(abus[7]),
    .nsw(nsw[7]),
    .wra(wra),
    .rda(rda),
    .ain(a[8]),
    .incp_clk(np[6]),
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
    .nsout(nf),
    .nxout(nx[7]),
    .xout(x[7]),
    .npout(np[7]),
    .io(io)
  );

  slice slice8(
    .nrst(nrst),
    .dep(dep),
    .dbus(dbus[8]),
    .abus(abus[8]),
    .nsw(nsw[8]),
    .wra(wra),
    .rda(rda),
    .ain(a[9]),
    .incp_clk(np[7]),
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
    .nsout(nderef),
    .aout(a[8]),
    .nxout(nx[8]),
    .xout(x[8]),
    .npout(np[8]),
    .io(io)
  );

  slice slice9(
    .nrst(nrst),
    .dep(dep),
    .dbus(dbus[9]),
    .abus(abus[9]),
    .nsw(nsw[9]),
    .wra(wra),
    .rda(rda),
    .ain(a[10]),
    .incp_clk(np[8]),
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
    .nsout(no0),
    .aout(a[9]),
    .nxout(nx[9]),
    .xout(x[9]),
    .npout(np[9]),
    .io(io)
  );

  slice slice10(
    .nrst(nrst),
    .dep(dep),
    .dbus(dbus[10]),
    .abus(abus[10]),
    .nsw(nsw[10]),
    .wra(wra),
    .rda(rda),
    .ain(a[11]),
    .incp_clk(np[9]),
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
    .nsout(no1),
    .aout(a[10]),
    .nxout(nx[10]),
    .xout(x[10]),
    .npout(np[10]),
    .io(io)
  );

  slice slice11(
    .nrst(nrst),
    .dep(dep),
    .dbus(dbus[11]),
    .abus(abus[11]),
    .nsw(nsw[11]),
    .wra(wra),
    .rda(rda),
    .ain(alu_out),
    .incp_clk(np[10]),
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
    .nsout(no2),
    .aout(a[11]),
    .nxout(nx[11]),
    .xout(x[11]),
    .npout(np[11]),
    .io(io)
  );

endmodule
