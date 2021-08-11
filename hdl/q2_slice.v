
module q2_slice(
  input wire nrst,
  input wire dep,
  inout wire dbus,
  inout wire abus,
  input wire nsw,
  input wire wra,
  input wire rda,
  input wire ain,
  input wire incp_clk,
  input wire nwrp,
  input wire rdp,
  input wire wrx,
  input wire rdx,
  input wire nxin,
  input wire xin_zero,
  input wire xin_shift,
  input wire xin_p,
  input wire xin_dbus,
  input wire wrs,
  input wire sin,
  output wire aout,
  output wire sout,
  output wire nsout,
  output wire xout,
  output wire nxout,
  output wire pout,
  inout wire io
);

  wire naout;
  dff areg(
    .clk(wra),
    .d(ain),
    .set(1'b0),
    .clr(1'b0),
    .q(aout),
    .nq(naout)
  );
  wire at1;
  nfet #(3, 10000) aq1(at1, naout, dbus);
  nfet #(3, 10000) aq2(1'b0, rda, at1);

  wire nextx, xt1, xt2, xt3, xt4, xt5;
  nfet #(1, 10000) xq1(1'b0, xin_zero, nextx);
  nfet #(1, 10000) xq2(xt1, xin_p, nextx);
  nfet #(1, 10000) xq3(1'b0, npout, xt1);
  nfet #(1, 10000) xq4(xt2, xin_shift, nextx);
  nfet #(1, 10000) xq5(1'b0, nxin, xt2);
  nfet #(1, 10000) xq6(xt3, xin_dbus, nextx);
  nfet #(1, 10000) xq7(1'b0, xt4, xt3);
  nfet #(1, 10000) xq8(1'b0, dbus, xt4);
  dff xreg(
    .clk(wrx),
    .d(nextx),
    .set(1'b0),
    .clr(1'b0),
    .q(xout),
    .nq(nxout)
  );
  nfet #(3, 10000) xq9(xt5, nxout, abus);
  nfet #(3, 10000) xq10(1'b0, rdx, xt5);
  nfet #(1, 10000) xq11(1'b0, nxout, io);

  wire npout;
  wire pset, pclr;
  wire pt1, pt2, pt3, pt4;
  nfet pq1(pt1, nwrp, pset);
  nfet pq2(pt1, nxout, pset);
  nfet pq3(1'b0, nrst, pt1);
  nfet pq4(1'b0, nsw, pt1);
  nfet pq5(pt2, nwrp, pclr);
  nfet pq6(pt2, xout, pclr);
  nfet pq7(1'b0, nrst, pt2);
  nfet pq8(1'b0, pt3, pt2);
  nfet pq9(1'b0, nsw, pt3);
  dff preg(
    .clk(incp_clk),
    .d(npout),
    .set(pset),
    .clr(pclr),
    .q(pout),
    .nq(npout)
  );
  nfet #(3, 10000) pq10(pt4, rdp, abus);
  nfet #(3, 10000) pq11(1'b0, npout, pt4);

  dff sreg(
    .clk(wrs),
    .d(sin),
    .set(1'b0),
    .clr(clrs),
    .q(sout),
    .nq(nsout)
  );
  wire clrs;
  nfet sq1(1'b0, nrst, clrs);

  wire dt1;
  nfet #(3, 10000) dq1(dt1, dep, dbus);
  nfet #(3, 10000) dq2(1'b0, nsw, dt1);

endmodule
