`timescale 1ns / 1ps

module binary_to_gray(b,g);
input [3:0] b; //b represented for binary code
output [3:0] g; //g represented for gray code

assign g[3] = b[3];
assign g[2] = b[2] ^ b[3];
assign g[1] = b[1] ^ b[2];
assign g[0] = b[0] ^ b[1];

endmodule
