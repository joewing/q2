
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
  input wire wrs,
  input wire sin,
  output wire aout,
  output wire sout,
  output wire xout,
  output wire pout
);

  reg a;
  always @(posedge wra) begin
    a <= ain;
  end
  assign dbus = rda ? a : 1'bz;
  assign aout = a;

  reg x;
  always @(posedge wrx) begin
    case ({xin_zero, xin_shift, xin_p, xin_dbus})
      4'b1000:  x <= 0;
      4'b0100:  x <= xshift;
      4'b0010:  x <= p;
      4'b0001:  x <= dbus;
    endcase
  end
  assign abus = rdx ? x : 1'bz;
  assign xout = x;

  reg p;
  always @(posedge incp_clk or posedge wrp or posedge rst) begin
    if (rst) begin
      p <= sw;
    end else if (wrp) begin
      p <= x;
    end else if (incp_clk) begin
      p <= ~p;
    end
  end
  assign abus = rdp ? p : 1'bz;
  assign pout = p;

  reg s;
  always @(posedge wrs or posedge rst) begin
    s <= rst ? 1'b0 : sin;
  end
  assign sout = s;

  assign dbus = dep ? sw : 1'bz;

endmodule
