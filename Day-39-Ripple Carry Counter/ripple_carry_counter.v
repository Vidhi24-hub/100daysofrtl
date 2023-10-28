module ripple_carry_counter(clk,rst,out);
  input clk,rst;
  output [3:0] out;
  
  t_ff ff0(clk,rst,out[0]);
  t_ff ff1(out[0],rst,out[1]);
  t_ff ff2(out[1],rst,out[2]);
  t_ff ff3(out[2],rst,out[3]);
  
endmodule



module t_ff(clk,rst,q);
  input clk,rst;
  output q;
  
  d_ff dff(~q,clk,rst,q);

endmodule
    
    
module d_ff(d,clk,rst,q);
  input d,clk,rst;
  output reg q;
  
  always@(negedge clk or posedge rst)
    begin
      q <= rst ? 0 : d;
    end
  
endmodule