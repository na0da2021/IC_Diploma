module Up_Dn_Counter(
  input      [4:0] IN,
  input            Load, Up, Down, clk,
  output reg [4:0] Counter,
  output           High, Low
);

always@(posedge clk)
 begin
  if (Load)
    Counter <= IN;
  else if (Down && !Low)
    Counter <= Counter - 5'b1;
  else if (Up && !High && !Down)
    Counter <= Counter + 5'b1;   
  else
    Counter <= Counter;  
 end
 
assign Low = (Counter == 5'b00000); 
assign High = (Counter == 5'b11111);

endmodule