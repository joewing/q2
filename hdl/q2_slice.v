
`include "dff.v"

module q2_slice(
  input wire rst,
  input wire dep,
  inout wire dbus,
  inout wire abus,
  input wire sw,
  input wire wra,
  input wire rda,
  input wire ain,
  input wire incp_clk,
  input wire wrp,
  input wire rdp,
  input wire wrx,
  input wire rdx,
  input wire xshift,
  input wire xin_zero,
  input wire xin_shift,
  input wire xin_p,
  input wire xin_dbus,
  input wire rsts,
  input wire wrs,
  input wire sin,
  output wire aout,
  output wire sout,
  output wire xout,
  output wire pout,
  inout wire io
);

  dff areg(
    .clk(wra),
    .d(ain),
    .set(1'b0),
    .clr(1'b0),
    .q(aout)
  );
  assign (strong0, weak1) dbus = ~(rda & ~aout);

  dff xreg(
    .clk(wrx),
    .d(
      ~(
          xin_zero
        | (xin_p & ~pout)
        | (xin_shift & ~xshift)
        | (xin_dbus & ~dbus)
      )
    ),
    .set(1'b0),
    .clr(1'b0),
    .q(xout)
  );
  assign (strong0, weak1) abus = ~(rdx & ~xout);
  assign (strong0, weak1) io = xout;

  dff preg(
    .clk(incp_clk),
    .d(~pout),
    .set(~((~wrp | ~xout) & (~rst | ~sw))),
    .clr(~((~wrp | xout) & (~rst | sw))),
    .q(pout)
  );
  assign (strong0, weak1) abus = ~(rdp & ~pout);

  dff sreg(
    .clk(wrs),
    .d(sin),
    .set(1'b0),
    .clr(rsts),
    .q(sout)
  );

  assign (strong0, weak1) dbus = ~(dep & ~sw);

endmodule
