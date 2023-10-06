`timescale 1ns / 1ps

module priority_encoder(d0,d1,d2,d3,d4,d5,d6,d7,a,b,c);
input d0,d1,d2,d3,d4,d5,d6,d7;
output reg a,b,c;

always@(*)
begin

 casex({d7,d6,d5,d4,d3,d2,d1,d0})
    
    8'b0000_0001 : {a,b,c}=3'd0;
    8'b0000_001x : {a,b,c}=3'd1;
    8'b0000_01xx : {a,b,c}=3'd2;
    8'b0000_1xxx : {a,b,c}=3'd3;
    8'b0001_xxxx : {a,b,c}=3'd4;
    8'b001x_xxxx : {a,b,c}=3'd5;
    8'b01xx_xxxx : {a,b,c}=3'd6;
    8'b1xxx_xxxx : {a,b,c}=3'd7;
    default      : {a,b,c} = 3'bxxx;
   
  endcase

end
endmodule
