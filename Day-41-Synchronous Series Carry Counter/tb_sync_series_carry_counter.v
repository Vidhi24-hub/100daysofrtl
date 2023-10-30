module tb_sync_series_carry_counter();
  reg clk;
  wire [3:0] out;
  
  sync_series_carry_counter dut(clk,out);
  
  always #3 clk = ~clk;
  
  initial begin
    
    #0; clk=0; 
    #100; $finish;
    
  end
endmodule
