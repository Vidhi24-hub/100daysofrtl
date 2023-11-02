`timescale 1ns / 1ps

module tb_decoder();
parameter n=3'd3;
parameter m=2**n;
reg en;
reg [n-1:0] in; 
wire [m-1:0] out;

decoder dut(en,in,out);

initial begin

$monitor("Input=%b | Enable=%b | Output=%b",in,en,out);

#0; in=3'd4; en=0;
#5; in=3'd5; en=1;
#5; in=3'd1;
#5; in=3'd7;
#5; $finish;

end
endmodule
