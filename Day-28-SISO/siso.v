`timescale 1ns / 1ps

module siso(in,clk,out);
input in,clk;
output out;
reg  q0,q1,q2,q3;

always@(posedge clk)
begin
q3<=in;
q2<=q3;
q1<=q2;
q0<=q1;
end

assign out = q0;
endmodule
