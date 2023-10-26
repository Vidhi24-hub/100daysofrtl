module tb_ring_counter();
  parameter width=8;
  reg preset,clr,clk;
  wire [width-1:0] out;
  
  ring_counter dut(preset,clr,clk,out);
  
  always #4 clk=~clk;
  
  initial begin
    
    #0; clk=0; preset=1; clr=1;
    #3; preset=0; clr=0;
    #6; preset=1; clr=1;
    #100; $finish;

  end
endmodule
    
  