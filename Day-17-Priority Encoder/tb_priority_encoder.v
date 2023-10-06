`timescale 1ns / 1ps

module tb_priority_encoder();
reg d0,d1,d2,d3,d4,d5,d6,d7;
wire a,b,c;

priority_encoder dut(d0,d1,d2,d3,d4,d5,d6,d7,a,b,c);

initial begin

$monitor("d7d6d5d4_d3d2d1d0=%b%b%b%b_%b%b%b%b | abc=%b%b%b",d7,d6,d5,d4,d3,d2,d1,d0,a,b,c);

#0; d7=0; d6=0; d5=0; d4=0; d3=0; d2=0; d1=0; d0=0;
#5; d7=0; d6=0; d5=0; d4=0; d3=0; d2=0; d1=0; d0=1;
#5; d7=0; d6=0; d5=1; d4=0; d3=0; d2=0; d1=1; d0=0;
#5; d7=0; d6=1; d5=0; d4=0; d3=0; d2=1; d1=0; d0=0;
#5; d7=0; d6=0; d5=0; d4=1; d3=1; d2=1; d1=0; d0=0;
#5; d7=0; d6=0; d5=0; d4=1; d3=0; d2=0; d1=0; d0=0;
#5; d7=0; d6=0; d5=1; d4=1; d3=0; d2=0; d1=1; d0=1;
#5; d7=0; d6=0; d5=0; d4=0; d3=0; d2=0; d1=0; d0=0;
#5; d7=1; d6=0; d5=0; d4=1; d3=0; d2=1; d1=0; d0=0;
#5; $finish; 

end
endmodule
