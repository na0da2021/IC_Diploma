module tx_mux(
input  wire       clk, rst,
input  wire [1:0] mux_sel,
input  wire       start_bit, stop_bit, ser_data, par_bit,
output reg        TX_OUT 
);

reg mux_out;
/* mux_sel possible values */
localparam [1:0] I0 = 2'b00,
                 I1 = 2'b01,
				 I2 = 2'b10,
				 I3 = 2'b11;

always @(*) begin
	case(mux_sel)
	I0: mux_out = start_bit;
	I1: mux_out = stop_bit ;
	I2: mux_out = ser_data ;
	I3: mux_out = par_bit  ;
	endcase
end

//register mux output
always @ (posedge clk or negedge rst)
 begin
  if(!rst)
   begin
    TX_OUT <= 'b0 ;
   end
  else
   begin
    TX_OUT <= mux_out ;
   end 
 end

endmodule