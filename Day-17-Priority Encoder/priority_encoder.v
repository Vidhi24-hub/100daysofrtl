`timescale 1ns / 1ps

module priority_encoder(d0,d1,d2,d3,d4,d5,d6,d7,a,b,c);
input d0,d1,d2,d3,d4,d5,d6,d7;
output reg a,b,c;

always@(*)
begin

if(d7==1)
begin a=1; b=1; c=1; end
else if(d6==1)
begin a=1; b=1; c=0; end
else if(d5==1)
begin a=1; b=0; c=1; end
else if(d4==1)
begin a=1; b=0; c=0; end
else if(d3==1)
begin a=0; b=1; c=1; end
else if(d2==1)
begin a=0; b=1; c=0; end
else if(d1==1)
begin a=0; b=0; c=1; end
else if(d0==1)
begin a=0; b=0; c=0; end
else
begin a=1'bz; b=1'bz; c=1'bz; end

end
endmodule
