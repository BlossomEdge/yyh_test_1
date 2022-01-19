module yyh_2513_4_1(
input clk,input key_in,input rst,
output reg key_flag,output reg key_state,output reg [6:0]codeout,
output wire [6:0]codeout0,output wire [6:0]codeout1,output wire [6:0]codeout2);
wire [3:0]K; wire [3:0]F; wire [3:0]C;
reg [9:0]t;
reg [3:0]Q;
reg [3:0]state;
parameter s0=4'b0001,s1=4'b0010,s2=4'b0100,s3=4'b1000;
reg temp0,temp1;
reg [18:0]cnt;
reg [20:0]count0;
reg [20:0]count1;
reg en;
reg full;
reg a,b;
wire pose,nege;
assign K=t/7'd100;
assign F=(t/7'd10)%7'd10;
assign C=t%7'd10;
Decoder U0(C,codeout0);
Decoder U1(F,codeout1);
Decoder U2(K,codeout2);
always @(posedge clk or negedge rst)
begin
  if(!rst)
  begin
  temp0<=0;
  temp1<=0;
  end
  else 
  begin
  temp1<=temp0;
  temp0<=key_in;
  end
end
assign pose=temp0&(!temp1);
assign nege=(!temp0)&temp1;
always @(posedge clk or negedge rst)
begin
  if(!rst)
  begin
	  key_flag<=0;
	  key_state<=1;
	  state<=s0;
	  en<=0;
	  Q<=4'd0;
	  t<=0;
	  a<=0;
	  b<=0;
  end
  else 
  begin
  case(state)
		 s0:begin
				b<=0;
				key_flag<=0;
				if(nege) 
				begin 
					state<=s1;
					en<=1;
				end
				else 
					state<=s0;
			 end
		 s1:begin a<=1;
			 if(full)
			 begin
				 key_flag<=1;
				 key_state<=0;
				 en<=0;
				 t<=(count0 * 2 - 20'd3000000) / 15'd10000;
				 state<=s2;
			 end
				else if(pose)
					begin 
						 state=s0;en<=0;
					end
						 else state<=s1;
				 end
		 s2:begin 
			  a<=0;
		     key_flag<=0;
			  
		     if(pose) begin
				  state<=s3;
				  en<=1;
		     end
			  else
			    state<=s2;
		    end
		 s3:begin 
				b<=1;
				if(full)
				begin
					key_flag=1;
					key_state=1;
					t<=(count1*2-20'd3000000)/15'd10000;
					state<=s0;
				if(Q==4'd9)Q<=4'd0;
            else
					Q<=Q+4'd1;
				end
				else if (nege) begin
					en<=0;
					state<=s2;
				end
				else
					state<=s3;
				end
       default:
				begin 
		         state<=s0;
			      en<=0;
			      key_flag=1;
			      key_state=1;
		      end
		 endcase
	case(Q)
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
	default:codeout <= 7'b1111111;
 endcase
		 
       end
 		 
end
always@(posedge clk or negedge rst)
begin
	if(!rst)
	  begin 
	  cnt<=19'd0;
	  end
	else if(en)
	  begin 
	  cnt<=cnt+1'd1; 
	  end
	else 
	cnt<=19'd0;
	end
always @(posedge clk or negedge rst)
begin 
   if(!rst)
	  begin count0<=21'd0;count1<=21'd0;end
	else if((state==s0||state==s1)&&a==1)begin count0<=count0+1'd1;count1<=0; end
	else if((state==s2||state==s3)&&b==1)begin count1<=count1+1'd1;count0<=0; end
	else begin count0<=count0;count1<=count1;end
end
always@(posedge clk or negedge rst)
	begin
	if(!rst)
	  full<=0;
	else if(cnt == 19'd 499_999)
	  full<=1;
	else
	  full<=0;
	end

endmodule