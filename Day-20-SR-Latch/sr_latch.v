module sr_latch(s,r,en,rst,q,q_bar);
input s,r,en,rst;
output reg q,q_bar;
	
always @ (*)
begin
    
   if(rst)                //if system is at reset then q=0 and q_bar=1
   begin
   q<=0; 
   q_bar<=1;
   end
   else if(en) 
   begin
	   case({s,r})       
		 2'b00 : begin q<=q; q_bar<=q_bar; end
		 2'b01 : begin q<=0; q_bar<=1; end
		 2'b10 : begin q<=1; q_bar<=0; end
		 2'b11 : begin q<=0; q_bar<=0; end
		 default : begin q<=1'b0; q_bar<=1'b0; end
	    endcase
   end
end
	
endmodule
