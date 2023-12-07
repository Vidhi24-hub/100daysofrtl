module tb_datatype_string;
  string s1 = "VLSI Enthuasianst";
  string s2 = {"Hello", " ", s1};
  bit [31:0] num = 79;
  string s3 = num;
  
  initial begin
    
    $display("String : %s",s2);
    $display("Today is my%d th day of 100daysofrtl",s3);
    
  end
endmodule
             
             
             
  
