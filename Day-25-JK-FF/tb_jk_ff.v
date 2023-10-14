`timescale 1ns / 1ps

module tb_jk_ff();
reg j,k,clk,rst;
wire q,q_bar;

jk_ff dut(j,k,clk,rst,q,q_bar);

always #3 clk=~clk;

initial begin

#0; j=0; k=0; rst=0; clk=0;
#5; rst=1;
#5; j=0; k=0; rst=0;
#5; j=0; k=1; 
#5; j=1; k=0;
#5; j=0; k=0;
#5; j=1; k=1;


#5; $finish;

end
endmodule
