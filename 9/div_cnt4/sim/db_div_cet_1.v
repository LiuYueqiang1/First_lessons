// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : db_div_cet_1.v
// Create : 2023-10-23 10:50:03
// Revise : 2023-10-23 11:38:48
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
`timescale 1ns/1ns
module db_div_cet_1();
reg clk,rst;
wire [1:0] po_cnt;

initial begin
	clk=0;
	rst=1;
	#100
	rst=0;
end

always #10 clk=~clk;

div_cnt_1 div_cnt_inst_1(
	.clk(clk),
	.rst(rst),
	.po_cnt(po_cnt)
	);

endmodule
