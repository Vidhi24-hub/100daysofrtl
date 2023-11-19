module tb_seven_segment_using_rom();
  reg [3:0] addr;
  reg en,clk;
  wire [7:0] out;
  
  seven_segment_using_rom dut(addr,clk,en,out);
  
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