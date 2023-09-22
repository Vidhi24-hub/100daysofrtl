`timescale 1ns / 1ps

module tb_half_subtractor();


reg t_a, t_b;
wire difference, borrow;
half_subtractor dut(.a(t_a), .b(t_b), .difference(difference), .borrow(borrow));

initial begin

$monitor("A=%b | B=%b | Difference=%b | Borrow=%b",t_a,t_b,difference,borrow);

t_a=0; t_b=0;
#10;
t_a=0; t_b=1;
#10;
t_a=1; t_b=0;
#10;
t_a=1; t_b=1;
#10; $finish;
end 

endmodule
