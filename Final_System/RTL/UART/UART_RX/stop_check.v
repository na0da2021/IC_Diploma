module stop_check(
input  wire       clk,
input  wire       rstn,
input  wire       enable,
input  wire       sampled_bit,
input  wire [5:0] prescale,
input  wire [5:0] edge_count,
input  wire [3:0] bit_count,

output reg        stop_error
);

always @(posedge clk or negedge rstn) begin
	if(!rstn) begin
		stop_error <= 0;
	end else begin
		if (enable && (edge_count == ((prescale >> 1) + 2)))
			stop_error <= ~sampled_bit;
		else
			if(bit_count == 'd1/* data state*/)
				stop_error <= 0;	
	end
	
end

endmodule