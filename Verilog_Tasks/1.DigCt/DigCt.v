module DigCt(IN1, IN2, IN3, IN4, IN5, clk, OUT1, OUT2, OUT3);
  
input IN1, IN2, IN3, IN4, IN5;
input clk;
output OUT1, OUT2, OUT3;

reg OUT1, OUT2, OUT3;
reg temp1, temp2;
reg D1, D2, D3;

always@(IN1, IN2, IN3)
 begin
  temp1 = ~(IN1 | IN2);
  D1 = ~(temp1 & IN3);
 end

always@(IN2, IN3)
 begin
  D2 = ~(IN2 & IN3);
 end

always@(IN3, IN4, IN5)
 begin
  temp2 = IN3 | ~IN4;
  D3 = temp2 | IN5;
 end
 
always @(posedge clk)
 begin
  OUT1 <= D1;  
 end
 
 always @(posedge clk)
 begin
  OUT2 <= D2;  
 end
 
 always @(posedge clk)
 begin
  OUT3 <= D3;  
 end

endmodule