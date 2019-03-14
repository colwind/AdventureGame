module sword(sw,reset,clk,V);
input sw,reset,clk;
output V;
reg V=0;
always @ (posedge clk, negedge reset)
	begin
		if (~reset) V<=1'b0;
			else begin
					if (sw) V<=1'b1;
						else V<=V;
				end
	end
endmodule
