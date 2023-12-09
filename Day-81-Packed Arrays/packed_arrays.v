module packed_arrays; 
  
  logic [1:0][3:0][7:0] data;
  
  initial begin
    
    data[0] = 32'h1234_5678;
    data[1] = 32'h9abc_def0;
    
    $display("data=%h",data);
   
    foreach(data[i])
      begin
        $display("data[%0d]=%h",i,data[i]);
        foreach(data[i][j])
          begin
            $display("data[%0d][%0d]=%h",i,j,data[i][j]);
          end
      end
    
  end
endmodule
