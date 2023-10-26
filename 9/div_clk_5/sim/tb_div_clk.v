// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : tb_div_clk.v
// Create : 2023-10-24 17:16:03
// Revise : 2023-10-24 17:27:52
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
`timescale 1ns/1ns
module tb_div_clk();
	reg clk,rst;
	wire clk_5;

	initial begin
	clk=0;
	rst=1;
	#110
	rst=0;
end

always #10 clk=~clk;
div_clk_5 div_cnt_inst(
	.clk(clk),
	.rst(rst),
	.clk_5(clk_5)
	);

endmodule