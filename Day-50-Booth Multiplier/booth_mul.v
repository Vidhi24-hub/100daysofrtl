module booth_mul(a,b,mul);
  input [3:0] a,b;
  output [7:0] mul;
  
  reg [3:0] Acc, q; //Acc is Accumulator and q is multiplier 
  reg p; //p is q(-1)
  reg [8:0] con;
  integer i;
  initial Acc=0;
  initial p=0;
  
  always@(*)
    begin
      
      q=b;
      
      con={Acc,b,p};
		
      for(i=0;i<4;i=i+1)
        begin
          
          if({con[1],con[0]} == 2'b00 | {con[1],con[0]} == 2'b11)
            begin con={con[1],con[8:1]}; end
          
          else if({con[1],con[0]} == 2'b01)
            begin con[8:5]=con[8:5]+a; con={con[1],con[8:1]}; end
          
          else if({con[1],con[0]} == 2'b10)
            begin con[8:5]=con[8:5]-a; con={con[1],con[8:1]}; end

         
        end
     
    end
	 
  assign  mul={con[8:1]};
  
endmodule
 
  