module johnson_counter(clr,clk,out);
  parameter width=4;
  input clr,clk;
  output reg [width-1:0] out;
  
  always@(negedge clk or negedge clr)
    begin

      if(!clr) 
          out <= 0; 
        
      else 
        out <= {~out[0],out[width-1:1]};
        
    end
   
endmodule 