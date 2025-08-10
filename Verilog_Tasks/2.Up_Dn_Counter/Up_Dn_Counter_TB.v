`timescale 1ns/1ps
module Up_Dn_Counter_TB();
  
  reg  [4:0]  IN_TB;
  reg        Load_TB, Up_TB, Down_TB, clk_TB;
  wire [4:0] Counter_TB;
  wire       High_TB, Low_TB;
  
  //DUT Instantiation
  Up_Dn_Counter DUT(
   .IN(IN_TB),
   .Load(Load_TB),
   .Up(Up_TB),
   .Down(Down_TB),
   .clk(clk_TB),
   .Counter(Counter_TB),
   .High(High_TB),
   .Low(Low_TB)
   );
  
  //clock Generatio
  always #5 clk_TB = ~clk_TB;
   
   //initial block
   initial begin
     $dumpfile("Up_Dn_Counter.vcd");
     $dumpvars;
     
     $display(" start Test Cases");
     
     IN_TB = 15;
     clk_TB = 0;
      
     // 1st case (initialized or don't care values) 
     Load_TB = 0;
     Up_TB = 0;
     Down_TB = 0; 
     #5
     if (Counter_TB === 5'bx && Low_TB === 1'bx && High_TB === 1'bx)
         $display("Test Case succeed, t = %0t, Counter_TB = %0b, Low = %0b, High = %0b ",$time, Counter_TB, Low_TB, High_TB);
     else
         $display("Test Case failed, t = %0t, Counter_TB = %0b, Low = %0b, High = %0b ",$time, Counter_TB, Low_TB, High_TB);
         
     // 2nd case (test load prioriy)
     #5
     Load_TB = 1;
     Up_TB = 1;
     Down_TB = 0; 
     #10
     if (Counter_TB == IN_TB && Low_TB == 0 && High_TB == 0)
         $display("Test Case succeed, t = %0t, Counter_TB = %0d ",$time, Counter_TB);
     else
         $display("Test Case failed, t = %0t, Counter_TB = %0d ",$time, Counter_TB);

     // 3rd case (test down prioriy)
     
     Load_TB = 0;
     Up_TB = 0;
     Down_TB = 1; 
     #10
     if (Counter_TB == (IN_TB -5'b1) && Low_TB == 0 && High_TB == 0) // counter should equal to 14
         $display("Test Case succeed, t = %0t, Counter_TB = %0d ",$time, Counter_TB);
     else
         $display("Test Case failed, t = %0t, Counter_TB = %0d ",$time, Counter_TB);
     /*====================================================*/
     #10
     if (Counter_TB == (IN_TB -5'b00_010) && Low_TB == 0 && High_TB == 0) //counter should equal to 13
         $display("Test Case succeed");
     else
         $display("Test Case failed"); 
     /*====================================================*/    
     #130
     if (Counter_TB == 5'b00000 && Low_TB == 1 && High_TB == 0) //counter should equal to 0
         $display("Test Case succeed");
     else
         $display("Test Case failed");
    /*====================================================*/
    #10                 
    if (Counter_TB == 5'b00000 && Low_TB == 1 && High_TB == 0) // counter should save its value at 0
         $display("Test Case succeed, t = %0t, Counter_TB = %0d ",$time, Counter_TB);
     else
         $display("Test Case failed, t = %0t, Counter_TB = %0d ",$time, Counter_TB); 
    /*====================================================*/
    Load_TB = 0;
    Up_TB = 1;
    Down_TB = 0;
    
    #10                 
    if (Counter_TB == 5'b00_001 && Low_TB == 0 && High_TB == 0) // counter should equal to 1
         $display("Test Case succeed, t = %0t, Counter_TB = %0d ",$time, Counter_TB);
     else
         $display("Test Case failed, t = %0t, Counter_TB = %0d ",$time, Counter_TB);
    /*====================================================*/
    #310 
    if (Counter_TB == 5'b11_111 && Low_TB == 0 && High_TB == 1) // counter should equal to 32
         $display("Test Case succeed");
     else
         $display("Test Case failed"); 
    /*====================================================*/     
    #20
    if (Counter_TB == 5'b11_111 && Low_TB == 0 && High_TB == 1) // counter should sve its Value equal to 32
         $display("Test Case succeed");
     else
         $display("Test Case failed"); 
    /*====================================================*/    
    #100 $stop;    
   end  
endmodule  
