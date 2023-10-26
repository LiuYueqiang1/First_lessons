// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : tb_homeifelse.v
// Create : 2023-10-22 21:59:26
// Revise : 2023-10-22 22:34:14
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
`timescale 1ns/1ns
module tb_homeifelse();
reg clk,rst;
wire [3:0] po_cnt;

initial begin
	clk=0;
	rst=1;
	#100
	rst=0;
end

always #10 clk=~clk;

	home_ifelse inst_home_ifelse (
		.clk(clk), 
		.rst(rst), 
		.po_cnt(po_cnt)
		);

endmodule