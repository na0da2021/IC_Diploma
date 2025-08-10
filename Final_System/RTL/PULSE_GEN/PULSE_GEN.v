
/////////////////////////////////////////////////////////////
///////////////////// bit synchronizer //////////////////////
/////////////////////////////////////////////////////////////

module PULSE_GEN 
(
input    wire                      clk,
input    wire                      rst,
input    wire                      lvl_sig,
output   wire                      pulse_sig
);


reg              rcv_flop  ,  // A register to capture the level signal
                 pls_flop  ;  // A register to store the previous state of rcv_flop.
					 
					 
always @(posedge clk or negedge rst)
 begin
  if(!rst)      // active low
   begin
    rcv_flop <= 1'b0 ;
    pls_flop <= 1'b0 ;	
   end
  else
   begin
    rcv_flop <= lvl_sig;   
    pls_flop <= rcv_flop;
   end  
 end
 
//----------------- pulse generator --------------------

assign pulse_sig = rcv_flop && !pls_flop ; //This condition indicates a rising edge in the lvl_sig, thus generating a pulse.


endmodule