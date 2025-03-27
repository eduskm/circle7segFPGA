`timescale 10ps/1ps
module tb;

localparam WIDTH = 4;
localparam num_leds = 10;

reg clk;
reg rst_n;
reg sens;
wire [WIDTH - 1:0] count;
wire ovfl;
wire row;
wire directie;
wire [2:0] curr_display;
wire [5 : 0] [7 : 0] seg7;
	
initial begin
	clk = 1'b0;
	rst_n = 1'b1;
	#10 rst_n = 1'b0;
	#10 rst_n = 1'b1;
	sens = 1'b0;
	#10 sens  = 1'b1;
	#100 sens = 1'b0;
end

always #1 clk = ~clk;

counter #(
	.WIDTH (WIDTH),
	.COUNT_TO ()
)
counterinst (
	.clk_i (clk   ),
	.rst_ni(rst_n),
	.count_o (count),
	.overflow_o(ovfl)
);

led #(
	.NUM_OF_DISPLAYS (),
	.COL_WIDTH ()

)
led_inst
(
	.clk_i(clk),
	.rst_ni(rst_n),
	.overflow_i(ovfl),
	.directie(directie),
	.row(row),
	.curr_display(curr_display)
);

seg7_driver #(
	.DISPLAY_COUNT(),
	.COL_WIDTH()
)
seg7_instance
(
	.row(row),
	.col(curr_display),
	.seg7(seg7)
);

endmodule