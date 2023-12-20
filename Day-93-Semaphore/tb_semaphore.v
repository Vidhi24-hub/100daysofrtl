module tb_semaphore;
  semaphore s; //declare semaphore 's'
  
  initial begin
    
    s=new(2); //creating s with '1' key
    
    fork
      display();
      display();
    join
  end
  
  task automatic display();
    s.get(2); //getting '1' key from s
    $display($time,"\tCurrent Simulation Time");
    #10;
    s.put(2); //putting '1' key to s
  endtask
endmodule
    