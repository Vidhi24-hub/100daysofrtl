module tb_moore();
  reg in,clk,rst;
  wire out;
  
  moore dut(in,clk,rst,out);
  
  always #2 clk=~clk;
  
  initial begin

    #0; clk=0; rst=0; in=0;
    #3; in=1;
    #3; in=0;
    #3; rst=1;
    #3; rst=0;
    #3; in=1;
    #30; $finish;
    
  end
endmodule
  