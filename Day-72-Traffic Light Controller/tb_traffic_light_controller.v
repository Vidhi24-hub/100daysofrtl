module tb_traffic_light_controller();
  reg clk,rst;
  wire [1:0] state;
  wire red,yellow,green;
  
  traffic_light_controller dut(clk,rst,state,red,yellow,green);
  
  always #1 clk=~clk;
  
  initial begin
    
    #0; clk=1; rst=1;
    @(negedge clk) rst=0;
    #100; $finish;

  end
endmodule
    
   
    