// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : div_clk_5.v
// Create : 2023-10-24 16:55:26
// Revise : 2023-10-24 17:29:31
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
module div_clk_5(
	input wire clk,
	input wire rst,
	output wire clk_5
	);
	
	reg [2:0] pos_cnt=1'b0;
	reg pos_clk=1'b0;
	reg [2:0] neg_cnt;
	reg neg_clk=1'b0;

	//写pos_cnt
	always @(posedge clk) begin
	if (rst==1)
	pos_cnt<=0;
	else if (pos_cnt!=3'd4)
		pos_cnt<=pos_cnt+1'b1;
	else 
		pos_cnt<=0;
	end

	//写pos_clk
	always @(posedge clk)begin
	if (rst==1)
	pos_clk<=0;
	else if (pos_cnt==2'd2)
	pos_clk<=1'b1;
	else if(pos_cnt==3'd4)
	pos_clk<=1'b0;
	end

	//写neg_cnt，下降沿
	always @(negedge clk)begin
		if (rst==1)
		neg_cnt<=0;
	else if (neg_cnt!=3'd4)
		neg_cnt<=neg_cnt+1'b1;
	else 
		neg_cnt<=0;
	end

	//写neg_clk，下降沿
	always @(negedge clk)begin
	if (rst==1)
	neg_clk<=0;
	else if (neg_cnt==2'd2)
	neg_clk<=1'b1;
	else if(neg_cnt==3'd4)
	neg_clk<=1'b0;
	end

	//写输出clk_5
	assign clk_5=pos_clk|neg_clk;

endmodule