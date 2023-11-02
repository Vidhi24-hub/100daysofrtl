`timescale 1ns / 1ps

module decoder(en,in,out);
parameter n=3; //number of inputs of decoder
parameter m=2**n; //number of outputs of decoder
input [n-1:0] in;
input en;
output reg [m-1:0] out;

always@(*)
begin
out=0;
if(en==1)
begin
out[in]=1;
end
else
out=0;
end
endmodule 
