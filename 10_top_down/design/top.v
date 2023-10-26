// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : top.v
// Create : 2023-10-26 15:20:45
// Revise : 2023-10-26 17:34:06
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
module top(
	input wire pi_a,
	input wire pi_b,
	input wire rst_n,
	input wire clk,
	output wire po_c //wire类型
	);

	wire flag;
	div_clk div_clk_inst(
		.clk(clk),
		.rst_n(rst_n),
		.po_flag(flag)
		);

	a_and_b a_and_b_inst(
		.pi_a(pi_a),//如果模块内部接口是输入例化时连接可以是wire变量也可以是reg
		.pi_b(pi_b),
		.pi_flag(flag),
		.rst_n(rst_n),
		.clk(clk),
		.po_c(po_c)//如果模块内接口是输出例化时必须连接wire变量
		);

endmodule