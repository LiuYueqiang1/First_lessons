// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : div_count_4.v
// Create : 2023-10-23 20:02:32
// Revise : 2023-10-23 21:05:07
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
module div_count_4(
	input wire clk,
	input wire rst,
	output reg [1:0] po_cnt
	);
	reg [1:0] div_cnt;//定义计数器
	reg div_flag=1'b0; //定义分频时钟

//计算时钟周期个数
	always @(posedge clk)begin
	if (rst==1'b1)
	div_cnt<=0;
	else 
		div_cnt<=div_cnt+1'b1;
	end
//产生分频时钟
	always @(posedge clk)begin
	if (rst==1'b1)
	div_flag<=0;
	else if (div_cnt==2'd1)	
	div_flag<=1'b1;
	else 
	div_flag<=1'b0;
	end
//记录分频时钟个数
	always @(posedge clk) begin
	if (rst==1)
	po_cnt<=0;
	else if(div_flag==1)
	po_cnt<=po_cnt+1;
	end
endmodule