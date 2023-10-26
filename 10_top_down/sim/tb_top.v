// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : tb_top.v
// Create : 2023-10-26 15:34:34
// Revise : 2023-10-26 17:19:10
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
`timescale 1ns/1ns
module tb_top();
	reg pi_a,pi_b,rst_n,clk;
	wire po_c;

	initial begin
		pi_a=0;
		pi_b=0;
		clk=0;
		rst_n=0;
		#100
		rst_n=1;
	end
	always #10 clk=~clk;
	always #20 pi_a = {$random};
	always #20 pi_b = {$random};

	top top_inst(
		.pi_a(pi_a),
		.pi_b(pi_b),
		.rst_n(rst_n),
		.clk(clk),
		.po_c(po_c)
		);

endmodule 