module des(
input  wire       clk,
input  wire       rstn,
input  wire       enable,
input  wire [5:0] prescale,
input  wire [5:0] edge_count,
input  wire       sampled_bit,

output reg  [7:0] P_DATA
);

always @(posedge clk or negedge rstn) begin
	if(!rstn) begin
		P_DATA <= 8'b1111_1111;
	end else begin
		if (enable && (edge_count == ((prescale >> 1) + 2))) begin
			P_DATA[7:0] <= {sampled_bit, P_DATA[7:1]}; 
		end 
		//if not enable, keep the parallel data 
	end
	
end

endmodule