module mealy_overlapping(in,clk,rst,out); //1101 sequence detector
  input in,clk,rst;
  output reg out;
  
  reg [1:0] state;
  parameter S0=0, S1=1, S11=2, S110=3; /*S0 is reset state, S1 is taken from MSB of 1101, similarly S11 taken as 11 of 1101 and lastly S110 is taken as 110 from 1101.*/
  
  always@(posedge clk)
    begin
      
      if(rst)
        begin
          out <= 0;
          state <= 0;
        end
      
      else
        begin
          
          case(state)
            S0 : 
              begin 
                state <= in ? S1 : S0; 
                out <= 0; 
              end
            S1 : 
              begin 
                state <= in ? S11 : S0; 
                out <= 0;
              end
            S11 : 
              begin 
                state <= in ? S11 : S110; 
                out <= 0;
              end
            S110 : 
              begin 
                state <= in ? S1 : S0; 
                out <= in ? 1 : 0;
              end
	   default : 
              begin 
                state <= S0; 
                out <= 1'bx;
              end
          endcase
        end
    end
endmodule
            
              
            
      
