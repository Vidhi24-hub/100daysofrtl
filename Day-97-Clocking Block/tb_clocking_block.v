//simple module 
module example(req,grant,clk);
  input clk,req;
  output reg grant;
  
  always@(posedge clk)
    grant = req == 1 ? 1 : 0;
  
endmodule

//create interface 'intf'
interface intf(input bit clk);
  logic grant;
  logic req;
  
  clocking cb@(posedge clk);
    input #1ns grant;
    output #5 req;
  endclocking
endinterface

module tb_clocking_block;
  bit clk;
  
  intf if0(.clk(clk));
  example e0(.clk(clk), .req(if0.req), .grant(if0.grant));
  
  always #3 clk=~clk;
  always #4 if0.req=~if0.req;
  
  initial begin
    $monitor("[%0t] Req : %b | Grant : %b", $time,if0.req,if0.grant);
    #0 clk=0; if0.req=1; 
    #50 $finish;
  end
endmodule

      