module ring_counter(preset,clr,clk,out);
  parameter width=8;
  input preset,clr,clk;
  output reg [width-1:0] out;
  
  always@(negedge clk)
    begin
      if(!preset && !clr)
        begin 
          out [width-2:0]  <= 0; 
          out[width-1] <= 1; 
        end
      else
        out <= {out[0],out[width-1:1]};
        
    end
   
endmodule 