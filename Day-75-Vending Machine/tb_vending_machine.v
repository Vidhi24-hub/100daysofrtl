module tb_vending_machine();
  reg clk,rst;
  reg [4:0] in;
  wire [4:0] change; 
  wire product;
  
  vending_machine dut(clk,rst,in,change,product);
  
  always #2 clk=~clk;
  
  initial begin
    
    #0; in=0; clk=1; rst=1;
    #2; rst=0;
    
    @(negedge clk) in=5'd20;
    @(negedge clk) in=5'd5; //money paid: 20 + 5 = 25
    @(negedge clk) in=5'd0;
    
    @(negedge clk) in=5'd5;
    @(negedge clk) in=5'd10; 
    @(negedge clk) in=5'd10; //money paid: 5 + 10 + 10 = 25
    @(negedge clk) in=5'd0;
    
    @(negedge clk) in=5'd20; //money paid: 20; 
    @(negedge clk) in=5'd0; //return money: 20
    
    @(negedge clk) in=5'd20;
    @(negedge clk) in=5'd20; //money paid: 20 + 20 = 40
    @(negedge clk) in=5'd0;  //return money: 15 (5+10)
    
    
    #30; $finish;
  end
endmodule
    
    