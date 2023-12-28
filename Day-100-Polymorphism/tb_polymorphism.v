class parent_class;
  //non virtual function of parent class
  function void nvm();
    $display("parent class : nvm");
  endfunction : nvm
  
  //Virtual function of parent class
  virtual function void vm();
    $display("parent class : vm");
  endfunction : vm
  
endclass

class child_class extends parent_class;
  //non virtual function of child class
  function void nvm();
    $display("child class : nvm");
  endfunction : nvm
  
  //Virtual function of child class
  virtual function void vm();
    $display("child class : vm");
  endfunction : vm
  
endclass


module top;
  initial begin
    parent_class pc_h,pch_h; //parent class handles
    child_class cc_h; //child class handle
    
    pc_h=new();
    cc_h=new();
    
    pch_h=cc_h; //assigning cc to pc
    
    $display("First print----");
    pc_h.nvm(); //parent class : nvm
    pc_h.vm(); //parent class : nvm
    
    pc_h=cc_h; //assigning cc to pc
    
    $display("Second print----");
    cc_h.nvm(); //child class : nvm
    cc_h.vm(); //child class : nvm
    
    pc_h=cc_h; //assigning cc to pc
    
    $display("Third print----");
    pch_h.nvm(); //parent class : nvm
    pch_h.vm(); //child class : nvm
    
    
    
  end
endmodule
  