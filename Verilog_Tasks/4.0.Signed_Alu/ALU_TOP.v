module ALU_TOP# (parameter In_Data_Width = 8, 
                           arith_out_width = In_Data_Width + In_Data_Width,
						   logic_out_width = In_Data_Width,
						   cmp_out_width   = 2,             //takes the values{0, 1, 2, 3}, so 2 bits will be enough
						   shift_out_width = In_Data_Width
)(	
input  wire                           clk,rst,
input  wire [In_Data_Width - 1 : 0]   A, B,
input  wire [3:0]                     ALU_FUNC, 
output wire                           Arith_flag, Logic_flag, CMP_flag, SHIFT_flag, 
output wire [arith_out_width - 1 : 0] Arith_OUT,
output wire [logic_out_width - 1 : 0] Logic_OUT,
output wire [cmp_out_width   - 1 : 0] CMP_OUT,
output wire [shift_out_width - 1 : 0] SHIFT_OUT
);

//internal wires
wire arith_enable, logic_enable, cmp_enable, shift_enable;

decoder DUT0 (
.Alu_fun(ALU_FUNC[3:2]),
.arith_enable(arith_enable),
.logic_enable(logic_enable),
.cmp_enable(cmp_enable),
.shift_enable(shift_enable)
);

arithmetic_unit#(.In_Data_Width(In_Data_Width), .arith_out_width(arith_out_width)) DUT1(
.A(A),
.B(B),
.clk(clk),
.rst(rst),
.arith_enable(arith_enable),
.Alu_fun(ALU_FUNC[1:0]),
.arith_out(Arith_OUT),  
.arith_flag(Arith_flag) 
);

logic_unit#(.In_Data_Width(In_Data_Width), .logic_out_width(logic_out_width)) DUT2(
.A(A),
.B(B),
.clk(clk),
.rst(rst),
.logic_enable(logic_enable),
.Alu_fun(ALU_FUNC[1:0]),
.logic_out(Logic_OUT),  
.logic_flag(Logic_flag) 
);

cmp_unit#(.In_Data_Width(In_Data_Width), .cmp_out_width(cmp_out_width)) DUT3(
.A(A),
.B(B),
.clk(clk),
.rst(rst),
.cmp_enable(cmp_enable),
.Alu_fun(ALU_FUNC[1:0]),
.cmp_out(CMP_OUT),  
.cmp_flag(CMP_flag) 
);

shift_unit#(.In_Data_Width(In_Data_Width), .shift_out_width(shift_out_width)) DUT4(
.A(A),
.B(B),
.clk(clk),
.rst(rst),
.shift_enable(shift_enable),
.Alu_fun(ALU_FUNC[1:0]),
.shift_out(SHIFT_OUT),  
.shift_flag(SHIFT_flag) 
);

endmodule