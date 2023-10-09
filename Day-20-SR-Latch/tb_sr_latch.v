`timescale 1ns / 1ps

module tb_sr_latch();
reg s,r,en,rst;
wire q,q_bar;

sr_latch dut(s,r,en,rst,q,q_bar);


initial begin

#0; s=0; r=0; en=0; rst=0;
#100; en=1; rst=1;
#100; s=1; rst=0;
#100; s=0; r=1; 
#100; s=1; r=1;
#100; s=0; r=0; 
#100; s=1; r=0;
#100; $finish;

end
endmodule
