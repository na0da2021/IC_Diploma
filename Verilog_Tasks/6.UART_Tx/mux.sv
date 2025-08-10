module mux(
input  wire [1:0] mux_sel,
input  wire start_bit, stop_bit, ser_data, par_bit,
output reg  TX_OUT 
);

/* mux_sel possible values */
localparam [1:0] I0 = 2'b00,
                 I1 = 2'b01,
				 I2 = 2'b10,
				 I3 = 2'b11;

always @(*) begin
	case(mux_sel)
	I0: TX_OUT = start_bit;
	I1: TX_OUT = stop_bit ;
	I2: TX_OUT = ser_data ;
	I3: TX_OUT = par_bit  ;
	endcase
end

endmodule