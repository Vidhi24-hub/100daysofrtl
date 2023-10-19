
module tb_bidirectional();
reg in,clr,clk,mode;
wire [3:0] out;

bidirectional dut(in,mode,clk,clr,out);

always #1 clk=~clk;

initial begin

#0; in=0; clk=0; mode=0; clr=0;
#4; in=1; clr=1; 
#5; mode=1; clr=0;
#5; in=0;
#5; in=1;
#5; mode=0;
#30; $finish;

end

endmodule

