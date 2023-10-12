`timescale 1ns / 1ps

module tb_d_ff();
reg d,clk,rst;
wire q,q_bar;

d_ff dut(d,clk,rst,q,q_bar);

always #3 clk=~clk;

initial begin

#0; d=0; rst=0; clk=0;
#5; d=1; rst=1;
#5; d=0; rst=0;
#5; d=1;
#5; $finish;

end
endmodule
