module counter #(
	parameter WIDTH = 7,
	parameter COUNT_TO = 'd100
)
(
	input clk_i,
	input rst_ni,
	output reg overflow_o
);

reg [WIDTH - 1 : 0] count_o;

always @(posedge clk_i or negedge rst_ni) begin
	if(~rst_ni) begin
		count_o <= {WIDTH{1'b0}};
		overflow_o <= 1'b0;
	end
	else begin
		count_o <= count_o + 'b1;
		if (count_o == {WIDTH{1'b1}} - 1) begin
			overflow_o <= 1'b1;
		end
		if (count_o == {WIDTH{1'b1}}) begin
			overflow_o <= 1'b0;
		end
	end 
end



endmodule