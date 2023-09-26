`timescale 1ns / 1ps

module carry_select_adder(a,b,cin,sum,cout);
input [3:0] a,b;
input cin;
output  [3:0] sum;
output cout;

wire [3:0] sum_0,sum_1;
wire out_0,out_1,c1,c2,c3,c4,c5,c6,cout_0,cout_1;

//instance of full adder for cin=0
full_adder f0_0(a[0],b[0],1'b0,sum_0[0],c1);
full_adder f1_0(a[1],b[1],c1,sum_0[1],c2);
full_adder f2_0(a[2],b[2],c2,sum_0[2],c3);
full_adder f3_0(a[3],b[3],c3,sum_0[3],cout_0);

//instance of full adder for cin=1
full_adder f0_1(a[0],b[0],1'b1,sum_1[0],c4);
full_adder f1_1(a[1],b[1],c4,sum_1[1],c5);
full_adder f2_1(a[2],b[2],c5,sum_1[2],c6);
full_adder f3_1(a[3],b[3],c6,sum_1[3],cout_1);

//selection of sum and carry depending on cin
mux m1(sum_0[0],sum_1[0],cin,sum[0]);
mux m2(sum_0[1],sum_1[1],cin,sum[1]);
mux m3(sum_0[2],sum_1[2],cin,sum[2]);
mux m4(sum_0[3],sum_1[3],cin,sum[3]);
mux m5(cout_0,cout_1,cin,cout); 
endmodule


module full_adder(a,b,cin,sum,cout);
input a,b,cin;
output sum,cout;

assign sum = a^b^cin;
assign cout = a&b | b&cin | a&cin; 
endmodule


module mux(a,b,sel,out);
input a,b,sel;
output out;

assign out = a&~sel | b&sel;

endmodule
