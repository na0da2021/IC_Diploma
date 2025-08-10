module crc_tb();

///////////////////// Parameters ////////////////////////
parameter Test_Cases = 10 ;
parameter Clock_PERIOD = 100 ;  // Clock frequency: 10 MHz ~ 100ns period

//////////////////// DUT Signals ////////////////////////
reg   clk_tb, rst_tb;
reg   data_tb;
reg   active_tb;
wire  valid_tb;
wire  crc_tb;


//////////////////// Looper ////////////////////////
integer                       Operation ;

/////////////////////// Memories ////////////////////////
reg    [7:0]   Test_Data    [Test_Cases-1:0] ;
reg    [7:0]   Expec_Outs   [Test_Cases-1:0] ;


////////////////// initial block /////////////////////// 
initial
 begin
	// System Functions
	$dumpfile("CRC.vcd") ;       
	$dumpvars; 
	
	//read input files
	$readmemh("DATA_h.txt", Test_Data);
	$readmemh("Expec_Out_h.txt", Expec_Outs);
	
	// initialization
    initialize() ;

	// Test Cases
	for (Operation = 0; Operation < Test_Cases; Operation = Operation + 1)
	begin
		reset();
		perform_oper(Test_Data[Operation]) ;                   // perform_lfsr_operation
		check_out(Expec_Outs[Operation], Operation) ;          // check output response
	end

 #200
 $stop ;
 end




/*====================================================*/
/////////////////////// TASKS //////////////////////////
/*====================================================*/

/////////////// Signals Initialization //////////////////

task initialize ;
 begin
  clk_tb     = 'b0;
  rst_tb     = 'b0;
  active_tb  = 'b0;
 end
endtask

///////////////////////// RESET /////////////////////////

task reset ;
 begin
  rst_tb =  'b1;
  #(Clock_PERIOD)
  rst_tb  = 'b0;
  #(Clock_PERIOD)
  rst_tb  = 'b1;
 end
endtask

////////////////// Perform LFSR Operation ////////////////////

task perform_oper ;
input  [7:0] Data ;

integer index;

 begin
  //reset();
  active_tb = 1'b1;
   for (index = 0; index < 8 ; index = index + 1)
	begin
		data_tb = Data[index];
		#(Clock_PERIOD);
	end
 end
endtask

////////////////// Check crc output/Response  ////////////////////

task check_out ;
 input  reg     [7:0] expec_out ;
 input  integer       Oper_Num ; 

 integer i ;
 reg    [7:0] gener_out ;

 begin
  active_tb = 1'b0;
  @(posedge valid_tb)
  #(Clock_PERIOD)
  for(i=0; i<8; i=i+1)
   begin
    #(Clock_PERIOD) gener_out[i] = crc_tb ;
   end
   if(gener_out == expec_out) 
    begin
     $display("Test Case %d is succeeded, expec_out : %b, gener_out : %b", Oper_Num, expec_out, gener_out);
    end
   else
    begin
     $display("Test Case %d is failed, expec_out : %b, gener_out : %b", Oper_Num, expec_out, gener_out);
    end
 end
endtask


////////////////// Clock Generator ////////////////////
always #(Clock_PERIOD/2)  clk_tb = ~clk_tb ;


//////////////////// Module Instantiation ////////////////////////
crc Dut (
.clk(clk_tb),
.rst(rst_tb),
.data(data_tb),
.active(active_tb),
.valid(valid_tb),
.crc(crc_tb)
);

endmodule