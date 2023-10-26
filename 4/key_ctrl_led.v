module key_ctrl_led(
input wire key1,
input wire key2,
output wire led
	);
assign led = key1&key2;
endmodule