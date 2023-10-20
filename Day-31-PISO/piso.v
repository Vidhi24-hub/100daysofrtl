
module piso(in,clk,select,out);
input [3:0] in;
input clk,select;
output out;
reg q0,q1,q2,q3;

always@(posedge clk)
begin

if(!select)
begin
  q3<=in[3];
  q2<=in[2];
  q1<=in[1];
  q0<=in[0];
end

else
begin
q3<=in[3];
q2<=q3;
q1<=q2;
q0<=q1;
end

end

assign out=q0;

endmodule

