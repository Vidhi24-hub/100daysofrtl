module array_multiplier(a,b,mul);
  input [3:0] a,b;
  output [7:0] mul;
  
  wire h_s1,h_s2,h_s3,h_s4,
  	   h1_c1,h2_c2,h3_c3,h4_c4,
       f_s1,f_s2,f_s3,f_s4,f_s5,f_s6,f_s7,f_s8,
  	   f_c1,f_c2,f_c3,f_c4,f_c5,f_c6,f_c7,f_c8;
  
  assign and1 = a[0] & b[0];
  
  half_adder h1( a[0]&b[1], a[1]&b[0], h_s1, h_c1);
  half_adder h2( a[1]&b[1], a[2]&b[0], h_s2, h_c2);
  half_adder h3( a[2]&b[1], a[3]&b[0], h_s3, h_c3);
  
  full_adder f1( a[0]&b[2], h_c1, h_s2, f_s1, f_c1);
  full_adder f2( a[1]&b[2], h_c2, h_s3, f_s2, f_c2);
  full_adder f3( a[2]&b[2], a[3]&b[1], h_c3, f_s3, f_c3);
  full_adder f4( a[0]&b[3], f_c1, f_s2, f_s4, f_c4);
  full_adder f5( a[1]&b[3], f_c2, f_s3, f_s5, f_c5);
  full_adder f6( a[2]&b[3], a[3]&b[2], f_c3, f_s6, f_c6);
  
  half_adder h4( f_c4, f_s5, h_s4, h_c4);
  
  full_adder f7( h_c4, f_c5, f_s6, f_s7, f_c7);
  full_adder f8( a[3]&b[3], f_c7, f_c6, f_s8, f_c8);
  
  assign mul={f_c8,f_s8,f_s7,h_s4,f_s4,f_s1,h_s1,and1};

endmodule
  

module half_adder(a,b,s,cout);
  input a,b;
  output s,cout;
  
  assign {cout,s} = a+b;
  
endmodule

module full_adder(a,b,cin,s,cout);
  input a,b,cin;
  output s,cout;
  
  assign {cout,s} = a+b+cin;
  
endmodule
