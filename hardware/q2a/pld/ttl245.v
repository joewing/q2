
module ttl245(
  input wire ab,
  input wire nce,
  inout [7:0] a,
  inout [7:0] b
);

  assign a = (~nce & ~ab) ? b : 8'bz;
  assign b = (~nce & ab)  ? a : 8'bz;

endmodule
