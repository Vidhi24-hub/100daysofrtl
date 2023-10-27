module tb_johnson_counter();
  parameter width=4;
  reg clr,clk;
  wire [width-1:0] out;
  
  johnson_counter dut(clr,clk,out);
  
  always #4 clk=~clk;
  
  initial begin

    #0; clk=0; clr=1;
    #3; clr=0;
    #6; clr=1;
    #100; $finish;
  end
endmodule
    
  