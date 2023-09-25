`timescale 1ns / 1ps

module tb_cla();
reg [3:0] a,b;
reg cin;
wire [3:0] sum;
wire cout;

cla dut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));

initial 
begin
$monitor("A=%h | B=%h | Cin=%h | Sum=%h | Carry=%h",a,b,cin,sum,cout);
#0; a=0; b=0; cin=0;
#5; a=4'h4; b=4'h9;
#5; a=4'hb; b=4'h3; cin=1;
#5; a=4'he; cin=1;
#5; $finish;
end
endmodule
