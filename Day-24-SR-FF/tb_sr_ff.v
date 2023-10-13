`timescale 1ns / 1ps

module tb_sr_ff();
reg s,r,clk,rst;
wire q,q_bar;

sr_ff dut(s,r,clk,rst,q,q_bar);

always #3 clk=~clk;

initial begin

#0; s=0; r=0; rst=0; clk=0;
#5; rst=1;
#5; s=0; r=0; rst=0;
#5; s=0; r=1; 
#5; s=1; r=0;
#5; s=0; r=0;
#5; s=1; r=1;
#5; $finish;

end
endmodule
