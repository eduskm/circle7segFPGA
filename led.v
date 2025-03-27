module led #(
	parameter NUM_OF_DISPLAYS = 6,
	parameter COL_WIDTH = $clog2(NUM_OF_DISPLAYS)
)
(
	input clk_i,
	input rst_ni,
	input overflow_i, // 0 - stanga->dreapta / 1 - dreapta->stanga 
	output reg [NUM_OF_DISPLAYS - 1:0] column,
	output reg row, // 1 sus sau 0 jos
	output reg directie,
	output reg [COL_WIDTH : 0] curr_display
);


always @(posedge clk_i or negedge rst_ni) begin
	if (~rst_ni) begin
		curr_display = 'b0;
		row <= 'b1;
		directie <= 0;
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
			curr_display = directie ? curr_display + 1 : curr_display - 1; 
		end
	end
end

endmodule
