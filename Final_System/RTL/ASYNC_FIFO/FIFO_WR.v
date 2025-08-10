module FIFO_WR #(parameter address_width = 3)(
input  wire                          w_inc,
input  wire                          w_clk,
input  wire                          wrst_n,
input  wire  [address_width : 0]     wq2_rptr,

output reg   [address_width : 0]     wptr,
output wire  [address_width - 1 : 0] waddr,
output wire                          wfull
);

reg [address_width : 0] waddr_intermid;
integer i;
//wire wfull_c;

always @(posedge w_clk or negedge wrst_n) begin
	if (!wrst_n) begin
		waddr_intermid  <= 4'b0;
	end else begin
		if (w_inc && !wfull)
			waddr_intermid <= waddr_intermid + 4'b001;
	end
end
/*------------------ waddr_logic ------------------*/
assign waddr = waddr_intermid[address_width - 1 : 0 ];

/*------------ wptr_logic(gray encoding) ----------*/
always @ (*) begin
	wptr[address_width] = waddr_intermid[address_width];
	for(i = address_width - 1 ; i >= 0; i = i - 1 ) begin	
		wptr[i] = waddr_intermid[i] ^ waddr_intermid[i + 1];
	end
end

/*------------------ wfull_logic ------------------*/
assign wfull =((wptr[address_width : address_width - 1] == ~(wq2_rptr[address_width:address_width - 1])) && (wptr[address_width - 2 : 0] == wq2_rptr[address_width - 2 : 0]))? 1'b1 : 1'b0;
/*
always @(posedge w_clk or negedge wrst_n) begin
	if (!wrst_n) begin
		wfull <= 1'b0;
	end else begin
		wfull <= wfull_c;
	end
end
*/
endmodule