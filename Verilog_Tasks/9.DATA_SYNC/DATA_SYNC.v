module DATA_SYNCH # (parameter bus_width = 8)
(
input  wire [bus_width - 1 : 0] unsync_bus,
input  wire                     bus_enable,
input  wire                     clk, rst,

output reg [bus_width - 1 : 0] sync_bus,
output reg                     enable_pulse
);

reg                      meta_flop, sync_flop;
reg                      enable_flop;

wire                     enable_pulse_comb;
wire [bus_width - 1 : 0] sync_bus_comb;

/*==== meta_flop and sync_flop ====*/
always @(posedge clk or negedge rst)
begin
	if (!rst) begin
		meta_flop <= 1'b0;
		sync_flop <= 1'b0;
	end else begin
		meta_flop <= bus_enable;
		sync_flop <= meta_flop;
	end
end

/*========= pulse Generator =========*/
always @(posedge clk or negedge rst)
begin
	if (!rst) begin
		enable_flop <= 1'b0;
	end else begin
		enable_flop <= sync_flop;
	end
end
assign enable_pulse_comb = (sync_flop) && (!enable_flop);

/*========= enable pulse =========*/
always @(posedge clk or negedge rst)
begin
	if (!rst) begin
		enable_pulse <= 1'b0;
	end else begin
		enable_pulse <= enable_pulse_comb;
	end
end

/*========= Multiplexing =========*/
assign sync_bus_comb = (enable_pulse_comb)? unsync_bus : sync_bus;

/*========= Synch_bus =========*/
always @(posedge clk or negedge rst)
begin
	if (!rst) begin
		sync_bus <= 1'b0;
	end else begin
		sync_bus <= sync_bus_comb;
	end
end

endmodule