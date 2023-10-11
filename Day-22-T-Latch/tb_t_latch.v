`timescale 1ns / 1ps

module tb_t_latch();
reg t,en,rst;
wire q,q_bar;

t_latch dut(t,en,rst,q,q_bar);

initial begin

#0; t=0; en=0; rst=0; 
#5; rst=1;
#5; t=1; en=1; rst=0;  
#5; t=0;    
#5; t=1;
#10; $finish;

end
endmodule
