module tb_edge_detector();
  reg in,clk;
  wire posedge_detection,negedge_detection;
  
  edge_detector dut(in,clk,posedge_detection,negedge_detection);
  
  always #2 clk=~clk;
  
  initial begin
    
    #0; in=0; clk=0;
    #4; in=1;
    #4; in=0;
    #4; in=1;
    #4; $finish;
  end
endmodule
  