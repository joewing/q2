
`include "q2_control.v"
`include "q2_alu.v"
`include "q2_slice.v"

module q2(
  input wire clk,
  input wire [11:0] sw,
  inout wire [11:0] dbus,
  inout wire [11:0] abus,
  output wire wrm,
  output wire rdm,
  input wire incp_sw,
  input wire dep_sw,
  input wire start_sw,
  input wire stop_sw,
  input wire rst,
  output reg run
);

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
  wire wrp;
  wire rdp;
  wire wrf;
  wire s2in;

  // State bits
  wire cdiv;
  wire s0;
  wire s1;
  wire s2;
  wire s3;
  wire f;
  wire f_in;
  wire o2;
  wire o1;
  wire o0;
  wire deref;

  // ALU connections.
  wire alu_cout;

  // Clock generation.
  wire sc = ~(clk | ~cdiv);
  wire ws = ~(clk | cdiv);

  // Halt condition for simulation.
  // Halt when executing "jmp $".
  wire halt = s0 & s1 & ~s2 & ~s3 && o2 & o1 & ~o0 & ~deref && (x == p - 1);
  always @(posedge halt or posedge start_sw or posedge stop_sw) begin
    run = start_sw & ~stop_sw & ~halt;
  end

  q2_control control(
    .x0(x[0]),
    .s0(s0),
    .s1(s1),
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
    .wrp(wrp),
    .incp_clk(incp_clk),
    .rdp(rdp),
    .wrm(wrm),
    .rdm(rdm),
    .wrf(wrf),
    .fout(f_in),
    .s2in(s2in)
  );

  wire [11:0] a;
  wire [11:0] x;
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

  q2_slice slice0(
    .rst(rst),
    .dep(dep_sw),
    .dbus(dbus[0]),
    .abus(abus[0]),
    .sw(sw[0]),
    .wra(wra),
    .rda(rda),
    .ain(a[1]),
    .incp_clk(incp_clk),
    .wrp(wrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .xshift(x[1]),
    .xin_zero(1'b0),
    .xin_shift(xlin_shift),
    .xin_p(1'b0),
    .xin_dbus(xlin_dbus),
    .wrs(clk),
    .rsts(rst),
    .sin(~cdiv),
    .sout(cdiv),
    .aout(a[0]),
    .xout(x[0]),
    .pout(p[0])
  );

  q2_slice slice1(
    .rst(rst),
    .dep(dep_sw),
    .dbus(dbus[1]),
    .abus(abus[1]),
    .sw(sw[1]),
    .wra(wra),
    .rda(rda),
    .ain(a[2]),
    .incp_clk(~p[0]),
    .wrp(wrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .xshift(x[2]),
    .xin_zero(1'b0),
    .xin_shift(xlin_shift),
    .xin_p(1'b0),
    .xin_dbus(xlin_dbus),
    .wrs(sc),
    .rsts(rst),
    .sin(~s0),
    .sout(s0),
    .aout(a[1]),
    .xout(x[1]),
    .pout(p[1])
  );

  q2_slice slice2(
    .rst(rst),
    .dep(dep_sw),
    .dbus(dbus[2]),
    .abus(abus[2]),
    .sw(sw[2]),
    .wra(wra),
    .rda(rda),
    .ain(a[3]),
    .incp_clk(~p[1]),
    .wrp(wrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .xshift(x[3]),
    .xin_zero(1'b0),
    .xin_shift(xlin_shift),
    .xin_p(1'b0),
    .xin_dbus(xlin_dbus),
    .wrs(~s0),
    .rsts(rst),
    .sin(~s1),
    .sout(s1),
    .aout(a[2]),
    .xout(x[2]),
    .pout(p[2])
  );

  q2_slice slice3(
    .rst(rst),
    .dep(dep_sw),
    .dbus(dbus[3]),
    .abus(abus[3]),
    .sw(sw[3]),
    .wra(wra),
    .rda(rda),
    .ain(a[4]),
    .incp_clk(~p[2]),
    .wrp(wrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .xshift(x[4]),
    .xin_zero(1'b0),
    .xin_shift(xlin_shift),
    .xin_p(1'b0),
    .xin_dbus(xlin_dbus),
    .wrs(~s1),
    .rsts(rst),
    .sin(s2in),
    .sout(s2),
    .aout(a[3]),
    .xout(x[3]),
    .pout(p[3])
  );

  q2_slice slice4(
    .rst(rst),
    .dep(dep_sw),
    .dbus(dbus[4]),
    .abus(abus[4]),
    .sw(sw[4]),
    .wra(wra),
    .rda(rda),
    .ain(a[5]),
    .incp_clk(~p[3]),
    .wrp(wrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .xshift(x[5]),
    .xin_zero(1'b0),
    .xin_shift(xlin_shift),
    .xin_p(1'b0),
    .xin_dbus(xlin_dbus),
    .wrs(~s2),
    .rsts(rst),
    .sin(~s3),
    .sout(s3),
    .aout(a[4]),
    .xout(x[4]),
    .pout(p[4])
  );

  q2_slice slice5(
    .rst(rst),
    .dep(dep_sw),
    .dbus(dbus[5]),
    .abus(abus[5]),
    .sw(sw[5]),
    .wra(wra),
    .rda(rda),
    .ain(a[6]),
    .incp_clk(~p[4]),
    .wrp(wrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .xshift(x[6]),
    .xin_zero(1'b0),
    .xin_shift(xlin_shift),
    .xin_p(1'b0),
    .xin_dbus(xlin_dbus),
    .wrs(1'b0),
    .rsts(1'b0),
    .sin(1'b0),
    .sout(),
    .aout(a[5]),
    .xout(x[5]),
    .pout(p[5])
  );

  q2_slice slice6(
    .rst(rst),
    .dep(dep_sw),
    .dbus(dbus[6]),
    .abus(abus[6]),
    .sw(sw[6]),
    .wra(wra),
    .rda(rda),
    .ain(a[7]),
    .incp_clk(~p[5]),
    .wrp(wrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .xshift(x[7]),
    .xin_zero(1'b0),
    .xin_shift(xlin_shift),
    .xin_p(1'b0),
    .xin_dbus(xlin_dbus),
    .wrs(1'b0),
    .sin(1'b0),
    .sout(),
    .aout(a[6]),
    .xout(x[6]),
    .pout(p[6])
  );

  wire unused7;
  q2_slice slice7(
    .rst(rst),
    .dep(dep_sw),
    .dbus(dbus[7]),
    .abus(abus[7]),
    .sw(sw[7]),
    .wra(wra),
    .rda(rda),
    .ain(a[8]),
    .incp_clk(~p[6]),
    .wrp(wrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .xshift(x[8]),
    .xin_zero(xhin_zero),
    .xin_shift(xhin_shift),
    .xin_p(xhin_p),
    .xin_dbus(xhin_dbus),
    .wrs(wrf),
    .rsts(1'b0),
    .aout(a[7]),
    .sin(f_in),
    .sout(f),
    .xout(x[7]),
    .pout(p[7])
  );

  q2_slice slice8(
    .rst(rst),
    .dep(dep_sw),
    .dbus(dbus[8]),
    .abus(abus[8]),
    .sw(sw[8]),
    .wra(wra),
    .rda(rda),
    .ain(a[9]),
    .incp_clk(~p[7]),
    .wrp(wrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .xshift(x[9]),
    .xin_zero(xhin_zero),
    .xin_shift(xhin_shift),
    .xin_p(xhin_p),
    .xin_dbus(xhin_dbus),
    .wrs(wro),
    .rsts(1'b0),
    .sin(dbus[8]),
    .sout(deref),
    .aout(a[8]),
    .xout(x[8]),
    .pout(p[8])
  );

  q2_slice slice9(
    .rst(rst),
    .dep(dep_sw),
    .dbus(dbus[9]),
    .abus(abus[9]),
    .sw(sw[9]),
    .wra(wra),
    .rda(rda),
    .ain(a[10]),
    .incp_clk(~p[8]),
    .wrp(wrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .xshift(x[10]),
    .xin_zero(xhin_zero),
    .xin_shift(xhin_shift),
    .xin_p(xhin_p),
    .xin_dbus(xhin_dbus),
    .wrs(wro),
    .rsts(1'b0),
    .sin(dbus[9]),
    .sout(o0),
    .aout(a[9]),
    .xout(x[9]),
    .pout(p[9])
  );

  q2_slice slice10(
    .rst(rst),
    .dep(dep_sw),
    .dbus(dbus[10]),
    .abus(abus[10]),
    .sw(sw[10]),
    .wra(wra),
    .rda(rda),
    .ain(a[11]),
    .incp_clk(~p[9]),
    .wrp(wrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .xshift(x[11]),
    .xin_zero(xhin_zero),
    .xin_shift(xhin_shift),
    .xin_p(xhin_p),
    .xin_dbus(xhin_dbus),
    .wrs(wro),
    .rsts(1'b0),
    .sin(dbus[10]),
    .sout(o1),
    .aout(a[10]),
    .xout(x[10]),
    .pout(p[10])
  );

  q2_slice slice11(
    .rst(rst),
    .dep(dep_sw),
    .dbus(dbus[11]),
    .abus(abus[11]),
    .sw(sw[11]),
    .wra(wra),
    .rda(rda),
    .ain(alu_out),
    .incp_clk(~p[10]),
    .wrp(wrp),
    .rdp(rdp),
    .wrx(wrx),
    .rdx(rdx),
    .xshift(1'b0),
    .xin_zero(xhin_zero),
    .xin_shift(xhin_shift),
    .xin_p(xhin_p),
    .xin_dbus(xhin_dbus),
    .wrs(wro),
    .rsts(1'b0),
    .sin(dbus[11]),
    .sout(o2),
    .aout(a[11]),
    .xout(x[11]),
    .pout(p[11])
  );

endmodule
