
module universal_shift_register(in,p_in,s1,s0,clk,clr,out);
input in,clk,clr,s1,s0;
input [3:0] p_in; //parallel input
output [3:0] out;
  reg q0,q1,q2,q3;

always@(posedge clk or posedge clr)
begin

if(clr)
begin
q3<=0;
q2<=0;
q1<=0;
q0<=0;
end

else 
begin
case({s1,s0})
2'b00 : begin q0<=q0; q1<=q1; q2<=q2; q3<=q3; end //No changes 
2'b01 : begin q0<=in; q1<=q0; q2<=q1; q3<=q2; end //Right Shift
2'b10 : begin q0<=q1; q1<=q2; q2<=q3; q3<=in; end //Left Shift
2'b11 : begin q0<=p_in[0]; q1<=p_in[1]; q2<=p_in[2];q3<=p_in[3]; end //Parallel Load
endcase
end

end
assign out[0]=q0;
assign out[1]=q1;
assign out[2]=q2;
assign out[3]=q3;
endmodule

