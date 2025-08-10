module arithmetic_unit#(
    parameter In_Data_Width = 8, 
              arith_out_width = In_Data_Width + In_Data_Width //to handle the size of output from multiplication operation 
)(
    input  wire signed [In_Data_Width - 1 : 0]   A,
    input  wire signed [In_Data_Width - 1 : 0]   B,
    input  wire                                  clk,
    input  wire                                  rst,
    input  wire                                  arith_enable,
    input  wire        [1:0]                     Alu_fun,
    output reg  signed [arith_out_width - 1 : 0] arith_out,  
    output reg                                   arith_flag 
);

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            arith_out  <= 'b0;
            arith_flag <= 1'b0;
        end else begin
            if (arith_enable) begin
                arith_flag <= 1'b1;	  
                case (Alu_fun)
                    2'b00: arith_out <= A + B;
                    2'b01: arith_out <= A - B;
                    2'b10: arith_out <= A * B;
                    2'b11: arith_out <= A / B;
                endcase
            end else begin
                arith_flag <= 1'b0;
                arith_out  <= 'b0;
            end
        end 
    end
endmodule