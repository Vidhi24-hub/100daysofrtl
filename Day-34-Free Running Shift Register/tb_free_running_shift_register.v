
module tb_free_running_shift_register();
reg in,clk,clr;
wire out;

free_running_shift_register dut(in,clk,clr,out);

always #3 clk=~clk;

initial begin 

#0; in=0; clk=0; clr=0;
#6; clr=1;
#6; in=1; clr=0;
#6; in=0;
#36; $finish;

end

endmodule
