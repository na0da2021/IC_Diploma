`timescale 1ns/1ps
module tb_uart_tx();

reg       clk, rstn;
reg [7:0] P_DATA;
reg       data_valid;
reg       par_typ, par_en;

wire      TX_OUT;
wire      busy;

reg parity_bit;
/*============ parameters ============*/
localparam Clock_period = 5.0; // 5ns ~ 200MHZ

/*============ module instantiation ============*/

uart_tx DUT(
.clk(clk),
.rstn(rstn),
.P_DATA(P_DATA),
.data_valid(data_valid),
.par_typ(par_typ),
.par_en(par_en),
.TX_OUT(TX_OUT),
.busy(busy)
);

/*============ Clock Generation ============*/
always #(Clock_period/2) clk = ~clk;

/*============ Intial block ============*/
initial
begin
initialize();
reset();
$display("test case 1 ===enable even parity===");
configure(8'b1001_1100, 1, 0); //enable even parity
start_bit_test;
parity_bit_calc(1, 0, 8'b1001_1100,parity_bit);
check_data(8'b1001_1100, parity_bit, 1);
$display("test case 2 ===enable odd parity===");
configure(8'b1001_1100, 1, 1); //enable odd parity
start_bit_test;
parity_bit_calc(1, 1, 8'b1001_1100, parity_bit);
check_data(8'b1001_1100, parity_bit, 1);
$display("test case 3 ===disable parity===");
configure(8'b1001_1100, 0, 0); //disable parity
start_bit_test;
parity_bit_calc(0, 0, 8'b1001_1100, parity_bit);
check_data(8'b1001_1100, parity_bit, 0);
$display("test case 4 ===check neglecting new P_DATA while processing===");
configure(8'b1001_1100, 0, 0); //disable parity
start_bit_test;
parity_bit_calc(0, 0, 8'b1001_1100, parity_bit);
P_DATA = 8'b_1100_0011;
check_data(8'b1001_1100, parity_bit, 0);
$stop;
end

/*============ Tasks ============*/

task initialize;
 begin
    clk    = 0;
	data_valid = 0;
 end
endtask
/*===============================*/
task reset;
 begin
 rstn  = 'b0; //negedge of rstn
 #(Clock_period);
 rstn  = 'b1; 
 end
endtask 
/*===============================*/
task configure;
input [7:0] parallel_Data;
input par_enable, par_type;
 begin
    par_typ = par_type;
	par_en  = par_enable;
	P_DATA  = parallel_Data;
 end
endtask 
/*===============================*/
task start_bit_test;
 begin
	#(Clock_period);
	data_valid = 1;
	#(Clock_period);
	if (TX_OUT == 0 && busy == 1)
		$display("start bit detected as expected and equals to %b, busy_signal = %b ", TX_OUT, busy);
	else
		$display("start bit failed to be detected as expected and equals to %b, busy_signal = %b ", TX_OUT, busy);	
 end
endtask

/*===============================*/
task parity_bit_calc;
input        parity_enable, parity_type;
input  [7:0] parallel_Data;	
output       parity_bit;
begin
   if (parity_enable) begin
    case(parity_type)
		0: parity_bit  = ^parallel_Data;
		1: parity_bit  = ~^parallel_Data; 
	endcase
   end
   else
	parity_bit = 0;
end
endtask
/*===============================*/

task check_data;
 input [7:0] parallel_Data;
 input       parity_bit;
 input       par_enable;
 
 integer i ;
 reg    [10:1] gener_out ;

 begin
  data_valid = 0;
  gener_out = 10'b0; // Clear gener_out before use
  if (!par_enable) begin
	for(i = 1; i < 10; i = i + 1)
   begin
    #(Clock_period) gener_out[i] = TX_OUT ;
   end
   if(gener_out[9:1] == { 1'b1, parallel_Data}) 
    begin
     $display("Test Case succeeded, gener_out = %b", gener_out[9:1]);
    end
   else
    begin
     $display("Test Case failed, gener_out = %b", gener_out[9:1]);
    end
  end else if (par_enable) begin
	for(i = 1; i < 11; i = i + 1)
   begin
    #(Clock_period) gener_out[i] = TX_OUT ;
   end
   if(gener_out[10:1] == {1'b1, parity_bit, parallel_Data}) 
    begin
     $display("Test Case succeeded, gener_out = %b", gener_out[10:1]);
    end
   else
    begin
     $display("Test Case failed, gener_out = %b", gener_out[10:1]);
    end
  end
 end
endtask

endmodule