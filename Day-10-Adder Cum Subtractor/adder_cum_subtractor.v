
module adder_cum_subtractor(a,b,cin,result,carryout);
input [3:0] a,b;
input cin; 
output [3:0] result;
output carryout;
wire [3:0] b_xor;
wire c1,c2,c3,c4;

assign b_xor[0] = b[0]^cin;
assign b_xor[1] = b[1]^cin;
assign b_xor[2] = b[2]^cin;
assign b_xor[3] = b[3]^cin;

//instance of full adder
full_adder f0(a[0],b_xor[0],cin,result[0],c1);
full_adder f1(a[1],b_xor[1],c1,result[1],c2);
full_adder f2(a[2],b_xor[2],c2,result[2],c3);
full_adder f3(a[3],b_xor[3],c3,result[3],c4);

//final carry out
assign carryout=c4;

endmodule
