module tb_pwm();
  parameter R=4;
  reg clk,rst;
  reg [R-1:0] duty;
  wire out;
  
  pwm dut(clk,rst,duty,out);
  
  always #1 clk=~clk;
  
  initial begin
    
    #0; clk=0; rst=1; duty=0;
    #3; rst=0; duty=0.25*(2**R); //25% duty cycle
    #30; duty=0.50*(2**R);       //50% duty cycle
    #32; duty=0.75*(2**R);       //75% duty cycle
    #100; $finish;

  end
endmodule
    
    