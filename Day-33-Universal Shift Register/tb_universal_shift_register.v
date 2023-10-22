
module tb_universal_shift_register();
reg in,s1,s0,clk,clr;
reg [3:0] p_in;
wire [3:0] out;

universal_shift_register dut(in,p_in,s1,s0,clk,clr,out);

always #3 clk=~clk;

initial begin

#0;  in=0; p_in=4'b0000; s1=0; s0=0; clk=0; clr=0;
#4;  in=1; p_in=4'b1011; clr=1; 
#4;  clr=0;
#4;  s1=0; s0=1;
#24; in=0; s1=1; s0=0; 
#24; s1=1; s0=1;
#6;  s1=0; s0=0;
#50; $finish;
end

endmodule
