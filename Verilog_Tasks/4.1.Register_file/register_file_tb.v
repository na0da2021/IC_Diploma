module register_file_tb();

reg         WrEn_tb, RdEn_tb;
reg         clk_tb, rst_tb;
reg  [2:0]  address_tb;
reg  [15:0] WrData_tb; 
wire [15:0] RdData_tb;

//module instantiation 
register_file #(.ADDR_WIDTH(3), .MEM_DEPTH(8), .MEM_WIDTH(16)) DUT(.WrEn(WrEn_tb), 
.RdEn(RdEn_tb),
.clk(clk_tb),
.rst(rst_tb),
.address(address_tb),
.WrData(WrData_tb),
.RdData(RdData_tb)
);

//clock generation
always #5 clk_tb = ~clk_tb;

initial begin
$dumpfile("register_file.vcd");
$dumpvars;

$display("Start our test cases");
clk_tb = 0;

#2 rst_tb = 1; 
#5 rst_tb = 0; //negedge rst 
address_tb = 'b000;
WrEn_tb = 1;
RdEn_tb = 0;
WrData_tb = 'b1010_1010_1010_1010;
#3 
if (RdData_tb == 'b0) 
    $display("test case succeeded");
else  
    $display("test case failed");
	
rst_tb = 1;
#10 
WrEn_tb = 0;
RdEn_tb = 1; 
#10
if (RdData_tb == 'b1010_1010_1010_1010) 
    $display("test case succeeded");
else  
    $display("test case failed");

WrEn_tb = 1;
RdEn_tb = 0;
address_tb = 'b001;
WrData_tb = 'b1111_0000_1010_1010;

#10 
WrEn_tb = 0;
RdEn_tb = 1; 

#10
if (RdData_tb == 'b1111_0000_1010_1010) 
    $display("test case succeeded");
else  
    $display("test case failed");

WrEn_tb = 1;
RdEn_tb = 0;
address_tb = 'b111;
WrData_tb = 'b1111_1111_1001_0000; 
#10

WrEn_tb = 0;
RdEn_tb = 1;

#10
if (RdData_tb == 'b1111_1111_1001_0000) 
    $display("test case succeeded");
else  
    $display("test case failed");

WrEn_tb = 1;
RdEn_tb = 0;
address_tb = 'b101;
WrData_tb = 'b1111_1111_1111_1111; 
#10

WrEn_tb = 0;
RdEn_tb = 1;

#10
if (RdData_tb == 'b1111_1111_1111_1111) 
    $display("test case succeeded");
else  
    $display("test case failed");    
/*================test if WrEn and RdEn are High==================*/
/*================no read or write operation and will hold old data=====================*/	
WrEn_tb = 1;
RdEn_tb = 1;
address_tb = 'b011;
WrData_tb = 'b1010_1001_0011_1100; 
#10
if (RdData_tb == 'b1111_1111_1111_1111) // hold the old data
    $display("test case succeeded");
else  
    $display("test case failed");    

/*================test if WrEn and RdEn are Low==================*/
/*================no read or write operation and will hold old data=====================*/	
WrEn_tb = 0;
RdEn_tb = 0;
address_tb = 'b111;
WrData_tb = 'b1011_1011_1111_1100; 
#10
if (RdData_tb == 'b1111_1111_1111_1111) // hold the old data
    $display("test case succeeded");
else  
    $display("test case failed");    
	
	
#100 $stop;    
end 
endmodule
