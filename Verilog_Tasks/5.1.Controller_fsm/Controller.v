//moore Fsm 
module Controller(
input clk, rst,
input activate,
input up_max, 
input dn_max,
output reg up_M,
output reg dn_M
);

// FSM Encoding
localparam [2:0] IDLE  = 3'b001,
                 Mv_Up = 3'b010,
		         Mv_Dn = 3'b100;
		   
//current and next state decleration
reg [2:0] current_state, next_state;

//state_transition		   
always @(posedge clk or negedge rst)
 begin
  if(!rst)
   begin
     current_state <= IDLE ;
   end
  else
   begin
     current_state <= next_state ;
   end
 end

//next_state_logic
always @(*)
 begin
  case(current_state)	 
  IDLE: begin
	if (activate) begin
		if (up_max && !dn_max )
			next_state = Mv_Dn;
		else if(!up_max && dn_max)
			next_state = Mv_Up;
		else
			next_state = IDLE;
	end else begin
		next_state = IDLE;
	end
  end
  
  Mv_Up: begin
	if (up_max)
		next_state = IDLE;
	else 
		next_state = Mv_Up;
  end
  
  Mv_Dn: begin
	if (dn_max)
		next_state = IDLE;
	else 
		next_state = Mv_Dn;
  end
  
  default:begin
	next_state = IDLE;
  end
  endcase
end

//Output_logic
always @(*)
 begin
  case(current_state)	 
    IDLE: begin
	up_M = 0;
	dn_M = 0;
	end	
	Mv_Up:begin
	up_M = 1;
	dn_M = 0;
	end	
	Mv_Dn:begin
	up_M = 0;
	dn_M = 1;
	end	
	default:begin
	up_M = 0;
	dn_M = 0;
	end	
  endcase
end
 
endmodule