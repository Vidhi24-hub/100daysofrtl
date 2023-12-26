class example;
  int a,b;
  task printf();
    $display(a,b);
  endtask
endclass

program main;
  initial begin
    example obj_1=new();
    example obj_2=new();
    obj_1.a=24;
    obj_1.b=10;
    obj_2.a=12;
    obj_2.b=07;
    obj_1.printf();
    obj_2.printf();
  end
endprogram