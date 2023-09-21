`timescale 1ns / 1ps

module tb_full_adder();

reg a,b,cin;
wire sum,cout;

full_adder dut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));

initial begin
$monitor("A=%h | B=%h | Cin=%h | Sum=%h | Carry=%h",a,b,cin,sum,cout);

            #5; a  = 0;
                b  = 0;
               cin = 0;
            
            #5; a  = 0;
                b  = 1;
               cin = 1;
               
            #5; a = 1;
                b = 0;   
                
               
            #5; a = 1;
                b = 1;
	    
	   #5; $finish;
                   
            
            end 


endmodule
