
module q2_control(
  input wire s0,
  input wire s1,
  input wire s2,
  input wire s3,
  input wire f,
  input wire op2,
  input wire op3,
  input wire op4,
  input wire op5,
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
  output wire fout
);

  wire state_fetch  = ~s0 & ~s1 & ~s2 & ~s3;
  wire state_load   = ~op5 & s0 & ~s1 & ~s2 & ~s3;
  wire state_deref  = op2 & ~s0 & s1 & ~s2 & ~s3;
  wire state_exec   = s0 & s1 & ~s2 & ~s3;
  wire state_alu    = ~(~s2 & ~s3) & ((~op3 & ~op4) | ~op5);

  assign rdp = state_fetch;
  assign rdx = ~state_fetch;
  assign rda = state_exec;
  assign rdm = ~state_exec;

  assign wro = ~(~state_fetch | ~ws);
  assign wra = ~(~state_alu | ~ws);
  assign wrx = ~(
    (~state_alu & ~state_deref & ~state_load & ~state_fetch) | ~ws
  );
  assign wrp = state_exec & op5 & op4 & (~op3 | ~f) & ws;

  assign incp_clk = ~(~state_fetch | ~ws) | incp_db;
  assign wrm = ~(~dep_sw & (~op5 | op4 | ~op3 | ~state_exec | ~ws));
  assign wrf = ~((~state_alu & (~state_exec | op5)) | ~ws);

  assign xhin_shift = state_alu;
  assign xhin_p = ~(~state_fetch | dbus7);
  assign xhin_zero = ~(~state_fetch | ~dbus7);
  assign xhin_dbus = ~(~state_load & ~state_deref);
  assign xlin_dbus = ~state_alu;
  assign xlin_shift = state_alu;

  // 00 - ld  - 1
  // 01 - nor - 1
  // 10 - add - 0
  // 11 - shr - x0
  assign fout = ~(
    (~state_alu | ~alu_cout) &
    (~state_exec | op4) &
    (~state_exec | ~op3 | ~x0)
  );

endmodule
