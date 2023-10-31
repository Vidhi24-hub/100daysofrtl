module tb_modN();
  parameter width=8;
  reg clk,rst;
  wire [width-1:0] out;
  
  modN dut(clk,rst,out);
  
  always #3 clk=~clk;
  
  initial begin
    
    #0; clk=0; rst=0;
    #3; rst=1; 
    #3; rst=0;  
    #80; $finish;
  end
endmodule
   