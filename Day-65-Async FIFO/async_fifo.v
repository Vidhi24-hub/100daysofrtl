module async_fifo(in,wt_en,rd_en,clk1,clk2,rst,out,counter,empty,full);
  input [7:0] in; //8 bits input of FIFO
  input clk1,clk2,rst; //clk1 is for write part and clk2 is for read part
  input wt_en,rd_en; //wt_en is write enable and rd_en is read enable
  output reg [7:0] out; //8 bits output of FIFO
  output reg [6:0] counter;
  output reg empty,full; 
  
  reg [7:0] mem[63:0];
  reg [6:0] wt_ptr, rd_ptr;
  
  //to identify pointer to write on memory using clk1
  
  always@(posedge clk1 or posedge rst)
    begin
      
      if(rst)
        begin
          wt_ptr <= 0;
        end
      else
        begin
          if(!full & wt_en) //Head Section 
            wt_ptr <= wt_ptr+1;
          else if(wt_ptr==64)
            wt_ptr <= 0;
          else
            wt_ptr <= wt_ptr;
          
        end
    end
  
  //to identify pointer to read from memory using clk2
  
  always@(posedge clk2 or posedge rst)
    begin
      
      if(rst)
        begin
          rd_ptr <= 0;
        end
      else
        begin
          if(!empty & rd_en) //Tail Section
            rd_ptr <= rd_ptr+1;
          else if(rd_ptr==64)
            rd_ptr <= 0;
          else
            rd_ptr <= rd_ptr;
        end
    end  
  
  //Write section
  
  always@(posedge clk1)
    begin
      if(!full & wt_en)
        mem[wt_ptr] <= in;
      else
        mem[wt_ptr] <= mem[wt_ptr];
    end
  
  //Read section
  
  always@(posedge clk2 or posedge rst)
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
  
  //Counter section of clk1
  
  always@(posedge clk1 or posedge rst)
    begin
      if(rst)
        counter <= 0;
      else if((!full & wt_en) && (!empty & rd_en))
        counter <= counter;
      else if(!full & wt_en)
        counter <= counter + 1;
      else
        counter <= counter;
    end
  
  //Counter section of clk2
  
  always@(posedge clk2 or posedge rst)
    begin
      if(rst)
        counter <= 0;
      else if((!full & wt_en) && (!empty & rd_en))
        counter <= counter;
      else if(!empty & rd_en)
        counter <= counter - 1;
      else
        counter <= counter;
    end
  
  //for flag indication: empty and full flag
  
  always@(counter)
    begin
      empty <= counter==0;
      full <= counter==64;
    end

endmodule
        
              
  
          
      
