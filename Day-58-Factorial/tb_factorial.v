module tb_factorial();
  parameter width=4;
  reg [width-1:0] in;
  wire [(width*8)-1:0] out;
  
  factorial dut(in,out);
  
  initial begin
    
    #0; in=0;
    #4; in=4'h5;
    #4; in=4'h9;
    #4; $finish;

  end
endmodule