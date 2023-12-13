module tb_queue;
  
  int queue [$] = {24,12,20};
  
  initial begin
    
    foreach(queue[i])
      $display("Queue[%0d] : %0d", i, queue[i]);
    
    //add element to end of queue
    queue[$+1] = 17;
    $display("Add new elemnt to Queue : %p", queue);
    
    //insert any number to given index
    queue.insert(2,100);
    $display("Add new element to 2 index of Queue : %p", queue);

    //push new element to back of queue
    queue.push_back(50);
    $display("Push 50 to back of Queue : %p",  queue);
    
    //push new element to front of queue
    queue.push_front(75);
    $display("Push 75 to front of Queue : %p",  queue);
    
    //pop from back of queue
    queue.pop_back();
    $display("Pop from back of Queue : %p",  queue);
    
    //pop from front of queue
    queue.pop_front();
    $display("Pop from front of Queue : %p",  queue);
    
  end
endmodule
      