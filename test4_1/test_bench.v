`timescale 1ns/1ns
module test_yyh_2513_4;

reg clk, rst_n, key_in;
wire key_flag, key_state;
wire [3:0]digital;

yyh_2513_4_1 t (
	.clk(clk), 
	.rst_n(rst_n), 
	.key_in(key_in), 
	.key_flag(key_flag), 
	.key_state(key_state),
	.digital(digital)
);

initial clk = 1;
always#10 clk = ~clk;  //时钟周期为20ns

initial begin 
	rst_n = 0;
	key_in = 0;
	#2000;
	rst_n = 1;
	#2000;
	
	#300_000 
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#20_000_100;
	
	#300_000;
	
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#30_100_000;
	#300_000 
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#30_000_100;
	#300_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#30_100_000;
	#300_000 
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#30_000_100;
	#300_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#1000_000;
	key_in = 1;#1000_000;
	key_in = 0;#30_100_000;
	
end
endmodule
