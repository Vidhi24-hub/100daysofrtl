`timescale 1ns / 1ps

module bcd_to_7_seg(bcd,seg);
input [3:0] bcd;
output reg [6:0] seg;

always@(*)
begin

case (bcd)
                   0: seg = 7'b1111_110;   //when bcd = 0
                   1: seg = 7'b0110_000;   //when bcd = 1
                   2: seg = 7'b1101_101;   //when bcd = 2
                   3: seg = 7'b1111_001;   //when bcd = 3
                   4: seg = 7'b0110_011;   //when bcd = 4
                   5: seg = 7'b1011_011;   //when bcd = 5
                   6: seg = 7'b1011_111;   //when bcd = 6
                   7: seg = 7'b1110_000;   //when bcd = 7
                   8: seg = 7'b1111_111;   //when bcd = 8
                   9: seg = 7'b1111_011;   //when bcd = 9
                   default: seg=7'b1111111;

endcase 
end
endmodule
