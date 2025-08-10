module register_file # (
    parameter ADDR_WIDTH = 3,
    parameter MEM_DEPTH = 8,
    parameter MEM_WIDTH = 16)
(
    input  wire                   WrEn, RdEn,
    input  wire                   clk, rst,
    input  wire  [ADDR_WIDTH-1:0] address,
    input  wire  [MEM_WIDTH-1:0]  WrData, 
    output reg   [MEM_WIDTH-1:0]  RdData

);

    // 2D Array
    reg [MEM_WIDTH-1:0] memory [MEM_DEPTH-1:0];        

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
		//clear all registers
		    memory[0] <= 'b0;
            memory[1] <= 'b0;			
            memory[2] <= 'b0;			
            memory[3] <= 'b0;			
            memory[4] <= 'b0;			
            memory[5] <= 'b0;			
            memory[6] <= 'b0;			
            memory[7] <= 'b0;		
        //clear RdData  
			RdData <= 'b0;
        end else begin
            if (WrEn && !RdEn) begin
                memory[address] <= WrData;
            end else if (RdEn && !WrEn) begin
                RdData <= memory[address];
            end
        end
    end
endmodule