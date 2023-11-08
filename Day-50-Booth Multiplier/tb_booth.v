module tb_booth;
  reg [3:0] m,q_in;
  wire [7:0] mul;
  
  booth_mul dut(m,q_in,mul);
  
  initial begin
    

    
    #0; m=0; q_in=0;
    #3; m=4'h7; q_in=4'h3;
    #3; m=4'h6; q_in=4'h4;
    #3; $finish;
   
  end
endmodule 