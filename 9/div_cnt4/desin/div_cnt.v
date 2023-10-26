// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : div_cnt.v
// Create : 2023-10-23 10:34:19
// Revise : 2023-10-23 20:02:27
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
module div_cnt(
	input wire clk,
	input wire rst,
	output reg clk_4=1'b0
	);

reg [1:0] divcnt; //定义内部变量

//计算时钟周期个数
always @(posedge clk ) begin
	if (rst==1'b1)
		divcnt<=2'b0;
		//这里省略了=3的
	else
		divcnt<=divcnt+1'b1;
end
//产生分配时钟
always @(posedge clk ) begin
	if (rst==1'b1)
		clk_4<=0;
		else if (divcnt==2'd1)
		clk_4<=1;
		else if (divcnt==2'd3)
		clk_4<=0;
end

endmodule