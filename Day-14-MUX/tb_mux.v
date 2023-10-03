`timescale 1ns / 1ps

module tb_mux();
parameter n=3'd4; //number of select lines 
parameter m=2**n; //number of input lines
reg [m-1:0] in;
reg [n-1:0]sel;
wire out;

mux dut(.in(in),.sel(sel),.out(out));

initial begin

$monitor("Input=%b | Select line=%d | Output=%b",in,sel,out);

#0; in=0; sel=0;
#5; in=1101_0111_1010_0101; sel=0;
#5; sel=5;
#5; sel=10;
#5; in=0100_1010_1111_0010; sel=15;
#5; $finish;

end 
endmodule
