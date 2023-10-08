`timescale 1ns / 1ps

module d_latch(d,en,rst,q,q_bar);
input d,en,rst;
output reg q;
output q_bar;

always@(*)
begin

if(rst) 
q <= 0;
else begin
if(en) 
q <= d;
end

end

assign q_bar=~q;

endmodule
