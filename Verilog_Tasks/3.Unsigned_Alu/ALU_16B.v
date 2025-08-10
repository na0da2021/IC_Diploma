module ALU_16B(
input             clk,
input      [15:0] A, B,
input      [3:0]  ALU_FUN,
output reg [15:0] ALU_OUT,
output reg        carry_flag, arith_flag, logic_flag, cmp_flag, shift_flag
);
 
 reg [15:0] temp_out;
always @ (*) begin
  carry_flag = 1'b0;
  arith_flag = 1'b0;
  logic_flag = 1'b0;
  cmp_flag   = 1'b0;
  shift_flag = 1'b0;
 case(ALU_FUN)
  /*==== the arithmetic operations (Addition, Subtraction,Multiplication, division) ====*/
  //addition
  4'b0000: 
  begin
    arith_flag = 1'b1;
    {carry_flag, temp_out} = A + B;
  end
  //subtraction
  4'b0001: 
  begin
    arith_flag = 1'b1;  
    {carry_flag, temp_out} =  A - B;
  end
  //multiplication
  4'b0010: 
  begin
    arith_flag = 1'b1;  
    temp_out = A * B;
  end
  //division
  4'b0011: 
  begin
    arith_flag = 1'b1;  
    temp_out = A / B;
  end

  /*==== the Bolean operations (AND, OR, NAND, NOR, XOR, XNOR) ====*/
  //and
  4'b0100: 
  begin
    logic_flag = 1'b1;  
    temp_out = A & B;
  end
  //or
  4'b0101: 
  begin
    logic_flag = 1'b1;  
    temp_out =  A | B;
  end
  //nand
  4'b0110: 
  begin
    logic_flag = 1'b1;
    temp_out = ~(A & B);
  end
  //nor
  4'b0111: 
  begin
    logic_flag = 1'b1;
    temp_out = ~(A | B);
  end 
  //xor
  4'b1000: 
  begin
    logic_flag = 1'b1;
    temp_out = A ^ B;
  end  
  //xnor
  4'b1001: 
  begin
    logic_flag = 1'b1;
    temp_out = ~(A ^ B);
  end
  /*==== Comparison operations (Equal, Greater than, less than) ====*/
  //equality
  4'b1010: 
  begin
    cmp_flag = 1'b1;
    if (A == B) 
     temp_out = 16'b0000_0000_0000_0001;
    else  
     temp_out = 16'b0000_0000_0000_0000;
  end
  //greater than
  4'b1011: 
  begin
    cmp_flag = 1'b1;
    if (A > B) 
     temp_out = 16'b0000_0000_0000_0010;
    else  
     temp_out = 16'b0000_0000_0000_0000;
  end
  //less than
  4'b1100: 
  begin
    cmp_flag = 1'b1;
    if (A < B) 
     temp_out = 16'b0000_0000_0000_0011;
    else  
     temp_out = 16'b0000_0000_0000_0000;
  end
  /*==== shifting operations (shift right, shift left) ====*/
  //shift right
  4'b1101: 
  begin
    shift_flag = 1'b1;
    temp_out = A >> 1;
  end
  //shift left
  4'b1110: 
  begin
    shift_flag = 1'b1;
    temp_out = A << 1;
  end
  //Default Value
  default: temp_out = 16'b0000_0000_0000_0000;
 endcase
end // end always block

always @(posedge clk) 
 begin
    ALU_OUT <= temp_out;
 end 
 
endmodule
