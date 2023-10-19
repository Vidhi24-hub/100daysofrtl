`timescale 1ns / 1ps

module tb_pipo();
reg [3:0] in;
reg clk;
wire [3:0] out;

pipo dut(in,clk,out);

always #3 clk=~clk;
initial begin
$monitor("In=%b | clk=%b | Out=%b",in,clk,out);
#0; in=4'h0; clk=0; 
#3; in=4'h5;
#3; in=4'hb;
#3; in=4'hf;
#6; in=4'h2;
#30; $finish;
end
endmodule
