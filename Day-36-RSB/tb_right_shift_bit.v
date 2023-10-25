module tb_right_shift_bit;

reg clk, rst;
reg [3:0] in;
wire [3:0] out;

right_shift_bit dut(in,clk,rst,out);

always #2 clk=~clk;

initial begin

#0; clk=0; rst=0; in=4'b0000;
#5; rst=1;
#5; rst=0; in=4'b0010;
#5; in=4'b1101;
#5; in=4'b0001;
#5; $finish;

end

endmodule