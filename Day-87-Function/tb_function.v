module tb_function;
  int a,b,mul,ans,p,q;
  
  function int argument_pass_by_value(int a,b);
    return a*b;
  endfunction
  
  function int argument_pass_by_ref(ref int p,q);
    q = p+q;
    return p*q;
  endfunction
  
  
  initial begin
    
    a = 20;
    b = 10;
    
    mul = argument_pass_by_value(a,b);
    $display("Value of a : %0d", a);
    $display("Value of b : %0d", b);
    $display("Output by Arguement pass by value function : %0d", mul);
    
    p = 20;
    q = 80;
    
    ans = argument_pass_by_ref(p,q);
    $display("Value of p : %0d", p);
    $display("Value of q : %0d", q);
    $display("Output by Arguement pass by value function : %0d", ans);
    
    
  end
endmodule
    
    
    