`timescale 1ns/1ps

module TB_ASYNC_FIFO();

  /*-------- parameters --------*/
  parameter data_width    = 8,
            address_width = 3,
			w_clk_period  = 10,
			r_clk_period  = 25;

  /*-------- inputs --------*/
  reg  [data_width-1:0] wdata;
  reg                   winc, wclk, wrst_n;
  reg                   rinc, rclk, rrst_n;

  /*-------- outputs --------*/
  wire [data_width-1:0] rdata;
  wire                  wfull, rempty;

  /*-------- Instantiate the FIFO module --------*/
  FIFO_TOP #(data_width, address_width) Dut (
    .r_data(rdata),
    .wfull(wfull),
    .rempty(rempty),
    .w_data(wdata),
    .w_inc(winc),
    .w_clk(wclk),
    .wrst_n(wrst_n),
    .r_inc(rinc),
    .r_clk(rclk),
    .rrst_n(rrst_n)
  );
  
  /*-------- Clock Generation --------*/
  initial begin
    wclk = 0;
    forever #(w_clk_period/2.0) wclk = ~wclk; // Write clock toggles every 5 ns ==> 100MHZ (faster)
  end

  initial begin
    rclk = 0;
    forever #(r_clk_period/2.0) rclk = ~rclk; // Read clock toggles every 12.5 ==> 40MHZ ns (slower)
  end

  /*-------- writing data in the FIFO --------*/
  initial begin
	wdata = 0;
    winc = 0;
	wrst_n = 0;
	#(2*w_clk_period) wrst_n = 1;
    
    #w_clk_period;	
    $display("Starting write operations...");
    repeat (2 ** address_width + 1) begin
      @(negedge wclk);
      if (!wfull) begin
        wdata = wdata + 1;
        winc = 1;
      end else begin
        winc = 0;
        $display("FIFO is full. Cannot write anymore.");
      end
    end
    winc = 0;
    #(4*w_clk_period);
  end
  
  /*-------- Read data from the FIFO --------*/
  initial begin
    rinc = 0;
    rrst_n = 0;
    #(2*r_clk_period) rrst_n = 1;
	
    $display("Starting read operations...");
    repeat (2 ** address_width + 5 ) begin
      @(negedge rclk);
      if (!rempty) begin
        rinc = 1;
        $display("Reading data: %d", rdata);
      end else begin
        rinc = 0;
        $display("FIFO is empty. Cannot read anymore.");
      end
    end
    rinc = 0;
    #(4*r_clk_period);
  end
initial begin 
#(15 * r_clk_period);
$stop;
end
endmodule