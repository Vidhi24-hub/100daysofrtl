`timescale 1ns / 1ps

module tb_encoder_8x3();

parameter n=3'd3; //number of outputs of encoder
parameter m=2**n; //number of inputs of encoder
reg en;
reg [m-1:0] in;
wire [n-1:0] out;

encoder dut(en,in,out);

initial begin

$monitor("Input=%b | Enable=%b | Output=%b",in,en,out);

#0; in=8'b1000_0000; en=0;
#5; in=8'b0000_0100; en=1; 
#5; in=8'b1000_0000;
#5; in=8'b0100_0000;
#5; $finish;  

end
endmodule
