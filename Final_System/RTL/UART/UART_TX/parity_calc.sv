module parity_calc(
input  wire       clk, rst,
input  wire [7:0] P_DATA,
input  wire       data_valid, busy,
input  wire       par_en, par_typ,
output reg        par_bit
);

reg [7:0] saved_data;
//assign  saved_data = (data_valid && !busy)? P_DATA : 8'b1111_1111;

//isolate input 
always @ (posedge clk or negedge rst)
 begin
  if(!rst)
   begin
    saved_data <= 'b0 ;
   end
  else if(data_valid && !busy)
   begin
    saved_data <= P_DATA ;
   end 
 end

always @(*) begin
	if (par_en) begin
		case(par_typ) 
		1'b0: par_bit = ^saved_data;            /*even parity*/
		
		1'b1: par_bit = ~^saved_data;           /*odd parity*/
		endcase
	end else begin
		par_bit = 1'b0;
	end
end

endmodule