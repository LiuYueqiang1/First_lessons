// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : tb_operaters.v
// Create : 2023-10-22 17:30:45
// Revise : 2023-10-22 20:43:54
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
module tb_operaters();
reg inclk;
reg rst;
wire [7:0] po_a;

initial begin
inclk=0;
	rst=1;
	#100
	rst=0;
end
always #10 inclk=~inclk;

	operaters inst_operaters (
		.clk(inclk), 
		.rst(rst), 
		.po_a(po_a)
		);

endmodule