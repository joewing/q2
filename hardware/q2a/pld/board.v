
`include "clock.v"
`include "state.v"
`include "opcode.v"
`include "slicehigh.v"
`include "slicelow.v"
`include "io.v"
`include "field.v"

`include "ram.v"
`include "rom.v"
`include "lcd.v"
`include "buttons.v"
`include "ttl245.v"

module board(
  input wire bclk,
  input wire rst,
  input wire dep,
  input wire incp,
  input wire start,
  input wire stop,
  input wire [11:0] sw,
  input wire [2:0] fieldsw
);

  wire [3:0] op;
  wire [3:0] control;
  wire [1:0] state;
  wire store;
  wire zp;
  wire flag;
  wire cin0;

  wire [11:0] abus;
  wire [11:0] dbus;
  wire [11:0] carry;    // Carry (low->high bits)
  wire [11:0] io;       // Zero/IO (low->high bits)
  wire [11:0] x;
  wire [1:0] ioen;
  wire [7:0] iobus;
  wire [2:0] field;

  wire memoe, memwe;
  wire iord, iowr, iocmd;
  wire wrf;
  wire clk;

  wire ramcs = ~abus[11];
  wire romcs = abus[11];

  ram ram_inst(
    .ce(ramcs),
    .we(memwe),
    .oe(memoe),
    .abus(abus[10:0]),
    .dbus(dbus)
  );

  rom rom_inst(
    .ce(romcs),
    .oe(memoe),
    .abus(abus[10:0]),
    .dbus(dbus)
  );

  lcd lcd_inst(
    .wr(iowr),
    .cmd(iocmd),
    .dbus(iobus)
  );

  buttons buttons_inst(
    .clk(clk),
    .rd(iord),
    .dbus(iobus)
  );

  clock clock_inst(
    .clk(bclk),
    .rst(rst),
    .start(start),
    .stop(stop),
    .dep(dep),
    .incp(incp),
    .cout(clk)
  );

  io io_inst(
    .clk(clk),
    .io(io[11]),
    .store(store),
    .d11(dbus[11]),
    .d10(dbus[10]),
    .d9(dbus[9]),
    .d8(dbus[8]),
    .memoe(memoe),
    .memwe(memwe),
    .iord(iord),
    .iowr(iowr),
    .iocmd(iocmd),
    .ioen0(ioen[0]),
    .ioen1(ioen[1]),
    .wrf(wrf)
  );

  ttl245 io0_buf(
    .ab(~iord),
    .nce(~ioen[0]),
    .a(dbus[7:0]),
    .b(iobus[7:0])
  );
//assign dbus[11:8] = iord ? 4'b0 : 4'bz;

  state state_inst(
    .clk(clk),
    .rst(rst),
    .op3(op[3]),
    .op2(op[2]),
    .op1(op[1]),
    .op0(op[0]),
    .dep(dep),
    .incp(incp),
    .flag(flag),
    .c3(control[3]),
    .c2(control[2]),
    .c1(control[1]),
    .c0(control[0]),
    .cin0(cin0),
    .s1(state[1]),
    .s0(state[0]),
    .store(store)
  );

  opcode opcode_inst(
    .clk(clk),
    .op3(op[3]),
    .op2(op[2]),
    .op1(op[1]),
    .op0(op[0]),
    .zp(zp),
    .s0(state[0]),
    .s1(state[1]),
    .d11(dbus[11]),
    .d10(dbus[10]),
    .d9(dbus[9]),
    .d8(dbus[8]),
    .d7(dbus[7]),
    .cin(carry[11]),
    .x0(x[0]),
    .flag(flag)
  );

  genvar i;
  generate
    for (i = 0; i < 3; i = i + 1) begin
      field field_inst(
        .clk(clk),
        .c0(control[0]),
        .c1(control[1]),
        .c2(control[2]),
        .c3(control[3]),
        .s1(state[1]),
        .din(dbus[i]),
        .sw(fieldsw[i]),
        .wrf(wrf),
        .field(field[i])
      );
    end
  endgenerate;

  generate
    for (i = 0; i < 12; i = i + 1) begin
      if (i > 6) begin
        slicehigh high_inst(
          .clk(clk),
          .c0(control[0]),
          .c1(control[1]),
          .c2(control[2]),
          .c3(control[3]),
          .sin(i == 11 ? 1'b0 : x[i + 1]),
          .ioin(io[i - 1]),
          .cin(carry[i - 1]),
          .zp(zp),
          .cout(carry[i]),
          .ioout(io[i]),
          .sw(sw[i]),
          .abus(abus[i]),
          .dbus(dbus[i]),
          .x(x[i])
        );
      end else begin
        slicelow low_inst(
          .clk(clk),
          .c0(control[0]),
          .c1(control[1]),
          .c2(control[2]),
          .c3(control[3]),
          .sin(x[i + 1]),
          .ioin(i > 0 ? io[i - 1] : 1'b1),
          .cin(i > 0 ? carry[i - 1] : cin0),
          .cout(carry[i]),
          .ioout(io[i]),
          .sw(sw[i]),
          .abus(abus[i]),
          .dbus(dbus[i]),
          .x(x[i])
        );
      end
    end
  endgenerate

endmodule
