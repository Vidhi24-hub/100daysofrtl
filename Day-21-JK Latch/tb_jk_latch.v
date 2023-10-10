`timescale 1ns / 1ps

module tb_jk_latch();
reg j,k,en,rst;
wire q,q_bar;

jk_latch dut(j,k,en,rst,q,q_bar);


initial begin

#0; j=1; k=0; en=0; rst=0;
#100; en=1; rst=1;
#100; j=1; rst=0;
#100; j=0; k=1; 
#100; j=1; k=1;
#100; j=0; k=0; 
#100; j=1; k=0;
#100; $finish;

end
endmodule
