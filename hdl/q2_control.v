
module q2_control(
  input wire s0,
  input wire s1,
  input wire s2,
  input wire s3,
  input wire f,
  input wire deref,
  input wire o0,
  input wire o1,
  input wire o2,
  input wire dbus7,
  input wire x0,
  input wire ws,
  input wire incp_db,
  input wire dep_sw,
  input wire alu_cout,
  output wire wro,
  output wire wra,
  output wire rda,
  output wire wrx,
  output wire rdx,
  output wire xhin_shift,
  output wire xhin_p,
  output wire xhin_zero,
  output wire xhin_dbus,
  output wire xlin_shift,
  output wire xlin_dbus,
  output wire wrp,
  output wire incp_clk,
  output wire rdp,
  output wire wrm,
  output wire wrf,
  output wire fout,
  output wire s2in,
  inout wire io
);

  wire state_alu   = (s2 | s3);
  wire state_fetch = (~state_alu & ~s1 & ~s0);
  wire state_deref = (~state_alu & ~s1 & s0 & deref);
  wire state_load = (~state_alu & s1 & ~s0 & ~o2);
  wire state_exec = (~state_alu & s1 & s0);

  assign s2in = ~(((o0 | o1) & o2) | s2);
  assign (strong0, weak1) io = ~state_fetch;

  assign rdp = state_fetch;
  assign rdx = ~state_fetch;
  assign rda = state_exec;

  assign wro = ~(~state_fetch | ~ws);
  assign wra = ~(~state_alu | ~ws);
  assign wrx = ~((~state_fetch & ~state_deref & ~state_load & ~state_alu) | ~ws);
  assign wrp = (o2 & o1 & (~f | ~o0) & state_exec & ws);

  assign incp_clk = ~(~state_fetch | ~ws);
  assign wrm = ~(~dep_sw & (~o2 | o1 | ~o0 | ~state_exec | ~ws));
  assign wrf = ~((~state_alu & ~state_exec) | o2 | ~ws);

  assign xhin_shift = state_alu;
  assign xlin_shift = state_alu;
  assign xlin_dbus = ~state_alu;
  assign xhin_p = ~(~state_fetch | dbus7);
  assign xhin_zero = ~(~state_fetch | xhin_p);
  assign xhin_dbus = ~(~state_load & ~state_deref);

  // 00 - ld  - 1
  // 01 - nor - 1
  // 10 - add - 0
  // 11 - shr - x0
  assign fout = ~(
      (~alu_cout | ~state_alu)
    & (~state_exec | (o1 & (~o0 | ~x0)))
  );

endmodule
