`timescale 1ns/1ns
module tb_a_and_b_bit();
reg [7:0] a,b;
reg inclk;
wire c; //一位 只显示最低的一位 外部的

initial begin
	a=0;
	b=0;
	inclk=0;
end

always #20 a={$random}%256;
always #20 b={$random}%256;

always #10 inclk=~inclk;

// 内部的
a_and_b_bit a_and_b_bit_inst(
	.clk(inclk),
	.a(a),
	.b(b),
	.c(c)
	);

endmodule