module FIFO_mem #(parameter data_width = 8, address_width = 3)(
input  wire [data_width - 1 : 0]     w_data,
input  wire                          w_clk, w_clk_en,
input  wire [address_width - 1 : 0]  w_addr,
input  wire [address_width - 1 : 0]  r_addr,

output wire [data_width - 1 : 0]     r_data
);

localparam depth = 1 << address_width;
reg [data_width - 1 :0] mem [depth - 1 : 0];

/*------------writing logic-------------*/
always @(posedge w_clk) begin
	if(w_clk_en) begin
		mem[w_addr] <= 	w_data;
	end
end 
/*------------reading logic-------------*/
assign r_data = mem[r_addr];

endmodule