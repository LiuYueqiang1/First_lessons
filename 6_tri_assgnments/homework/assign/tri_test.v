// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : tri_test.v
// Create : 2023-10-22 11:25:19
// Revise : 2023-10-22 11:44:43
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
module tri_test(
input wire clk,
input wire ia,
input wire ib,
output reg oc=1'b1
	);

always @(posedge clk) begin
	oc<=ia|ib;
end

endmodule