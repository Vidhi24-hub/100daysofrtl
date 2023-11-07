module tb_vedic_mul_8_bit;
  reg [7:0] a,b;
  wire [15:0] mul;
  
  vedic_mul_8_bit dut(a,b,mul);
  
  initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars();
   
    #0; a=0; b=0;
    #3; a=8'h21; b=8'h45;
    #3; a=8'h14; b=8'hbe;
    #3; a=8'hf1; b=8'hd9;
    #3; $finish;
   
  end
endmodule