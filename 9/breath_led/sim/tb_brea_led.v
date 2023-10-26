// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : tb_brea_led.v
// Create : 2023-10-25 22:20:28
// Revise : 2023-10-25 22:24:03
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
`timescale 1ns/1ns
module tb_brea_led();
	reg clk,rst_n;
	wire led;

	initial begin
		clk=0;
		rst_n=0;
		#100
		rst_n=1;
	end

	always #10 clk = ~clk;

		brea_led inst_brea_led (.clk(clk), .rst_n(rst_n), .led(led));

endmodule