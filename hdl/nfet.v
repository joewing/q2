
module nfet(
  input wire source,
  input wire gate,
  output wire drain
);

  assign (strong0, weak1) drain = !gate | source;

endmodule
