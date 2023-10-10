module jk_latch(j,k,en,rst,q,q_bar);
input j,k,en,rst;
output reg q,q_bar;
//output q,q_bar;
always @ (*)
begin
    
   if(rst)                
   begin
   q<=0; 
   q_bar<=1;
   end
   else if(en) 
   begin
   
	    case({j,k})       
		 2'b00 :   begin q<=q;    q_bar<=q_bar; end
		 2'b01 :   begin q<=0;    q_bar<=1; end
		 2'b10 :   begin q<=1;    q_bar<=0; end
		 2'b11 :   begin q<=1;    q_bar<=1; end
		 default : begin q<=1'bx; q_bar<=1'bx; end
		 endcase
		 
   end
end
/*
//wire w1,w2;
//reg w1,w2;
and a1(w1,q_bar,j);
and a2(w2,q,k);
nor n1(q,w1,q_bar);
nor n2(q_bar,w2,q);
always@(*) begin
if(rst)
begin q=0; q_bar=1; end 
else if(en) begin

w1=j&q_bar;
w2=k&q;
q=~(w1|q_bar);
q_bar=~(w2|q);

end
end
*/
endmodule