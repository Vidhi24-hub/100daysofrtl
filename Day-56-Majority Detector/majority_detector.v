module majority_detector(a,b,c,out);
  input a,b,c; //a,b, and c are inputs of majority detector
  output reg out; //out is output of majority detector
  
  reg w1,w2,w3;
  
  always@(*)
    begin
      w1 = a&b;
      w2 = b&c;
      w3 = a&c;
      out = w1|w2|w3;
    end
endmodule