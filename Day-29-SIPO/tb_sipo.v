`timescale 1ns / 1ps

module tb_sipo();
reg in,clk;
wire [3:0] out;

sipo dut(in,clk,out);

always #1 clk=~clk;
initial begin
$monitor("In=%b | clk=%b | Out=%b",in,clk,out);
#0; in=0; clk=0; 
#5; in=1;
#3; in=0;
#5; in=1;
#3; in=0;
#50; $finish;
end
endmodule
