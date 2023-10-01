`timescale 1ns / 1ps

module tb_binary_to_bcd();
reg [9:0] bi;
wire [15:0] bcd;

binary_to_bcd dut(.bi(bi),.bcd(bcd));

initial begin

$monitor("Binary = %d | BCD = %b",bi,bcd);

#0; bi=10'd0;
#5; bi=10'd56;
#5; bi=10'd240;
#5; bi=10'd8; 
#5; $finish;
end
endmodule
