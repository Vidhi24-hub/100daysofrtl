interface ms_if(input clk);
  logic s_ready; //slave ready signal
  logic rstn; //reset signal
  logic [1:0] addr; //address 
  logic [7:0] data; //data
  
  modport master(output addr, data, input clk, s_ready, rstn);
  
  modport slave(input clk, s_ready, rstn);
endinterface

//module of master
module master(ms_if.master mif);

endmodule

//module of slave
module slave(ms_if.slave sif);
endmodule

//tied two modules together
module t(ms_if tif);
  //pass 'master' modport to master
  master m0(tif.master);
  
  //pass 'slave' modport to slave
  slave s0(tif.slave);
endmodule

//testbench top
module t_bench;
  logic clk;
  
  ms_if if0(clk);
  top d0(if0);
  
endmodule
