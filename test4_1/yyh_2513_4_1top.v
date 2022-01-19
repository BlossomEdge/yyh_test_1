module yyh_2513_4_1top(dout0,dout1,dout2);
output reg [6:0]dout0,dout1,dout2;
wire key_in,key_flag,key_state;
wire a,b,c;
wire count_out;

yyh_2513_4_1(clk,rst_n,key_in,key_flag,key_state,digital,count_out);
assign a=(count_out*2/10000)%10;
assign b=(count_out*2/10000)/10%10; 
assign c=(count_out*2/10000)/100;

always@(a)
	case(a-1)
	4'b0000:dout0<=7'b1000000;//0
	4'b0001:dout0<=7'b1111001;//1
	4'b0010:dout0<=7'b0100100;//2
	4'b0011:dout0<=7'b0110000;//3
	4'b0100:dout0<=7'b0011001;//4
	4'b0101:dout0<=7'b0010010;//5
	4'b0110:dout0<=7'b0000010;//6
	4'b0111:dout0<=7'b1111000;//7
	4'b1000:dout0<=7'b0000000;//8
	4'b1001:dout0<=7'b0010000;//9
	default:dout0<=7'b1111111;//全不亮
	endcase
always@(b)
	case(b-1)
	4'b0000:dout1<=7'b1000000;//0
	4'b0001:dout1<=7'b1111001;//1
	4'b0010:dout1<=7'b0100100;//2
	4'b0011:dout1<=7'b0110000;//3
	4'b0100:dout1<=7'b0011001;//4
	4'b0101:dout1<=7'b0010010;//5
	4'b0110:dout1<=7'b0000010;//6
	4'b0111:dout1<=7'b1111000;//7
	4'b1000:dout1<=7'b0000000;//8
	4'b1001:dout1<=7'b0010000;//9
	default:dout1<=7'b1111111;//全不亮
	endcase
	always@(c)
	case(c-1)
	4'b0000:dout2<=7'b1000000;//0
	4'b0001:dout2<=7'b1111001;//1
	4'b0010:dout2<=7'b0100100;//2
	4'b0011:dout2<=7'b0110000;//3
	4'b0100:dout2<=7'b0011001;//4
	4'b0101:dout2<=7'b0010010;//5
	4'b0110:dout2<=7'b0000010;//6
	4'b0111:dout2<=7'b1111000;//7
	4'b1000:dout2<=7'b0000000;//8
	4'b1001:dout2<=7'b0010000;//9
	default:dout2<=7'b1111111;//全不亮
	endcase
  endmodule
