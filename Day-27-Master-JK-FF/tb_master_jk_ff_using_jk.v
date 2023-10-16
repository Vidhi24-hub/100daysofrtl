`timescale 1ns / 1ps

module tb_master_jk_ff_using_jk();

reg j,k,clk,rst;
wire q,q_bar;

master_jk_using_jk dut(j,k,clk,rst,q,q_bar);

always #2 clk=~clk;
initial begin 
  $dumpfile("dump.vcd");
  $dumpvars();

$monitor("j=%b | k=%b | rst=%b | clk=%b | q=%b | q_bar=%b",j,k,rst,clk,q,q_bar);

#0; j=0; k=0; clk=0; rst=0; 
#2; rst=1;
#4; j=1; k=0; rst=0;
#4; j=0; k=0; 
#4; j=1; k=1;
#4; j=0; k=0;
#30; $finish;
end
endmodule
