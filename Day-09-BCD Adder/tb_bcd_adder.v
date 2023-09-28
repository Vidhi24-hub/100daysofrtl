`timescale 1ns / 1ps

module tb_bcd_adder();

reg [3:0] a,b;
reg cin;
wire [3:0] sum;
wire cout;

bcd_adder dut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout)); 

initial
    begin

        $monitor("A=%h | B=%h | Cin=%h | Sum=%h | Cout=%h",a,b,cin,sum,cout);

        #0; a=0; b=0; cin=0;
        #5; a=4'd3; b=4'd4; cin=1'b0;
        #5; a=4'd11; b=4'd3; cin=1'b1;
        #5; a=4'd5; b=4'd7; cin=1'b0;
        #5; $finish;
    end

endmodule
