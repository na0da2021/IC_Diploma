module FSM_UART_RX(
input  wire        clk,
input  wire        rstn,
input  wire        parity_enable,
input  wire        RX_IN, 
input  wire [5:0]  prescale,
input  wire [5:0]  edge_count, 
input  wire [3:0]  bit_count,
input  wire        stop_error,
input  wire        parity_error,
input  wire        start_glitch,      

output reg         data_sample_en,
output reg         edge_bit_count_en,
output reg         des_en,
output reg         stp_chk_en,
output reg         strt_chk_en,
output reg         parity_chk_en,

output reg         data_valid
);

/* states encoding */	
typedef enum bit [2:0] {
        IDLE      = 3'b000,
		START     = 3'b001,
		DATA      = 3'b011,
		PARITY    = 3'b010,
		STOP      = 3'b110,
		ERROR_CHK = 3'b100
 } state;		

reg [5:0] check_edge;
assign check_edge = prescale - 6'd1;

/*
reg saved_parity_error;
reg saved_stop_error;
*/

/* curent and next state decleration */
state curent_state, next_state;

/* state transition logic */
always @(posedge clk or negedge rstn) begin
	if(!rstn)
		curent_state <= IDLE;
	else
		curent_state <= next_state;
end	 

/* next_state logic and output logic*/
always @(*) 
begin
    next_state 	= curent_state; 
	data_sample_en    = 0;
    edge_bit_count_en = 0;
	des_en            = 0;
	stp_chk_en        = 0;
	strt_chk_en       = 0;
	parity_chk_en     = 0;
	data_valid        = 0;
	
	case(curent_state)
	IDLE: begin
		//saved_parity_error = 0;
        //saved_stop_error   = 0;
		if (!RX_IN) begin 
			next_state =  START;
		end	else
			next_state =  IDLE;
	end
	
	START: begin
		//saved_parity_error = 0;
        //saved_stop_error   = 0;
		data_sample_en     = 1;
        edge_bit_count_en  = 1;
	    strt_chk_en        = 1;
		if ((bit_count == 'd0) && (edge_count == check_edge)) begin
			if(!start_glitch)
				next_state = DATA;
			else	
				next_state = IDLE;
		end
		
	end
	
	DATA: begin
	    //saved_parity_error = 0;
        //saved_stop_error   = 0;
		data_sample_en     = 1;
        edge_bit_count_en  = 1;
		des_en             = 1;
		if ((bit_count == 'd8) && (edge_count == check_edge)) begin
			if(parity_enable)
				next_state = PARITY;
			else
				next_state = STOP;
		end
	end
	
	PARITY: begin
        //saved_stop_error   = 0;
		data_sample_en     = 1;
        edge_bit_count_en  = 1;
		parity_chk_en      = 1;
		
		if ((bit_count == 'd9) && (edge_count == check_edge)) begin
		    //saved_parity_error = parity_error;
			next_state = STOP;
		end
	end
	
	STOP: begin
	    data_sample_en     = 1;
        edge_bit_count_en  = 1;
	    stp_chk_en         = 1;
	    if (parity_enable/* stop bit at index 10 */) begin
			if ((bit_count == 'd10) && (edge_count == check_edge)) begin
				//saved_stop_error = stop_error;
				next_state = ERROR_CHK;
			end
	    end else /* stop bit at index 9 */ begin
			if ((bit_count == 'd9) && (edge_count == check_edge)) begin
				//saved_stop_error = stop_error;
				next_state = ERROR_CHK;
			end
	    end
	   
	end
	ERROR_CHK: begin
		/*if (saved_parity_error || saved_stop_error)*/
		if (parity_error || stop_error)
			data_valid = 0;
		else
			data_valid = 1;
		
		if(!RX_IN)
			next_state = START;
		else
			next_state = IDLE;
			
	end
	default: begin
		next_state 		  = IDLE; 			
		data_sample_en    = 0;
		edge_bit_count_en = 0;
		des_en            = 0;
		stp_chk_en        = 0;
		strt_chk_en       = 0;
		parity_chk_en     = 0;
		data_valid        = 0;
	end	
	endcase
end

endmodule