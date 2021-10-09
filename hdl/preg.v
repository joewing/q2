
module preg(
  input wire nrst,
  input wire incp_clk,
  input wire rdp,
  input wire nwrp,
  input wire xout,
  input wire nxout,
  input wire nsw,
  output wire npout,
  inout wire abus
);

  // pout fanout: 0
  // npout fanout: 4
  //  bit 11: 2 (local)
  //  other:  2 (local) + 2 (next)

  wire pset, pclr;
  wire t1, t2, t3, t4;
  nfet q1(t1, nwrp, pset);
  nfet q2(t1, nxout, pset);
  nfet q3(1'b0, nrst, t1);
  nfet q4(1'b0, nsw, t1);
  nfet q5(t2, nwrp, pclr);
  nfet q6(t2, xout, pclr);
  nfet q7(1'b0, nrst, t2);
  nfet q8(1'b0, t3, t2);
  nfet q9(1'b0, nsw, t3);
  dff #(0, 4) preg(
    .clk(incp_clk),
    .d(npout),
    .set(pset),
    .clr(pclr),
    .nq(npout)
  );
  nfet #(3, 10000) pq10(t4, rdp, abus);
  nfet #(3, 10000) pq11(1'b0, npout, t4);

endmodule
