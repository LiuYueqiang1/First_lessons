// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : tb_div_count_4.v
// Create : 2023-10-23 20:24:35
// Revise : 2023-10-23 20:30:03
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
`timescale 1ns/1ns
module tb_div_count_4();
reg clk,rst;
wire [1:0] po_cnt;

initial begin
	clk=0;
	rst=1;
	#100
	rst=0;
end
always #10 clk=~clk;

	div_count_4 inst_div_count_4 (
		.clk(clk), 
		.rst(rst), 
		.po_cnt(po_cnt)
		);


endmodule