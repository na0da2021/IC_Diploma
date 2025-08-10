`timescale 1ns/1ps
module CLK_DIV_TB();
reg       i_ref_clk;
reg       i_rstn;
reg       i_clk_en;
reg [7:0] i_divide_ratio;
wire      gen_clk;

// clock_generation
always #2.5 i_ref_clk = ~i_ref_clk;

//module_instantiaion
CLK_DIV DUT(
 .i_ref_clk(i_ref_clk),
 .i_rstn(i_rstn),
 .i_clk_en(i_clk_en),
 .i_divide_ratio(i_divide_ratio),
 .gen_clk(gen_clk)
);

//initial block
initial begin
i_ref_clk = 0;
i_divide_ratio = 'd2;

i_clk_en = 0;
i_rstn = 0;
#50;

i_clk_en = 1;
i_rstn = 0;
#100;

i_rstn = 1;
i_clk_en = 0;
#100;

i_clk_en = 1;
#500;

i_divide_ratio = 'd3;
#500;

i_divide_ratio = 'd4;
#500;

i_divide_ratio = 'd5;
#500;

i_divide_ratio = 'd1;
#500;

i_divide_ratio = 'd0;
#500;
$stop;
end
endmodule