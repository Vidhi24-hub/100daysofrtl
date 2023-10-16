`timescale 1ns / 1ps

module master_jk_ff(j,k,rst,clk,out,out_bar,q_m,q_m_bar,q_s,q_s_bar);
input j,k,clk,rst;
output reg q_m,q_s;
output out,out_bar,q_m_bar,q_s_bar;

always@(clk or rst)
begin
if(rst==1) 
begin            //when reset is 0 then output will 0
q_m<=0; q_s<=0; 
end

else if(clk==1)  //high level of clock
begin
case({j,k})      
2'b00 : q_m<=q_m;
2'b01 : q_m<=1'b0;
2'b10 : q_m<=1'b1;
2'b11: q_m<=~q_m;
endcase
end

else if(clk==0)  //low level of clock
begin
case({q_m,q_m_bar})
2'b00 : q_s<=q_s;
2'b01 : q_s<=1'b0;
2'b10 : q_s<=1'b1;
2'b11: q_s<=~q_s;
endcase
end
end

assign q_m_bar=~q_m;
assign  q_s_bar=~q_s;

assign out=q_s;
assign out_bar=q_s_bar;

endmodule
