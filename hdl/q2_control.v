
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
  output wire rdm,
  output wire wrf,
  output wire fout,
  output wire s2in
);

  wire #0.7 state_fetch  = ~s0 & ~s1 & ~s2 & ~s3;
  wire #0.7 state_load   = ~o2 & ~s0 & s1 & ~s2 & ~s3;
  wire #0.7 state_deref  = deref & s0 & ~s1 & ~s2 & ~s3;
  wire #2.1 state_exec   = s0 & s1 & ~s2 & ~s3;
  wire #0.6 state_alu = ~(~s2 & ~s3);

  assign s2in = ~(((o0 | o1) & o2) | s2);

  assign #0.4 rdp = state_fetch;
  assign #0.0 rdx = ~state_fetch;
  assign #0.5 rda = state_exec;
  assign rdm = ~state_exec;

  assign #0.3 wro = ~(~state_fetch | ~ws);
  assign #0.0 wra = ~(~state_alu | ~ws);
  assign #0.0 wrx = ~(
    (~state_alu & ~state_load & ~state_deref & ~state_fetch) | ~ws
  );
  assign #1.3 wrp = state_exec & o2 & o1 & (~o0 | ~f) & ws;

  assign #0.7 incp_clk = ~(~state_fetch | ~ws) | incp_db;
  assign #0.7 wrm = ~(~dep_sw & (~o2 | o1 | ~o0 | ~state_exec | ~ws));
  assign #0.0 wrf = ~((~state_alu & ~state_exec) | ~ws | o2);

  assign #0.4 xhin_shift = state_alu;
  assign #1.7 xhin_p = ~(~state_fetch | dbus7);
  assign #1.7 xhin_zero = ~(~state_fetch | xhin_p);
  assign #1.7 xhin_dbus = ~(~state_load & ~state_deref);
  assign #0 xlin_dbus = ~state_alu;
  assign #0.4 xlin_shift = state_alu;

  // 00 - ld  - 1
  // 01 - nor - 1
  // 10 - add - 0
  // 11 - shr - x0
  assign fout = ~(
    (~state_alu | ~alu_cout) &
    (~state_exec | (o1 & (~o0 | ~x0)))
  );

endmodule
