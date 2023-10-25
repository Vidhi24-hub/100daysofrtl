`timescale 1ns / 1ps

module d_ff(d,clk,rst,q,q_bar);
input d,clk,rst;
output reg q;
output q_bar;

always@(posedge clk or rst)
begin

if(rst)
q <= 0;
else begin
if(clk)
q <= d;
end

assign q_bar = ~q;

end
endmodule
