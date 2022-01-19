module Decoder(codein,codeout);
input[3:0]codein;
output reg[6:0]codeout;
always@(codein)
begin
   case(codein)
	4'b0000:codeout <= 7'b1000000;//0
	4'b0001:codeout <= 7'b1111001;//1
	4'b0010:codeout <= 7'b0100100;//2
	4'b0011:codeout <= 7'b0110000;//3
	4'b0100:codeout <= 7'b0011001;//4
	4'b0101:codeout <= 7'b0010010;//5
	4'b0110:codeout <= 7'b0000010;//6
	4'b0111:codeout <= 7'b1111000;//7
	4'b1000:codeout <= 7'b0000000;//8
	4'b1001:codeout <= 7'b0010000;//9
	4'b1010:codeout <= 7'b0001000;//10
	4'b1011:codeout <= 7'b0000011;//11
	4'b1100:codeout <= 7'b0100111;//12
	4'b1101:codeout <= 7'b0100001;//13
	4'b1110:codeout <= 7'b0000110;//14
	default:codeout <= 7'b1111111;
	endcase
end
endmodule