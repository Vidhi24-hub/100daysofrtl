module free_running_shift_register(in,clk,clr,out);
parameter n=4;
input in,clk,clr;
output out;
reg  [n-1:0] register;
wire [n-1:0] next_register;

always@(posedge clk or posedge clr)
begin

if(clr)
register<=0;
else
register<=next_register;                     

end

assign next_register = {register[n-2:1],in};   //Left Shifting
assign out = register[n-1];

endmodule