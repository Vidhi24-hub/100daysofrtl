module booth_mul(m,q,mul);
  input [3:0] m,q; //m is multiplicand and q is multiplier
  output [7:0] mul;
  
  reg [3:0] Acc; //Acc is Accumulator  
  reg p; //p is q(-1)
  reg [8:0] con; 
  
  integer i;
  initial Acc=0;
  initial p=0;
  
  always@(*)
    begin
      
      con = {Acc,q,p}; //con is concatenation of Acc, q and p
		
      for(i=0;i<4;i=i+1)
        begin
          
          if({con[1],con[0]} == 2'b00 | {con[1],con[0]} == 2'b11)
            begin con = {con[8],con[8:1]}; end
          
          else if({con[1],con[0]} == 2'b01)
            begin con[8:5] = con[8:5] + m; con = {con[8],con[8:1]}; end
          
          else if({con[1],con[0]} == 2'b10)
            begin con[8:5] = con[8:5] - m; con = {con[8],con[8:1]}; end
          
          else
            begin con = {Acc,q,p}; end

        end
     
    end
	 
  assign  mul = {con[8:1]};
  
endmodule
 
  
