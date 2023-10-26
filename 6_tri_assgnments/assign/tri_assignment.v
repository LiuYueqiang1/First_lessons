// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : tri_assignment.v
// Create : 2023-10-22 10:37:31
// Revise : 2023-10-22 11:09:36
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
module tri_assignment(
input wire clk,
input wire a,
input wire b,
output wire c1,
output reg c2,//c2是一个线网 不是存储器不能进行赋值 ；wire类型的不能设置初始值
output reg c3=1'b0
	);
//组合逻辑
assign c1 = a&b;
//always
//按照电平触发(always实现组合逻辑)
// always@(*)begin 
// 如果敏感列表触发电平信号不全导致锁存器的产生
always @(a or b) begin
c2 = a&b;
end
//时序逻辑
//按照上升沿触发
always @(posedge clk) begin
c3 <= a&b;
end

endmodule