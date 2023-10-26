// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : a_and_b.v
// Create : 2023-10-21 15:38:01
// Revise : 2023-10-21 15:51:24
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------

module a_and_b(
input wire pi_a,
input wire pi_b,
input wire clk,
output wire po_c1,// 组合逻辑
output reg po_c2 //时序逻辑
	);
assign po_c1 = pi_a & pi_b; //wire 类型的是assign

always @(posedge clk) begin  //reg类型的是always
	po_c2<=pi_a&pi_b;  //将pi_a和pi_b以时钟的形式赋值给po_c2
end

endmodule