module tb_ripple_carry_counter();
reg clk,rst;
wire [3:0] out;

ripple_carry_counter dut(clk,rst,out);

always #2 clk=~clk;

initial begin
  
  #0; clk=0; rst=0;
  #3; rst=1;
  #3; rst=0;
  #100; $finish;
  
end

endmodule