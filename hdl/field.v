
module field(
  input wire nrst,
  input wire nwrp,
  input wire nderef,
  input wire nstate_load,
  input wire nstate_exec,
  input wire df_wr,
  input wire dbus0,
  output wire abus12
);

  always @(posedge df_wr) begin
    $display("SET DF: ", dbus0);
  end
  always @(posedge wrp) begin
    if (df0 != if0) begin
      $display("SET IF: ", if0, " -> ", df0);
    end
  end

  wire nfield_in0, field_in0;
  nfet q1(1'b0, dbus0, nfield_in0);
  nfet q2(1'b0, nfield_in0, field_in0);

  wire t1, t2, t3, df0, ndf0;
  nfet #(2, 10000) q3(1'b0, nfield_in0, t2);
  nfet #(2, 10000) q4(t2, df_wr, df0);
  nfet #(2, 10000) q5(1'b0, ndf0, df0);
  nfet #(3, 1000, 3) q6(1'b0, field_in0, t1);
  nfet #(3, 1000, 3) q7(t1, df_wr, ndf0);
  nfet #(3, 1000, 3) q8(1'b0, nrst, t3);
  nfet #(3, 1000, 3) q9(t3, df0, ndf0);

  wire wrp;
  nfet #(2) q10(1'b0, nwrp, wrp);

  wire t5, t6, t7, if0, nif0;
  nfet #(1, 10000) q11(1'b0, ndf0, t6);
  nfet #(1, 10000) q12(t6, wrp, if0);
  nfet #(1, 10000) q13(1'b0, nif0, if0);
  nfet #(2, 1000, 3) q14(1'b0, df0, t5);
  nfet #(2, 1000, 3) q15(t5, wrp, nif0);
  nfet #(2, 1000, 3) q16(1'b0, nrst, t7);
  nfet #(2, 1000, 3) q17(t7, if0, nif0);

  wire use_df, t8;
  nfet #(2) q18(1'b0, nderef, use_df);
  nfet #(2) q19(1'b0, nstate_load, t8);
  nfet #(2) q20(t8, nstate_exec, use_df);

  wire use_if;
  nfet q21(1'b0, use_df, use_if);

  wire t9;
  nfet q22(1'b0, use_df, t9);
  nfet q23(t9, ndf0, abus12);

  wire t10;
  nfet q24(1'b0, use_if, t10);
  nfet q25(t10, nif0, abus12);

endmodule
