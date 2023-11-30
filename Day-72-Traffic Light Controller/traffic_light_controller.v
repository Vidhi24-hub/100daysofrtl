module traffic_light_controller(clk,rst,state,red,yellow,green); //basic single traffic light controller code
  input clk,rst;
  output reg [1:0] state;
  output reg red,yellow,green;
  reg[3:0] count=0;
  localparam redsignal=2'b00, 
              redwithyellow=2'b01, 
              greensignal=2'b10, 
              greenwithyellow=2'b11;
  
  always@(posedge clk)
    begin
      
      if(rst)
        begin
          red <= 1;
          yellow <= 0;
          green <= 0;
          state <= redsignal;
          count <= 0;
        end
      
      else begin
        
        case(state)
          
          redsignal:
            
            begin
              if(count == 10)
                count <= 0;
              
              else begin
                count <= count + 1;
                red <= 1; yellow <= 0; green <= 0;
                state <= redwithyellow;
                #10;
              end
            end
          
          redwithyellow:
            
            begin
              red <= 0; yellow <= 1; green <= 0;
              state <= greensignal;
              #3;
            end
          
          greensignal:
            
            begin
              red <= 0; yellow <= 0; green <= 1;
              state <= greenwithyellow;
              #5;
            end
          
          greenwithyellow:
            
            begin
              red <= 0; yellow <= 1; green <= 0;
              state <= redsignal;
              #3;
            end
          
          default : 
            begin
              state <= redsignal;
            end
          
        endcase
      end
    end
  
  always@(posedge clk)
    begin
      if(count == 10)
        count <= 0;
      else 
         count <= count + 1;
    end
        
  
endmodule
        
            
        
        
      
      
      