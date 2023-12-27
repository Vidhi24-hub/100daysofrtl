class parent_class;
  bit [4:0] l; //length
  bit [4:0] b; //breadth
  bit [31:0] peri; //perimeter
  
  //function to calculate perimeter of rectangle
  function Peri();
    peri = 2*(l+b);
    $display("Perimeter of rectangle : %d",peri);
  endfunction
  
endclass

class child_class extends parent_class;
  bit [31:0] A; //Area
  
  //function to calculate area of rectangle
  function Area();
    A = l*b;
    $display("Area of rectangle : %d",A);
    super.Peri();
  endfunction
endclass

module top;
  child_class c;
  
  initial begin
    c=new();
    c.l=24;
    c.b=10;
    c.Area();
  end
endmodule