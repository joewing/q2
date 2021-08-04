
module q2_alu(
  input wire a0,
  input wire x0,
  input wire x1,
  input wire f,
  input wire o0,
  input wire o1,
  output wire alu_out,
  output wire alu_cout
);

  wire alu_nor;
  nfet q1(1'b0, a0, alu_nor);
  nfet q2(1'b0, x0, alu_nor);

  wire t1;
  nfet q3(1'b0, a0, t1);
  nfet q4(1'b0, alu_nor, t1);

  wire t2;
  nfet q5(1'b0, x0, t2);
  nfet q6(1'b0, alu_nor, t2);

  wire t3;
  nfet q7(1'b0, t1, t3);
  nfet q8(1'b0, t2, t3);

  wire alu_carry;
  nfet q9(1'b0, alu_nor, alu_carry);
  nfet q10(1'b0, t4, alu_carry);

  wire t4;
  nfet q11(1'b0, t3, t4);
  nfet q12(1'b0, f, t4);

  wire t5;
  nfet q13(1'b0, t3, t5);
  nfet q14(1'b0, t4, t5);

  wire t6;
  nfet q15(1'b0, f, t6);
  nfet q16(1'b0, t4, t6);

  wire alu_sum;
  nfet q17(1'b0, t5, alu_sum);
  nfet q18(1'b0, t6, alu_sum);


  // ALU output selector.
  wire alu_nout;
  wire t7, t8;
  nfet q19(1'b0, ~o1, t7);
  nfet q20(t7, ~o0, t8);
  nfet q21(t8, x0, alu_nout);

  wire t9;
  nfet q22(t7, o0, t9);
  nfet q23(t9, alu_nor, alu_nout);

  wire t10, t11;
  nfet q24(1'b0, o1, t10);
  nfet q25(t10, ~o0, t11);
  nfet q26(t11, alu_sum, alu_nout);

  wire t12;
  nfet q27(t10, o0, t12);
  nfet q28(t12, x1, alu_nout);

  nfet q29(1'b0, alu_nout, alu_out);

  // ALU carry out selector.
  wire alu_ncout;
  wire t13, t14;
  nfet q30(1'b0, ~o1, t13);
  nfet q31(t13, f, t14);
  nfet q32(t14, alu_nout, alu_ncout);

  wire t15, t16;
  nfet q33(1'b0, o1, t15);
  nfet q34(t15, ~o0, t16);
  nfet q35(t16, alu_carry, alu_ncout);

  wire t17;
  nfet q36(t15, o0, t17);
  nfet q37(t17, f, alu_ncout);

  assign alu_cout = ~alu_ncout;

endmodule
