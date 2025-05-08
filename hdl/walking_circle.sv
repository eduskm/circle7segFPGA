module walking_circle #(
	parameter NUM_OF_DISPLAYS = 6,
	parameter COL_WIDTH = $clog2(NUM_OF_DISPLAYS),
	parameter ROW = 0,
	parameter DIRECTION = 0
)
(
	input clk_i,
	input rst_ni,
	input overflow_i,
	output [NUM_OF_DISPLAYS - 1 : 0] [7 : 0] seg7_o
);

reg row; // 1 sus sau 0 jos
reg directie; // 0 - stanga la dreapta / 1 - dreapta la stanga
reg [COL_WIDTH - 1: 0] curr_display;
reg [NUM_OF_DISPLAYS - 1 : 0] col_en;

always @(posedge clk_i or negedge rst_ni) begin
	if (~rst_ni) begin
		curr_display <= 'b0;
		row <= ROW;
		directie <= DIRECTION;
	end
	else if (overflow_i) begin
		if(curr_display == 5 && directie) begin
			row <= ~row;
			directie <= ~directie;
		end else
		if (curr_display == 0 && directie == 0) begin
			row <= ~row;
			directie <= ~directie;
		end else begin
			curr_display <= directie ? curr_display + 1 : curr_display - 1; 
		end
	end
end

assign col_en = 1 << curr_display;

genvar i;
generate
    for (i = 0; i < NUM_OF_DISPLAYS; i=i+1) begin: seg7_for // instantiem 6 displayuri
        circle_on_seg #
		(
			.led_logic(1)
		) circle_on_seg_inst (
            .row_i(row),
            .enable_i(col_en[i]),
            .seg_display_o(seg7_o[i])
        );
    end


endgenerate

endmodule
