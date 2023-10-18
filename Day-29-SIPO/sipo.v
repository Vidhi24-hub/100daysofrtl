`timescale 1ns / 1ps

module sipo(in,clk,out);
input in,clk;
output [3:0] out;
reg q0,q1,q2,q3;

always@(posedge clk)
begin

q3<=in;
q2<=q3;
q1<=q2;
q0<=q1;

end
assign out[0]=q0;
assign out[1]=q1;
assign out[2]=q2;
assign out[3]=q3;
endmodule
