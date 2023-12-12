module tb_associative_array;
  
  //associative array of 'string' datatype having 'string' index
  string array[string];
  string s;

  initial begin
    
    array = '{"flower" : "lavender", "positivity" : "joy", 
              "book" : "self improvement" , "personality" : "confidence"};
    
    $display("Size of array : %0d",array.size());
    $display("array=%p",array);
    
    //checking if particular element exists
    if(array.exists("positivity"))
      $display("'positivity' element is present in array");
    
    //first element in array
    array.first(s);
    $display("The first element in array is %s : %s", s, array[s]);
    
    //next element in array
    array.next(s);
    $display("The next element in array is %s : %s", s, array[s]);
    
    //last element in array
    array.last(s);
    $display("The last element in array is %s : %s", s, array[s]);
    
    //previous element in array
    array.prev(s);
    $display("The previous element in array is %s : %s", s, array[s]);
    
  end
endmodule
    