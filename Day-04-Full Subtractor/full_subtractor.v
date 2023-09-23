`timescale 1ns / 1ps

module full_subtractor(a,b,bin,difference,borrow);
input a,b,bin;
output difference,borrow;

assign difference = a^b^bin;
assign borrow = ~a&b | b&bin | ~a&bin;

endmodule