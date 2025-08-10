`timescale 1ns/1ps

module TB_DATA_SYNC();

reg [7:0]  unsync_bus_tb;
reg        bus_enable_tb;
reg        clk_tb, rst_tb;

wire [7:0] sync_bus_tb;
wire       enable_pulse_tb;
/*-------- parameters --------*/
parameter clk_period = 5;
/*-------- module instantiation --------*/
DATA_SYNCH # (.bus_width(8)) DUT (
.unsync_bus(unsync_bus_tb),
.bus_enable(bus_enable_tb),
.clk(clk_tb), 
.rst(rst_tb),.sync_bus(sync_bus_tb),
.enable_pulse(enable_pulse_tb)
);

/*-------- destination clock generator--------*/
always #(clk_period / 2.000) clk_tb = !clk_tb;

/*-------- Intial block --------*/
initial begin 
initialize();
reset();
/*------- test Case 1 -------*/
$display("Test_Case1");
test(8'b10010011);

/*------- test Case 2 -------*/
$display("Test_Case2");
test(8'b11101011);
#(2*clk_period)
/*------- test Case 3 -------*/
$display("Test_Case3");
test(8'b00111000);

#(10 * clk_period);
$stop;
end

/*============ Tasks ============*/
task initialize;
 begin
    clk_tb    = 0;
	unsync_bus_tb = 8'b10101111; 
	bus_enable_tb = 0;	
 end
endtask
/*===============================*/
task reset;
 begin
	rst_tb    = 0;
	#(2 * clk_period);
    rst_tb    = 1;
 end
endtask 
/*===============================*/
task test; 
	input [7:0] data;
 begin
	#(1.5*clk_period);
	unsync_bus_tb = data;
    bus_enable_tb = 1;
	
	@(posedge enable_pulse_tb);
	bus_enable_tb = 0;
	$display("data ==> %b  get synchronous and went to destination domain" ,data);
 end
endtask 
endmodule
