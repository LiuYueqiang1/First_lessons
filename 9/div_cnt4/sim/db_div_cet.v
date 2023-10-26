// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : db_div_cet.v
// Create : 2023-10-23 10:50:03
// Revise : 2023-10-23 10:59:11
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
`timescale 1ns/1ns
module db_div_cet();
reg clk,rst;
wire clk_4;

initial begin
	clk=0;
	rst=1;
	#100
	rst=0;
end

always #10 clk=~clk;
div_cnt div_cnt_inst(
	.clk(clk),
	.rst(rst),
	.clk_4(clk_4)
	);

endmodule
