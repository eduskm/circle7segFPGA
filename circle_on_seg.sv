module circle_on_seg #
(
    parameter led_logic = 0
)
(
    input row,
    input enable,
    output reg [7:0] seg_display
);

localparam HIGH_CIRCLE = 8'b0_1100011;
localparam LOW_CIRCLE  = 8'b0_1011100;
localparam OFF = 8'b0_0000000;

always @* begin
    if (enable) begin
        if (row) begin
            seg_display = HIGH_CIRCLE;
        end else begin
            seg_display = LOW_CIRCLE;
        end
    end else begin
        seg_display = OFF;
    end
    if (led_logic)
        seg_display = ~seg_display;
end

endmodule