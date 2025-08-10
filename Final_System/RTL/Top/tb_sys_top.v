`timescale 1ns/1ps
module tb_sys_top();

reg   UART_CLK;
reg   REF_CLK;

reg   RST_N;
reg   UART_RX_IN;

wire  UART_TX_O;
wire  parity_error;
wire  framing_error;
wire  ASYNC_FIFO_full;

/*============ parameters ============*/
localparam REF_Clock_period   = 20,        //50MHZ 
           UART_Clock_period  = 271.267,   //3.6864 MHz(115.2KHz * 32)
		   UART_TX_CLK_Period = 8680.556;  //115.2KHz
/*============ module instantiation ============*/
SYS_TOP DUT (
.RST_N(RST_N),
.UART_CLK(UART_CLK),
.REF_CLK(REF_CLK),
.UART_RX_IN(UART_RX_IN),
.UART_TX_O(UART_TX_O),
.parity_error(parity_error),
.framing_error(framing_error),
.ASYNC_FIFO_full(ASYNC_FIFO_full)
);
/*============ Clocks Generation ============*/
always #(REF_Clock_period/2.000)  REF_CLK  = ~REF_CLK;
always #(UART_Clock_period/2.000) UART_CLK = ~UART_CLK;


/*============ Intial block ============*/
initial
begin
initialize();
reset();
#(REF_Clock_period);

/*================================= Register File COMMANDS ===============================*/

$display("sending Register File Write command to write 0x6f in address 0xa");
/*sending Register File Write command*/
data_transmit(11'b_0_0101_0101_0_1);  //{start, data(cmd0xAA), even_parity_bit, stop}
#(REF_Clock_period);

/*sending Register File Write address*/
data_transmit(11'b_0_0101_0000_0_1);  //{start, data(address), even_parity_bit, stop}
#(REF_Clock_period);

/*sending Register File Write data*/
data_transmit(11'b_0_1111_0110_0_1);  //{start, data(data), even_parity_bit, stop}
#(REF_Clock_period);

$display("sending another Register File Write command to write 0xff in address 0xf");
/*sending ANOTHER Register File Write command*/
data_transmit(11'b_0_0101_0101_0_1);  //{start, data(cmd0xAA), even_parity_bit, stop}
#(REF_Clock_period);

/*sending Register File Write address*/
data_transmit(11'b_0_1111_0000_0_1);  //{start, data(address), even_parity_bit, stop}
#(REF_Clock_period);

/*sending Register File Write data*/
data_transmit(11'b_0_1111_1111_0_1);  //{start, data(data), even_parity_bit, stop}
#(REF_Clock_period);

$display("sending another Register File Read command to Read data from address 0xa which should be 0x6f");
/*sending Register File read command*/
data_transmit(11'b_0_1101_1101_0_1);  //{start, data(cmd0xBB), even_parity_bit, stop}
#(REF_Clock_period);

/*sending Register File Write address*/
data_transmit(11'b_0_0101_0000_0_1);  //{start, data(address), even_parity_bit, stop}
#(REF_Clock_period);
#(25 * UART_TX_CLK_Period);

/*================================= ALU OPERATION COMMANDS ===============================*/

$display("sending ALU Operation command to calculate A('d64)+B('d4) which should be ('d68)");
/*sending command 0xCC */
data_transmit(11'b_0_0011_0011_0_1);  //{start, data(cmd0xCC), even_parity_bit, stop}
#(REF_Clock_period);

/*sending Operand A */
data_transmit(11'b_0_00000010_1_1);  //{start, Operand(A = 64), even_parity_bit, stop}
#(REF_Clock_period);

/*sending Operand B */
data_transmit(11'b_0_00100000_1_1);  //{start, Operand(B = 4), even_parity_bit, stop}
#(REF_Clock_period);

/*sending ALU Function */
data_transmit(11'b_0_0000_0000_0_1);  //{start, FUNC(4'b0000), even_parity_bit, stop}
#(4 * REF_Clock_period);

#(25 * UART_TX_CLK_Period);

/*============================ ALU OPERATION ON EXISTING OPERANDS COMMANDS ==========================*/

$display("sending ALU Operation command to calculate A('d64) * B('d4) which should be ('d256) TO SEE SENDING 2 Successive frames");
/*sending command 0xCC */
data_transmit(11'b_0_1011_1011_0_1);  //{start, data(cmd0xDD), even_parity_bit, stop}
#(REF_Clock_period);

/*sending ALU Function */
data_transmit(11'b_0_0100_0000_1_1);  //{start, FUNC(4'b0010), even_parity_bit, stop}
#(4 * REF_Clock_period);

#(50 * UART_TX_CLK_Period);

/*============================ ALU OPERATION ON EXISTING OPERANDS COMMANDS ==========================*/

$display("sending ALU Operation command to calculate A('d64) / B('d4) which should be ('d16)");
/*sending command 0xCC */
data_transmit(11'b_0_1011_1011_0_1);  //{start, data(cmd0xDD), even_parity_bit, stop}
#(REF_Clock_period);

/*sending ALU Function */
data_transmit(11'b_0_1100_0000_0_1);  //{start, FUNC(4'b0011), even_parity_bit, stop}
#(4 * REF_Clock_period);

#(50 * UART_TX_CLK_Period);

/*============================ ALU OPERATION ON EXISTING OPERANDS COMMANDS ==========================*/

$display("sending ALU Operation command to calculate A('d64) | B('d4) which should be ('d68)");
/*sending command 0xCC */
data_transmit(11'b_0_1011_1011_0_1);  //{start, data(cmd0xDD), even_parity_bit, stop}
#(REF_Clock_period);

/*sending ALU Function */
data_transmit(11'b_0_1010_0000_0_1);  //{start, FUNC(4'b0101), even_parity_bit, stop}
#(4 * REF_Clock_period);

#(50 * UART_TX_CLK_Period);
$stop;
end

/*============ Tasks ============*/
task initialize;
 begin
    UART_CLK    = 0;
	REF_CLK     = 0;
	UART_RX_IN  = 1;
 end
endtask
/*===============================*/
task reset;
 begin
 RST_N  = 'b0;
 #(4 * REF_Clock_period);
 RST_N  = 'b1; 
 end
endtask 
/*===============================*/
task data_transmit;
	input [10:0] data;
	integer i;
 begin
		for(i = 10; i >= 0; i = i - 1)
		begin
			#(UART_TX_CLK_Period) UART_RX_IN =  data[i];
		end
 end
endtask

endmodule