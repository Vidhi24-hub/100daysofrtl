`timescale 1ns / 1ps

module tb_full_subtractor();

reg a,b,bin;
wire difference,borrow;

full_subtractor dut(.a(a),.b(b),.bin(bin),.difference(difference),.borrow(borrow)); 

initial
    begin

        $monitor("A=%d | B=%d | Cin=%d | Difference=%d | Borrow=%d",a,b,bin,difference,borrow);

        #0; a=0; b=0; bin=0;
        #5; a=1'b1; b=1'b0; bin=1'b0;
        #5; a=1'b0; b=1'b1; bin=1'b1;
        #5; a=1'b0; b=1'b1; bin=1'b0;
        #5; $finish;
    end
 
endmodule
