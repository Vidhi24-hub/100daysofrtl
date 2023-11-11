module rom(addr,clk,ena,data);
  input [3:0] addr; //address
  input clk,en;     //en is enable
  output reg [3:0] data; 
  
  reg [3:0] rom [15:0]; //4 bit data and 16 location
  
  always@(posedge clk)
    begin
      
      if(en)
        data <= rom[addr];
      else
        data <= 4'bxxxx;
      
    end
  
  integer i;
  
  initial begin 

    for(i=0;i<=15;i=i+1)
      begin
        rom[i]=15-i;
        end
  
  end
  
endmodule
     
   