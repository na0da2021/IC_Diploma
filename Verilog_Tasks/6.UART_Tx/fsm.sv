module fsm(
input  wire      clk, 
input  wire      rstn, 
input  wire      data_valid,
input  wire      par_en,
input  wire      ser_done,
output reg       ser_en, 
output reg [1:0] mux_sel, 
output reg       busy
);

/* mux_sel possible values */
localparam [1:0] I0 = 2'b00,
                 I1 = 2'b01,
				 I2 = 2'b10,
				 I3 = 2'b11;

/* states encoding */	
typedef enum bit [2:0] {
        IDLE   = 3'b000,
		START  = 3'b001,
		DATA   = 3'b011,
		PARITY = 3'b010,
		STOP   = 3'b110
 } state;		

/* curent and next state decleration */
state curent_state, next_state;

/* state transition logic */
always @(posedge clk or negedge rstn) begin
	if(!rstn)
		curent_state <= IDLE;
	else
		curent_state <= next_state;
end	 

/* next_state logic and output logic */
always @(*) 
begin
ser_en       = 0 ; 
mux_sel      = I1; //stop_bit (default output equal 1 in case of no transmission) 
busy         = 0 ;
next_state   = curent_state;
	case(curent_state)
	IDLE: begin
		if (data_valid)
		    begin
				next_state = START;
			end
		else
			begin
				next_state = IDLE;
			end
	end
	
	START: begin
		mux_sel = I0;
		busy    = 1;
		next_state = DATA;
		//ser_en  = 1;
	end
	
	DATA: begin
		busy    = 1;
		ser_en  = 1;
		mux_sel = I2;
		if (ser_done && par_en)
			begin
				next_state = PARITY;
				ser_en = 0;
			end	
		else if (ser_done && !par_en)
			begin
				next_state = STOP;
				ser_en = 0;
			end	
		else 
			begin
				next_state = DATA;
			end	
	end
	
	PARITY: begin
		busy    = 1;
		mux_sel = I3;
		next_state = STOP;
		
	end
	STOP: begin
	    busy    = 1;
		mux_sel = I1;
		next_state = IDLE;
	end
	default: begin
		ser_en     = 0 ; 
        mux_sel    = I1; 
        busy       = 0 ;
        next_state = IDLE;
	end	
	
	endcase
end
endmodule

