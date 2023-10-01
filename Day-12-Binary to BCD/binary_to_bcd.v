`timescale 1ns / 1ps

module binary_to_bcd(bi,bcd);
input [9:0] bi; // bi is represented for binary
output reg [15:0] bcd; //bcd is represented for bcd number
reg [3:0] hundreds;
reg [3:0] tens;
reg [3:0] ones;
integer i;

always@(*)
begin

hundreds=4'b0000;
tens=4'b0000;
ones=4'b0000;

for(i=9; i>=0; i=i-1)
begin
//if >=5 then add 3
if(hundreds >=5)
hundreds = hundreds+2'd3;
if(tens >=5)
tens = tens+2'd3;
if(ones >=5)
ones = ones +2'd3;

//shift left
hundreds = hundreds<<1;
hundreds[0] = tens[3];
tens = tens<<1;
tens[0] = ones[3];
ones = ones<<1;
ones[0] = bi[i];
end

bcd = {hundreds,tens,ones};

end
endmodule
