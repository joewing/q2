
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
  output wire pout
);

  reg a;
  always @(posedge wra) begin
    #0.7 a <= ain;
  end
  assign #1.4 dbus = rda ? a : 1'bz;
  assign #1.4 aout = a;

  reg x;
  always @(posedge wrx) begin
    #0.7 x <= 1;
    case ({xin_zero, xin_shift, xin_p, xin_dbus})
      4'b1000:  x <= 0;
      4'b0100:  x <= xshift;
      4'b0010:  x <= p;
      4'b0001:  x <= dbus;
    endcase
  end
  assign #1.4 abus = rdx ? x : 1'bz;
  assign #1.4 xout = x;

  reg p;
  always @(posedge incp_clk or posedge wrp or posedge rst) begin
    if (rst) begin
      #0.7 p <= sw;
    end else if (wrp) begin
      #0.7 p <= x;
    end else if (incp_clk) begin
      #0.7 p <= ~p;
    end
  end
  assign #1.4 abus = rdp ? p : 1'bz;
  assign #1.4 pout = p;

  reg s;
  always @(posedge wrs or posedge rsts) begin
    #0.7 s <= rsts ? 1'b0 : sin;
  end
  assign #0.7 sout = s;

  assign dbus = dep ? sw : 1'bz;

endmodule
