// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : a_and_b.v
// Create : 2023-10-26 15:09:57
// Revise : 2023-10-26 21:02:39
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
module a_and_b (
input wire pi_a,
input wire pi_b,
input wire pi_flag16,
input wire rst_n,
input wire clk,
output reg po_c
	);
	wire rst;
	assign rst = ~rst_n;

always@(posedge clk)begin
	if (rst==1)
	po_c<=0;
	else if (pi_flag16==1)
	po_c<=pi_a&pi_b;
end

endmodule