//************************************************************************
//Copyright (c) 2015, PANGO MICROSYSTEMS,INC
//All Rights Reserved
//************************************************************************
`timescale 1ns / 1ns
module tx_sm #(
       parameter SPEED_TYPE= "10/100/1000M_MAC",
       parameter INTERFACE = "MII/GMII"
)
(
input               tx_clk      ,
input               rst         , 
input               clk_ten     ,
input   [17:0]      rd_data     , 
input               tpnd_en     ,
input               tsmac_rlast ,
input               data_out_valid,
input               tsmac_tpnd,
output  reg         rd_en,
output  reg [7:0]   tsmac_tdata , 
output  reg         tsmac_tstart,
output  reg         tsmac_tlast 
     
);

parameter [1:0]  TX_IDLE   = 2'b00;
parameter [1:0]  TX_IPG    = 2'b01;
parameter [1:0]  TX_DATA   = 2'b10;
parameter        TP=1; 

reg  [1:0]          tx_curt_state;
reg  [1:0]          tx_next_state;
reg  [3:0]          ipg_cnt ;
reg  [2:0]          tpnd_cnt;
reg  [7:0]          tx_cnt  ;
reg [6:0]  data    ;
reg [7:0]  frame_cnt;
reg       last1;
reg       last2;
reg       last3;
                 
always @ ( posedge tx_clk or posedge rst ) 
begin
  	if ( rst ) 
      tx_curt_state  <= #TP TX_IDLE;
    else if(clk_ten)
      tx_curt_state  <= #TP tx_next_state;
end

always @ ( * ) 
begin
    case (tx_curt_state) 
      TX_IDLE: 
      begin
        if (tsmac_rlast==1'b1) 
            tx_next_state = #TP TX_IPG;
        else
            tx_next_state = #TP TX_IDLE;
      end
      
      TX_IPG:
      begin
        if (ipg_cnt == 4'hb)
            tx_next_state = #TP TX_DATA;
        else
            tx_next_state = #TP TX_IPG; 
      end 

      TX_DATA:
      begin
        if (tsmac_tlast==1'b1)
            tx_next_state = #TP TX_IPG;
        else 
            tx_next_state = #TP TX_DATA;
      end                 
      default :tx_next_state = #TP TX_IPG;
     endcase     
 end  
      
//-----------------------------------------------------------------
//IPG count,12 period 
always @ ( posedge tx_clk or posedge rst ) 
  	if ( rst ) 
      ipg_cnt  <= #TP 4'h0;
    else if(clk_ten) begin
      if(tx_curt_state==TX_IPG) 
        ipg_cnt  <= #TP ipg_cnt+4'h1;
      else 
        ipg_cnt  <= #TP 4'h0;   
    end   
//-----------------------------------------------------
always @ ( posedge tx_clk or posedge rst ) 
begin
  	if ( rst ) 
      tpnd_cnt  <= #TP 3'h0;
    else if(clk_ten) begin
      if((tsmac_tlast==1'b1)&&(tpnd_en==1'b1)) 
        tpnd_cnt  <= #TP 3'h0;  
      else if((tsmac_tpnd==1'b1)&&(tpnd_cnt<=3'd1))       
        tpnd_cnt  <= #TP tpnd_cnt+3'h1;
    end    
end

always @ ( posedge tx_clk or posedge rst ) 
begin
  	if ( rst ) 
      tx_cnt  <= #TP 8'h00;
    else if(clk_ten) begin
      if((tsmac_tlast==1'b1)&&(tpnd_en==1'b1))
        tx_cnt  <= #TP 8'h00;  
      else if((tx_curt_state==TX_DATA)&&(tpnd_cnt>=3'd1)&&(tpnd_en==1'b1))        
        tx_cnt  <= #TP tx_cnt+8'h1; 
    end  
end


always @ ( posedge tx_clk or posedge rst ) 
begin
  	if ( rst ) begin
       tsmac_tdata  <= #TP 8'h00;
       data  <= #TP 7'h0;
       frame_cnt<= #TP 8'h01;
    end 
    else if(clk_ten) begin
      if((tx_curt_state==TX_DATA)&&(tpnd_cnt>=3'd1)&&(tpnd_en==1'b1))  
        tsmac_tdata  <= #TP rd_data;       
      else if((tsmac_tlast==1'b1)&&(tpnd_en==1'b1))
        tsmac_tdata  <= #TP 8'h00;
    end
end

always @ ( posedge tx_clk or posedge rst ) 
begin
  	if ( rst ) 
      tsmac_tstart  <= #TP 1'b0;
    else if(clk_ten) begin
      if((tpnd_cnt!=6'h02)&&(tx_curt_state==TX_DATA)&&(data_out_valid==1'b1)) 
        tsmac_tstart  <= #TP 1'b1;
      else     
        tsmac_tstart  <= #TP 1'b0; 
    end    
end

always @ ( posedge tx_clk or posedge rst ) 
begin
  	if ( rst ) 
      tsmac_tlast  <= #TP 1'd0;
    else if(clk_ten) begin
      if((SPEED_TYPE == "10/100M_MAC")||(INTERFACE == "RGMII")) begin
        if(((tsmac_tlast==1'b1)&&(tpnd_en==1'b1))||(tpnd_cnt<=3'd1))
          tsmac_tlast  <= #TP 1'd0;
        else
            tsmac_tlast  <= #TP (((rd_data[8]==1'b1)&&(tpnd_en==1'b1))||((tsmac_tlast==1'b1)&&(tsmac_tpnd==1'b1)));
      end
      else 
        tsmac_tlast  <= #TP ((rd_data[8]==1'b1)&&(tpnd_en==1'b1)) ; 
    end  
end

always @ ( posedge tx_clk or posedge rst ) 
begin
  	if ( rst ) 
  	begin
      last1  <= #TP 1'b0;
      last2  <= #TP 1'b0;
      last3  <= #TP 1'b0;
    end  
    else if(clk_ten) begin
      last1<=rd_data[8];
      last2<=last1;
      last3<=last2;	
    end 	
end

always @ ( posedge tx_clk or posedge rst ) 
begin
  	if ( rst ) 
      rd_en  <= #TP 1'b0;
    else if(clk_ten) begin
      if((SPEED_TYPE == "10/100M_MAC")||(INTERFACE == "RGMII")) begin
        if((last2==1'b1)||(last1==1'b1))
        	rd_en  <= #TP 1'b0;
        else
        	rd_en  <= #TP( (tsmac_tpnd==1'b1)&&!((rd_data[8]==1'b1)&&(tpnd_en==1'b1)));
      end 
      else begin
        if((rd_data[8]==1'b1)&(tsmac_tpnd==1'b1)) 
          rd_en  <= #TP 1'b0;	
        else 
          rd_en  <= #TP tsmac_tpnd&!tsmac_tlast;    
      end
    end    
end

endmodule

 