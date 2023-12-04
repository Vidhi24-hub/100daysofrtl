class hello_world;
  
  function void new();
   
  endfunction
  
  function hello();
    $display("Hello World!\n"); //displays Hello World!
  endfunction
  
endclass


module tb_hello_world();
  
  hello_world h; //declaring instance as h
  
  initial begin
    h=new();     //calls new function
    h.hello();   //calls hello function
    $finish();
  end
  
endmodule