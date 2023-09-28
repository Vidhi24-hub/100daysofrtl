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

module rca(a,b,cin,sum,cout);
input [3:0] a,b;
input cin;
output [3:0] sum;
output cout;

wire c1,c2,c3;

//instances of full adder
full_adder f0(a[0],b[0],cin,sum[0],c1);
full_adder f1(a[1],b[1],c1,sum[1],c2);
full_adder f2(a[2],b[2],c2,sum[2],c3);
full_adder f3(a[3],b[3],c3,sum[3],cout);

endmodule


module full_adder(a,b,cin,sum,cout);
input a,b,cin;
output sum,cout;

assign sum = a^b^cin;
assign cout = a&b | b&cin | a&cin; 
endmodule
