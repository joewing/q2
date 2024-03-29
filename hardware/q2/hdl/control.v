
module control(
  input wire s0,
  input wire ns0,
  input wire s1,
  input wire ns1,
  input wire s2,
  input wire ns2,
  input wire s3,
  input wire ns3,
  input wire nf,
  input wire deref,
  input wire o0,
  input wire no0,
  input wire o1,
  input wire no1,
  input wire o2,
  input wire no2,
  input wire dbus7,
  input wire nx0,
  input wire ws,
  input wire nincp_sw,
  input wire ndep_sw,
  input wire alu_ncout,
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
  output wire nwrm,
  output wire wrf,
  output wire fout,
  output wire s2in,
  output wire state_fetch,
  output wire nstate_exec,
  output wire nstate_load,
  output wire dep
);

  wire nstate_alu;
  wire nstate_fetch;
  wire t1, t2;
  nfet #(18, 1000) q1(1'b0, nstate_alu, t1);
  nfet #(18, 1000) q2(t1, ns1, t2);
  nfet #(18, 1000) q3(t2, ns0, nstate_fetch);

  wire nstate_deref;
  wire t3;
  nfet #(2, 10000) q4(t2, s0, t3);
  nfet #(2, 10000) q5(t3, deref, nstate_deref);

  wire t4, t5;
  nfet #(3, 10000) q6(t1, s1, t4);
  nfet #(3, 10000) q7(t4, ns0, t5);
  nfet #(3, 10000) q8(t5, no2, nstate_load);

  nfet #(5, 10000) q9(t4, s0, nstate_exec);

  wire state_exec;
  nfet #(14, 4700) q10(1'b0, nstate_exec, state_exec);

  nfet #(13, 4700) q11(1'b0, nstate_fetch, state_fetch);

  nfet #(13, 1000, 5, 2) q12(1'b0, s2, nstate_alu);
  nfet #(13, 1000, 5, 2) q13(1'b0, s3, nstate_alu);

  wire state_alu;
  nfet #(12, 4700) q14(1'b0, nstate_alu, state_alu);

  wire t6;
  nfet #(1, 10000, 5, 2) q15(1'b0, o0, t6);
  nfet #(1, 10000, 5, 2) q16(1'b0, o1, t6);
  nfet #(1, 10000, 5, 2) q17(t6, o2, s2in);
  nfet #(1, 10000, 5, 2) q18(1'b0, s2, s2in);

  nfet #(6, 4700, 5, 2) q19(1'b0, nstate_fetch, xhin_p);
  nfet #(6, 4700, 5, 2) q20(1'b0, dbus7, xhin_p);

  nfet #(5, 4700, 5, 2) q21(1'b0, nstate_fetch, xhin_zero);
  nfet #(5, 4700, 5, 2) q22(1'b0, xhin_p, xhin_zero);

  wire t7;
  nfet #(5, 10000) q23(1'b0, nstate_load, t7);
  nfet #(5, 10000) q24(t7, nstate_deref, xhin_dbus);

  wire nws;
  nfet #(6, 4700) q33(1'b0, ws, nws);

  wire t8;
  nfet #(2, 10000) q25(1'b0, nstate_exec, t8);
  nfet #(2, 10000, 5, 3) q26(t8, nstate_alu, wrf);
  nfet #(2, 10000, 5, 3) q27(1'b0, o2, wrf);
  nfet #(2, 10000, 5, 3) q28(1'b0, nws, wrf);

  nfet #(24, 1000, 5, 2) q29(1'b0, nstate_alu, wra);
  nfet #(24, 1000, 5, 2) q30(1'b0, nws, wra);

  nfet #(8, 4700, 5, 2) q31(1'b0, nstate_fetch, wro);
  nfet #(8, 4700, 5, 2) q32(1'b0, nws, wro);

  wire t9, t10, t11;
  nfet #(24, 1000) q34(1'b0, nstate_alu, t9);
  nfet #(24, 1000) q35(t9, nstate_load, t10);
  nfet #(24, 1000) q36(t10, nstate_deref, t11);
  nfet #(24, 1000, 5, 2) q37(t11, nstate_fetch, wrx);
  nfet #(24, 1000, 5, 2) q38(1'b0, nws, wrx);

  wire t22;
  nfet #(2, 10000) q65(1'b0, nincp_sw, t22);
  nfet #(2, 10000) q39(t22, nstate_fetch, incp_clk);
  nfet #(2, 10000) q40(t22, nws, incp_clk);

  wire t12, t13, t14, t15;
  nfet #(25, 1000) q41(1'b0, o2, t12);
  nfet #(25, 1000) q42(t12, o1, t13);
  nfet #(25, 1000) q43(t13, nf, t14);
  nfet #(25, 1000) q44(t13, no0, t14);
  nfet #(25, 1000) q45(t14, state_exec, t15);
  nfet #(25, 1000) q46(t15, ws, nwrp);

  assign rdp = state_fetch;
  assign rdx = nstate_fetch;
  assign rda = state_exec;

  wire t16, t17, t18;
  nfet #(1, 10000, 5, 5) q47(1'b0, no2, t16);
  nfet #(1, 10000, 5, 5) q48(1'b0, o1, t16);
  nfet #(1, 10000, 5, 5) q49(1'b0, no0, t16);
  nfet #(1, 10000, 5, 5) q50(1'b0, nstate_exec, t16);
  nfet #(1, 10000, 5, 5) q51(1'b0, nws, t16);
  nfet #(4, 10000, 5, 2) q52(1'b0, t16, nwrm);
  nfet #(4, 10000, 5, 2) q53(1'b0, t17, nwrm);
  nfet #(2, 10000) q54(1'b0, ndep_sw, t17);
  nfet #(1, 10000) q55(1'b0, t17, t18);
  nfet #(12, 10000) q56(1'b0, t18, dep);

  assign xhin_shift = state_alu;
  assign xlin_shift = state_alu;
  assign xlin_dbus = nstate_alu;

  wire t19, t20;
  nfet #(1, 10000, 5, 3) q57(1'b0, nstate_exec, t19);
  nfet #(1, 10000, 5, 2) q58(t19, alu_ncout, fout);
  nfet #(1, 10000, 5, 1) q59(1'b0, o1, t20);
  nfet #(1, 10000, 5, 3) q60(t20, no0, t19);
  nfet #(1, 10000, 5, 3) q61(t20, nx0, t19);
  nfet #(1, 10000, 5, 2) q62(t19, nstate_alu, fout);

endmodule
