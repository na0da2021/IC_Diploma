module counter(
    input clk, rst,
    input active,
    output reg valid
);

reg [3:0] limit_up;
reg active_prev;

always @ (posedge clk or negedge rst) begin
    if (!rst) begin
        valid <= 0;
        limit_up <= 4'b1000;
        active_prev <= 0;
    end else begin
        if (active && !active_prev) begin
            limit_up <= 4'b1000;
        end
        active_prev <= active;

        if (active) begin
            valid <= 0;
        end else if (limit_up != 0) begin
            limit_up <= limit_up - 4'b0001;
            valid <= 1;
        end else begin
            valid <= 0;
        end
    end
end
endmodule