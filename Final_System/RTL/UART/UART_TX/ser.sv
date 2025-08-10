module ser(
input  wire       clk, rstn,
input  wire [7:0] P_DATA,
input  wire       data_valid, busy, 
input  wire       ser_en,
output wire       ser_done,
output wire       ser_data 
);

reg [7:0] saved_data;
always @(posedge clk or negedge rstn) begin
	if (!rstn)
		saved_data <= 8'b11111111;
	else begin
		if (data_valid && !busy)
			saved_data <= P_DATA;
	end			
end


reg [2:0] cnt;
always @(posedge clk or negedge rstn) begin
	if (!rstn) begin
	    cnt       <='d0;
	end else begin
		if (ser_en) begin
			cnt   <= cnt + 'd1;
  
		end else
			cnt   <= 'd0;
    end		
end

assign ser_done = (cnt == 'd7)? 1'b1 : 1'b0;
assign ser_data = (ser_en)? saved_data[cnt] : 1'b1;

endmodule
