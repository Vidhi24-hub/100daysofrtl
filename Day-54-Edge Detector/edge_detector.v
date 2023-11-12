module edge_detector(in,clk,posedge_detection,negedge_detection);
  input in,clk;
  output reg posedge_detection,negedge_detection;
  
  reg signal;
  wire out_d; //output of D FF
  
  d_ff ff(in,clk,out_d);
  
  always@(*)
    begin
      signal <= out_d;
      posedge_detection <=   in  & ~(signal);
      negedge_detection <= ~(in) &   signal;
    end
endmodule


module d_ff(d,clk,q);
input d,clk;
output reg q;

always@(posedge clk)
begin
q <= d;
end

endmodule

  