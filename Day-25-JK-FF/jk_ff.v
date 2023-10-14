`timescale 1ns / 1ps

module jk_ff(j,k,clk,rst,q,q_bar);
input j,k,clk,rst;
output reg q;
output q_bar;

always@(posedge clk or posedge rst)
begin

if(rst)
q <= 0;

else begin
case({j,k})
2'b00 : q <= q;
2'b01 : q <= 1'b0;
2'b10 : q <= 1'b1;
2'b11 : q <= ~q;
endcase
end
end

assign q_bar=~q;

endmodule
