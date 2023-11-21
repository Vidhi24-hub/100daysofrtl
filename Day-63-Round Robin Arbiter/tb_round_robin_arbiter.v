module tb_round_robin_arbiter();
  reg [3:0] req;
  reg clk,rst;
  wire [3:0] gnt;
  
  round_robin_arbiter dut(req,clk,rst,gnt);
  
  always #2 clk=~clk; 
  
  initial begin

    #0; clk=0; rst=1;
    #2; rst=0;
    
    @(negedge clk) req = 4'hf;
    @(negedge clk) req = 4'b1101;
    @(negedge clk) req = 4'b0101;
    @(negedge clk) req = 4'b0001;
    @(negedge clk) req = 4'b1010;
    @(negedge clk) req = 4'b1111;
    
    #50; $finish;
    
  end
endmodule
  