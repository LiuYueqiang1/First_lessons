`timescale 1ns/1ns
module tb_key_ctrl_led();
reg key1;
reg key2;
wire led;

always #10 key1={$random};

always #15 key2={$random};

key_ctrl_led key_ctrl_led_inst(
.key1(key1),
.key2(key2),
.led(led)
	);
endmodule