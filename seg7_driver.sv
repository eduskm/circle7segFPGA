module seg7_driver #(
    parameter DISPLAY_COUNT = 6,
    parameter COL_WIDTH = $clog2(DISPLAY_COUNT)
) 
(
    input row,
    input [COL_WIDTH - 1 : 0] col,
    output [DISPLAY_COUNT - 1 : 0] [7 : 0] seg7
);

reg [DISPLAY_COUNT - 1 : 0] col_en;

assign col_en = 1 << col;

genvar i;
generate
    for (i = 0; i < DISPLAY_COUNT; i=i+1) begin: seg7_for // pentru fiecare display instantiem un display
        circle_on_seg circle_on_seg_inst (
            .row(row),
            .enable(col_en[i]),
            .seg_display(seg7[i])
        );
    end


endgenerate

endmodule