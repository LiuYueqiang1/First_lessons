// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : operaters.v
// Create : 2023-10-22 17:21:00
// Revise : 2023-10-22 22:01:41
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
module operaters(
input wire clk,
input wire rst,//复位
output reg [7:0] po_a=8'b1
	);
/*
always @(posedge clk) begin
	if (rst==1'b1)
	po_a <= 8'b0000_0001;
	else if  (po_a != 8'b1000_0000)
	po_a<= po_a<<1;
	else 
	po_a<= 8'b0000_0001;
end
*/
always @(posedge clk) begin
	if (rst==1'b1)
	po_a <= 8'b0000_0001;
	else 
	po_a <= {po_a[6:0],po_a[7]};
end

endmodule