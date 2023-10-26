module ring_counter(preset,clr,clk,out);
  parameter width=8;
  input preset,clr,clk;
  output reg [width-1:0] out;
  wire ori;
  
  assign ori = preset & clr;
  
  always@(negedge clk or negedge ori)
    begin
	 
	 if(!ori)
       begin 
         out [width-2:0] <= 0; 
         out [width-1] <= 1; 
       end 
	 else 
       out <= {out[0],out[width-1:1]};
     
    end
 
endmodule 
