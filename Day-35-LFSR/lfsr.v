module lfsr(clk,preset,out);
input clk,preset;
  output [3:0] out;
  reg  q0,q1,q2,q3;

always@(posedge clk or posedge preset)
begin

if(preset)         //Setting all Flip Flops
begin
q3<=1;
q2<=1;
q1<=1;
q0<=1;
end

else 
begin
q3<=q1^q0;
q2<=q3;
q1<=q2;
q0<=q1;
end

end

assign out[0]=q0;
assign out[1]=q1;
assign out[2]=q2;
assign out[3]=q3;

endmodule