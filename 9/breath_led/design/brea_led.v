// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : brea_led.v
// Create : 2023-10-24 20:12:28
// Revise : 2023-10-26 09:59:35
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
module brea_led(
	input wire clk,
	input wire rst_n,
	output wire led
	);
	
	//定义内部变量
	wire rst;
	assign rst = ~rst_n;

	reg [6:0] clk50Mcnt;
	reg [9:0] clk50Mcnt_1000;
	reg [9:0] pwn_cyc_cnt;
	reg pwm_flag;
	//定义晶振时钟计数器
	always@(posedge clk)begin
	if (rst==1) 
	clk50Mcnt<='d0;
	else if (clk50Mcnt=='d99)
	clk50Mcnt<='d0;
	else 
	clk50Mcnt<=clk50Mcnt+1'b1;	
	end

	//定义记录占空比高低电平个数
	always @(posedge clk) begin
	if (rst==1) 
	clk50Mcnt_1000<='d0;
	else if (clk50Mcnt=='d99 && clk50Mcnt_1000=='d999)
		clk50Mcnt_1000<=0;
	else if (clk50Mcnt=='d99)
	clk50Mcnt_1000<=clk50Mcnt_1000+1'b1;
	end

	//定义记录分成1000份呼吸灯的个数
	always @(posedge clk) begin
	if (rst==1) 
	pwn_cyc_cnt<='d0;
	else if (clk50Mcnt=='d99 && clk50Mcnt_1000=='d999 && pwn_cyc_cnt=='d999)
	pwn_cyc_cnt<=0;
	else if (clk50Mcnt=='d99 && clk50Mcnt_1000=='d999)
		pwn_cyc_cnt<=pwn_cyc_cnt+1'b1;
	end

	//记录从亮到灭还是从灭到亮的标志
	always @(posedge clk) begin
	if (rst==1)
	pwm_flag<=1'b0;
	else if (clk50Mcnt=='d99 && clk50Mcnt_1000=='d999 && pwn_cyc_cnt=='d999) begin
		pwm_flag<= ~pwm_flag;
	end
	end

	assign led=(pwm_flag==1'b0)?((clk50Mcnt_1000<pwn_cyc_cnt)?1'b0:1'b1):((clk50Mcnt_1000<pwn_cyc_cnt)?1'b1:1'b0);

endmodule