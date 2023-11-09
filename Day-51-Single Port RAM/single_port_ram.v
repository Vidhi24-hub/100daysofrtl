module single_port_ram(data,addr,we,clk,q);
  input [7:0] data;//input data
  input [5:0] addr;//address
  input we,clk;//wc is write enable
  output [7:0] q; //q is output
  
  reg [7:0] ram [63:0]; //8*64 bit
  reg [7:0] addr_reg; //address register
  
  always@(*)
    begin
      
      if(we)
        ram[addr] <= data;
      else
        addr_reg <= addr;
      
    end
  
  assign q = ram[addr_reg];
  
endmodule
  
  