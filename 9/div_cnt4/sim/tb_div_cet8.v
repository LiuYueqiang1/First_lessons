// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : tb_div_cet8.v
// Create : 2023-10-23 15:54:21
// Revise : 2023-10-23 16:28:53
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
`timescale 1ns/1ns
module tb_div_cet8();
reg clk,rst;
wire clk_8;

initial begin
	clk=0;
	rst=1;
	#100
	rst=0;	
end
always #10 clk=~clk;

div_cnt_8 div_cnt_8_inst(
	.clk(clk),
	.rst(rst),
	.clk_8(clk_8)
	);

endmodule