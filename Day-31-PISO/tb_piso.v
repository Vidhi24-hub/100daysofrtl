
module tb_piso();
reg [3:0]in;
reg select,clk;
wire out;

piso dut(in,clk,select,out);

always #1 clk=~clk;
initial begin

#0; in=0; clk=0; select=0;
#4; in=4'b0101; 
#5; select=1;
#30; $finish;
end

endmodule

