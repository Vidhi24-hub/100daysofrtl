`timescale 10ns/10ps

module tb_clk_gen();
  reg clk;
  
  clk_gen dut(clk);
  
  always #5 clk=~clk;
  
  initial 
    begin
    $dumpfile("dump.vcd");
    $dumpvars();
      $monitor("t=%t | clk=%b", $time,clk);
    #0; clk=0;
    #200; $finish;
  end
endmodule
  