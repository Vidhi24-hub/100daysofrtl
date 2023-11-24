module mealy(in,clk,rst,out); //basic mealy 
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
            if(in)
              begin
                out = 1;
                nextstate = S1;
              end
            else
              begin
                out = 0;
                nextstate = S0;
              end
          end
        
        S1 :
          begin
            if(in)
              begin
                out = 0;
                nextstate = S0;
              end
            else
              begin
                out = 1;
                nextstate = S1;
              end
          end
        
        default : 
          nextstate = S0;
        
      endcase
      
    end
endmodule
          
  
  