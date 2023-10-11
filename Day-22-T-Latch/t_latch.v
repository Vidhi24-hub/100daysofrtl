`timescale 1ns / 1ps

module t_latch(t,en,rst,q,q_bar);
input t,en,rst;
output reg  q;
output  q_bar;
  
always@(rst or en or t)
    begin
    
      if(rst)
      q<=0;
      
      else if(en)
        begin
          if(t)
            q<=~q;
          else
            q<=q;
        end
        
    end
 
 assign q_bar=~q;

endmodule
