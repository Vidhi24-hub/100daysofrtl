//global task to multiply two numbers
task mul(input int a,b, output int m);
  m = a*b;
endtask

module tb_task;
  int ans;
  
  initial begin
    
    //calling task for multiplication 20x40
    mul(20,40,ans);
    
    $display("Answer of multiplication 20x40 : %0d", ans);
    
  end
endmodule