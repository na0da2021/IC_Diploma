module parity_check(
input  wire       clk,
input  wire       rstn,
input  wire       enable,
input  wire       parity_type,
input  wire       sampled_bit, //to compare
input  wire [7:0] P_DATA,      //to calculate
input  wire [5:0] prescale,
input  wire [5:0] edge_count,
input  wire [3:0] bit_count,

output reg        parity_error
);

reg calc_par_bit;
 /*==========calculated_parity_bit==========*/
always @(*) begin
	case({enable, parity_type})
		2'b00, 2'b01: calc_par_bit = 0;
		2'b10: calc_par_bit = ^P_DATA; //even_parity
		2'b11: calc_par_bit = ~^P_DATA; //odd_parity
	endcase
end

always @(posedge clk or negedge rstn) begin
	if(!rstn) begin
		parity_error <= 0;
	end else begin
		if (enable && (edge_count == ((prescale >> 1) + 2)))
			if (sampled_bit != calc_par_bit)
				parity_error <= 1;
			else
				parity_error <= 0;	
		else
			if(bit_count == 'd1/* data state*/)	
				parity_error <= 0;
	end	
end

endmodule