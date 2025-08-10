module start_check(
input  wire       clk,
input  wire       rstn,
input  wire       enable,
input  wire       sampled_bit,
input  wire [5:0] prescale,
input  wire [5:0] edge_count,

output reg        start_glitch
);

always @(posedge clk or negedge rstn) begin
	if(!rstn) begin
		start_glitch <= 0;
	end else begin
		if (enable && (edge_count == ((prescale >> 1) + 2)))
			start_glitch <= sampled_bit;
		else	
			start_glitch <= 0;
	end
	
end
endmodule