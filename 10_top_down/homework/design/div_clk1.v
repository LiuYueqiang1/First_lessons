// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : div_clk1.v
// Create : 2023-10-26 20:05:03
// Revise : 2023-10-26 20:05:03
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
module div_clk1(
	input wire clk,
	input wire rst_n,
	output reg po_flag
	);

	wire rst;
	assign rst = ~rst_n;

	reg [1:0] clk_cnt;
	//计数器
	always @(posedge clk)begin
		if (rst==1)
		clk_cnt<=0;
		else if (clk_cnt=='d3)
		clk_cnt <=0;
		else begin
			clk_cnt<=clk_cnt+1'b1;
		end
	end

	always @(posedge clk)begin
		if (rst==1)
		po_flag<=0;
		else if (clk_cnt=='d2)
		po_flag<=1'b1;
		else begin
			po_flag<=1'b0;
		end
	end

endmodule