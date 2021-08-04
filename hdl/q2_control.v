
module q2_control(
  input wire s0,
  input wire ns0,
  input wire s1,
  input wire ns1,
  input wire s2,
  input wire s3,
  input wire f,
  input wire deref,
  input wire o0,
  input wire o1,
  input wire o2,
  input wire dbus7,
  input wire nx0,
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
  output wire nwrp,
  output wire incp_clk,
  output wire rdp,
  output wire wrm,
  output wire wrf,
  output wire fout,
  output wire s2in,
  inout wire io,
  output wire nio
);

  wire nstate_fetch;
  wire t1, t2;
  nfet q1(1'b0, nstate_alu, t1);
  nfet q2(t1, ns1, t2);
  nfet q3(t2, ns0, nstate_fetch);

  wire nstate_deref;
  wire t3;
  nfet q4(t2, s0, t3);
  nfet q5(t3, deref, nstate_deref);

  wire nstate_load;
  wire t4, t5;
  nfet q6(t1, s1, t4);
  nfet q7(t4, ns0, t5);
  nfet q8(t5, ~o2, nstate_load);

  wire nstate_exec;
  nfet q9(t4, s0, nstate_exec);

  wire state_exec;
  nfet q10(1'b0, nstate_exec, state_exec);

  wire state_fetch;
  nfet q11(1'b0, nstate_fetch, state_fetch);

  wire nstate_alu;
  nfet q12(1'b0, s2, nstate_alu);
  nfet q13(1'b0, s3, nstate_alu);

  wire state_alu;
  nfet q14(1'b0, nstate_alu, state_alu);

  wire t6;
  nfet q15(1'b0, o0, t6);
  nfet q16(1'b0, o1, t6);
  nfet q17(t6, o2, s2in);
  nfet q18(1'b0, s2, s2in);

  nfet q19(1'b0, nstate_fetch, xhin_p);
  nfet q20(1'b0, dbus7, xhin_p);

  nfet q21(1'b0, nstate_fetch, xhin_zero);
  nfet q22(1'b0, xhin_p, xhin_zero);

  wire t7;
  nfet q23(1'b0, nstate_load, t7);
  nfet q24(t7, nstate_deref, xhin_dbus);

  wire t8;
  nfet q25(1'b0, nstate_exec, t8);
  nfet q26(t8, nstate_alu, wrf);
  nfet q27(1'b0, o2, wrf);
  nfet q28(1'b0, nws, wrf);

  nfet q29(1'b0, nstate_alu, wra);
  nfet q30(1'b0, nws, wra);

  nfet q31(1'b0, nstate_fetch, wro);
  nfet q32(1'b0, nws, wro);

  wire nws;
  nfet q33(1'b0, ws, nws);

  wire t9, t10, t11;
  nfet q34(1'b0, nstate_alu, t9);
  nfet q35(t9, nstate_load, t10);
  nfet q36(t10, nstate_deref, t11);
  nfet q37(t11, nstate_fetch, wrx);
  nfet q38(1'b0, nws, wrx);

  nfet q39(1'b0, nstate_fetch, incp_clk);
  nfet q40(1'b0, nws, incp_clk);

  wire t12, t13, t14, t15;
  nfet q41(1'b0, o2, t12);
  nfet q42(t12, o1, t13);
  nfet q43(t13, ~f, t14);
  nfet q44(t13, ~o0, t14);
  nfet q45(t14, state_exec, t15);
  nfet q46(t15, ws, nwrp);

  assign rdp = state_fetch;
  assign rdx = nstate_fetch;
  assign rda = state_exec;

  wire dep;
  wire t16, t17, t18;
  nfet q47(1'b0, ~o2, t16);
  nfet q48(1'b0, o1, t16);
  nfet q49(1'b0, ~o0, t16);
  nfet q50(1'b0, nstate_exec, t16);
  nfet q51(1'b0, nws, t16);
  nfet q52(1'b0, t16, nwrm);
  nfet q53(1'b0, t17, nwrm);
  nfet q54(1'b0, ~dep_sw, t17);
  nfet q55(1'b0, t17, t18);
  nfet q56(1'b0, t18, dep);

  assign wrm = ~nwrm;

  assign xhin_shift = state_alu;
  assign xlin_shift = state_alu;
  assign xlin_dbus = nstate_alu;

  wire t19, t20;
  nfet q57(1'b0, nstate_exec, t19);
  nfet q58(t19, ~alu_cout, fout);
  nfet q59(1'b0, o1, t20);
  nfet q60(t20, ~o0, t19);
  nfet q61(t20, nx0, t19);
  nfet q62(t19, nstate_alu, fout);

  nfet q63(1'b0, state_fetch, io);
  nfet q64(1'b0, io, nio);

endmodule
