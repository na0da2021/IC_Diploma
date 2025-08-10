module SYS_TOP 
(
 input   wire                          RST_N,
 input   wire                          UART_CLK,
 input   wire                          REF_CLK,
 input   wire                          UART_RX_IN,
 output  wire                          UART_TX_O,
 output  wire                          parity_error,
 output  wire                          framing_error,
//output  wire                          ASYNC_FIFO_full,

 // number of chains (4)
 input   wire           [3:0]          SI,
 input   wire                          SE,
 input   wire                          scan_clk,
 input   wire                          scan_rst,
 input   wire                          test_mode,
 output  wire           [3:0]          SO 
);


wire       RST_N_REF, 
           RST_N_UART; 
		   
wire [7:0] UART_P_DATA, 
           UART_P_DATA_sync;

wire       data_valid,
           data_valid_sync;

wire       UART_TX_CLK,
           UART_RX_CLK;	

wire [7:0] REG0,
           REG1,
           REG2,
           REG3;
		   
wire [7:0] ASYNC_FIFO_RD_Data;		   
wire       FIFO_empty,
           busy_lvl,
		   busy_pulse;
		   
wire       wr_en,
           rd_en,
           rd_data_valid;	

wire [3:0] addr;
wire       ASYNC_FIFO_full;

wire [7:0] wr_data,
           rd_data;	

wire [15:0] ALU_OUT;
wire        ALU_OUT_VALID;  		   

wire [7:0] ASYNC_FIFO_wr_Data;
wire       wr_inc,
           clk_div_en;
		
wire       ALU_EN,
		   ALU_CLK;
		   
wire [3:0] ALU_FUN;	

wire [7:0] i_divide_ratio_RX;	

wire       CLK_EN;

// for dft_insertion

wire       REF_CLK_scan,
           UART_CLK_scan,
           muxed_UART_TX_CLK,
           muxed_UART_RX_CLK,
           rst_scan,
           ref_rst_scan,
           uart_rst_scan; 
           
		

///********************************************************///
///////////////////////// DFT MUXes //////////////////////////
///********************************************************///

//REF_CLK 
mux2X1  U0_mux2X1 (
.IN_0(REF_CLK), 
.IN_1(scan_clk),
.SEL(test_mode),
.OUT(REF_CLK_scan) 
 );  
//UART_CLK 
mux2X1  U1_mux2X1 (
.IN_0(UART_CLK), 
.IN_1(scan_clk),
.SEL(test_mode),
.OUT(UART_CLK_scan) 
 );   


// Muxing output clock from clk_devider
//RX_CLK
mux2X1  U2_mux2X1 (
.IN_0(UART_RX_CLK), 
.IN_1(scan_clk),
.SEL(test_mode),
.OUT(muxed_UART_RX_CLK) 
 );  

//TX_CLK
mux2X1  U3_mux2X1 (
.IN_0(UART_TX_CLK), 
.IN_1(scan_clk),
.SEL(test_mode),
.OUT(muxed_UART_TX_CLK) 
 ); 

// Muxing resets
mux2X1  U4_mux2X1 (
.IN_0(RST_N), 
.IN_1(scan_rst),
.SEL(test_mode),
.OUT(rst_scan) 
 );  

mux2X1  U5_mux2X1 (
.IN_0(RST_N_REF), 
.IN_1(scan_rst),
.SEL(test_mode),
.OUT(ref_rst_scan) 
 );  

mux2X1  U6_mux2X1 (
.IN_0(RST_N_UART), 
.IN_1(scan_rst),
.SEL(test_mode),
.OUT(uart_rst_scan) 
 );  
///********************************************************///
//////////////////// Reset synchronizers /////////////////////
///********************************************************///
RST_SYNC UART_CLK_domain_RST_SYNC (
.clk(UART_CLK_scan), 
.rst(rst_scan),
.sync_rst(RST_N_UART)
);

RST_SYNC REF_CLK_domain_RST_SYNC (
.clk(REF_CLK_scan), 
.rst(rst_scan),
.sync_rst(RST_N_REF)
);


