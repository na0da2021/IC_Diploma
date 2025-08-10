module FIFO_TOP #(parameter data_width = 8, address_width = 3)(
input  wire                          w_clk,
input  wire                          wrst_n,
input  wire                          w_inc,
input  wire [data_width - 1 : 0]     w_data,

input  wire                          r_clk,
input  wire                          rrst_n,
input  wire                          r_inc,


output wire                          wfull,
output wire                          rempty,
output wire [data_width - 1 : 0]     r_data
);

wire [address_width - 1 : 0] w_addr, r_addr;
wire [address_width : 0]     wq2_rptr, rq2_wptr, rptr, wptr; 

FIFO_WR #(.address_width(address_width)) FIFO_WR (
.w_inc(w_inc),
.w_clk(w_clk),
.wrst_n(wrst_n),
.wq2_rptr(wq2_rptr),
.wptr(wptr),
.waddr(w_addr),
.wfull(wfull)
);

FIFO_RD #(.address_width(address_width)) FIFO_RD(
.r_inc(r_inc),
.r_clk(r_clk),
.rrst_n(rrst_n),
.rq2_wptr(rq2_wptr),
.rptr(rptr),
.raddr(r_addr),
.rempty(rempty)
);

DF_SYNC # (.addr_width(address_width)) W2R (
.clk(r_clk), 
.rst(rrst_n),
.ptr(wptr),
.synch_ptr(rq2_wptr)
);

DF_SYNC # (.addr_width(address_width)) R2W (
.clk(w_clk), 
.rst(wrst_n),
.ptr(rptr),
.synch_ptr(wq2_rptr)
);

FIFO_mem #(.data_width(data_width), .address_width(address_width)) FIFO_mem (
.w_data(w_data),
.w_clk(w_clk), 
.w_clk_en(w_inc && !wfull),
.w_addr(w_addr),
.r_addr(r_addr),
.r_data(r_data)
);

endmodule