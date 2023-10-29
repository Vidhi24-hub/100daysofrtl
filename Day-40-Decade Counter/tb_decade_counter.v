module tb_decade_counter();
  reg clk,rst;
  wire [3:0] out;
  
  decade_counter dut(clk,rst,out);
  
  always #3 clk=~clk;
  
  initial begin
    
    #0; clk=0; rst=0; 
    #4; rst=1;
    #4; rst=0;
    #150; $finish;
    
  end
endmodule