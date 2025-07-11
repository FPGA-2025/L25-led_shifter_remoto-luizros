module LedShifter #(
    parameter CLK_FREQ = 25_000_000
) (
    input  wire clk,
    input  wire rst_n,
    output reg [7:0] leds
);
    localparam MAX_COUNT = CLK_FREQ - 1;
    reg [$clog2(CLK_FREQ)-1:0] count;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            leds  <= 8'b00011111;  
            count <= 0;
        end else begin
            if (count == MAX_COUNT) begin
                leds <= {leds[6:0], leds[7]};
                count <= 0;
            end else begin
                count <= count + 1;
            end
        end
    end

endmodule
