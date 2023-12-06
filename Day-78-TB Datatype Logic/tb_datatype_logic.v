module tb_datatype_logic;
  logic [7:0] data;    /* logic datatype have 4 state, that 
                          means values are 0, 1, x and z */
  
  initial begin
    
    $display("Size of data :%d", $bits(data));
    
    $display("Logic data : %h", data);
    
    data=8'h24;
    
    $display("Logic data : %h", data);
    
  end
endmodule
            