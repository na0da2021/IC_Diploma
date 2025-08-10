`timescale 1ns/1ps
module ALU_16B_TB();
reg        clk_tb;
reg [15:0] A_tb, B_tb;
reg [3:0]  ALU_FUN_tb;
wire[15:0] ALU_OUT_tb;
wire       carry_flag_tb, arith_flag_tb, logic_flag_tb, cmp_flag_tb, shift_flag_tb;
  
  //DUT Instantiation
  ALU_16B DUT(
   .clk(clk_tb),
   .A(A_tb),
   .B(B_tb),
   .ALU_FUN(ALU_FUN_tb),
   .ALU_OUT(ALU_OUT_tb),
   .carry_flag(carry_flag_tb),
   .arith_flag(arith_flag_tb),
   .logic_flag(logic_flag_tb),
   .cmp_flag(cmp_flag_tb),
   .shift_flag(shift_flag_tb)
   );
  
  //clock Generatio
  always #5000 clk_tb = ~clk_tb;
   
   //initial block
   initial begin
     $dumpfile("ALU_16B.vcd");
     $dumpvars;
     clk_tb = 1'b0;
     A_tb = 16'b0001_0111_0101_0010; // 5970 decimal
     B_tb = 16'b0000_1011_0111_1100; // 2940 decimal
    /*============1st test case===============*/ 
    #10000
    $display("Test Case 1(NOP)");
    if (ALU_OUT_tb == 16'b0000_0000_0000_0000 && carry_flag_tb == 1'b0 && arith_flag_tb == 1'b0 && logic_flag_tb == 1'b0 && cmp_flag_tb == 1'b0 && shift_flag_tb == 1'b0)
        $display("Test Case succeded");
    else
        $display("Test Case Failed");
    /*============2nd test case===============*/
    ALU_FUN_tb ='b0000;
    #10000     
    $display("Test Case 2(addition without carry)");
    if (ALU_OUT_tb == 16'b0010_0010_1100_1110 && carry_flag_tb == 1'b0 && arith_flag_tb == 1'b1 && logic_flag_tb == 1'b0 && cmp_flag_tb == 1'b0 && shift_flag_tb == 1'b0)
        $display("Test Case succeded");
    else
        $display("Test Case Failed");
    /*============3rd test case===============*/
    A_tb = 16'b1101_0111_0101_0010; // 55122 decimal
    B_tb = 16'b1000_1011_0111_1100; // 35708  decimal
    ALU_FUN_tb ='b0000;
    #10000     
    $display("Test Case 3(aadition with Carry)");
    if (ALU_OUT_tb == 16'b0110_0010_1100_1110 && carry_flag_tb == 1'b1 && arith_flag_tb == 1'b1 && logic_flag_tb == 1'b0 && cmp_flag_tb == 1'b0 && shift_flag_tb == 1'b0)
        $display("Test Case succeded");
    else
        $display("Test Case failed");
    /*============4th test case===============*/
    A_tb = 16'b0001_0010_0011_0100; // 4660  decimal
    B_tb = 16'b0101_0110_0111_1000; // 22136  decimal
    ALU_FUN_tb ='b0001;
    #10000       
    $display("Test Case 4(subtraction with borrow )");
    $display("A_tb = %b, B_tb = %b, ALU_OUT_tb = %b, carry_flag_tb = %b", A_tb, B_tb, ALU_OUT_tb, carry_flag_tb);
    if (ALU_OUT_tb == 16'b1011_1011_1011_1100 && carry_flag_tb == 1'b1 && arith_flag_tb == 1'b1 && logic_flag_tb == 1'b0 && cmp_flag_tb == 1'b0 && shift_flag_tb == 1'b0)
        $display("Test Case succeded");
    else      
        $display("Test Case Failed");   
    /*============5th test case===============*/
    A_tb = 16'b1101_0111_0101_0010; // 55122  decimal
    B_tb = 16'b1000_1011_0111_1100; // 35708  decimal
    ALU_FUN_tb ='b0001;
    #10000     
    $display("Test Case 5(subtraction without borrow )");
    if (ALU_OUT_tb == 16'b0100_1011_1101_0110 && carry_flag_tb == 1'b0 && arith_flag_tb == 1'b1 && logic_flag_tb == 1'b0 && cmp_flag_tb == 1'b0 && shift_flag_tb == 1'b0)
        $display("Test Case succeded");
    else      
        $display("Test Case Failed"); 
    /*============6th test case===============*/
    A_tb = 16'b0000_0000_0000_0101; // 5     decimal
    B_tb = 16'b0000_0000_0110_0100; // 100  decimal
    ALU_FUN_tb ='b0010;
    #10000     
    $display("Test Case 6( MULTIPLICATION )");
    if (ALU_OUT_tb == 16'b0000_0001_1111_0100 && carry_flag_tb == 1'b0 && arith_flag_tb == 1'b1 && logic_flag_tb == 1'b0 && cmp_flag_tb == 1'b0 && shift_flag_tb == 1'b0)
        $display("Test Case succeded");
    else      
        $display("Test Case Failed"); 
    /*============7th test case===============*/
    A_tb = 16'b0000_0000_0110_0100; // 100  decimal
    B_tb = 16'b0000_0000_0011_0010; // 50   decimal
    ALU_FUN_tb ='b0011;
    #10000     
    $display("Test Case 7(Division )");
    if (ALU_OUT_tb == 16'b0000_0000_0000_0010 && carry_flag_tb == 1'b0 && arith_flag_tb == 1'b1 && logic_flag_tb == 1'b0 && cmp_flag_tb == 1'b0 && shift_flag_tb == 1'b0)
        $display("Test Case succeded");
    else      
        $display("Test Case Failed"); 
    /*============8th test case===============*/
    A_tb = 16'b0000_0000_0110_0100; 
    B_tb = 16'b0000_0000_0011_0010; 
    ALU_FUN_tb ='b0100;
    #10000     
    $display("Test Case 8(AND)");
    if (ALU_OUT_tb == 16'b0000_0000_0010_0000 && carry_flag_tb == 1'b0 && arith_flag_tb == 1'b0 && logic_flag_tb == 1'b1 && cmp_flag_tb == 1'b0 && shift_flag_tb == 1'b0)
        $display("Test Case succeded");
    else      
        $display("Test Case Failed");    
            
    /*============9th test case===============*/
    A_tb = 16'b0000_0000_0110_0100; 
    B_tb = 16'b0000_0000_0011_0010; 
    ALU_FUN_tb ='b0101;
    #10000     
    $display("Test Case 9(OR)");
    if (ALU_OUT_tb == 16'b0000_0000_0111_0110 && carry_flag_tb == 1'b0 && arith_flag_tb == 1'b0 && logic_flag_tb == 1'b1 && cmp_flag_tb == 1'b0 && shift_flag_tb == 1'b0)
        $display("Test Case succeded");
    else      
        $display("Test Case Failed");  
    /*============10th test case===============*/
    A_tb = 16'b0000_0000_0110_0100; 
    B_tb = 16'b0000_0000_0011_0010; 
    ALU_FUN_tb ='b0110;
    #10000     
    $display("Test Case 10(NAND)");
    if (ALU_OUT_tb == 16'b1111_1111_1101_1111 && carry_flag_tb == 1'b0 && arith_flag_tb == 1'b0 && logic_flag_tb == 1'b1 && cmp_flag_tb == 1'b0 && shift_flag_tb == 1'b0)
        $display("Test Case succeded");
    else      
        $display("Test Case Failed"); 
    /*============11th test case===============*/
    A_tb = 16'b0000_0000_0110_0100; 
    B_tb = 16'b0000_0000_0011_0010; 
    ALU_FUN_tb ='b0111;
    #10000     
    $display("Test Case 11(NOR)");
    if (ALU_OUT_tb == 16'b1111_1111_1000_1001 && carry_flag_tb == 1'b0 && arith_flag_tb == 1'b0 && logic_flag_tb == 1'b1 && cmp_flag_tb == 1'b0 && shift_flag_tb == 1'b0)
        $display("Test Case succeded");
    else      
        $display("Test Case Failed");  
    /*============12th test case===============*/
    A_tb = 16'b0000_0000_0110_0100; 
    B_tb = 16'b0000_0000_0011_0010; 
    ALU_FUN_tb ='b1000;
    #10000     
    $display("Test Case 12(XOR)");
    if (ALU_OUT_tb == 16'b0000_0000_0101_0110 && carry_flag_tb == 1'b0 && arith_flag_tb == 1'b0 && logic_flag_tb == 1'b1 && cmp_flag_tb == 1'b0 && shift_flag_tb == 1'b0)
        $display("Test Case succeded");
    else      
        $display("Test Case Failed");  
    /*============13th test case===============*/
    A_tb = 16'b0000_0000_0110_0100; 
    B_tb = 16'b0000_0000_0011_0010; 
    ALU_FUN_tb ='b1001;
    #10000     
    $display("Test Case 13(XNOR)");
    if (ALU_OUT_tb == 16'b1111_1111_1010_1001 && carry_flag_tb == 1'b0 && arith_flag_tb == 1'b0 && logic_flag_tb == 1'b1 && cmp_flag_tb == 1'b0 && shift_flag_tb == 1'b0)
        $display("Test Case succeded");
    else      
        $display("Test Case Failed");  
    /*============14th test case===============*/
    A_tb = 16'b0000_0000_0110_0100; 
    B_tb = 16'b0000_0000_0011_0010; 
    ALU_FUN_tb ='b1010;
    #10000     
    $display("Test Case 14(Equality A != B)");
    if (ALU_OUT_tb == 16'b0000_0000_0000_0000 && carry_flag_tb == 1'b0 && arith_flag_tb == 1'b0 && logic_flag_tb == 1'b0 && cmp_flag_tb == 1'b1 && shift_flag_tb == 1'b0)
        $display("Test Case succeded");
    else      
        $display("Test Case Failed");  
    /*============15th test case===============*/
    A_tb = 16'b0000_0000_0011_0010; 
    B_tb = 16'b0000_0000_0011_0010; 
    ALU_FUN_tb ='b1010;
    #10000     
    $display("Test Case 15(Equality A == B)");
    if (ALU_OUT_tb == 16'b0000_0000_0000_0001 && carry_flag_tb == 1'b0 && arith_flag_tb == 1'b0 && logic_flag_tb == 1'b0 && cmp_flag_tb == 1'b1 && shift_flag_tb == 1'b0)
        $display("Test Case succeded");
    else      
        $display("Test Case Failed");  
    /*============16th test case===============*/
    A_tb = 16'b0000_0010_0011_0010; 
    B_tb = 16'b0000_0000_0011_0010; 
    ALU_FUN_tb ='b1011;
    #10000     
    $display("Test Case 16(Greater than & A > B)");
    if (ALU_OUT_tb == 16'b0000_0000_0000_0010 && carry_flag_tb == 1'b0 && arith_flag_tb == 1'b0 && logic_flag_tb == 1'b0 && cmp_flag_tb == 1'b1 && shift_flag_tb == 1'b0)
        $display("Test Case succeded");
    else      
        $display("Test Case Failed"); 
    /*============17th test case===============*/
    A_tb = 16'b0000_0010_0011_0010; 
    B_tb = 16'b0010_0000_0011_0010; 
    ALU_FUN_tb ='b1011;
    #10000     
    $display("Test Case 17(Greater than & A < B)");
    if (ALU_OUT_tb == 16'b0000_0000_0000_0000 && carry_flag_tb == 1'b0 && arith_flag_tb == 1'b0 && logic_flag_tb == 1'b0 && cmp_flag_tb == 1'b1 && shift_flag_tb == 1'b0)
        $display("Test Case succeded");
    else      
        $display("Test Case Failed"); 
    /*============18th test case===============*/
    A_tb = 16'b0000_0010_0011_0010; 
    B_tb = 16'b0010_0000_0011_0010; 
    ALU_FUN_tb ='b1100;
    #10000     
    $display("Test Case 18(less than & A < B)");
    if (ALU_OUT_tb == 16'b0000_0000_0000_0011 && carry_flag_tb == 1'b0 && arith_flag_tb == 1'b0 && logic_flag_tb == 1'b0 && cmp_flag_tb == 1'b1 && shift_flag_tb == 1'b0)
        $display("Test Case succeded");
    else      
        $display("Test Case Failed");   
    /*============ 19th test case===============*/
    A_tb = 16'b0000_0010_0011_0010; 
    ALU_FUN_tb ='b1101;
    #10000     
    $display("Test Case 19(Shift right A)");
    if (ALU_OUT_tb == 16'b0000_0001_0001_1001 && carry_flag_tb == 1'b0 && arith_flag_tb == 1'b0 && logic_flag_tb == 1'b0 && cmp_flag_tb == 1'b0 && shift_flag_tb == 1'b1)
        $display("Test Case succeded");
    else      
        $display("Test Case Failed");    
    /*============ 20th test case===============*/
    A_tb = 16'b0000_0010_0011_0010; 
    ALU_FUN_tb ='b1110;
    #10000     
    $display("Test Case 20(Shift left A)");
    if (ALU_OUT_tb == 16'b0000_0100_0110_0100 && carry_flag_tb == 1'b0 && arith_flag_tb == 1'b0 && logic_flag_tb == 1'b0 && cmp_flag_tb == 1'b0 && shift_flag_tb == 1'b1)
        $display("Test Case succeded");
    else      
        $display("Test Case Failed");                                      
                    
    #10000 $stop;    
   end  
endmodule  


