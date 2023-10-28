// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : fsm.v
// Create : 2023-10-27 20:17:55
// Revise : 2023-10-27 20:38:42
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
module fsm(
	input wire clk,
	input wire rst_n,
	input wire pi_money,
	output reg po_cola
	);
	
	reg [2:0] state;
	parameter IDLE='b001 ;
	parameter ONE='b010;
	parameter TWO='b100;
	//异步有效，下降沿也有效
	//时序逻辑描述的状态转移
	always @(posedge clk or negedge rst_n) begin
		if (rst_n==0) begin
			// reset
			state=IDLE;
		end
		else case (state)
		IDLE:if (pi_money==1)
		state<=ONE;
		ONE:if (pi_money==1)
		state<=TWO;
		TWO:if (pi_money==1)
		state<=IDLE;
		default:
		state<=IDLE;
		endcase
	end

	//二段式 输出
	always @(posedge clk or negedge rst_n) begin
		if (rst_n==0) begin
			// reset
			po_cola<=0;
		end
		else if (state==TWO&&pi_money==1) begin
			po_cola<=1;
		end
		else begin
			po_cola<=0;
		end
	end

endmodule