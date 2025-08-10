module UART_RX_TOP(
input  wire        clk, rstn,
input  wire        RX_IN,
input  wire [5:0]  prescale,
input  wire        parity_enable,
input  wire        parity_type,

output wire [7:0]  P_DATA,
output wire        parity_error,
output wire        stop_error,
output wire        data_valid      
);

wire 		parity_chk_en, 
			strt_chk_en, 
			stp_chk_en, 
			des_en, 
			edge_bit_count_en, 
	        data_sample_en;
	 
wire [5:0]  edge_count;
wire [3:0]  bit_count;

wire        start_glitch;
wire        sampled_bit;
	 
FSM_UART_RX FSM(
.clk(clk),
.rstn(rstn),
.parity_enable(parity_enable),
.RX_IN(RX_IN), 
.prescale(prescale),
.edge_count(edge_count), 
.bit_count(bit_count),
.stop_error(stop_error),
.parity_error(parity_error),
.start_glitch(start_glitch),      
.data_sample_en(data_sample_en),
.edge_bit_count_en(edge_bit_count_en),
.des_en(des_en),
.stp_chk_en(stp_chk_en),
.strt_chk_en(strt_chk_en),
.parity_chk_en(parity_chk_en),
.data_valid(data_valid)
);

edge_bit_counter edge_bit_counter(
.clk(clk), 
.rstn(rstn),
.prescale(prescale),
.enable(edge_bit_count_en),
.edge_count(edge_count),
.bit_count(bit_count)
);

data_sampling data_sampling(
.clk(clk),
.rstn(rstn),
.prescale(prescale),
.RX_IN(RX_IN),
.enable(data_sample_en),
.edge_count(edge_count),  
.sampled_bit(sampled_bit)
);

des des(
.clk(clk),
.rstn(rstn),
.enable(des_en),
.prescale(prescale),
.edge_count(edge_count),
.sampled_bit(sampled_bit),
.P_DATA(P_DATA)
);

start_check strt_chk(
.clk(clk),
.rstn(rstn),
.enable(strt_chk_en),
.sampled_bit(sampled_bit),
.prescale(prescale),
.edge_count(edge_count),
.start_glitch(start_glitch)
);

stop_check stp_chk(
.clk(clk),
.rstn(rstn),
.enable(stp_chk_en),
.sampled_bit(sampled_bit),
.prescale(prescale),
.edge_count(edge_count),
.bit_count(bit_count),
.stop_error(stop_error)
);

parity_check par_chk(
.clk(clk),
.rstn(rstn),
.enable(parity_chk_en),
.parity_type(parity_type),
.sampled_bit(sampled_bit), 
.prescale(prescale),
.edge_count(edge_count),
.bit_count(bit_count),
.P_DATA(P_DATA), 
.parity_error(parity_error)
);

endmodule