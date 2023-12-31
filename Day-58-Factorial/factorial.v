module factorial(in,out);
  parameter width=4;
  input [width-1:0] in;
  output [(width*8)-1:0] out;
  
  reg [(width*8)-1:0] fact;
  integer i;
  
  always@(*)
    begin
    for(i=1;i<in;i=i+1)
      begin
      fact=fact*i;
      end
    end
       
  assign out=fact;
  
endmodule
  
  
