module tb_car_parking_system();
  reg clk,rst,car_arrive,car_exit;
  reg [2:0] exit_from;
  reg [7:0] exit_code;
  wire [2:0] slot;
  wire can_park;
  wire [7:0] register;
  
  car_parking_system dut(clk,rst,car_arrive,car_exit,exit_from,exit_code,slot,can_park,register);
  
  always #2 clk=~clk;
   
  initial begin
    
    #0; clk=1; rst=1; car_arrive=0; car_exit=0; exit_from=0; exit_code=0;
    #1; rst=0; 
    
    @(negedge clk) car_arrive=1;  //one car is arrived
    @(negedge clk) car_arrive=0;
    @(negedge clk) car_exit=1;   //second car is arrived
    @(negedge clk) begin exit_code=8'd89; exit_from=3'd7; end /*exitcode doesn't match with system passcode
                                                                so car is not allowed to pass */
    @(negedge clk) begin exit_code=8'd0; exit_from=3'd0; end
    @(negedge clk) car_exit=0;
    @(negedge clk) car_arrive=1;
    @(negedge clk) car_arrive=0;
    @(negedge clk) car_exit=1;
    @(negedge clk) begin exit_code=8'd87; exit_from=3'd7; end  //exitcode of car is match with system passcode 
    @(negedge clk) begin exit_code=8'd0; exit_from=3'd0; end  //so both car are allowed to pass
    @(negedge clk) car_exit=0;
    
    #30; $finish;
    
  end
endmodule