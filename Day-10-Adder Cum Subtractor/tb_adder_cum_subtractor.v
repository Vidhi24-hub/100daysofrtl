`timescale 1ns / 1ps

module tb_adder_cum_subtractor();
reg [3:0] a,b;
reg cin;
wire [3:0] result;
wire carryout;

adder_cum_subtractor dut(.a(a),.b(b),.cin(cin),.result(result),.carryout(carryout));

initial begin

$monitor("A=%h | B=%h | Cin=%h | Result=%h | Carryout=%h",a,b,cin,result,carryout);

#0; a=4'd0; b=4'd0; cin=1'b0;
#5; a=4'd9; b=4'd4; cin=1'b0;
#5; cin=1'b1;
#5; a=4'hb; b=4'd6; cin=1'b0;
#5; cin=1'b1;
#5; $finish;


end


endmodule