///********************************************************///
///////////////////// Data Synchronizers /////////////////////
///********************************************************///
DATA_SYNCH # (.bus_width(8)) DATA_SYNCH
(
.clk(REF_CLK_scan),
.rst(ref_rst_scan),
.unsync_bus(UART_P_DATA),
.bus_enable(data_valid),

.sync_bus(UART_P_DATA_sync),
.enable_pulse(data_valid_sync)
);
///********************************************************///
///////////////////////// Async FIFO /////////////////////////
///********************************************************///
FIFO_TOP #(.data_width(8), 
           .address_width(3)) ASYNC_FIFO (
.w_clk(REF_CLK_scan),
.wrst_n(ref_rst_scan),
.w_inc(wr_inc),
.w_data(ASYNC_FIFO_wr_Data),
.r_clk(muxed_UART_TX_CLK),
.rrst_n(uart_rst_scan),
.r_inc(busy_pulse),
.wfull(ASYNC_FIFO_full),
.rempty(FIFO_empty),
.r_data(ASYNC_FIFO_RD_Data)
);
///********************************************************///
//////////////////////// Pulse Generator /////////////////////
///********************************************************///
PULSE_GEN PULSE_GEN(
.clk(muxed_UART_TX_CLK),
.rst(uart_rst_scan),
.lvl_sig(busy_lvl),
.pulse_sig(busy_pulse)
);
///********************************************************///
//////////// Clock Divider for UART_TX Clock /////////////////
///********************************************************///
CLK_DIV CLK_DIV_UART_TX(
.i_ref_clk(UART_CLK_scan),
.i_rstn(uart_rst_scan),
.i_clk_en(clk_div_en),
.i_divide_ratio(REG3),
.gen_clk(UART_TX_CLK)
);
///********************************************************///
/////////////////////// Custom Mux Clock /////////////////////
///********************************************************///
CLKDIV_MUX #(.WIDTH(8)) CLKDIV_MUX (
.IN(REG2[7:2]),
.OUT(i_divide_ratio_RX)
);
///********************************************************///
//////////// Clock Divider for UART_RX Clock /////////////////
///********************************************************///
CLK_DIV CLK_DIV_UART_RX(
.i_ref_clk(UART_CLK_scan),
.i_rstn(uart_rst_scan),
.i_clk_en(clk_div_en),
.i_divide_ratio(i_divide_ratio_RX),
.gen_clk(UART_RX_CLK)
);
///********************************************************///
/////////////////////////// UART /////////////////////////////
///********************************************************///
UART_RX_TOP UART_RX(
.clk(muxed_UART_RX_CLK), 
.rstn(uart_rst_scan),
.RX_IN(UART_RX_IN),
.prescale(REG2[7:2]),
.parity_enable(REG2[0]),
.parity_type(REG2[1]),

.P_DATA(UART_P_DATA),
.parity_error(parity_error),
.stop_error(framing_error),
.data_valid(data_valid)      
);

UART_TX_TOP UART_TX(
.clk(muxed_UART_TX_CLK), 
.rstn(uart_rst_scan), 
.P_DATA(ASYNC_FIFO_RD_Data),
.data_valid(!FIFO_empty),
.par_typ(REG2[1]), 
.par_en(REG2[0]),

.TX_OUT(UART_TX_O),
.busy(busy_lvl)
);
///********************************************************///
//////////////////// System Controller ///////////////////////
///********************************************************///
SYS_CTRL SYS_CTRL(
.CLK(REF_CLK_scan),
.RST(ref_rst_scan),
.RX_P_DATA(UART_P_DATA_sync),
.RX_D_VLD(data_valid_sync),
.RdData(rd_data),
.RdData_Valid(rd_data_valid),
.ALU_OUT(ALU_OUT),
.OUT_Valid(ALU_OUT_VALID),
.ALU_EN(ALU_EN),
.ALU_FUN(ALU_FUN),
.CLK_EN(CLK_EN),
.Address(addr),
.WrEn(wr_en),
.RdEn(rd_en),
.WrData(wr_data),
.TX_P_DATA(ASYNC_FIFO_wr_Data),
.TX_D_VLD(wr_inc),
.clk_div_en(clk_div_en)
);
///********************************************************///
/////////////////////// Register File ////////////////////////
///********************************************************///
RegFile #(.WIDTH(8), 
          .DEPTH(16), 
		  .ADDR(4)) reg_file(
.CLK(REF_CLK_scan),
.RST(ref_rst_scan),
.WrEn(wr_en),
.RdEn(rd_en),
.Address(addr),
.WrData(wr_data),
.RdData(rd_data),
.RdData_VLD(rd_data_valid),
.REG0(REG0),
.REG1(REG1),
.REG2(REG2),
.REG3(REG3)
);	 
///********************************************************///
//////////////////////////// ALU /////////////////////////////
///********************************************************///
ALU #(.OPER_WIDTH(8),
      .OUT_WIDTH(16)) ALU(
.A(REG0), 
.B(REG1),
.EN(ALU_EN),
.ALU_FUN(ALU_FUN),
.CLK(ALU_CLK),
.RST(ref_rst_scan),  
.ALU_OUT(ALU_OUT),
.OUT_VALID(ALU_OUT_VALID)  
);
///********************************************************///
///////////////////////// Clock Gating ///////////////////////
///********************************************************///
CLK_GATE CLK_GATE (
.CLK_EN(CLK_EN || test_mode),
.CLK(REF_CLK_scan),
.GATED_CLK(ALU_CLK)
);

endmodule
 
