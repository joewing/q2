
module xreg(
  input wire wrx,
  input wire rdx,
  input wire xiz,
  input wire xip,
  input wire xis,
  input wire xid,
  input wire np,
  input wire nxin,
  output wire xout,
  output wire nxout,
  input wire dbus,
  inout wire abus,
  inout wire io
);

  // xout fanout: 4
  //  bit 0: 3 (alu) + 1 (p)
  //  bit 1: 1 (alu) + 1 (p)
  //  other: 0 (alu) + 1 (p)
  // nxout fanout: 4
  //  bit 0: 2 (local) + 1 (p) + 1 (flag)
  //  other: 2 (local) + 1 (p) + 1 (next)

  wire nextx, t1, t2, t3, t4, t5;
  nfet #(1, 10000) q1(1'b0, xiz, nextx);
  nfet #(1, 10000) q2(t1, xip, nextx);
  nfet #(1, 10000) q3(1'b0, np, t1);
  nfet #(1, 10000) q4(t2, xis, nextx);
  nfet #(1, 10000) q5(1'b0, nxin, t2);
  nfet #(1, 10000) q6(t3, xid, nextx);
  nfet #(1, 10000) q7(1'b0, t4, t3);
  nfet #(1, 10000) q8(1'b0, dbus, t4);
  dff #(4, 4) xreg(
    .clk(wrx),
    .d(nextx),
    .set(1'b0),
    .clr(1'b0),
    .q(xout),
    .nq(nxout)
  );
  nfet #(3, 10000) q9(t5, nxout, abus);
  nfet #(3, 10000) q10(1'b0, rdx, t5);
  nfet #(1, 10000) q11(1'b0, nxout, io);

endmodule
