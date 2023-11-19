module seven_segment_using_rom(addr,clk,en,out);
  input [3:0] addr;
  input clk,en;
  output reg [7:0] out; 
  
  reg [7:0] rom [15:0]; //8 bit data and 16 location
  
  always@(posedge clk)
    begin
      
      if(en)
        out <= rom[addr];
      else
        out <= 4'bxxxx;
      
    end
  
  initial
    begin
      
      //common anode seven segment
      //h-g-f-e-d-c-b-a
      
      rom[16'h0] = 7'b1000000;
      rom[16'h1] = 7'b1111001;
      rom[16'h2] = 7'b0100100;
      rom[16'h3] = 7'b0110000;
      rom[16'h4] = 7'b0011001; 
      rom[16'h5] = 7'b0010010; 
      rom[16'h6] = 7'b0000010;
      rom[16'h7] = 7'b1111000;
      rom[16'h8] = 7'b0000000; 
      rom[16'h9] = 7'b0110000; 
      rom[16'ha] = 7'b0001000;
      rom[16'hb] = 7'b0000011;
      rom[16'hc] = 7'b1000110; 
      rom[16'hd] = 7'b0100001;
      rom[16'he] = 7'b0000110; 
      rom[16'hf] = 7'b0001110;
      
      
    end
endmodule