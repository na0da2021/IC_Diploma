module controller_tb;

reg        activate_tb;
reg        up_max_tb;
reg        dn_max_tb;
reg        clk_tb, rst_tb;
wire       up_M_tb;
wire       dn_M_tb;
  
parameter Clock_period = 20; //20ns ~ 50 MHZ

parameter Expec_up_m = 6'b010000;
parameter Expec_dn_m = 6'b000100;

////////////////// initial block /////////////////////// 

initial 
 begin
   
 // Save Waveform
   $dumpfile("Controller.vcd") ;       
   $dumpvars; 
 

 // initialization
   initialize();

 // Reset
   reset();
   
 // Input Sequence of (activate, up_max, dn_max)
   press_buttons(6'b111100,6'b100101,6'b011010); // idle > idle > Mv_dn > back to ideal > Mv_up > back to ideal 

	#(2 * Clock_period);
    $stop ;
 
 end  

/////////////////////// TASKS //////////////////////////


/////////////// Signals Initialization //////////////////

task initialize;
 begin
    activate_tb = 0;
    up_max_tb   = 0;
    dn_max_tb   = 0;
    clk_tb      = 0;
	rst_tb      = 0;
 end
endtask

///////////////////////// RESET /////////////////////////
  
task reset;
 begin
 rst_tb =  'b1;
 #(Clock_period);
 rst_tb  = 'b0;
 #(Clock_period);
 rst_tb  = 'b1;
 end
endtask  

////////////////////// press_buttons /////////////////////
  
task press_buttons(
  input  reg   [5:0]     activate,
  input  reg   [5:0]     up_max,
  input  reg   [5:0]     dn_max
);
  
  integer   looper ;
  reg          [5:0]    gen_up_m;
  reg          [5:0]    gen_dn_m;

begin
  for(looper = 0; looper < 6 ;looper = looper + 1)
   begin
     @(negedge clk_tb) 
     activate_tb = activate[looper] ;
     up_max_tb = up_max[looper] ;
	 dn_max_tb = dn_max[looper] ;
	 #(Clock_period);
	 gen_up_m [looper]= up_M_tb;
     gen_dn_m [looper]= dn_M_tb;
   end   
   if(gen_up_m == Expec_up_m && gen_dn_m == Expec_dn_m  ) 
    begin
     $display("Test Cases succeeded, gen_up_m : %b, Expec_up_m : %b, gen_dn_m : %b, Expec_dn_m : %b",gen_up_m , Expec_up_m, gen_dn_m, Expec_dn_m);
    end
   else
    begin
     $display("Test Cases failed, gen_up_m : %b, Expec_up_m : %b, gen_dn_m : %b, Expec_dn_m : %b",gen_up_m , Expec_up_m, gen_dn_m, Expec_dn_m);
    end
 end
endtask    

////////////////// Clock Generator  ////////////////////

always #(0.5 *Clock_period)  clk_tb = ~clk_tb ;
  

/////////////////// DUT Instantation ///////////////////

Controller DUT (
.activate(activate_tb),
.up_max(up_max_tb),
.dn_max(dn_max_tb),
.clk(clk_tb),
.rst(rst_tb),
.up_M(up_M_tb),
.dn_M(dn_M_tb)
);

endmodule 