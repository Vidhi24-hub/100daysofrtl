module bidirectional(in,mode,clk,clr,out);
input in,mode,clk,clr;
  output [3:0] out;
  reg  q0,q1,q2,q3;

always@(posedge clk or posedge clr)
begin

if(clr)         //Clearing output
begin
q3<=0;
q2<=0;
q1<=0;
q0<=0;
end

else if(mode)  //Right shifting of input
begin
q3<=in;
q2<=q3;
q1<=q2;
q0<=q1;
end

else          //Left shifting of input
begin
q0<=in;
q1<=q0;
q2<=q1;
q3<=q2;
end
 

end
  
  assign out[0]=q0;
  assign out[1]=q1;
  assign out[2]=q2;
  assign out[3]=q3;
  
endmodule