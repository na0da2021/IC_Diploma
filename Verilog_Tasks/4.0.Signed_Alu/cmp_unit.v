module cmp_unit#(
	parameter In_Data_Width = 8, 
              cmp_out_width = 2
)(   
    input  wire  [In_Data_Width - 1 : 0]   A,
    input  wire  [In_Data_Width - 1 : 0]   B,
    input  wire                            clk,
    input  wire                            rst,
    input  wire                            cmp_enable,
    input  wire  [1:0]                     Alu_fun,
    output reg   [cmp_out_width - 1 : 0]   cmp_out,  
    output reg                             cmp_flag 
);

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            cmp_out  <= 'b0;
            cmp_flag <= 1'b0;
        end else begin
            if (cmp_enable) begin
                cmp_flag <= 1'b1;	  
                case (Alu_fun)
                    2'b00: begin
						cmp_out  <= 'b0;
					end
                    2'b01: begin
						if (A == B)
							cmp_out  <= 'b1;
						else
                            cmp_out  <= 'b0;						
					end
                    2'b10: begin
						if (A > B)
							cmp_out  <= 'b10;
						else
                            cmp_out  <= 'b0;		
					end
                    2'b11: begin
						if (A < B)
							cmp_out  <= 'b11;
						else
                            cmp_out  <= 'b0;		
					end
                endcase
            end else begin
                cmp_flag <= 1'b0;
                cmp_out  <= 'b0;
            end
        end 
    end
							 
endmodule