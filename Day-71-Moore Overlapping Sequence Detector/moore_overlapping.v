module moore_overlapping(in,clk,rst,out); //1011 sequence
  input in,clk,rst;
  output reg out;
  
  reg [2:0] presentstate, nextstate;
  parameter S0=0, S1=1, S10=2, S101=3, S1011=4;
  
  always@(posedge clk)
    begin
      if(rst)
        begin
          presentstate <= S0;
        end
      else 
        presentstate <= nextstate;
    end
  
  always@(presentstate or in)
    begin
      
      case(presentstate)
        
        S0 :
          begin
            out = 0;
            nextstate = in ? S1 : S0;
          end
        
        S1 :
          begin
            out = 0;
            nextstate = in ? S1 : S10;
          end
        
        S10 :
          begin
            out = 0;
            nextstate = in ? S101 : S0;
          end
        
        S101 :
          begin
            out = 0;
            nextstate = in ? S1011 : S10;
          end
        
        S1011 :
          begin
            out = 1;
            nextstate = in ? S1 : S10;
          end
        default : 
          begin
            out = 1'bx;
            nextstate = S0;
          end
      endcase
    end
endmodule
      
  
