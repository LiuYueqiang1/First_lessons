// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : fsm_2.v
// Create : 2023-10-27 21:58:37
// Revise : 2023-10-28 11:09:48
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
module fsm_2(
	input wire clk,
	input wire rst_n,
	input wire pi_money,
	output reg po_cola,
	output reg po_money
	);

	reg [4:0] state;
	parameter IDLE='b0_0001;
	parameter M05='b0_0010;
	parameter M1='b0_0100;
	parameter M105='b0_1000;
	parameter M2='b1_0000;

	//逻辑关系
	always @(posedge clk or negedge rst_n) begin
		if (rst_n==0)
		state<=IDLE;
		else case (state)
		IDLE:if (pi_money==1)
			state<=M1;
			else begin
				state<=M05;
			end
			M05:if(pi_money==1'b1)
			state<=M105;
			else begin
				state<=M1;
			end
			M1:if(pi_money==1'b1)
			state<=M2;
			else begin
				state<=M105;
			end
			M2:
			state<=IDLE;

			default:
			state<=IDLE;
		endcase
	end

	//输出可乐
	always @(posedge clk or negedge rst_n) begin
		if (rst_n==0) begin
			po_cola<=0;
		end
		else if (state==M2)
		po_cola<=1;
		else begin
			po_cola<=0;
		end
	end
	//输出钱
	always @(posedge clk or negedge rst_n) begin
		if (rst_n==0) begin
			po_money<=0;
		end
		else if (state==M2)
		po_money<=1;
		else begin
			po_money<=0;
		end
	end
endmodule