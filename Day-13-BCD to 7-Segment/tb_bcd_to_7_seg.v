`timescale 1ns / 1ps

module tb_bcd_to_7_seg();
reg [3:0] bcd;
wire [6:0] seg;

bcd_to_7_seg dut(bcd,seg);

initial begin

$monitor("BCD=%b | 7-Segment=%b",bcd,seg);
#0; bcd=4'd0;
#5; bcd=4'd3;
#5; bcd=4'd5;
#5; bcd=4'd9;
#5; bcd=4'd10;
#5; $finish;
end
endmodule
