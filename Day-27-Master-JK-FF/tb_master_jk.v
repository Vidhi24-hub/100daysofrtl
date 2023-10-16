`timescale 1ns / 1ps

module tb_master_jk();

reg j,k,clk,rst;
wire out,out_bar,qm,qbarm,qs,qbars;

master_jk_ff dut(j,k,rst,clk,out,out_bar,qm,qbarm,qs,qbars);

always #2 clk=~clk;
initial begin 
  $dumpfile("dump.vcd");
  $dumpvars();

$monitor("j=%b | k=%b | rst=%b | clk=%b | qm=%b | qs=%b | out=%b | out_bar=%b",j,k,rst,clk,qm,qs,out,out_bar);

#0; j=0; k=0; clk=0; rst=0; 
#2; rst=1;
#4; j=1; k=0; rst=0;
#4; j=0; k=0; 
#4; j=1; k=1;
#4; j=0; k=0;
#30; $finish;
end
endmodule
