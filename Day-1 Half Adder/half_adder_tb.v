`timescale 1ns / 1ps

module half_adder_tb();
reg t_a, t_b;
wire SUM, CARRY;
half_adder dut(.a(t_a), .b(t_b), .carry(CARRY), .sum(SUM));

initial begin

$monitor("A=%h | B=%h | Sum=%h | Carry=%h",t_a,t_b,SUM,CARRY);

t_a=0; t_b=0;
#10;
t_a=0; t_b=1;
#10;
t_a=1; t_b=0;
#10;
t_a=1; t_b=1;
$stop;
end

endmodule
