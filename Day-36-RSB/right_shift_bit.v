module right_shift_bit(in,clk,rst,out);
input clk, rst;
input [3:0] in;
output reg [3:0] out;
	

	always @(posedge clk or posedge rst) 
	begin
	  if (rst) 
	    out <= 0;
	 
	  else 
	  begin
	    out <= {1'b0, in[3:1]};    
	  end
	end

endmodule