// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : keyshiftled.v
// Create : 2023-10-28 17:20:31
// Revise : 2023-10-28 17:40:56
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
module keyshiftled(
	input wire clk,
	input wire rst_n,
	input wire key,
	output wire [3:0] led
	);
	reg key_reg;
	reg [3:0] shiftled='b0001;

	//寄存器打拍
	always @(posedge clk or negedge rst_n) begin
		if (rst_n==1'b0)  
			key_reg<=1'b1; //无按键的时候key_reg初始值为1
		else 
		key_reg<=key;
	end
	//led 转移
	always @(posedge clk or negedge rst_n) begin
		if (rst_n==1'b0) 
			shiftled<='b0001;
		else if(key==1'b0 && key_reg==1'b1)
		shiftled<={shiftled[2:0],shiftled[3]};
	end
	assign led = shiftled;
endmodule