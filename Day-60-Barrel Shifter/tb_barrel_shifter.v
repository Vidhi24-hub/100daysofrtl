module tb_barrel_shifter();
  reg [7:0] in;
  reg [2:0] shift;
  reg mode;
  wire [7:0] out;
  
  barrel_shifter dut(in,shift,mode,out);
  
  initial begin
    
    #0; in=0; shift=0; mode=0;
    #3; in=8'hb; shift=3'h2;
    #3; in=8'ha; shift=3'h5; mode=1;
    #3; $finish;
  end
endmodule
