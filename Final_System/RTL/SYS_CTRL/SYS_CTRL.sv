module SYS_CTRL(

input  wire        CLK,
input  wire        RST,
//input from UART_RX
input  wire [7:0]  RX_P_DATA,
input  wire        RX_D_VLD,
//input from RegFile
input  wire [7:0]  RdData,
input  wire        RdData_Valid,
//input from ALU
input  wire [15:0] ALU_OUT,
input  wire        OUT_Valid,

output reg         ALU_EN,
output reg  [3:0]  ALU_FUN,
output reg         CLK_EN, //clock gate enable

output reg  [3:0]  Address,
output reg         WrEn,
output reg         RdEn,
output reg  [7:0]  WrData,

output reg  [7:0]  TX_P_DATA,
output reg         TX_D_VLD,
output reg         clk_div_en
);

typedef enum bit [3:0] {
        CMD              = 4'b0000,
		RF_Wr_Add        = 4'b0001,
		RF_Wr_Data       = 4'b0011,
		RF_Rd_Add        = 4'b0010,
		RF_Rd_Data       = 4'b0110, 
		Opar_A           = 4'b0111, 
		Opar_B           = 4'b0101,
		wtiting_Alu_fun  = 4'b0100,
		alu_out_2nd_byte = 4'b1100
 } state;

reg [3:0] Address_mid;  

/* curent and next state decleration */
state curent_state, next_state;

/* state transition logic */
always @(posedge CLK or negedge RST) begin
	if(!RST)
		curent_state <= CMD;
	else
		curent_state <= next_state;
end 

/* next_state and output logic */
always @(*) begin

	ALU_EN      = 1'b0;
	ALU_FUN     = 4'b0;
	CLK_EN      = 1'b0;
	Address_mid = 4'b0;
	WrEn        = 1'b0;
	RdEn        = 1'b0;
	WrData      = 8'b0;
	TX_P_DATA   = 8'b0;
	TX_D_VLD    = 1'b0;
	clk_div_en  = 1'b1;
	next_state  = curent_state;
	
	case(curent_state)
	CMD: begin
		if(RX_D_VLD) begin
			if(RX_P_DATA == 8'haa)
				next_state = RF_Wr_Add;
			else if(RX_P_DATA == 8'hbb)
				next_state = RF_Rd_Add;
			else if(RX_P_DATA == 8'hcc) begin
				next_state = Opar_A;
				Address_mid = 'b0;
			end else if(RX_P_DATA == 8'hdd) begin
				next_state = wtiting_Alu_fun;
				CLK_EN  = 1'b1;
			end	
		end
	end
	
	RF_Wr_Add: begin
		if(RX_D_VLD) begin
			Address_mid = RX_P_DATA[3:0];
			next_state = RF_Wr_Data;
		end	
	end
	
	RF_Wr_Data: begin
		if(RX_D_VLD) begin
			WrEn   = 1'b1;
			WrData = RX_P_DATA;
			next_state = CMD;
		end
	end
	RF_Rd_Add: begin
		if(RX_D_VLD) begin
			Address_mid = RX_P_DATA[3:0];
			next_state = RF_Rd_Data;
	   end
	end
	RF_Rd_Data: begin
		RdEn        = 1'b1;
		if (RdData_Valid) begin
			TX_P_DATA   = RdData;
			TX_D_VLD    = 1'b1;
			next_state  = CMD; 
		end else
			TX_D_VLD    = 1'b0; 
	end
	Opar_A: begin
		if(RX_D_VLD) begin
			WrEn   = 1'b1;
			WrData = RX_P_DATA;
			next_state = Opar_B;
			Address_mid = 'b1;
		end
	end
	Opar_B: begin
		if(RX_D_VLD) begin
			WrEn   = 1'b1;
			WrData = RX_P_DATA;
			next_state = wtiting_Alu_fun;
		end
	end
	wtiting_Alu_fun: begin
		CLK_EN  = 1'b1;
		
		if(RX_D_VLD) begin
		    ALU_EN  = 1'b1;
			ALU_FUN   = RX_P_DATA[3:0];
		end
		
		if (OUT_Valid) begin
			TX_P_DATA   = ALU_OUT[7:0];
            TX_D_VLD    = 1'b1;
			if(RX_P_DATA[3:0] == 4'b0010) /*multiplication operation*/
				next_state = alu_out_2nd_byte;
			else
				next_state = CMD;	
		end else
				TX_D_VLD    = 1'b0;
	end
	alu_out_2nd_byte:begin
		CLK_EN    = 1'b1;
		ALU_FUN   = 4'b0010;
		ALU_EN    = 1'b1;
		if (OUT_Valid) begin
			TX_P_DATA   = ALU_OUT[15:8];
			TX_D_VLD    = 1'b1;
			next_state  = CMD;
		end
	end
	default: begin
		next_state = CMD;
	end	
	endcase
end

/* Address retention logic */
always @(posedge CLK or negedge RST) begin
    if (!RST)
        Address <= 4'b0;
     else if ((curent_state == CMD ||curent_state == RF_Wr_Add || curent_state == RF_Rd_Add || curent_state == Opar_A || curent_state == Opar_B) && RX_D_VLD)
        Address <= Address_mid;
end
endmodule