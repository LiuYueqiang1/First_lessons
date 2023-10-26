// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : tb_tri_test.v
// Create : 2023-10-22 11:33:47
// Revise : 2023-10-22 16:06:17
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
`timescale 1ns/1ns
module tb_tri_test();
reg inclk;
reg a,b;
wire c;

initial begin
	inclk=0;
end
always #5 inclk=~inclk;
initial begin
	a=0;
	#10
	a=1;
	#40
	a=0;
end
initial begin
	b=1;
	#30
	b=0;
end

	tri_test inst_tri_test (
		.clk(inclk), 
		.ia(a), 
		.ib(b), 
		.oc(c)
		);

endmodule