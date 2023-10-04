`timescale 1ns / 1ps

module tb_demux();
parameter n=3'd4; //Number of select lines
parameter m=2**n; // to figure out width of output
reg in; 
reg [n-1:0] sel;
wire [m-1:0] out;

demux dut(.in(in),.sel(sel),.out(out));

initial begin

$monitor("Input=%b | Select line=%d | Output=%b",in,sel,out);

#0; in=0; sel=0;
#5; in=1; sel=3;
#5; sel=5;
#5; sel=10;
#5; sel=15;
#5; $finish;

end
endmodule