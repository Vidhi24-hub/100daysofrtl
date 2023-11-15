module tb_gcd();
  parameter width=8;
  reg [width-1:0] a,b;
  wire [width-1:0] gcd;
  
  gcd dut(a,b,gcd);
  
  initial begin
    
    #0; a=0; b=0; 
    #4; a=8'h24; b=8'h40;
    #4; a=8'h17; b=8'h20;
    #4; $finish;
    
  end
endmodule