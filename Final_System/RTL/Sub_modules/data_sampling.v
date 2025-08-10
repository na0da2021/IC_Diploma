module data_sampling(
input  wire       clk,
input  wire       rstn,
input  wire [5:0] prescale,
input  wire       RX_IN,   //serial data_in
input  wire       enable,
input  wire [5:0] edge_count,
  
output reg        sampled_bit
);

wire [5:0] centre, 
           centre_plus_one,
		   centre_minus_one;
		   
reg [2:0] oversamples;		   

assign centre = (prescale >> 1);
assign centre_plus_one  = centre + 6'd1;
assign centre_minus_one = centre - 6'd1;
/*========== oversamples logic ===========*/
always @(posedge clk or negedge rstn) begin
	if(!rstn) begin
		oversamples <= 3'b111;
	end else begin
		if (enable) begin
			if(edge_count == centre_minus_one)
				oversamples[0] <= RX_IN;
			else if (edge_count == centre)
				oversamples[1] <= RX_IN;
			else if (edge_count == centre_plus_one)
				oversamples[2] <= RX_IN;	
			end	
	end			
end

/*========== sampled_bit logic ===========*/
always @(posedge clk or negedge rstn) begin
	if(!rstn)
		sampled_bit <= 1;
	else begin
		if (enable && (edge_count >= centre_plus_one)) begin
			case(oversamples)
				3'b000: sampled_bit <= 0;
				
				3'b001: sampled_bit <= 0;
				
				3'b010: sampled_bit <= 0;
				
				3'b011: sampled_bit <= 1;
				
				3'b100: sampled_bit <= 0;
				
				3'b101: sampled_bit <= 1;
				
				3'b110: sampled_bit <= 1;
				
				3'b111: sampled_bit <= 1;
			endcase
		end	
	end
end

endmodule