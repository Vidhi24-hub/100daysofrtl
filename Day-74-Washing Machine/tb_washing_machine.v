module tb_washing_machine();

  reg clk, rst, door_closed, start, filled, detergent_added, cycle_timeout, drained, spin_timeout;
  wire door_lock, motor_on, fill_value_on, drain_value, done, soap_wash, water_wash;
  
  washing_machine dut(clk, rst, door_closed, start, filled, detergent_added, cycle_timeout, drained, spin_timeout, door_lock, motor_on, fill_value_on, drain_value, done, soap_wash, water_wash);
  
  always #2 clk=~clk;
  
  initial begin
    
    #0; clk=1; rst=1; door_closed=0; start=0; 
    filled=0; detergent_added=0; cycle_timeout=1; 
    drained=0; spin_timeout=0;
    
    #2; rst=0;
    
    @(negedge clk) start=1; door_closed=1;
    @(negedge clk) filled=1; 
    @(negedge clk) detergent_added=1;
    @(negedge clk) cycle_timeout=1;
    @(negedge clk) drained=1;
    @(negedge clk) spin_timeout=1;
    @(negedge clk) door_closed=1;
    @(negedge clk) start=0; door_closed=0;
    
    #20; $finish;
  end
endmodule
    
    