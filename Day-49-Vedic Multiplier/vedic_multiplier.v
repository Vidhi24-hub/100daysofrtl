module vedic_mul_8_bit (a, b, mul);
  input [7:0] a,b;
  output [15:0] mul;
  wire c1, c2, cout, o;
  wire [7:0] m1, m2, m3, m4, w1, w2, s1, s2, s3;
  parameter zero = 1'b0;
  
  vedic_mul_4_bit M1(a[3:0],b[3:0],m1);
  vedic_mul_4_bit M2(a[7:4],b[3:0],m2);
  vedic_mul_4_bit M3(a[3:0],b[7:4],m3);
  vedic_mul_4_bit M4(a[7:4],b[7:4],m4);
  
  assign w1 = m1[7:4];
  
  cla_8_bit F1( m2, m3, zero, s1, c1);
  cla_8_bit F2( s1, w1, zero, s2, c2);
  
  assign o = c1|c2;
  assign w2 = {zero, zero, zero, o, s2 [7:4]};
  
  cla_8_bit F3 (m4, w2, zero, s3, cout);
  
  assign mul [3:0] = m1[3:0];
  assign mul [7:4] = s2[3:0];
  assign mul [15:8] = s3;
  
endmodule



module cla_8_bit (a, b, cin, s, cout);
  input [7:0] a,b;
  input cin;
  output reg [7:0] s;
  output reg cout;
  reg [7:0] p,g, c;
  
  always@ (*)
    begin
      p = a^b;
      g = a&b;
      c[0] = cin;
      c[1] = g[0] | (p[0]&c[0]);
      c[2] = g[1] | (p[1]&c[1]);
      c[3] = g[2] | (p[2]&c[2]);
      c[4] = g[3] | (p[3]&c[3]);
      c[5] = g[4] | (p[4]&c[4]);
      c[6] = g[5] | (p[5]&c[5]);
      c[7] = g[6] | (p[6]&c[6]);
      cout = g[7] | (p[7]&c[7]);
      s = p^c;
    end
  
endmodule



module vedic_mul_4_bit (a, b, mul);
  input [3:0] a,b;
  output [7:0] mul;
  wire c1, c2, cout, o;
  wire [3:0] m1, m2, m3, m4, w1, w2, s1, s2, s3;
  parameter zero = 1'b0;
  
  vedic_mul_2_bit M1(a[1:0],b[1:0], m1);
  vedic_mul_2_bit M2(a[3:2],b[1:0], m2);
  vedic_mul_2_bit M3(a[1:0],b[3:2], m3);
  vedic_mul_2_bit M4(a[3:2],b[3:2], m4);
  
  assign w1 = m1[3:2];
  
  cla F1 (m2, m3, zero, s1,c1);
  cla F2 (s1, w1, zero, s2, c2);
  
  assign o=c1|c2;
  assign w2={zero, o, s2[3:2]};
  
  cla F3 (m4, w2, zero, s3, cout);
  
  assign mul[1:0] = m1[1:0];
  assign mul[3:2] = s2[1:0];
  assign mul[7:4] = s3[3:0];
  
endmodule



module cla (a, b, cin, s, cout);
  input [3:0] a,b;
  input cin;
  output reg [3:0] s;
  output reg cout;
  reg [3:0] p, g, c;
  
  always@ (*)
    begin
      p = a^b;
      g = a&b;
      
      c[0] = cin;
      c[1] = g[0] | (p[0]&c[0]);
      c[2] = g[1] | (p[1]&c[1]); 
      c[3] = g[2] | (p[2]&c[2]); 
      cout = g[3] | (p[3]&c[3]);
      s = p^c;
    
    end
  
endmodule



module vedic_mul_2_bit (a, b, out);
  input [1:0] a,b;
  output [3:0] out;
  wire w1, w2, w3, w4, c1;
  
  assign w1 = a[0]&b[0];
  assign w2 = a[1]&b[0];
  assign w3 = a[0]&b[1];
  assign w4 = a[1]&b[1];
  
  assign out[0] = w1;
  
  half_adder HA1 (w2, w3, out [1], c1);
  half_adder HA2 (c1, w4, out [2], out [3]);

endmodule



module half_adder (a, b, s, c);
  input a,b;
  output reg s, c;
  
  always@ (*)
    begin
      
      s = a^b;
      c = a&b;
      
    end

endmodule
