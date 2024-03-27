module barrel_shifter(in,shift,mode,out);
  input [7:0] in; //8 bit input for shifting
  input [2:0] shift;//amount of shifting
  input mode; //0 - Left Shift | 1 = Right Shift
  output reg [7:0] out; //output of barrel shifter
  
  always@(*)
    begin
      
      if(mode) 
        begin
          case(shift)
            3'b000 : out = {in[0],in[7:1]};
            3'b001 : out = {in[1:0],in[7:2]};
            3'b010 : out = {in[2:0],in[7:3]};
            3'b011 : out = {in[3:0],in[7:4]};
            3'b100 : out = {in[4:0],in[7:5]};
            3'b101 : out = {in[5:0],in[7:6]};
            3'b110 : out = {in[6:0],in[7]};
            3'b111 : out = in;
            default : out = in;
          endcase
        end
      else 
        begin
          case(shift)
            3'b000 : out = {in[6:0],in[7]};
            3'b001 : out = {in[5:0],in[7:6]};
            3'b010 : out = {in[4:0],in[7:5]};
            3'b011 : out = {in[3:0],in[7:4]};
            3'b100 : out = {in[2:0],in[7:3]};
            3'b101 : out = {in[1:0],in[7:2]};
            3'b110 : out = {in[0],in[7:1]};
            3'b111 : out = in;
            default : out = in;
          endcase
        end
      
    end
endmodule
        
        
