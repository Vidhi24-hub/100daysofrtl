module tb_alu();
  reg [3:0] A,B;
  reg [2:0] opcode;
  wire [7:0] out;
  integer i;
  
  alu dut(A,B,opcode,out);
  
  initial begin
    
    #0; A=0; B=0; opcode=0;
    #4; A=4'b1100; B=4'b1011;

    for(i=0; i<=7; i=i+1)
      begin
        opcode=i;
        #4;
      end

  end
endmodule
    
  