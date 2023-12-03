module vending_machine(clk,rst,in,change,product);
  input clk,rst;
  input [4:0] in;
  output reg [4:0] change; //to return money
  output reg product; //one product having price 25
  
  reg [9:0] money; //store money
  reg [2:0] presentstate, nextstate;
  
  parameter S0=0, S5=1, S10=2, S15=3, S20=4;
  //only 5, 10 and 20 coin are allowed
  
  initial money=0;
  initial change=0;
  
  always@(posedge clk)
    begin
      
      if(rst)
        begin
          presentstate = 0;
          nextstate = 0;
          change = 0;
        end
      
      else 
        presentstate = nextstate;
          
          case(presentstate)
            
            S0 : 
              begin
                
                //if user paid some amount but that is not equal to or 
                //more than product price then vending machine return back paid money
                
                if(!in) 
                  begin
                    product = 0;
                    change = 0;
                    nextstate = S0;
                    money=money;
                  end
                
                else if(in == 5'd5)
                  begin
                    product = 0;
                    change = 0;
                    nextstate = S5;
                    money=money+5;
                  end
                
                else if(in == 5'd10)
                  begin
                    product = 0;
                    change = 0;
                    nextstate = S10;
                    money=money+10;
                  end
                
                else if(in == 5'd20)
                  begin
                    product = 0;
                    change = 0;
                    nextstate = S20;
                    money=money+20;
                  end
                
                else 
                  begin
                    product = 0;
                    change = 0;
                    nextstate = S0;
                    money=money;
                  end
              end
            
            S5 :
              begin
                
                if(!in) 
                  begin 
                    product = 0;
                    change = 5;
                    nextstate = S0;
                    money=money-5;
                  end
                
                else if(in == 5'd5)
                  begin
                    product = 0;
                    change = 0;
                    nextstate = S10;
                    money=money+5;
                  end
                
                else if(in == 5'd10)
                  begin
                    product = 0;
                    change = 0;
                    nextstate = S15;
                    money=money+10;
                  end
                
                else 
                  begin
                    product = 0;
                    change = 5;
                    nextstate = S0;
                    money=money-5;
                  end
              end
                
            
            S10 :
              begin
                
                if(!in)
                  begin
                    product = 0;
                    change = 10;
                    nextstate = S0;
                    money=money-10;
                  end
                
                else if(in == 5'd5)
                  begin
                    product = 0;
                    change = 0;
                    nextstate = S15;
                    money=money+5;
                  end
                
                else if(in == 5'd10)
                  begin
                    product = 0;
                    change = 0;
                    nextstate = S20;
                    money=money+10;
                  end
                
                else if(in == 5'd20)
                  begin
                    product = 1;
                    change = 5;   //total amount - price of product = 30 - 25 = 5
                    nextstate = S0;
                    money=money+15; //added money - change : 20 - 5 = 15
                  end
                
                else
                  begin
                    product = 0;
                    change = 10;
                    nextstate = S0;
                    money=money-10;
                  end
              end
            
            S15 :
              begin
                
                if(in == 5'd5)
                  begin
                    product = 0;
                    change = 0;
                    nextstate = S20;
                    money=money+5;
                  end
                
                else if(in == 5'd10)
                  begin
                    product = 1;
                    change = 0;
                    nextstate = S0;
                    money=money+10;
                  end
                
                else if(in == 5'd20)
                  begin
                    product = 0;
                    money=money+10; //new money added - change : 20 - 10 = 10
                    change = 10; //total amount - price of product = 35 - 25 = 10
                    nextstate = S0;
                  end
                else 
                  begin
                    product = 0;
                    change = 0;
                    nextstate = S15;
                    money=money;
                  end
              end
            
            S20 : 
              begin
                
                if(!in)
                  begin
                    product = 0;
                    change = 20;
                    nextstate = S0;
                    money=money-20;
                  end
                
                else if(in == 5'd5)
                  begin
                    product = 1;
                    change = 0;
                    nextstate = S0;
                    money=money+5;
                  end
                
                else if(in == 5'd10)
                  begin
                    product = 1;
                    change = 5;//total amount - price of product = 30 - 25 = 5
                    nextstate = S0;
                    money=money+5; //added money - change : 10 - 5 = 5
                  end
                
                else if(in == 5'd20)
                  begin
                    product = 1;
                    nextstate = S0;
                    money=money+5; //added money - change : 20 - 15 = 5
                    change = 5;  //total amount - price of product 
                    #1;          //40 - 25 = 15; change = 15
                    change = 10;
                  end
                
                else
                  begin
                    product = 0;
                    change = 20;
                    nextstate = S0;
                    money=money-20;
                  end
              end
          endcase
        
    end
endmodule
                
              
              
              
                  
             
                
                
        
        
        