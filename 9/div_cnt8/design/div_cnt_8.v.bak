// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : div_cnt_1.v
// Create : 2023-10-23 10:34:19
// Revise : 2023-10-23 15:11:20
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
module div_cnt_1(
	input wire clk,
	input wire rst,
	output reg [1:0] po_cnt=2'b0
	);

	reg [1:0] divcnt; //定义内部变量
	reg clk_4;//定义分频时钟
//计算时钟周期个数
always @(posedge clk ) begin
	if (rst==1'b1)
		divcnt<=2'b0;
		//这里省略了=3的
	else
		divcnt<=divcnt+1'b1;
end
//产生4分频时钟
always @(posedge clk ) begin
	if (rst==1'b1)
		clk_4<=0;
		else if (divcnt==2'd1)
		clk_4<=1;
		else if (divcnt==2'd3)
		clk_4<=0;
end
//定义计数器记录8分频时钟周期个数
always @(posedge clk_4) begin
	if (rst==1'b1)
	po_cnt<=2'd0;
	else if (po_cnt==2'd3)
	po_cnt<=2'd0;
	else 
	po_cnt<=po_cnt+1'b1;
end

endmodule