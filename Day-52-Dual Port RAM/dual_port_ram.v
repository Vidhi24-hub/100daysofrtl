module dual_port_ram(data_a,data_b,addr_a,addr_b,we_a,we_b,clk,rst,q_a,q_b);
  input [7:0] data_a,data_b; //data input
  input [5:0] addr_a,addr_b; //address input
  input we_a,we_b,clk,rst;       //we is write enable
  output reg [7:0] q_a,q_b;      
  
  reg [7:0] ram [63:0]; //64*8 bit ram 
  
  always@(posedge clk)
    begin
      
      if(rst)
        begin ram[addr_a] <= 0; q_a = ram[addr_a]; end
      else if(we_a)
        ram[addr_a] <= data_a;
      else
        q_a <= ram[addr_a];
      
    end
  
  always@(posedge clk)
    begin
      
      if(rst)
        begin ram[addr_b] <= 0; q_b = ram[addr_b]; end
      else if(we_b)
        ram[addr_b] <= data_b;
      else
        q_b <= ram[addr_b];
      
    end
  
endmodule
