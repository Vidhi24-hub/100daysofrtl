module tb_fixed_priority_arbiter();
  reg [3:0] req;
  reg clk,rst;
  wire [3:0] gnt;
  
  fixed_priority_arbiter dut(req,clk,rst,gnt);
  
  always #2 clk=~clk; 
  
  initial begin
    
    #0; clk=0; rst=1;
    #2; rst=0;
    
    @(negedge clk) req = 4'b0100;
    @(negedge clk) req = 4'b1000;
    @(negedge clk) req = 4'b0101;
    @(negedge clk) req = 4'b0001;
    @(negedge clk) req = 4'b1010;
    @(negedge clk) req = 4'b0111;
    
    #50; $finish;
    
  end
endmodule
  