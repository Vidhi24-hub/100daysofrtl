module tb_sync_series_carry_counter();
  reg clk,rst;
  wire [3:0] out;
  
  sync_series_carry_counter dut(clk,rst,out);
  
  always #3 clk = ~clk;
  
  initial begin
    
    #0; clk=0; rst=1;
    #4; rst=0;
    #100; $finish;
  end
endmodule