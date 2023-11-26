module tb_mealy_non_overlapping();
  reg in,clk,rst;
  wire out;
  
  mealy_non_overlapping dut(in,clk,rst,out); //1101 sequence detector
  
  always #2 clk=~clk;
  
  initial begin
    
    #0; clk=0; rst=1;
    #3; rst=0;
    @(negedge clk) in=0;
    @(negedge clk) in=1;
    @(negedge clk) in=1;
    @(negedge clk) in=0;
    @(negedge clk) in=1;
    @(negedge clk) in=1;
    @(negedge clk) in=0;
    @(negedge clk) in=1;
    @(negedge clk) in=1;
    @(negedge clk) in=0;
    @(negedge clk) in=1;
    
    #100; $finish;
  end
endmodule