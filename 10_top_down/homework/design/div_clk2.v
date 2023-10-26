// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : div_clk2.v
// Create : 2023-10-26 11:11:51
// Revise : 2023-10-26 21:15:38
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
module div_clk2(
	input wire clk,
	input wire rst_n,
	input wire pi_flag,
	output reg po_flag16
	);

	wire rst;
	assign rst = ~rst_n;

	reg [1:0] clk_cnt16;
	//计数器
	always @(posedge clk)begin
		if (rst==1)
		clk_cnt16<=0;
		else if (pi_flag==1)
		clk_cnt16<=clk_cnt16+1'b1;
	end

	//十六分频波形
	always @(posedge clk)begin
		if (rst==1)
		po_flag16<=0;
		else if(clk_cnt16=='d3&&pi_flag==1)
		po_flag16<=1;
		else 
		po_flag16<=0;
	end
	
endmodule