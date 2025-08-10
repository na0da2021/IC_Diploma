module edge_bit_counter(
input  wire        clk, 
input  wire        rstn,
input  wire [5:0]  prescale,
input  wire        enable,

output reg  [5:0]  edge_count, // #edges = prescale
output reg  [3:0]  bit_count   // frame_length(start, 8_bit data, parity, stop) ==> 11 (4 bit)
);

wire   complete_bit;
assign complete_bit = (edge_count == prescale - 1);

/*=========== edge_count logic ============*/
always @(posedge clk or negedge rstn) begin
	if(!rstn) begin
		edge_count <= 6'b0;
	end else begin
		if (enable && edge_count < prescale - 1) begin
			edge_count <= edge_count + 6'd1;
		end else begin
			edge_count <= 6'b0;
		end
	end
	
end

/*=========== bit_count logic ============*/
always @(posedge clk or negedge rstn) begin
	if(!rstn) begin
		bit_count  <= 4'b0;
	end else begin
		if (enable) begin
			if (complete_bit)
				bit_count  <= bit_count +  4'd1;
		end else begin
		    bit_count  <= 4'b0;
		end
	end
	
end

endmodule