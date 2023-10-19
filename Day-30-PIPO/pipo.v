`timescale 1ns / 1ps

module pipo(in,clk,out);
input [3:0] in;
input clk;
output [3:0] out;
reg q0,q1,q2,q3;

always@(posedge clk)
begin

q3<=in[3];
q2<=in[2];
q1<=in[1];
q0<=in[0];

end
assign out[0]=q0;
assign out[1]=q1;
assign out[2]=q2;
assign out[3]=q3;
endmodule
