`timescale 1ns / 1ps

module tb_carry_skip_adder();


reg [3:0] a,b;
reg cin;
wire [3:0] sum;
wire cout;

carry_skip_adder dut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout)); 

initial
    begin

        $monitor("A=%b | B=%b | Cin=%b | Sum=%b | Carry=%b",a,b,cin,sum,cout);

        #0; a=0; b=0; cin=0;
        #5; a=4'b0011; b=4'b1100; cin=1'b0;
        #5; a=4'b1010; b=4'b0101; cin=1'b1;
        #5; a=4'd5; b=4'd7; cin=1'b0;
        #5; $finish; 
    end
endmodule
