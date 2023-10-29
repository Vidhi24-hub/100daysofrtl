module decade_counter(clk,rst,out);
  input clk,rst;
  output reg [3:0] out;
  
  
  always@(negedge clk or negedge rst)
    begin

      if(!rst) 
		  out <= 0; 
        
      else if(out < 4'd9)
        out <= out + 4'd1;
      
      else 
        out <= 0;
        
    end
endmodule