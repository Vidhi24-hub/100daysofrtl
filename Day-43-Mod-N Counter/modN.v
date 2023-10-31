module modN(clk,rst,out);
  parameter n=5;
  parameter width=8;
  input clk,rst;
  output reg [width-1:0] out;
  
  always@(negedge clk or posedge rst)
    begin

      if(rst)
        out <= 0;

      else if(out==n)
        out <= 0;

      else 
        out <= out + 1;

    end

endmodule
        