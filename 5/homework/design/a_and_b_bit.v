module a_and_b_bit(
	input wire clk,
	input wire [7:0] a,
	input wire [7:0] b,
	output reg [7:0] c
	);
	//按位与
	//8'b1001_0010
	//8'b1001_1101
	//8'b1001_0000
	always @(posedge clk) begin
	c <= a&b;
	end

endmodule