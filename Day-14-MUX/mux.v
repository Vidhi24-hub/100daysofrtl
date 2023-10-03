`timescale 1ns / 1ps

module mux(in,sel,out);
parameter n=3'd4; //number of select lines 
parameter m=2**n; //number of input lines
input [m-1:0]in;
input [n-1:0] sel;
output out;

assign out=in[sel];

endmodule