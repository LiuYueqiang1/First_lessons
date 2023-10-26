// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : tb_flash_led.v
// Create : 2023-10-23 21:18:56
// Revise : 2023-10-23 22:17:24
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
`timescale 1ns/1ns
module tb_flash_led();
	reg sclk,rst_n;
	wire led;

	initial begin
		sclk=0;
		rst_n=0;
		#100;
		rst_n=1;
	end
	always #10 sclk=~sclk;
	falsh_led falsh_led_inst(
		.sclk(sclk),
		.rst_n(rst_n),
		.led(led)
		);

endmodule