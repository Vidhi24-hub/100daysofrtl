`timescale 1ns / 1ps

module tb_binary_to_gray();

reg [3:0] b;
wire [3:0] g;

binary_to_gray dut(.b(b),.g(g));

initial begins

$monitor("Binary = %b | Gray = %b",b,g);

#0; b=4'b0;
#5; b=4'b1000;
#5; b=4'b0101;
#5; b=4'b0110;

end
endmodule
