`timescale 1ns / 1ps

module bcd_adder(a,b,cin,sum,cout);
input [3:0] a,b;
input cin;
output [3:0] sum;
output cout;
wire [3:0] s1,s2;
wire c1,c2;

//instance of rca for 4-bit addition
rca m1(a,b,cin,s1,c1);
//final carry
assign cout = c1 | s1[3]&s1[2] | s1[3]&s1[1];
//if sum is greater than 9 then add 6(0110)
assign s2={1'b0,cout,cout,1'b0};
//add 6 to sum of two inputs 4-bit addition
rca m2(s1,s2,1'b0,sum,c2);

endmodule
