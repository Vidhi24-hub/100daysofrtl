module tb_barrel_shifter();
  reg [7:0] in;
  reg [2:0] shift;
  wire [7:0] out;
  
  barrel_shifter dut(in,shift,out);
  
  initial begin

    #0; in=0; shift=0;
    #3; in=8'hb; shift=3'h2;
    #3; in=8'h5; shift=3'h5;
    #3; $finish;

  end
endmodule