module fifo(in,wt_en,rd_en,clk,rst,out,counter,empty,full);
  input [7:0] in; //8 bits input of FIFO
  input clk,rst,wt_en,rd_en; //wt_en is write enable and rd_en is read enable
  output reg [7:0] out; //8 bits output of FIFO
  output reg [6:0] counter;
  output reg empty,full; 
  
  reg [7:0] mem[63:0];
  reg [6:0] wt_ptr, rd_ptr;
  
  //to identify pointer
  
  always@(posedge clk or posedge rst)
    begin
      
      if(rst)
        begin
          wt_ptr <= 0;
          rd_ptr <= 0;
        end
      else
        begin
          if(!full & wt_en) //pointer to write on memory
            wt_ptr <= wt_ptr+1;
          else
            wt_ptr <= wt_ptr;
          
          if(!empty & rd_en) //pointer to read from memory
            rd_ptr <= rd_ptr+1;
          else
            rd_ptr <= rd_ptr;
        end
    end
  
  //Write section
  
  always@(posedge clk)
    begin
      if(!full & wt_en)
        mem[wt_ptr] <= in;
      else
        mem[wt_ptr] <= mem[wt_ptr];
    end
  
  //Read section
  
  always@(posedge clk or posedge rst)
  begin
    if(rst)
      out <= 8'd0;
    else
      begin
        if(!empty & rd_en)
          out <= mem[rd_ptr];
        else 
          out <= out;
      end
  end
  
  //Counter section
  
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        counter <= 0;
      else if((!full & wt_en) && (!empty & rd_en))
        counter <= counter;
      else if(!full & wt_en)
        counter <= counter + 1;
      else if(!empty & rd_en)
        counter <= counter - 1;
      else
        counter <= counter;
    end
  
  //empty is used to get to know if memory is empty
  //full is used to get to know if memory is full
  
  always@(counter)
    begin
      empty <= counter==0;
      full <= counter==64;
    end

endmodule
        
              
  
          
      