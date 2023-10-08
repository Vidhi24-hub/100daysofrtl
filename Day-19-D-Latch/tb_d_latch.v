`timescale 1ns / 1ps

module tb_d_latch();
reg d,en,rst;
wire q,q_bar;
 
d_latch dut(d,en,rst,q,q_bar);

initial begin

#0; d=0; en=0; rst=0;
#5; d=1; en=1; rst=1;
#5; d=0; rst=0;
#5; d=1;
#5; d=0; en=0;
#5; $finish;


end
endmodule
