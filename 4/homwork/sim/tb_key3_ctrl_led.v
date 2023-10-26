`timescale 1ns/1ns
module tb_key3_ctrl_led();
reg key11;
reg key21;
reg key31;
wire led1;
always #10 key11={$random};
always #15 key21={$random};
always #20 key31={$random};
	key3_ctrl_led inst_key3_ctrl_led (
		.key1(key11), 
		.key2(key21), 
		.key3(key31), 
		.led(led1)
);
endmodule
