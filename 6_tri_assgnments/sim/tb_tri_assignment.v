// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : tb_tri_assignment.v
// Create : 2023-10-22 10:44:50
// Revise : 2023-10-22 11:01:11
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
`timescale 1ns/1ns
module tb_tri_assignment();
reg inclk;
reg ia,ib;

wire oc1,oc2,oc3;

initial begin
	ia=0;
	ib=0;
	inclk=0;
end

always #15 ia={$random};
always #20 ib={$random};

always #10 inclk=~inclk;

tri_assignment tri_assignment_inst(
	.clk(inclk),
	.a(ia),
	.b(ib),
	.c1(oc1),
	.c2(oc2),
	.c3(oc3)
	);

endmodule