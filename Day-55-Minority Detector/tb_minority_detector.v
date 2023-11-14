module tb_minority_detector();
  reg a,b,c;
  wire out;
  integer i;

  minority_detector dut(a,b,c,out);
  
  initial
    begin
      
      #0; a=0; b=0; c=0;
      
      for(i=0;i<7;i=i+1)
        begin
          {a,b,c} = i;
          #4;
        end
      
      #50; $finish;
      
    end
endmodule
      
  
