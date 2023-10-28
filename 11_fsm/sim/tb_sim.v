// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : tb_sim.v
// Create : 2023-10-27 20:28:55
// Revise : 2023-10-27 21:58:24
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
`timescale 1ns/1ns
module tb_sim();
	reg clk,rst_n,pi_money;
	wire po_cola;

	initial begin
		clk=1;
		rst_n=0;
		#20
		rst_n=1;
	end
	always #5 clk=~clk;
	always #20 pi_money={$random};

		fsm inst_fsm (
			.clk      (clk),
			.rst_n    (rst_n),
			.pi_money (pi_money),
			.po_cola  (po_cola)
		);

endmodule