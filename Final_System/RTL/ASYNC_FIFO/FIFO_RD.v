module FIFO_RD #(parameter address_width = 3)(
input  wire                          r_inc,
input  wire                          r_clk,
input  wire                          rrst_n,
input  wire  [address_width : 0]     rq2_wptr,

output reg   [address_width : 0]     rptr,
output wire  [address_width - 1 : 0] raddr,
output wire                          rempty
);
reg [address_width : 0] raddr_intermid;
integer i;
//wire rempty_c;

always @(posedge r_clk or negedge rrst_n) begin
	if (!rrst_n) begin
		raddr_intermid  <= 4'b0;
	end else begin
		if (r_inc && !rempty)
			raddr_intermid <= raddr_intermid + 4'b001;
	end
end

/*------------------ raddr_logic ------------------*/
assign raddr = raddr_intermid[address_width - 1 : 0 ];

/*------------ rptr_logic(gray encoding) ----------*/
always @ (*) begin
	rptr[address_width] = raddr_intermid[address_width];
	for(i = address_width - 1 ; i >= 0; i = i - 1 ) begin	
		rptr[i] = raddr_intermid[i] ^ raddr_intermid[i + 1];
	end
end

/*------------------ rempty_logic ------------------*/
assign rempty =(rptr == rq2_wptr)? 1'b1 : 1'b0;
/*
always @(posedge r_clk or negedge rrst_n) begin
	if (!rrst_n) begin
		rempty <= 1'b1;
	end else begin
		rempty <= rempty_c;
	end
end
*/
endmodule