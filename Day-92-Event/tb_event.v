module tb_event;
  event e; //declaring event 'e'
  
  initial begin
    
    fork 
      //thread 1 trigger the event
      begin
      #30;
      $display("[%0t] Triggered Event",$time);
      ->e;
      end
      
      //thread 2 waits to trigger the event
      begin
        $display("[%0t] Waiting for Event to triggered",$time);
        #30 wait(e.triggered);
        $display("[%0t] Received Triggered Event",$time);
      end
    join
  end
  
  initial begin
    #100;
    $display("[%0t] END",$time);
    $finish; 
  end
  
endmodule
  