module tb_single_port_ram();
  reg [7:0] data;
  reg [5:0] addr;
  reg we,clk;
  wire [7:0] q;
  
  single_port_ram dut(data,addr,we,clk,q);
  
  always #2 clk=~clk;
  
  initial begin
    
    #0; clk=1; data=8'h10; addr=5'd10; we=1'd1;
    #4; data=8'h20; addr=5'd20; 
    #4; data=8'h30; addr=5'd30;
    #4; addr=5'd10; we=0;
    #4; addr=5'd20;
    #4; addr=5'd30;
    #4; $finish;
  
  end
  
endmodule