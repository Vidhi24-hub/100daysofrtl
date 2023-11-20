module fixed_priority_arbiter(req,clk,rst,gnt);
  input [3:0] req;
  input clk,rst;
  output reg [3:0] gnt;
  
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        gnt <= 0;
      
      else if(req[3])
        gnt <= 4'b1000;
      
      else if(req[2])
        gnt <= 4'b0100;
      
      else if(req[1])
        gnt <= 4'b0010;
      
      else if(req[0])
        gnt <= 4'b0001;
      
      else
        gnt <= 0;
      
    end
endmodule
  
              
  