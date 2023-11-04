module tb_clk_divider;
  reg clk_in;
  wire clk_out;
  
  clk_divider dut(clk_in,clk_out);
  
  always #1 clk_in=~clk_in;
  
  initial begin
    
    #0; clk_in=0;
    #200; $finish;
    
  end
endmodule