module test1(
	input clk,
	output [15:0] led);

	reg [39:0] counter;
	assign led = counter[39:24];

	always @(posedge clk)
		counter <= counter + 1;

endmodule
