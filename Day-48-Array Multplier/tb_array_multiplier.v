module tb_array_multiplier;
  reg [3:0] a,b;
  wire [7:0] mul;
  
  array_multiplier dut(a,b,mul);
  
  initial begin
   
    #0; a=0; b=0;
    #3; a=4'h3; b=4'h4;
    #3; a=4'hb; b=4'hb;
    #3; a=4'hf; b=4'hd;
    #3; $finish;
   
  end
endmodule