module tb_datatype_bit;
  bit [7:0] data;   //bit datatype can only have 2 values 0 and 
                    //1, it cannot have values like x and z.
  
  initial begin
    
    $display("Size of data : %0d", $bits(data));
    
    $display("Bit data : %0h", data);
    
    data=8'h17;
    
    $display("Bit data : %0h", data);
    
  end
endmodule
            