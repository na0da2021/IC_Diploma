module logic_unit#(
	parameter In_Data_Width = 8, 
              logic_out_width = In_Data_Width
)(   
    input  wire  [In_Data_Width - 1 : 0]   A,
    input  wire  [In_Data_Width - 1 : 0]   B,
    input  wire                            clk,
    input  wire                            rst,
    input  wire                            logic_enable,
    input  wire  [1:0]                     Alu_fun,
    output reg   [logic_out_width - 1 : 0] logic_out,  
    output reg                             logic_flag 
);

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            logic_out  <= 'b0;
            logic_flag <= 1'b0;
        end else begin
            if (logic_enable) begin
                logic_flag <= 1'b1;	  
                case (Alu_fun)
                    2'b00: logic_out <=   A & B;
                    2'b01: logic_out <=   A | B;
                    2'b10: logic_out <= ~(A & B);
                    2'b11: logic_out <= ~(A | B);
                endcase
            end else begin
                logic_flag <= 1'b0;
                logic_out  <= 'b0;
            end
        end 
    end
							 
endmodule