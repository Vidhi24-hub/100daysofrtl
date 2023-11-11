module tb_rom();
  reg [3:0] addr;
  reg en,clk;
  wire [3:0] data;
  
  rom dut(addr,clk,en,data);
  
  always #2 clk=~clk;
  
  initial begin

    #0; clk=1; addr=4'h1; en=1;
    #4; addr=4'h2; 
    #4; addr=4'h3;
    #4; addr=4'ha;
    #4; addr=4'he;
    #4; addr=4'hf; 
    #4; en=0;
    #4; $finish;
  
  end
  
endmodule