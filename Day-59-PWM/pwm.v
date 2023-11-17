module pwm(clk,rst,duty,out); //basic pwm 
  parameter R=4;
  input clk,rst;
  input [R-1:0] duty;
  output out;
  
  reg [R-1:0] Q_reg,Q_next;
  
  //For Up counter
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        Q_reg<=0;
      else
        Q_reg<=Q_next;
    end
  
  //For next logic
  always@(*)
    begin
      Q_next<=Q_reg+1;
    end
  
  assign out=(Q_reg<duty);
  
endmodule
      