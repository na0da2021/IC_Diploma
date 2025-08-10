module CLK_DIV(
input wire i_ref_clk,
input wire i_rstn,
input wire i_clk_en,
input wire [7:0] i_divide_ratio,

output reg gen_clk
);

reg        divided_clk;
reg  [7:0] cnt ;
wire [7:0] mid_value;
wire       ClK_DIV_EN; 

assign ClK_DIV_EN = i_clk_en && ( i_divide_ratio != 0) && ( i_divide_ratio != 1);
assign mid_value = i_divide_ratio >> 1;

always @(posedge i_ref_clk or negedge i_rstn) begin
	if (!i_rstn) begin
		cnt <= 'd0;
		divided_clk <= 0;
    end else begin
		if(ClK_DIV_EN) begin
			if (cnt < mid_value)
				divided_clk <= 1'b1;
			else
				divided_clk <= 1'b0;
				
			//counter increment
			if (cnt < i_divide_ratio - 1)
				cnt <= cnt + 1'd1;
			else	
				cnt <= 1'b0;	
		end
	end
end

always @(*) begin	
	if (ClK_DIV_EN)
		gen_clk = divided_clk;
	else
		gen_clk = i_ref_clk;
end

endmodule
