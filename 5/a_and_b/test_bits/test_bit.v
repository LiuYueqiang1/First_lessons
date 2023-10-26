module test_bit(
input wire clk,
input wire [1:0] pi_a,
input wire [2:0] pi_b,
output reg [3:0] po_c
	);

parameter W=15; //不能在接口里面使用parameter
reg [7:0] counter;
reg [7:0] counter2=8'd255;//8'hff //8'b1111_1111
//十进制 8'd81  十六进制 8'h51  二进制 8'b0101_0001
//255默认是32bit

//reg [3:0] 代表低四位  counter2=255;
//4'b1111 4'd15 4'hf

//reg [3:0] 代表低四位  counter2=81
//counter2=4'b0001; 4'd1 4'h1

wire [W:0] interface_a;

always @(posedge clk) begin
	po_c <= pi_a & pi_b;
end

endmodule