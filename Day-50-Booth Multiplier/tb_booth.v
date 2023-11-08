module tb_booth_mul;
  reg [3:0] m,q;
  wire [7:0] mul;
  
  booth_mul dut(m,q,mul);
  
  initial begin
    
    #0; m=0; q=0;
    #3; m=4'h7; q=4'h3;
    #3; m=4'h6; q=4'h4;
    #3; m=4'hc; q=4'h9;
    #3; m=4'hb; q=4'hb;
    #3; $finish;
   
  end
endmodule 
