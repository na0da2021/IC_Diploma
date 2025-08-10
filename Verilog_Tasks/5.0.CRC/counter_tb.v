module counter_tb;

// Testbench signals
reg clk;
reg rst;
reg active;
wire valid;

// Instantiate the counter module
counter Dut (
    .clk(clk),
    .rst(rst),
    .active(active),
    .valid(valid)
);

// Generate clock signal (50 MHz, 20 ns period)
always #10 clk = ~clk;

initial begin
    // Initialize signals
    clk = 0;
    rst = 0;
    active = 0;
	
    #20;
    rst = 1;

    // Test 1: Activate the counter
    active = 1;
    #160;        // hold active for 160 ns (8 cycles)
    active = 0;
    #240;       // Observe for 9 cycles (240 ns)

    // Test 2: Reactivate the counter
    active = 1;
    #40;        // hold active for 40 ns (2 cycles)
    active = 0;
    #240;       // Observe for 9 cycles (240 ns)

    // Test 3: Activate the counter briefly
    active = 1;
    #20;        // hold active for 20 ns (1 cycle)
    active = 0;
    #160;       // Observe for 8 cycles (160 ns)

    // End of simulation
    #100;
	$stop;
end

initial begin
    // Monitor the output
    $monitor("Time = %0t, clk = %b, rst = %b, active = %b, valid = %b", $time, clk, rst, active, valid);
end

endmodule
