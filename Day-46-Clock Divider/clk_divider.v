module clk_divider(clk_in,clk_out);
  input clk_in;
  output clk_out;
  reg [2:0]m;

  initial m=0;

  always@(posedge clk_in)
    begin
      m<=m+1;
    end
  
  assign clk_out=m[2];
endmodule
  
  
  
  
  