module moore(in,clk,rst,out); //basic mealy code
  input in,clk,rst;
  output reg out;
  
  reg presentstate,nextstate;
  
  parameter S0=0, S1=1;
  
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        presentstate <= S0;
      else
        presentstate <= nextstate;
    end
  
  always@(presentstate or in)
    begin
      
      case(presentstate)
        
        S0 : 
          begin
            out = 0;
            if(in)
              nextstate = S1;
            else
              nextstate = S0;
          end
        
         S1 : 
          begin
            out = 1;
            if(in)
              nextstate = S0;
            else
              nextstate = S1;
          end
        
        default : 
          nextstate = S0;
        
      endcase
      
    end
endmodule
          
  
  