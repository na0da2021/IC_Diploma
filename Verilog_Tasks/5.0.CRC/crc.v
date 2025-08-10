module crc(
input       clk, rst,
input       data,
input       active,
output      valid,
output reg  crc
);

parameter SEED = 8'h_D8;
reg [7:0] LFSR;
wire      feedback;

assign feedback = data ^ LFSR[0];

// handle valid signal using counter sub_module
counter Dut (
    .clk(clk),
    .rst(rst),
    .active(active),
    .valid(valid)
);

always @(posedge clk or negedge rst) begin
	if (!rst) begin
		LFSR  <= SEED;
		crc   <= 0;
	end else if (active) begin
	//perform the operation
		LFSR[0] <= LFSR[1];
		LFSR[1] <= LFSR[2];
		LFSR[2] <= LFSR[3] ^ feedback;
		LFSR[3] <= LFSR[4];
		LFSR[4] <= LFSR[5];
		LFSR[5] <= LFSR[6];
		LFSR[6] <= LFSR[7] ^ feedback;
		LFSR[7] <= feedback;
	end else begin
	//output logic
		if (valid) begin
			crc     <= LFSR[0];
			LFSR[0] <= LFSR[1];
			LFSR[1] <= LFSR[2];
			LFSR[2] <= LFSR[3];
			LFSR[3] <= LFSR[4];
			LFSR[4] <= LFSR[5];
			LFSR[5] <= LFSR[6];
			LFSR[6] <= LFSR[7];
		end else
			crc     <= 'b0;
	end

end
endmodule