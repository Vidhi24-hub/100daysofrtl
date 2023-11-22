module tb_fifo();
  reg [7:0] in; 
  reg clk,rst,wt_en,rd_en; //wt_en is write enable and rd_en is read enable
  wire [7:0] out; 
  wire [6:0] counter;
  wire empty,full; 
  
  fifo dut(in,wt_en,rd_en,clk,rst,out,counter,empty,full);
  
  always #2 clk=~clk;
  
  initial begin
    
    #0; in=0; clk=0; rst=0; wt_en=0; rd_en=0;
    #3; rst=1;
    #3; rst=0; wt_en=1; in=8'ha1;
    #3; in=8'h17; 
    #6; wt_en=0; rd_en=1; 
    #25; $finish;

  end
endmodule
    
  