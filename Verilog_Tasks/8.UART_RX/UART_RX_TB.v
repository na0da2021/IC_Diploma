`timescale 1ns/1ps

module UART_RX_TB();

reg        clk, rstn;
reg        RX_IN;
reg [5:0]  prescale;
reg        parity_enable;
reg        parity_type;

wire [7:0]   P_DATA;
wire         parity_error;
wire         stop_error;
wire         data_valid;

/*===================== parameters ====================*/
parameter clk_period_8prescale  = 1085.069,
          clk_period_16prescale = 542.594,
		  clk_period_32prescale = 271.297,
		  TX_CLK_period         = 8680.556;

/*====================== clk_gen =======================*/
always #(clk_period_32prescale / 2) clk = ~clk;
/*=============== UART_RX instantiation ================*/
top top(
.clk(clk), 
.rstn(rstn),
.RX_IN(RX_IN),
.prescale(prescale),
.parity_enable(parity_enable),
.parity_type(parity_type),

.P_DATA(P_DATA),
.parity_error(parity_error),
.stop_error(stop_error),
.data_valid(data_valid)     
);
/*===================== Intial block ======================*/
initial 
begin
initialize();
reset();
/*===============================*/
$display("Test_case#1, < even_parity_enabled >");
data_transmit(11'b00101101001, 1);
/*===============================*/
parity_enable = 1;
parity_type = 1; 
$display("Test_case#2, < odd_parity_enabled >");
data_transmit(11'b00101101011, 1);
/*===============================*/
parity_enable = 0;
$display("Test_case#3, < parity_desabled >");
data_transmit(11'b0_1111_0000_1_1, 0);       //last 1 in data is just padding
/*===============================*/
parity_enable = 1;
parity_type = 1;  //enable odd parity
$display("Test_case#4, < error_injected in parity_bit>");
data_with_parity_bit_error(11'b0_11110000_0_1); //error in parity_bit
/*===============================*/
parity_enable = 1;
parity_type = 0;  //enable even parity
$display("Test_case#5, < error_injected in stop_bit, while parity is enabled>");
data_with_stop_bit_error(11'b0_11110110_0_0, 1); //error in stop bit
/*===============================*/
parity_enable = 1;
parity_type = 0;  //enable even parity
$display("Test_case#6, < error_injected in parity_bit>");
data_with_parity_bit_error(11'b0_11110000_1_1); //error in parity_bit
/*===============================*/
parity_enable = 0;
$display("Test_case#7, < parity_desabled >");
data_transmit(11'b0_1111_0000_1_1, 0);       //last 1 in data is just padding
/*===============================*/
parity_enable = 0;
$display("Test_case#8, < error_injected in stop_bit, while parity disabled>");
data_with_stop_bit_error(11'b0_11110000_0_0, 0); //error in stop bit
#(2 * TX_CLK_period);
$stop;
end


/*============ Tasks ============*/

task initialize;
 begin
    clk    = 0;
	RX_IN  = 1;
	prescale = 32;
    parity_enable = 1;
    parity_type = 0;   //even_parity
	
 end
endtask
/*===============================*/
task reset;
 begin
 rstn  = 'b0; //negedge of rstn
 #(clk_period_32prescale);
 rstn  = 'b1; 
 end
endtask 
/*===============================*/
task data_transmit;
	input [10:0] data;
	input        parity_enable;
	
	integer i;
	
 begin
	if (parity_enable)/* 11 bits to be sent*/
		for(i = 10; i >= 0; i = i - 1)
		begin
			#(TX_CLK_period) RX_IN =  data[i];
		end
	else /*10 bits to be sent*/
		for(i = 10; i >= 1; i = i - 1)
			begin
			#(TX_CLK_period) RX_IN =  data[i];
		end
	@(posedge data_valid)
	if ((P_DATA[7] == data[2]) && (P_DATA[6] == data[3]) && (P_DATA[5] == data[4]) && (P_DATA[4] == data[5]) && (P_DATA[3] == data[6]) && (P_DATA[2] == data[7]) && (P_DATA[1] == data[8]) && (P_DATA[0] == data[9]))
		$display("Test_case passed");
	else
		$display("Test_case failed");
 end
endtask
/*===============================*/
task data_with_parity_bit_error;
	input [10:0] data;
	integer i;
 begin
		for(i = 10; i >= 1; i = i - 1) //transmit till parity_bit 
		begin
			#(TX_CLK_period) RX_IN =  data[i];
		end
	@(posedge parity_error)	
	$display("Test_case passed and data sent with error in parity_bit as expected");
	RX_IN =  1;
	#(2 * TX_CLK_period);
 end
endtask 
/*===============================*/
task data_with_stop_bit_error;
	input [10:0] data;
	input        parity_enable;
	integer i;
 begin
	#(2 * TX_CLK_period);
	if (parity_enable)/* 11 bits to be sent*/
		for(i = 10; i >= 0; i = i - 1)
		begin
			#(TX_CLK_period) RX_IN =  data[i];
		end
	else /*10 bits to be sent*/             
		for(i = 10; i >= 1; i = i - 1)
			begin
			#(TX_CLK_period) RX_IN =  data[i];
		end
	@(posedge stop_error)
		$display("Test_case passed with error in stop_bit as expected");
		RX_IN =  1;
		#(2 * TX_CLK_period);
		
 end
endtask 
endmodule