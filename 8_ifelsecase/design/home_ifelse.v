// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : home_ifelse.v
// Create : 2023-10-22 21:55:26
// Revise : 2023-10-23 09:24:59
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
module home_ifelse(
input wire clk,
input wire rst,
output reg [3:0] po_cnt=4'b0
	);

always @(posedge clk) begin
	if (rst==1) 
	po_cnt=0;
	else if (po_cnt==4'd15) begin
		po_cnt<= 4'b0;
	end
	else 
	po_cnt<=po_cnt+1'b1;
end
// 4'd15 = 1111
//input wire [3:0] test,
// 2'd15 = 0011
endmodule

