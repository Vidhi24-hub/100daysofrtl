`timescale 1ns / 1ps

module full_adder(a,b,cin,sum,cout);
input a,b,cin;
output sum,cout;

assign sum = a^b^cin; //sum of inputs
assign cout = a&b | b&cin | a&cin; //final carry generate 
endmodule
