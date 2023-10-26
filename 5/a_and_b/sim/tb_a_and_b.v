// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : tb_a_and_b.v
// Create : 2023-10-21 15:51:11
// Revise : 2023-10-21 15:51:21
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
`timescale 1ns/1ns
module tb_a_and_b();
//输入
reg pi_a,pi_b,inclk;
//输出
wire c1,c2;

//给输入激励
always #15 pi_a={$random};
always #20 pi_b={$random};

initial begin
	inclk=0;
end
always #10 inclk=~inclk;

//实例化
a_and_b a_and_b_inst(
	.pi_a(pi_a),
	.pi_b(pi_b),
	.clk(inclk),
	.po_c1(c1),
	.po_c2(c2)
	);
endmodule