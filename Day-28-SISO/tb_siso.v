`timescale 1ns / 1ps

module tb_siso();
reg in,clk;
wire out;

siso dut(in,clk,out);

always #1 clk=~clk;
always #4 in=~in;
initial begin
$monitor("In=%b | clk=%b | Out=%b",in,clk,out);
#0; in=0; clk=0; 
#50; $finish;
end
endmodule
