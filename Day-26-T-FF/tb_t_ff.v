`timescale 1ns / 1ps

module tb_t_ff();
reg t,clk,rst;
wire q,q_bar;

t_ff dut(t,clk,rst,q,q_bar);

always #3 clk=~clk;

initial begin

#0; t=0; rst=0; clk=0;
#5; t=1; rst=1;
#5; t=0; rst=0;
#5; t=1; 
#5; $finish;

end
endmodule
