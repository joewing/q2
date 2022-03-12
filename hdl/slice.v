
module slice(
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
  output wire npout,
  inout wire io
);

  areg a(
    .wra(wra),
    .rda(rda),
    .ain(ain),
    .aout(aout),
    .dbus(dbus)
  );

  xreg x(
    .wrx(wrx),
    .rdx(rdx),
    .xiz(xin_zero),
    .xip(xin_p),
    .xis(xin_shift),
    .xid(xin_dbus),
    .np(npout),
    .nxin(nxin),
    .xout(xout),
    .nxout(nxout),
    .dbus(dbus),
    .abus(abus),
    .io(io)
  );

  preg p(
    .nrst(nrst),
    .incp_clk(incp_clk),
    .rdp(rdp),
    .nwrp(nwrp),
    .xout(xout),
    .nxout(nxout),
    .nsw(nsw),
    .npout(npout),
    .abus(abus)
  );

  // o2 fanout:     3
  // no2 fanout:    2
  // o1 fanout:     6
  // no1 fanout:    2
  // o0 fanout:     4
  // no0 fanout:    6
  // deref fanout:  1
  // nderef fanout: 0
  // f fanout:      4
  // nf fanout:     1
  // s3 fanout:     1
  // ns3 fanout:    1
  // s2 fanout:     2
  // ns2 fanout:    2
  // s1 fanout:     1
  // ns1 fanout:    4
  // s0 fanout:     2
  // ns0 fanout:    5
  // cdiv fanout:   1
  // ncdiv fanout:  2
  // nscl fanout:   1
  // nsda fanout:   1
  wire clrs;
  dff #(6, 6) sreg(
    .clk(wrs),
    .d(sin),
    .set(1'b0),
    .clr(clrs),
    .q(sout),
    .nq(nsout)
  );
  nfet q1(1'b0, nrst, clrs);

  wire t1;
  nfet #(5, 10000) q2(t1, dep, dbus);
  nfet #(5, 10000) q3(1'b0, nsw, t1);

endmodule
