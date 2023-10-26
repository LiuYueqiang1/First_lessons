// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : falsh_led.v
// Create : 2023-10-23 21:05:15
// Revise : 2023-10-23 22:20:44
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
module falsh_led(
	input wire sclk, //系统时钟
	input wire rst_n,  // 一旦按键按下，则接地
	output reg led=1'b0
	);

	//定义内部变量
	parameter END_CNT=49999999;
	wire rst;
	reg [25:0] div_cnt=1'd0;
	reg one_s_flag=1'b0;

	//active L --->active H
	assign rst = ~rst_n;
	// 计数器
	always @(posedge sclk ) begin
		if (rst==1'b1) // 高电平有效是指高电平给它们赋初值。
		div_cnt<='d0;
		else if (div_cnt==END_CNT)
		div_cnt<='d0;
		else 
			div_cnt<=div_cnt+1;
	end
	//one_s_flag
	always @(posedge sclk) begin
	if (rst==1)
	one_s_flag<=1'b0;
	else if (div_cnt==(END_CNT-1))
	one_s_flag<=1'b1;
	else if (div_cnt==END_CNT)
	one_s_flag<=1'b0;
	end
	//led
	always @(posedge sclk) begin
		if (rst==1'b1) 
		led<=1'b0;
		else if (one_s_flag==1'b1) 
			led<=~led;
	end
endmodule