module tb_up_down_counter();
  parameter width=8;
  reg clk,rst,mode;
  wire [width-1:0] out;
  
  up_down_counter dut(clk,rst,mode,out);
  
  always #3 clk=~clk;
  
  initial begin
    
    #0; clk=0; rst=0; mode=0;
    #3; rst=1; 
    #3; rst=0; 
    #50; mode=1; 
    #80; $finish;
  end
endmodule
   