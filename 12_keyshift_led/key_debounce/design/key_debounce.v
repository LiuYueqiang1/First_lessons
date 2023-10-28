// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : key_debounce.v
// Create : 2023-10-28 21:01:46
// Revise : 2023-10-28 22:19:01
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
module key_debounce(
	input wire sclk,
	input wire rst_n,
	input wire key,
	output wire [3:0] led
	);
	
	//输出led
	reg [3:0] shiftled='b0001;

	reg cnt_flag;		//计数器标志
	reg [17:0] cnt;		//消抖计数器
	reg po_key_flag;	//消抖后产生的标志

	//cnt
	always @(posedge sclk or negedge rst_n) begin
		if (rst_n==0)
		cnt<=18'b0;
		else if (key==0) begin
			cnt<=cnt+1'b1;	//cnt可以在18位二进制内一直加，在key变为低电平的时候，即按键按下后一直计数.
		end
		else 
		cnt<=18'b0;			//只要key后抖动一变高，则重置.
	end
	//cnt_flag		//防止产生多个 po_key_flag，则灯会在一次按下一位多次.
	always @(posedge sclk or negedge rst_n) begin
		if (rst_n==0) 
			cnt_flag<=1'b0;
			else if(cnt=='d24_9999) begin //在5ms即250000个时钟周期后变为1
			//****因为cnt_flag在后抖动之前无论多长时间，都是高电平，消除了产生多次po_key_flag的可能****
				cnt_flag<=1'b1;			
			end
			else if(key==1'b1)			//一旦开始后抖动，变为0
			cnt_flag<=0;
	end
	//po_key_flag
	always @(posedge sclk or negedge rst_n) begin
	if (rst_n==0)
	po_key_flag<=1'b0;
	//采的是249999的前面时刻的，仅在cnt_flag低电平有效，后面的虽然也可能会达到cnt==249999，但是cnt_flag在后抖动之前一直是高电平的
	else if (cnt=='d24_9999 && cnt_flag==1'b0)
	po_key_flag<=1'b1;
	else 
	po_key_flag<=1'b0;
	end
	//shifled
	always @(posedge sclk or negedge rst_n) begin
	if (rst_n==0)
	shiftled<='b0001;
	else if (po_key_flag==1)
	shiftled<={shiftled[2:0],shiftled[3]};
	end

	assign led = shiftled;
endmodule