`timescale 1ns / 1ps

module tb_comparator();
parameter n=4; //width of inputs
reg [n-1:0] a,b;
wire a_greater_b,a_less_b,a_equal_b;

comparator dut(a,b,a_greater_b,a_less_b,a_equal_b);

initial begin

$monitor("A=%d | B=%d | A>B=%b | A<B=%b | A==B=%b",a,b,a_greater_b,a_less_b,a_equal_b);

#0; a=0; b=0;
#5; a=4; b=9;
#5; a=12; b=6;
#5; a=10; b=10;
#5; $finish;

end
endmodule
