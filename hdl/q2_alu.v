
module q2_alu(
  input wire a0,
  input wire x0,
  input wire x1,
  input wire f,
  input wire op3,
  input wire op4,
  output reg alu_out,
  output reg alu_cout
);

  wire alu_nor = ~(a0 | x0);

  wire t0 = ~(a0 & x0);
  wire t1 = ~(t0 & a0);
  wire t2 = ~(t0 & x0);
  wire t3 = ~(t1 & t2);

  wire t4 = ~(t3 & f);
  wire t6 = ~(t3 & t4);
  wire t7 = ~(f & t4);
  wire alu_sum = ~(t6 & t7);

  wire alu_carry = ~(t4 & t0);

  always @(*) begin
    case ({op4, op3})
      2'b00:  alu_out = x0;
      2'b01:  alu_out = alu_nor;
      2'b10:  alu_out = alu_sum;
      2'b11:  alu_out = x1;
    endcase
  end

  always @(*) begin
    case ({op4, op3})
      2'b00:  alu_cout = f & ~alu_out;
      2'b01:  alu_cout = f & ~alu_out;
      2'b10:  alu_cout = alu_carry;
      2'b11:  alu_cout = x0;
    endcase
  end

endmodule
