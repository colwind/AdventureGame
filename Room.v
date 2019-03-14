module Room(clk,n,s,e,w,v,reset,s6,win,s5,d,s4,s3,sw,s2,s1,s0);
input clk,n,s,e,w,v,reset;
output reg win,d,sw,s6,s5,s4,s3,s2,s1,s0;
reg [2:0]now,next;
parameter r0=3'b000,r1=3'b001,r2=3'b010,r3=3'b011,r4=3'b100,r5=3'b101,r6=3'b110;
always @(posedge clk,negedge reset)
begin
	if (~reset) 
		begin
			next<=r0;
			now<=r0;
			sw<=1'b0;
		end
	else
		//begin
			now<=next;
			case (now)
				r0: begin 
							s0<=1'b1;
							s1<=1'b0; 
							s2<=1'b0; 
							s3<=1'b0; 
							s4<=1'b0; 
							s5<=1'b0; 
							s6<=1'b0; 
							sw<=1'b0; win<=1'b0; d<=1'b0; if (e) next<=r1; else next<=now; 
					end
				r1: begin 
							s0<=1'b0;
							s1<=1'b1; 
							s2<=1'b0; 
							s3<=1'b0; 
							s4<=1'b0; 
							s5<=1'b0; 
							s6<=1'b0;
							sw<=1'b0; win<=1'b0; d<=1'b0; if (w) next<=r0; else if (s) next<=r2; else next<=r1; 
					end
				r2: begin 
							s0<=1'b0;
							s1<=1'b0; 
							s2<=1'b1; 
							s3<=1'b0; 
							s4<=1'b0; 
							s5<=1'b0; 
							s6<=1'b0; 
							sw<=1'b0; win<=1'b0; d<=1'b0; if (n) next<=r1; else if (w) next<=r3; else if (e) next<=r4; else next<=now; 
					end
				r3: begin 
							s0<=1'b0;
							s1<=1'b0; 
							s2<=1'b0; 
							s3<=1'b1; 
							s4<=1'b0; 
							s5<=1'b0; 
							s6<=1'b0; 
							sw<=1'b1; win<=1'b0; d<=1'b0; if (e) next<=r2; else next<=now; 
							end 
				r4: begin 
							s0<=1'b0;
							s1<=1'b0; 
							s2<=1'b0; 
							s3<=1'b0; 
							s4<=1'b1; 
							s5<=1'b0; 
							s6<=1'b0; 
							sw<=1'b0; win<=1'b0; d<=1'b0; if (v) next<=r5; else next<=r6; 
					end
				r5: begin 
							s0<=1'b0;
							s1<=1'b0; 
							s2<=1'b0; 
							s3<=1'b0; 
							s4<=1'b0; 
							s5<=1'b1; 
							s6<=1'b0; 
							sw<=1'b0; win<=1'b1; d<=1'b0; next<=now; 
					end
				r6: begin 
							s0<=1'b0;
							s1<=1'b0; 
							s2<=1'b0; 
							s3<=1'b0; 
							s4<=1'b0; 
							s5<=1'b0; 
							s6<=1'b1; 
							sw<=1'b0; win<=1'b0; d<=1'b1; next<=now; 
					end
			endcase
		//end
end
endmodule
		
			