//************************************************************************
//Copyright (c) 2015, PANGO MICROSYSTEMS,INC
//All Rights Reserved
//************************************************************************
`timescale 1ns / 1ns
module config_reg  # (
    parameter SPEED_TYPE = "10/100/1000M_MAC"
)
(
  input               pclk        ,
  input               presetn     ,  
  output  reg         pselx       , 
  output  reg         pwrite      ,
  output  reg         penable     ,
  output  reg   [7:0] paddr       , 
  output  reg  [31:0] pwdata      ,
  output  reg         config_done
);

reg  config_start;
//reg  config_done;
reg         [9:0] hstcnt      ;
parameter  TP=1; 
parameter [7:0]  MAC1=8'h00,
                 MAC2=8'h01,
                 ADDR_FIR=8'h12,          
                 MAC_L=8'h13,
                 MAC_H=8'h14;

always @ ( posedge pclk or posedge presetn )
begin
     if(presetn)
        config_start<=#TP 1'b0;
     else if(config_done==1'b1)
        config_start<=#TP 1'b0;
     else 
        config_start<=#TP 1'b1;             
end
//-----------------------------------------------------------------
//configure register count,12 period 
always @ ( posedge pclk or posedge presetn ) 
begin
  	if (presetn ) 
      hstcnt  <= #TP 10'h0;
    else if(config_start) 
      hstcnt  <= #TP hstcnt+10'h1;
    else 
      hstcnt  <= #TP 10'h0;     
end
 
always @ ( posedge pclk or posedge presetn)
begin
  if(presetn)
     config_done<=#TP 1'b0;
  else if(config_start) begin
  case(hstcnt)
  0:
    begin
      paddr  <= #TP 8'h0; 
      pselx  <= #TP 1'b0;
      pwrite  <= #TP 1'b0;
      penable <= #TP 1'b0;
      pwdata <= #TP 32'h0000_0000;
    end 
  1:
    begin
      paddr  <= #TP MAC1;
      pselx  <= #TP 1'b1;
      pwrite  <= #TP 1'b1;
      pwdata <= #TP 32'h0000_0035;
    end
  2:  penable <= #TP 1'b1  ;
  3:
    begin                         
      pselx  <= #TP 1'b0;  
      penable <= #TP 1'b0;        
      pwdata <= #TP 32'h0000_0000; 
    end 
                           
  4:
    begin                          
      paddr  <= #TP 8'h00;          
      pselx  <= #TP 1'b0;           
      pwrite  <= #TP 1'b0; 
      penable <= #TP 1'b0;          
      pwdata <= #TP 32'h0000_0000;  
    end  
  5: 
    begin                           
      paddr  <= #TP MAC2;            
      pselx  <= #TP 1'b1;            
      pwrite  <= #TP 1'b1; 
      if(SPEED_TYPE == "10/100M_MAC")           
        pwdata <= #TP 32'h0000_7013|32'h0000_0100; 
      else
        pwdata <= #TP 32'h0000_7017|32'h0000_0200;  
    end                          
  6:  penable <= #TP 1'b1;
  7:
    begin                         
      pselx  <= #TP 1'b0; 
      penable <= #TP 1'b0;         
      pwdata <= #TP 32'h0000_0000; 
    end  
                          
  8:
    begin                         
      paddr  <= #TP 8'h00;         
      pselx  <= #TP 1'b0;          
      pwrite  <= #TP 1'b0;   
      penable <= #TP 1'b0;       
      pwdata <= #TP 32'h0000_0000; 
    end                             
  9:
    begin                          
      paddr  <= #TP ADDR_FIR;       
      pselx  <= #TP 1'b1;           
      pwrite  <= #TP 1'b1;           
      pwdata <= #TP 32'h0000_0480;  
    end                            
  10: penable <= #TP 1'b1 ;
  11:
    begin                           
      pselx  <= #TP 1'b0;
      penable <= #TP 1'b0;            
      pwdata <= #TP 32'h0000_0000;  
    end 

  12:
    begin                         
      paddr  <= #TP 8'h00;         
      pselx  <= #TP 1'b0;          
      pwrite  <= #TP 1'b0;   
      penable <= #TP 1'b0;       
      pwdata <= #TP 32'h0000_0000; 
    end                             
  13:
    begin                          
      paddr  <= #TP MAC_L;       
      pselx  <= #TP 1'b1;           
      pwrite  <= #TP 1'b1;           
      pwdata <= #TP 32'h1020_3040;  
    end                            
  14: penable <= #TP 1'b1 ;
  15:
    begin                           
      pselx  <= #TP 1'b0;
      penable <= #TP 1'b0;            
      pwdata <= #TP 32'h0000_0000;  
    end 

  16:
    begin                         
      paddr  <= #TP 8'h00;         
      pselx  <= #TP 1'b0;          
      pwrite  <= #TP 1'b0;   
      penable <= #TP 1'b0;       
      pwdata <= #TP 32'h0000_0000; 
    end                             
  17:
    begin                          
      paddr  <= #TP MAC_H;       
      pselx  <= #TP 1'b1;           
      pwrite  <= #TP 1'b1;           
      pwdata <= #TP 32'h5060_0000;  
    end                            
  18: penable <= #TP 1'b1 ;
  19:
    begin                           
      pselx  <= #TP 1'b0;
      penable <= #TP 1'b0;            
      pwdata <= #TP 32'h0000_0000;  
      config_done<=#TP 1'b1; 
    end 
  
  default: ;      
  endcase
  end
end    

endmodule