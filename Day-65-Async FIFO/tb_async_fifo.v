module tb_fifo();
  reg [7:0] in; 
  reg clk,clk2,rst,wt_en,rd_en; //wt_en is write enable and rd_en is read enable
  wire [7:0] out; 
  wire [6:0] counter;
  wire empty,full; 

  fifo dut(in,wt_en,rd_en,clk,clk2,rst,out,counter,empty,full);
  
  always #2 clk=~clk;
  always #3 clk2=~clk2;

  initial begin

    #0; in=0; clk=0; clk2=0; rst=0; wt_en=0; rd_en=0;
    #3; rst=1;
    #3; rst=0; wt_en=1; in=8'ha1;
    #4; in=8'hbb; 
    #4; in=8'heb;
    #4; in=8'hcb;
    #4; in=8'hb5;
    #4; in=8'h2b;
    #4; in=8'h1b;
    #3; in=8'hb0;
    #3; wt_en=0; 
    #4; rd_en=1;
    #50; $finish;

  end
endmodule
    
  