`timescale 1ns / 1ps

module encoder(en,in,out);
parameter n=3'd3; //number of outputs of encoder
parameter m=2**n; //number of inputs of encoder
input en;
input [m-1:0] in;
output reg [n-1:0] out;
integer i;
always@(*)
begin
out=0;
if(en==1)
begin
for (i = 0; i < m; i = i + 1)
begin
if(in[i]==1)
out=i;
end
end
else begin
out=0;
end
end
endmodule
