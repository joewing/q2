
module alu(
  input wire a0,
  input wire x0,
  input wire x1,
  input wire f,
  input wire o0,
  input wire no0,
  input wire o1,
  input wire no1,
  output wire alu_out,
  output wire alu_ncout
);

  wire alu_nor;
  nfet #(4) q1(1'b0, a0, alu_nor);
  nfet #(4) q2(1'b0, x0, alu_nor);

  wire t1;
  nfet #(1) q3(1'b0, a0, t1);
  nfet #(1) q4(1'b0, alu_nor, t1);

  wire t2;
  nfet #(1) q5(1'b0, x0, t2);
  nfet #(1) q6(1'b0, alu_nor, t2);

  wire t3;
  nfet #(2) q7(1'b0, t1, t3);
  nfet #(2) q8(1'b0, t2, t3);

  wire alu_carry;
  nfet #(1) q9(1'b0, alu_nor, alu_carry);
  nfet #(1) q10(1'b0, t4, alu_carry);

  wire t4;
  nfet #(3) q11(1'b0, t3, t4);
  nfet #(3) q12(1'b0, f, t4);

  wire t5;
  nfet #(1) q13(1'b0, t3, t5);
  nfet #(1) q14(1'b0, t4, t5);

  wire t6;
  nfet #(1) q15(1'b0, f, t6);
  nfet #(1) q16(1'b0, t4, t6);

  wire alu_sum;
  nfet #(1) q17(1'b0, t5, alu_sum);
  nfet #(1) q18(1'b0, t6, alu_sum);


  // ALU output selector.
  wire alu_nout;
  wire t7, t8;
  nfet #(2) q19(1'b0, no1, t7);
  nfet #(2) q20(t7, no0, t8);
  nfet #(2) q21(t8, x0, alu_nout);

  wire t9;
  nfet #(2) q22(t7, o0, t9);
  nfet #(2) q23(t9, alu_nor, alu_nout);

  wire t10, t11;
  nfet #(2) q24(1'b0, o1, t10);
  nfet #(2) q25(t10, no0, t11);
  nfet #(2) q26(t11, alu_sum, alu_nout);

  wire t12;
  nfet #(2) q27(t10, o0, t12);
  nfet #(2) q28(t12, x1, alu_nout);

  nfet #(1) q29(1'b0, alu_nout, alu_out);

  // ALU carry out selector.
  wire t13, t14;
  nfet #(1) q30(1'b0, no1, t13);
  nfet #(1) q31(t13, f, t14);
  nfet #(1) q32(t14, alu_nout, alu_ncout);

  wire t15, t16;
  nfet #(1) q33(1'b0, o1, t15);
  nfet #(1) q34(t15, no0, t16);
  nfet #(1) q35(t16, alu_carry, alu_ncout);

  wire t17;
  nfet #(1) q36(t15, o0, t17);
  nfet #(1) q37(t17, f, alu_ncout);

endmodule
