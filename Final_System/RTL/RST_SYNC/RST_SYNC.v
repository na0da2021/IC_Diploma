module RST_SYNC(
input  wire clk, 
input  wire rst,

output reg  sync_rst
);

reg meta_flop;

/* ACTIVE LOW RESET */
always @(posedge clk or negedge rst) begin
	if (!rst) begin
		meta_flop <= 1'b0;
		sync_rst  <= 1'b0;
	end else begin
		meta_flop <= 1'b1;
		sync_rst  <= meta_flop;	
	end
end

endmodule