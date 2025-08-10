module DF_SYNC # (parameter addr_width = 3)(
input  wire clk, 
input  wire rst,
input  wire [addr_width : 0] ptr,
output reg  [addr_width : 0] synch_ptr
);

reg [addr_width : 0] meta_flop;

always @(posedge clk or negedge rst) begin
	if (!rst) begin
		meta_flop <= 0;
		synch_ptr <= 0;
	end else begin
		meta_flop <= ptr;
		synch_ptr <= meta_flop; 
	end
end

endmodule