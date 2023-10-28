// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : Yueqiang Liu lyq15684175732@163.com
// File   : tb_fsm2.v
// Create : 2023-10-28 10:34:57
// Revise : 2023-10-28 10:36:16
// Editor : sublime text3, tab size (4)
// -----------------------------------------------------------------------------
`timescale 1ns/1ns
module tb_fsm2();
	reg clk,rst_n,pi_money;
	wire po_cola,po_money;

	initial begin
		clk=1;
		rst_n=0;
		#20
		rst_n=1;
	end
	always #5 clk=~clk;
	always #20 pi_money={$random};
		fsm_2 inst_fsm_2 (
			.clk      (clk),
			.rst_n    (rst_n),
			.pi_money (pi_money),
			.po_cola  (po_cola),
			.po_money (po_money)
		);

endmodule