`timescale 1ns / 1ps

module t_ff(t,clk,rst,q,q_bar);
input t,clk,rst;
output reg q;
output q_bar;

assign q_bar = ~q;
  always@(posedge clk or posedge rst)
begin

if(rst)
q <= 0;
else begin
q <= t==1'b1 ? ~q : q; 
end

end
endmodule
