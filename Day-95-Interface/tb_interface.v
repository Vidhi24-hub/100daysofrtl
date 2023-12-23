//create interface 
interface bus;
  logic [7:0] add;
  logic rd_wr;
  wire [7:0] data;
  logic ack;
endinterface : bus

//module of memory
module mem(input logic clk, reset, bus ifmem);
endmodule

//testcase
program testcase(input logic clk, reset, bus iftest);
endprogram

//Testbench top
module testbench_top;
  logic clk=0;
  logic reset=0;
  
  //interface instance
  bus intf();
  
  //memory instance
  mem dut(.clk,.reset,.ifmem(intf));
  
  //testcase instance
  testcase test(.clk,.reset,.iftest(intf));  
endmodule
