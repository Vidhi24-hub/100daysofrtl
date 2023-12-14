//create a structure that hold number and name of book
typedef struct{
    int number;
    string book;
} structure;
 

module tb_structure;
  
  initial begin
    
    structure structure1;
    structure structure2;
  
    structure1 = '{1, "Morris Mano"};
    structure2 = '{2, "Samir Palnitkar"};
    
    $display("structure_1 : %p", structure1);
    $display("structure_2 : %p", structure2);
    
    structure2.book = "A Verilog HDL Primer - by J. Bhasker";
    $display("Change in structure_2");
    $display("structure_2 : %p", structure2);
    
  end
endmodule