module car_parking_system(clk,rst,car_arrive,car_exit,exit_from,exit_code,slot,can_park,register);
  
  input clk,rst,car_arrive,car_exit; //car_arrive is high when car arrives; car_exit is high when any car exit
  input [2:0] exit_from; //exit_from is showing spot from which car exit
  input [7:0] exit_code; //code of exiting spot
  output reg [2:0] slot; //total available spot
  output reg can_park;  //showing us if car can park or not
  output reg [7:0] register; //temporary memory to store spot of car parked
  
  reg [7:0] first,second,third,fourth,fifth,sixth,seventh,eighth; //memories to hold passcode
  reg [2:0] spot; //car has be allowed to exit
  reg [7:0] temp; //holding passcode for designated spot
  reg match;
  
  integer i;
  
  always@(posedge clk)
    begin
      
      //synchronous reseting
      if(rst)
        begin
          slot=3'b111;
          can_park=1;
          register=0;
        end
      
      //if any car exit
      else if(car_exit)
        begin
          
          case(exit_from)
            0 : match = exit_code==first ? 1 : 0;
            1 : match = exit_code==second ? 1 : 0;
            2 : match = exit_code==third ? 1 : 0;
            3 : match = exit_code==fourth ? 1 : 0;
            4 : match = exit_code==fifth ? 1 : 0;
            5 : match = exit_code==sixth ? 1 : 0;
            6 : match = exit_code==seventh ? 1 : 0;
            7 : match = exit_code==eighth ? 1 : 0;
            default : match=0;
          endcase
        end
      
      //if there is no empty slot left
      else if(!slot)
        can_park=0;
      
      //when car arrived
      else if(car_arrive)
        begin
          slot=slot-1;
          can_park=1;
          
          /*for loop check if the MSB of register 
          is zero, then park car on that spot*/
          for(i=0;i<=7;i=i+1)
            begin
              if(register[i]==0)
                spot=i;
            end
          
          register[spot]=1;
          
          task_code (spot,temp);
          
            case(spot)
              0 : first = temp;
              1 : second = temp;
              2 : third = temp;
              3 : fourth = temp;
              4 : fifth = temp;
              5 : sixth = temp;
              6 : seventh = temp;
              7 : eighth = temp;
            endcase
          
        end
      
      /*if passcode given during exiting of car 
		matches with passcode given when car was arrive*/
      if(match)
        begin
          slot=slot+1;
          can_park=1;
          register[exit_from]=0;
        end
      
      else
        slot=slot;
            
    end
  
  task task_code;
    input [2:0] slot_number;
    output reg [7:0] out;
    
    begin
      case(slot_number)
        0 : out=1;
        1 : out=1+2;
        2 : out=1+2+3;
        3 : out=1+2+3+5;
        4 : out=1+2+3+5+8;
        5 : out=1+2+3+5+8+13;
        6 : out=1+2+3+5+8+13+21;
        7 : out=1+2+3+5+8+13+21+34;
        default : out=8'bz;
      endcase
      end
  endtask
endmodule
      
    
              
              
          