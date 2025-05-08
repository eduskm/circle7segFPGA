`timescale 10ps/1ps
module tb;

localparam WIDTH = 4;
localparam led_logic = 1;

reg clk;
reg rst_n;
wire ovfl;
wire [5 : 0] [7 : 0] seg7;
	
initial begin
	clk = 1'b0;
	rst_n = 1'b1;
	#10 rst_n = 1'b0;
	#10 rst_n = 1'b1;
end

always #1 clk = ~clk;

clock_div #(
	.WIDTH (WIDTH),
	.COUNT_TO ()
)
clock_div_inst (
	.clk_i (clk   ),
	.rst_ni(rst_n),
	.overflow_o(ovfl)
);

walking_circle #(
	.NUM_OF_DISPLAYS (),
	.COL_WIDTH (),
        .ROW (0),
	.DIRECTION (1)

)
walking_circle_inst
(
	.clk_i(clk),
	.rst_ni(rst_n),
	.overflow_i(ovfl),
	.seg7_o(seg7)
);

endmodule