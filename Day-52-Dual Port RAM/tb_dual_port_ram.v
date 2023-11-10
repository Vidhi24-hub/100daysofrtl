module tb_dual_port_ram();
  reg [7:0] data_a,data_b;
  reg [5:0] addr_a,addr_b;
  reg we_a,we_b,clk,rst;
  wire [7:0] q_a,q_b;
  
  dual_port_ram dut(data_a,data_b,addr_a,addr_b,we_a,we_b,clk,rst,q_a,q_b);
  
  always #2 clk=~clk;
  
  initial begin
    
    #0; clk=1; data_a=8'ha; addr_a=5'd1; we_a=1'd1;
    	rst=0; data_b=8'hd; addr_b=5'd10; we_b=1'd1;
    #4; data_a=8'hb; addr_a=5'd2; 
    	data_b=8'he; addr_b=5'd15; 
    #4; data_a=8'hc; addr_a=5'd3;
    	data_b=8'hf; addr_b=5'd20;
    #4; addr_a=5'd1; we_a=0;
    	addr_b=5'd10; we_b=0;
    #4; addr_a=5'd2; addr_b=5'd15;
    #4; addr_a=5'd3; addr_b=5'd20;
    #4; rst=1;
    #4; $finish;
  
  end
  
endmodule
