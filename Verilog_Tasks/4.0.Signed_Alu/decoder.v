module decoder(
input  wire [1:0] Alu_fun,
output reg        arith_enable,
output reg        logic_enable,
output reg        cmp_enable,
output reg        shift_enable
);

always @(*) begin
	arith_enable = 1'b0;
	logic_enable = 1'b0;
	cmp_enable   = 1'b0;
	shift_enable = 1'b0;
	case(Alu_fun)
		2'b00: arith_enable = 1'b1;
		2'b01: logic_enable = 1'b1;
		2'b10: cmp_enable   = 1'b1;
		2'b11: shift_enable = 1'b1;
	endcase
end

endmodule