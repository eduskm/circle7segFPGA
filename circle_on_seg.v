module circle_on_seg(
    input row,
    input en
    output [7:0] seg_display
)

localparam HIGH_CIRCLE = 8'b0_1100011;
localparam LOW_CIRCLE  = 8'b0_1011100;
localparam OFF = 8'b0_0000000;

always @ (en or row) begin
    if (en) begin
        if (row) begin
            seg_display = HIGH_CIRCLE;
        end else begin
            seg_display = LOW_CIRCLE;
        end
    end else begin
        seg_display = OFF;
    end
end

endmodule