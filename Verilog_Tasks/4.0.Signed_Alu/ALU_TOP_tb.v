`timescale 1us/1ns 
module ALU_TOP_tb();

reg                 clk_tb,rst_tb;
reg  signed [7:0]   A_tb, B_tb;
reg         [3:0]   ALU_FUNC_tb;
wire                Arith_flag_tb, Logic_flag_tb, CMP_flag_tb, SHIFT_flag_tb;
wire signed [15:0]  Arith_OUT_tb;
wire        [7:0]   Logic_OUT_tb;
wire        [1:0]   CMP_OUT_tb;
wire        [7:0]   SHIFT_OUT_tb;


// instantiation
ALU_TOP #(.In_Data_Width(8), 
.arith_out_width(16),
.logic_out_width(8),
.cmp_out_width(2),
.shift_out_width(8)
) dut ( .clk(clk_tb),
.rst(rst_tb),
.A(A_tb), 
.B(B_tb),
.ALU_FUNC(ALU_FUNC_tb), 
.Arith_flag(Arith_flag_tb), 
.Logic_flag(Logic_flag_tb), 
.CMP_flag(CMP_flag_tb), 
.SHIFT_flag(SHIFT_flag_tb), 
.Arith_OUT(Arith_OUT_tb),
.Logic_OUT(Logic_OUT_tb),
.CMP_OUT(CMP_OUT_tb),
.SHIFT_OUT(SHIFT_OUT_tb)
); 

wire [3:0]flags;
assign flags = {Arith_flag_tb, Logic_flag_tb, CMP_flag_tb, SHIFT_flag_tb};

// clock generation
always begin
	#4 clk_tb = ~clk_tb;
	#6 clk_tb = ~clk_tb;
end
// initial block
initial begin
$dumpfile("alu.vcd");
$dumpvars;
clk_tb = 0;
rst_tb = 0;
#2 
rst_tb = 1;

#8
A_tb = -'d5;
B_tb = -'d3;
ALU_FUNC_tb = 4'b0000;
#10
/*=========== Arithmitic Operations =========== */	
$display("*** TEST CASE 1 -- Addition -- NEG + NEG ***"); 

if (Arith_OUT_tb == -8 && flags == 4'b1000 )
	$display("test case passed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);

A_tb = 'd5;
B_tb = -'d3;
ALU_FUNC_tb = 4'b0000;
#10
$display("*** TEST CASE 2 -- Addition -- POS + NEG ***"); 

if (Arith_OUT_tb == 2 && flags == 4'b1000 )
	$display("test case passed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);

A_tb = -'d5;
B_tb = 'd3;
ALU_FUNC_tb = 4'b0000;
#10
$display("*** TEST CASE 3 -- Addition -- NEG + POS ***"); 

if (Arith_OUT_tb == -2 && flags == 4'b1000 )
	$display("test case passed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);
	
A_tb = 'd5;
B_tb = 'd3;
ALU_FUNC_tb = 4'b0000;
#10
$display("*** TEST CASE 4 -- Addition -- POS + POS ***"); 

if (Arith_OUT_tb == 8 && flags == 4'b1000 )
	$display("test case passed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);

A_tb = -'d9;
B_tb = -'d3;
ALU_FUNC_tb = 4'b0001;
#10
$display("*** TEST CASE 5 -- Subtraction -- NEG - NEG ***"); 

if (Arith_OUT_tb == -6 && flags == 4'b1000 )
	$display("test case passed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);

A_tb = 'd9;
B_tb = -'d3;
ALU_FUNC_tb = 4'b0001;
#10
$display("*** TEST CASE 6 -- Subtraction -- POS - NEG ***"); 

if (Arith_OUT_tb == 12 && flags == 4'b1000 )
	$display("test case passed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);	
	
A_tb = -'d9;
B_tb = 'd3;
ALU_FUNC_tb = 4'b0001;
#10
$display("*** TEST CASE 7 -- Subtraction -- NEG - POS ***"); 

if (Arith_OUT_tb == -12 && flags == 4'b1000 )
	$display("test case passed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);	
	
A_tb = 'd9;
B_tb = 'd3;
ALU_FUNC_tb = 4'b0001;
#10
$display("*** TEST CASE 8 -- Subtraction -- POS - POS ***"); 

if (Arith_OUT_tb == 6 && flags == 4'b1000 )
	$display("test case passed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);	

A_tb = -'d9;
B_tb = -'d3;
ALU_FUNC_tb = 4'b0010;
#10
$display("*** TEST CASE 9 -- Multiplication -- NEG * NEG ***"); 

if (Arith_OUT_tb == 27 && flags == 4'b1000 )
	$display("test case passed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);	

A_tb = 'd9;
B_tb = -'d3;
ALU_FUNC_tb = 4'b0010;
#10
$display("*** TEST CASE 10 -- Multiplication -- POS * NEG ***"); 

if (Arith_OUT_tb == -27 && flags == 4'b1000 )
	$display("test case passed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);	
	
A_tb = -'d9;
B_tb = 'd3;
ALU_FUNC_tb = 4'b0010;
#10
$display("*** TEST CASE 11 -- Multiplication -- NEG * POS ***"); 

if (Arith_OUT_tb == -27 && flags == 4'b1000 )
	$display("test case passed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);		

A_tb = 'd9;
B_tb = 'd3;
ALU_FUNC_tb = 4'b0010;
#10
$display("*** TEST CASE 12 -- Multiplication -- POS * POS ***"); 

if (Arith_OUT_tb == 27 && flags == 4'b1000 )
	$display("test case passed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);	

A_tb = -'d9;
B_tb = -'d3;
ALU_FUNC_tb = 4'b0011;
#10
$display("*** TEST CASE 13 -- DIVISION -- NEG / NEG ***"); 

if (Arith_OUT_tb == 3 && flags == 4'b1000 )
	$display("test case passed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);	

A_tb = 'd9;
B_tb = -'d3;
ALU_FUNC_tb = 4'b0011;
#10
$display("*** TEST CASE 14 -- DIVISION -- POS / NEG ***"); 

if (Arith_OUT_tb == -3 && flags == 4'b1000 )
	$display("test case passed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);	
	
A_tb = -'d9;
B_tb = 'd3;
ALU_FUNC_tb = 4'b0011;
#10
$display("*** TEST CASE 15 -- DIVISION -- NEG / POS ***"); 

if (Arith_OUT_tb == -3 && flags == 4'b1000 )
	$display("test case passed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);		

A_tb = 'd9;
B_tb = 'd3;
ALU_FUNC_tb = 4'b0011;
#10
$display("*** TEST CASE 16 -- DIVISION -- POS / POS ***"); 

if (Arith_OUT_tb == 3 && flags == 4'b1000 )
	$display("test case passed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %0d, Flags = %b ", Arith_OUT_tb, flags);	
	
/*=========== Logical Operations =========== */	
A_tb = 'b1110_0101;
B_tb = 'b0111_0111;
ALU_FUNC_tb = 4'b0100;
#10
$display("*** TEST CASE 17 -- AND ***"); 

if (Logic_OUT_tb == 101  && flags == 4'b0100 )
	$display("test case passed, Alu_out = %b, Flags = %b ", Logic_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %b, Flags = %b ", Logic_OUT_tb, flags);		

A_tb = 'b1110_0101;
B_tb = 'b0111_0111;
ALU_FUNC_tb = 4'b0101;
#10
$display("*** TEST CASE 18 -- OR ***"); 

if (Logic_OUT_tb == 247  && flags == 4'b0100 )
	$display("test case passed, Alu_out = %b, Flags = %b ", Logic_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %b, Flags = %b ", Logic_OUT_tb, flags);		

A_tb = 'b1110_0101;
B_tb = 'b0111_0111;
ALU_FUNC_tb = 4'b0110;
#10
$display("*** TEST CASE 19 -- NAND ***"); 

if (Logic_OUT_tb == 154  && flags == 4'b0100 )
	$display("test case passed, Alu_out = %b, Flags = %b ", Logic_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %b, Flags = %b ", Logic_OUT_tb, flags);		

A_tb = 'b1110_0101;
B_tb = 'b0111_0111;
ALU_FUNC_tb = 4'b0111;
#10
$display("*** TEST CASE 20 -- NOR ***"); 
if (Logic_OUT_tb == 8  && flags == 4'b0100 )
	$display("test case passed, Alu_out = %b, Flags = %b ", Logic_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %b, Flags = %b ", Logic_OUT_tb, flags);		

/*=========== Comparison Operations and NOP =========== */	
ALU_FUNC_tb = 4'b1000;
#10
$display("*** TEST CASE 21 -- NOP ***"); 
if (CMP_OUT_tb == 0  && flags == 4'b0010 )
	$display("test case passed, Alu_out = %b, Flags = %b ", CMP_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %b, Flags = %b ", CMP_OUT_tb, flags);	

A_tb = 'b1110_0101;
B_tb = 'b0111_0111;	
ALU_FUNC_tb = 4'b1001;
#10
$display("*** TEST CASE 22 -- EQUALITY ***"); 
if (CMP_OUT_tb == 0  && flags == 4'b0010 )
	$display("test case passed, Alu_out = %b, Flags = %b ", CMP_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %b, Flags = %b ", CMP_OUT_tb, flags);	


A_tb = 'b1111_0101;
B_tb = 'b1111_0101;	
ALU_FUNC_tb = 4'b1001;
#10
$display("*** TEST CASE 23 -- EQUALITY ***"); 
if (CMP_OUT_tb == 1  && flags == 4'b0010 )
	$display("test case passed, Alu_out = %b, Flags = %b ", CMP_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %b, Flags = %b ", CMP_OUT_tb, flags);	

A_tb = 'b1110_0101;
B_tb = 'b0111_0111;	
ALU_FUNC_tb = 4'b1010;
#10
$display("*** TEST CASE 24 -- GREATER Than ***"); 
if (CMP_OUT_tb == 2  && flags == 4'b0010 )
	$display("test case passed, Alu_out = %b, Flags = %b ", CMP_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %b, Flags = %b ", CMP_OUT_tb, flags);	

A_tb = 'b0010_0101;
B_tb = 'b0111_0111;	
ALU_FUNC_tb = 4'b1011;
#10
$display("*** TEST CASE 25 -- LESS Than ***"); 
if (CMP_OUT_tb == 3  && flags == 4'b0010 )
	$display("test case passed, Alu_out = %b, Flags = %b ", CMP_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %b, Flags = %b ", CMP_OUT_tb, flags);	

/*=========== SHIFT Operations =========== */	
A_tb = 'b0010_0101;
ALU_FUNC_tb = 4'b1100;
#10
$display("*** TEST CASE 26 --  A >> 1 ***"); 
if (SHIFT_OUT_tb == 18   && flags == 4'b0001 )
	$display("test case passed, Alu_out = %b, Flags = %b ", SHIFT_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %b, Flags = %b ", SHIFT_OUT_tb, flags);	

A_tb = 'b0010_0101;
ALU_FUNC_tb = 4'b1101;
#10
$display("*** TEST CASE 27 --  A << 1 ***"); 
if (SHIFT_OUT_tb == 74   && flags == 4'b0001 )
	$display("test case passed, Alu_out = %b, Flags = %b ", SHIFT_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %b, Flags = %b ", SHIFT_OUT_tb, flags);	
	

B_tb = 'b0011_0111;
ALU_FUNC_tb = 4'b1110;
#10
$display("*** TEST CASE 28 --  B >> 1 ***"); 
if (SHIFT_OUT_tb == 27   && flags == 4'b0001 )
	$display("test case passed, Alu_out = %b, Flags = %b ", SHIFT_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %b, Flags = %b ", SHIFT_OUT_tb, flags);	



B_tb = 'b0011_0111;
ALU_FUNC_tb = 4'b1111;
#10
$display("*** TEST CASE 29 --  B << 1 ***"); 
if (SHIFT_OUT_tb == 110   && flags == 4'b0001 )
	$display("test case passed, Alu_out = %b, Flags = %b ", SHIFT_OUT_tb, flags);
else
	$display("test case failed, Alu_out = %b, Flags = %b ", SHIFT_OUT_tb, flags);		
	
#20 $stop;
end
endmodule