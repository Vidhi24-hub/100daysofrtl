module tb_dynamic_array;
  
  int array [];
  
  initial begin
    
    //size of dynamic array is 5
    array = new[5];
    
    //elements of array
    array = '{0,1,2,3,4};
    
    $display("Size of array : %0d", array.size());
    
    foreach(array[i])
      $display("array[%0d]=%0d", i,array[i]);
    
    
    //-----adding new value to array------
    
    //increase the size of array
    array = new[array.size() + 1](array);
    
    //add new element to array
    array[array.size() - 1] = 5;
    
    $display("New size of array : %0d", array.size());
    
    foreach(array[j])
      $display("array[%0d]=%0d", j,array[j]);
    
   
    //-----deleting all elements of array-----
    
    array.delete();
    
    $display("Size of array : %0d", array.size());
                
    
    
  end
endmodule
      
    
    
    