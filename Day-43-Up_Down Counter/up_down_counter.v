module up_down_counter(clk,rst,mode,out);
  parameter width=8;
  input clk,rst,mode;
  output reg [width-1:0] out;
  
  always@(negedge clk or posedge rst)
    begin

      if(rst)
        out <= 0;
      else if(!mode)
        out <= out + 1;
      else 
        out <= out - 1;
	
    end
endmodule
        
