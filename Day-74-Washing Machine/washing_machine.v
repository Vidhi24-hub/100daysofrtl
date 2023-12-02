module washing_machine(clk, rst, door_closed, start, filled, detergent_added, cycle_timeout, drained, spin_timeout, door_lock, motor_on, fill_value_on, drain_value, done, soap_wash, water_wash);
  
  input clk, rst, door_closed, start, filled, detergent_added, cycle_timeout, drained, spin_timeout;
  output reg door_lock, motor_on, fill_value_on, drain_value, done, soap_wash, water_wash;
  
  parameter check_door=0;
  parameter fill_water=1;
  parameter add_detergent=2;
  parameter cycle=3;
  parameter drain_water=4;
  parameter spin=5;
  
  reg [2:0] presentstate, nextstate;
  
  always@(posedge clk)
    begin
      
      if(rst)
        presentstate <= 3'b000;
      else
        presentstate <= nextstate;
      
    end
  
  always@(presentstate or door_closed or start or filled or detergent_added or cycle_timeout or drained or spin_timeout)
    begin
      
      case(presentstate)
        
        check_door :
          begin
            
            if(start == 1 && door_closed == 1)
              begin
                door_lock = 1;
                nextstate = fill_water;
                
                motor_on=0;
                fill_value_on=0;
                drain_value=0;
                soap_wash=0;
                water_wash=0;
                done=0;
              end
            
            else 
              begin
                nextstate = presentstate;
                
                door_lock=0;
                motor_on=0;
                fill_value_on=0;
                drain_value=0;
                soap_wash=0;
                water_wash=0;
                done=0;
              end
            
            
          end
        
        fill_water :
          begin
            
            if(filled)
              begin
                if(!soap_wash)
                  begin
                    nextstate = add_detergent;
                    soap_wash=1;
                    
                    door_lock=1;
                    motor_on=0;
                    fill_value_on=0;
                    drain_value=0;
                    water_wash=0;
                    done=0;
                  end
                else
                  begin
                    nextstate = cycle;
                    water_wash=1;
                    
                    door_lock=1;
                    motor_on=0;
                    fill_value_on=0;
                    drain_value=0;
                    soap_wash=1;
                    done=0;
                  end
              end
            
            else
              begin
                nextstate = presentstate;
                fill_value_on = 1;
                
                door_lock=1;
                motor_on=0;
                drain_value=0;
                done=0;
              end
          end
        
        add_detergent :
          begin
            if(detergent_added)
              begin
                nextstate = cycle;
                
                door_lock=1;
                motor_on=0;
                fill_value_on=0;
                drain_value=0;
                soap_wash=1;
                done=0;
              end
            else
              begin
                soap_wash = 1;
                nextstate = presentstate;
                
                
                door_lock=1;
                motor_on=0;
                fill_value_on=0;
                drain_value=0;
                soap_wash=0;
                water_wash=0;
                done=0;
              end
          end
        
        cycle :
          begin
            if(cycle_timeout)
              begin
                motor_on = 0;
                nextstate = drain_water;
                
                door_lock=1;
                fill_value_on=0;
                drain_value=0;
                done=0;
              end
            else
              begin
                motor_on = 1;
                nextstate = presentstate;
                
                door_lock=1;
                fill_value_on=0;
                drain_value=0;
                done=0;
              end
          end
        
        drain_water :
          begin
            if(drained)
              begin
                if(!water_wash)
                  begin
                    nextstate = fill_water;
                    
                    door_lock=1;
                    motor_on=0;
                    fill_value_on=0;
                    drain_value=0;
                    soap_wash=1;
                    done=0;
                  end
                else
                  begin
                    nextstate = spin;
                    
                    door_lock=1;
                    motor_on=0;
                    fill_value_on=0;
                    drain_value=0;
                    soap_wash=1;
                    water_wash=1;
                    done=0;
                  end
              end
            else
              begin
                drain_value = 1;
                nextstate = presentstate;
                
                door_lock=1;
                motor_on=0;
                fill_value_on=0;
                drain_value=1;
                soap_wash=1;
                done=0;
                
              end
          end
        
        spin :
          begin
            
            if(spin_timeout)
              begin
                done = 1;
                nextstate = check_door;
                
                door_lock=1;
                motor_on=0;
                fill_value_on=0;
                drain_value=0;
                soap_wash=1;
                water_wash=1;
                done=1;
              end
            else
              begin
                nextstate = presentstate;
                
                door_lock=1;
                motor_on=0;
                fill_value_on=0;
                drain_value=1;
                soap_wash=1;
                water_wash=1;
                done=0;
              end
          end
        
        default : nextstate = check_door;
        
      endcase
    end
endmodule
        
        
            
                
            
                  
                
      
      