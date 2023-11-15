module gcd(a,b,gcd);
  parameter width=8;
  input [width-1:0] a,b;
  output reg [width-1:0] gcd;
  
  reg [width-1:0] A,B;
  
  always@(*)
    begin
      
      A=a;
      B=b;
      
      while(A!=B)
        begin
          if(A>B)
            A=A-B;
          else
            B=B-A;
        end
      
      gcd=A;
      
    end
endmodule
  