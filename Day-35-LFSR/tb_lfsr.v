
module tb_lfsr();
reg clk,preset;
wire [3:0] out;

lfsr dut(clk,preset,out);

always #1 clk=~clk;

initial begin

#0 clk=0; preset=0;
#4 preset=1; 
#4 preset=0; 
#30 $finish;

end

endmodule

