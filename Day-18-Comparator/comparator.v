`timescale 1ns / 1ps

module comparator(a,b,a_greater_b,a_less_b,a_equal_b);
parameter n=4; //width of inputs
input [n-1:0] a,b;
output reg a_greater_b,a_less_b,a_equal_b;

always@(*)
begin

if(a>b)
begin a_greater_b=1; a_less_b=0; a_equal_b=0; end
  
else if(a<b)
begin a_greater_b=0; a_less_b=1; a_equal_b=0; end
  
else if(a==b)
begin a_greater_b=0; a_less_b=0; a_equal_b=1; end
  
else
begin a_greater_b=1'bz; a_less_b=1'bz; a_equal_b=1'bz; end
  
end

endmodule
