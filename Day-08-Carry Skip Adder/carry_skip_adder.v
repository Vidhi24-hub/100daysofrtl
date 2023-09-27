`timescale 1ns / 1ps

module carry_skip_adder(a,b,cin,sum,cout);
input [3:0] a,b;
input cin;
output [3:0] sum;
output cout;

wire c1,c2,c3,c4,sel;
wire [3:0] p;

//instances of modified full adder
modified_full_adder f0(a[0],b[0],cin,sum[0],c1,p[0]);
modified_full_adder f1(a[1],b[1],c1,sum[1],c2,p[1]);
modified_full_adder f2(a[2],b[2],c2,sum[2],c3,p[2]);
modified_full_adder f3(a[3],b[3],c3,sum[3],c4,p[3]);

assign sel = p[0] & p[1] & p[2] & p[3];

//instance of mux for selecting cin or final carry of adder depending upon AND result
mux m1(c4,cin,sel,cout);

endmodule


module modified_full_adder(a,b,cin,sum,cout,p); //modified full adder to propagate carry
input a,b,cin;
output sum,cout,p;

assign sum = a^b^cin; //final sum of three inputs
assign cout = a&b | b&cin | a&cin; //final carry out
assign p=a^b; //carry propagate 
endmodule


module mux(a,b,sel,out);
input a,b,sel;
output out;

assign out = a&~sel | b&sel;

endmodule
