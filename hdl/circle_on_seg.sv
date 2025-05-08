module circle_on_seg #
(
    parameter led_logic = 1
)
(
    input row_i,
    input enable_i,
    output reg [7:0] seg_display_o
);

localparam HIGH_CIRCLE = 8'b0_1100011;
localparam LOW_CIRCLE  = 8'b0_1011100;
localparam OFF = 8'b0_0000000;

//localparam HIGH_CIRCLE = 8'b1_0011100;
//localparam LOW_CIRCLE  = 8'b1_0100011;
//localparam OFF = 8'b1_1111111;



always @* begin
    if (enable_i) begin
        if (row_i) begin
            seg_display_o = HIGH_CIRCLE;
        end else begin
            seg_display_o = LOW_CIRCLE;
        end
    end else begin
        seg_display_o = OFF;
    end
    if (led_logic)
        seg_display_o = ~seg_display_o;
end

endmodule