module UART_TX_TOP(
input  wire       clk, rstn, 
input  wire [7:0] P_DATA,
input  wire       data_valid,
input  wire       par_typ, par_en,

output wire        TX_OUT,
output wire        busy
);

wire       ser_done, ser_en;
wire [1:0] mux_sel;
wire       ser_data;
wire       par_bit;
wire       start_bit;
wire       stop_bit;

assign start_bit = 1'b0;
assign stop_bit = 1'b1;

fsm_uart_tx U0(
.clk(clk), 
.rstn(rstn), 
.data_valid(data_valid),
.par_en(par_en),
.ser_done(ser_done),
.ser_en(ser_en), 
.mux_sel(mux_sel), 
.busy(busy)
);

tx_mux U1(
.clk(clk),
.rst(rstn),
.mux_sel(mux_sel),
.start_bit(start_bit), 
.stop_bit(stop_bit), 
.ser_data(ser_data), 
.par_bit(par_bit),
.TX_OUT(TX_OUT) 
);

parity_calc U2(
.clk(clk),
.rst(rstn),
.P_DATA(P_DATA),
.data_valid(data_valid),
.busy(busy),
.par_typ(par_typ),
.par_en(par_en),
.par_bit(par_bit)
);

ser U3(
.clk(clk),
.rstn(rstn),
.P_DATA(P_DATA),
.data_valid(data_valid),
.busy(busy),
.ser_en(ser_en),
.ser_done(ser_done),
.ser_data(ser_data) 
);
endmodule