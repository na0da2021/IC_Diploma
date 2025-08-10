module shift_unit#(
	parameter In_Data_Width = 8, 
              shift_out_width = In_Data_Width
)(   
    input  wire  [In_Data_Width - 1 : 0]   A,
    input  wire  [In_Data_Width - 1 : 0]   B,
    input  wire                            clk,
    input  wire                            rst,
    input  wire                            shift_enable,
    input  wire  [1:0]                     Alu_fun,
    output reg   [shift_out_width - 1 : 0] shift_out,  
    output reg                             shift_flag 
);

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            shift_out  <= 'b0;
            shift_flag <= 1'b0;
        end else begin
            if (shift_enable) begin
                shift_flag <= 1'b1;	  
                case (Alu_fun)
                    2'b00: begin
						shift_out  <= A >> 1;
					end
                    2'b01: begin
						shift_out  <= A << 1;						
					end
                    2'b10: begin
						shift_out  <= B >> 1;	
					end
                    2'b11: begin
						shift_out  <= B << 1;		
					end
                endcase
            end else begin
                shift_flag <= 1'b0;
                shift_out  <= 'b0;
            end
        end 
    end
							 
endmodule