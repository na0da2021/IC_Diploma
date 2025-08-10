`timescale 1ns/1ps

module TB_RST_SYNC();

reg   clk_tb; 
reg   rst_tb;
wire  sync_rst_tb;
/*-------- parameters --------*/
parameter clk_period = 5;
/*-------- module instantiation --------*/
RST_SYNC DUT (
.clk(clk_tb), 
.rst(rst_tb),
.sync_rst(sync_rst_tb)
);

/*-------- destination clock generator--------*/
always #(clk_period / 2.000) clk_tb = !clk_tb;

/*-------- Intial block --------*/
initial begin 
initialize_and_reset();

$display("first time deasserting rst");
deassert_and_assert_reset();
#(2*clk_period)
$display("2nd time deasserting rst");
deassert_and_assert_reset();

$stop;
end

/*============ Tasks ============*/
task initialize_and_reset;
 begin
    clk_tb    = 0;	
	rst_tb    = 0;
	#(2 * clk_period);
 end
endtask
/*===============================*/
task deassert_and_assert_reset;
 begin
	rst_tb    = 1;
	@(posedge sync_rst_tb)
	$display("deasserting rst get stabled");
	#(4 * clk_period);
	rst_tb    = 0;
	#(2 * clk_period);
 end
endtask 
endmodule
