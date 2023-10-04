`timescale 1ns / 1ps

module demux(in,sel,out);
parameter n=3'd4; //number of select lines
parameter m=2**n; //number of output lines
input in; 
input [n-1:0] sel;
output reg [m-1:0] out;

always@(*)
begin
out=0;
out[i]=in;

end
endmodule
