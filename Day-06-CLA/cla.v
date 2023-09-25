`timescale 1ns / 1ps

module cla(a,b,cin,sum,cout);
input [3:0] a,b;
input cin;
output reg [3:0] sum;
output reg cout;
reg [3:0] p,g;
reg c1,c2,c3;

always@(*)
begin

p = a^b; //carry propagate
g = a&b; //carry generate

//internal carry and cout
c1 = g[0] | p[0]&cin;
c2 = g[1] | p[1]&g[0] | p[1]&p[0]&cin;
c3 = g[2] | p[2]&g[1] | p[2]&p[1]&g[0] | p[2]&p[1]&p[0]&cin;
cout = g[3] | p[3]&g[2] | p[3]&p[2]&g[1] | p[3]&p[2]&p[1]&g[0] | p[3]&p[2]&p[1]&p[0]&cin;

//for final summation
sum[0] = p[0]^cin;
sum[1] = p[1]^c1;
sum[2] = p[2]^c2;
sum[3] = p[3]^c3;

end

endmodule
