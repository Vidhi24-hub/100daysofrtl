module tb_mailbox;
  
  mailbox m=new(); //declare mailbox as 'm'
  
  initial begin
    bit [3:0] a;
    a=$random;
    m.put(a);
    $display("Data send : %d",a);
  end
  
  initial begin
    bit [3:0] b;
    m.get(b);
    $display("Data recieved : %d",b);
  end 
endmodule
      
  