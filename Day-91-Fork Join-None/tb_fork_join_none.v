module tb_fork_join_none;
  
  initial begin
    
    statement(1,"Beginning of Fork-Join");
    
    fork
      
      //Thread 1
      fork
        statement(20,"Thread 1_1");
        statement(30,"Thread 1_2");
      join_none
      
    //Thread 2
    begin
      statement(2,"Thread 2_1");
      statement(3,"Thread 2_2");
    end
    
      
    //Thread 3
    statement(25,"Thread 3");
      
    join_none
    
    $display("[%0t] Ending of Fork-Join",$time);
    
  end
  
  //automatic task to print statement
  task automatic statement(int t, string t_name);
    #t $display("[%0t] %s", $time,t_name);
  endtask
      
endmodule
        
        