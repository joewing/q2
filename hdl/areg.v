
module areg(
  input wire wra,
  input wire rda,
  input wire ain,
  output wire aout,
  inout wire dbus
);

  // aout fanout: 2
  //  bit 0: 2 (alu)
  //  other: 1 (next)
  // naout fanout:  1

  wire naout;
  dff #(2, 1) areg(
    .clk(wra),
    .d(ain),
    .set(1'b0),
    .clr(1'b0),
    .q(aout),
    .nq(naout)
  );
  wire t1;
  nfet #(5, 10000, 5, 4) q1(t1, naout, dbus);
  nfet #(5, 10000, 5, 4) q2(1'b0, rda, t1);

endmodule
