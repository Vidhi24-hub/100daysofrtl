module sync_series_carry_counter(clk,rst,out);
  input clk,rst;
  output reg [3:0] out;
  wire a1,a2;
  
  assign a1 = out[0] & out[1];
  assign a2 = a1 & out[2];
  
  always@(posedge clk or posedge rst)
    begin
	 
    if(rst)
      out <= 0;
		
      else 
        begin
          out[0] <= ~out[0];
          
          if(out[0])
            out[1] <= ~out[1];
				
          if(a1)
            out[2] <= ~out[2];
				
          if(a2)
            out[3] <= ~out[3];
      end
		
  end
  
endmodule    
          
        