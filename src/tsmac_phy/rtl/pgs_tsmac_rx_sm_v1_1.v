//******************************************************************
// Copyright (c) 2015 PANGO MICROSYSTEMS, INC
// ALL RIGHTS REVERVED.
//******************************************************************
`timescale 1ns / 1ns
// ***********************************************************************
// --- Module Definition
module pgs_tsmac_rx_sm_v1_1 #(
       parameter WR_ADDR_WIDTH=11   
     )
(
    input   [7:0]      rpd_i ,
    input              rpdv_i,
    input              rpsf_i,
    input              rpef_i,
    input              rsvp_i,
    input   [32:0]     rsv_i ,
    input              srrfn ,
    input              rx_clk,
    input              clk_en,
    input              hashe ,
    input   [8:0]      hashv ,
    input   [8:0]      dahash,
    input   [47:0]     damac,
    input   [47:0]     dmac,
    input              fuc,
    input              fmc,
    input              fbc,
    input              nfcs,
    output  reg [7:0]  rdata ,
    output  reg        rvalid,
    output  reg        rlast ,
    output  reg        rsvp  ,
    output  reg [32:0] rsv   ,
    output  reg [63:0] packet_cnt   ,       //count the total number of frame 
    output  reg [63:0] crc_err_cnt  ,       //count the number of frame that is droped due to the crc error
    output  reg [63:0] pause_ctr_cnt,       //count the number of pause control frame 
    output  reg [63:0] addr_err_cnt ,       //count the number of frame that is droped due to the address error
    output  reg [63:0] len_err_cnt  ,       //count the number of frame that is droped due to the length of frame error
    output  reg [63:0] frame_trc_cnt,       //count the number of frame that is truncated
    output  reg [63:0] ifg_sma_cnt  ,       //count the number of frame that is droped due to the small ifg
    output  reg [63:0] bcad_cnt     ,       //count the number of frame that the destination address contained the broadcast address
    output  reg [63:0] mcad_cnt     ,       //count the number of frame that the destination address contained a multicast address
    output  reg [63:0] ucad_cnt             //count the number of frame that the destination address contained a unicast address

);


// ------------------------------------------------------------------------
// --- Port Declarations

// ------------------------------------------------------------------------
// --- Parameter Declarations

parameter TP = 1;                                       // simulation reset

reg     [WR_ADDR_WIDTH-7:0]  wrdata_addr;
reg     [WR_ADDR_WIDTH-7:0]  rddata_addr;
reg            ram_read_e;  
wire    [8:0]  ram_wdata;     
wire    [8:0]  ram_rdata;
reg     [3:0]  rx_cnt;
//reg            rsvp_o;
reg            rsvp_i_d1;
reg     [32:0] rsv_i_d1;
reg     [32:0] rsv_i_d2;
wire    [7:0]  rpd_o;

reg     [WR_ADDR_WIDTH-1:0] wr_addr;
reg     [WR_ADDR_WIDTH-1:0] rd_addr;
reg     [WR_ADDR_WIDTH-1:0] wr_ptr_sta;
reg        rpdv_d;
reg        dadisma;
reg [7:0]  rdata_d1;
reg        rvalid_d1;
reg        rlast_d1;
reg        rsvp_d1;
reg [32:0] rsv_d1;

reg [7:0]  rdata_d2;
reg        rvalid_d2;
reg        rlast_d2;
reg        rsvp_d2;
reg [32:0] rsv_d2;

reg [7:0]  rdata_d3;
reg        rvalid_d3;
reg        rlast_d3;
reg        rsvp_d3;
reg [32:0] rsv_d3;

reg [7:0]  rdata_d4;
reg        rvalid_d4;
reg        rlast_d4;
reg        rsvp_d4;
reg [32:0] rsv_d4;

reg [7:0]  rdata_d5;
reg        rvalid_d5;
reg        rlast_d5;
reg        rsvp_d5;
reg [32:0] rsv_d5;

reg [2:0]  ipgt_cnt;

//reg            rpef_o_d;

reg            rpe_state;
parameter                   RD_IDLE   = 0,
                            RD_DATA   = 1;
//-----------------------------------------------------------
//count register

//packet_cnt
always @ ( posedge rx_clk or posedge srrfn )
begin
     if ( srrfn )           
         packet_cnt <= #TP 64'h0;
     else if (clk_en)
     begin
     if(rsvp_i==1'b1)           
         packet_cnt <= #TP packet_cnt+ 64'h1;
     end    
end       

//crc_err_cnt
always @ ( posedge rx_clk or posedge srrfn )
begin
     if ( srrfn )           
         crc_err_cnt <= #TP 64'h0;
     else if (clk_en)
     begin
     if ((rsvp_i==1'b1)&&(rsv_i[20]==1'b1))           
         crc_err_cnt <= #TP crc_err_cnt+ 64'h1;
     end    
end  

//len_err_cnt
always @ ( posedge rx_clk or posedge srrfn )
begin
     if ( srrfn )           
         len_err_cnt <= #TP 64'h0;
     else if (clk_en)
     begin
     if ((rsvp_i==1'b1)&&(rsv_i[21]==1'b1))          
         len_err_cnt <= #TP len_err_cnt+ 64'h1;
     end    
end  

//pause_ctr_cnt
always @ ( posedge rx_clk or posedge srrfn )
begin
     if ( srrfn )           
         pause_ctr_cnt <= #TP 64'h0;
     else if (clk_en)
     begin
     if((rsvp_i==1'b1)&&(rsv_i[28]==1'b1))            
         pause_ctr_cnt <= #TP pause_ctr_cnt+ 64'h1;
     end    
end 

//frame_trc_cnt
always @ ( posedge rx_clk or posedge srrfn )
begin
     if ( srrfn )           
         frame_trc_cnt <= #TP 64'h0;
     else if (clk_en)
     begin
     if((rsvp_i==1'b1)&&(rsv_i[32]==1'b1))           
         frame_trc_cnt <= #TP frame_trc_cnt+ 64'h1;
     end    
end 

//ifg_sma_cnt
always @ ( posedge rx_clk or posedge srrfn )
begin
     if ( srrfn )           
         ifg_sma_cnt <= #TP 64'h0;
     else if (clk_en)
     begin
     if((rsvp_i==1'b1)&&(rsv_i[16]==1'b1))         
         ifg_sma_cnt <= #TP ifg_sma_cnt+ 64'h1;
     end    
end 

//bcad_cnt
always @ ( posedge rx_clk or posedge srrfn )
begin
     if ( srrfn )           
         bcad_cnt <= #TP 64'h0;
     else if (clk_en)
     begin 
     if((rsvp_i==1'b1)&&(rsv_i[25]==1'b1))           
         bcad_cnt <= #TP bcad_cnt+ 64'h1;
     end    
end 

//mcad_cnt
always @ ( posedge rx_clk or posedge srrfn )
begin
     if ( srrfn )           
         mcad_cnt <= #TP 64'h0;
     else if (clk_en)
     begin
     if ((rsvp_i==1'b1)&&(rsv_i[24]==1'b1))           
         mcad_cnt <= #TP mcad_cnt+ 64'h1;
     end    
end 

//ucad_cnt
always @ ( posedge rx_clk or posedge srrfn )
begin
     if ( srrfn )           
          ucad_cnt<= #TP 64'h0;
     else if (clk_en)
     begin
     if ((rsvp_i==1'b1)&&(rsv_i[24]==1'b0)&&(rsv_i[25]==1'b0))           
          ucad_cnt<= #TP ucad_cnt+ 64'h1;
     end     
end 

//addr_err_cnt
always @ ( posedge rx_clk or posedge srrfn )
begin
     if ( srrfn )           
         addr_err_cnt <= #TP 64'h0;
     else if (clk_en)
     begin
     if ((dadisma==1'b1)&&(rsvp_i_d1==1'b1)&&(rsv_i[20]== 1'b0)&&(rsv_i[28]== 1'b0)&&(rsv_i[21]== 1'b0))          
         addr_err_cnt <= #TP addr_err_cnt+ 64'h1;
     end    
end 
   
//-----------------------------------------------------------
always @ ( posedge rx_clk or posedge srrfn )
begin
     if ( srrfn )           
         wrdata_addr <= #TP {(WR_ADDR_WIDTH-6){1'b0}};
     else if (clk_en)
     begin
     if ( rsvp_i_d1 &(rsv_i[20] == 1'b0)&(rsv_i[28] == 1'b0)&(dadisma==1'b0))           
         wrdata_addr <= #TP wrdata_addr + 1'b1;
     end    
end        

always @ ( posedge rx_clk or posedge srrfn )
begin
     if ( srrfn )
         rsvp_i_d1   <= #TP 1'b0; 
     else if (clk_en)
         rsvp_i_d1   <= #TP rsvp_i;
end         

always @ ( posedge rx_clk or posedge srrfn )
begin
     if ( srrfn )
         rsv_i_d1   <= #TP 33'b0; 
     else if (clk_en)
         rsv_i_d1   <= #TP rsv_i;
end 
         
always @ ( posedge rx_clk or posedge srrfn )
begin
     if ( srrfn ) 
         rddata_addr <= #TP {(WR_ADDR_WIDTH-6){1'b0}};
     else if (clk_en)
     begin
     if (( ram_rdata[8] == 1'b1) && (ram_read_e == 1'b1))
         rddata_addr <= #TP rddata_addr + 1'b1;
     end    
end

wire   rpef_o;
assign rpd_o  = ram_rdata[7:0];
assign rpdv_o = ram_read_e&~rpef_o;
assign rpef_o = ram_rdata[8] & ram_read_e;

always @ ( posedge rx_clk or posedge srrfn )
begin
     if ( srrfn ) 
         rx_cnt <= #TP 4'b0;
     else if (clk_en)
     begin
     if ((rpdv_o == 1'b1) && (rx_cnt != 4'b1111)) 
         rx_cnt <= #TP rx_cnt + 1'b1;
     else if (rpdv_o == 1'b0)
         rx_cnt <= #TP 4'b0;
     end    
end  

always @(posedge rx_clk or posedge srrfn)
begin
    if (srrfn)
        ipgt_cnt <= 3'd0;
    else if (ipgt_cnt[2])
        ipgt_cnt <= 3'd0;
    else if (~rpe_state)
        ipgt_cnt <= ipgt_cnt + 3'd1;
end

always @ ( posedge rx_clk or posedge srrfn ) 
  begin
  	if ( srrfn ) 
      rpe_state  <= #TP 1'b0;
    else if (clk_en)
    begin
    case (rpe_state) 
      RD_IDLE: begin
        if ((wrdata_addr != rddata_addr) && ipgt_cnt[2])
            rpe_state <= #TP RD_DATA;
        else
            rpe_state <= #TP RD_IDLE;
      end

      RD_DATA: begin
        if (ram_rdata[8]) 
            rpe_state <= #TP RD_IDLE;
        else 
            rpe_state <= #TP RD_DATA;
      end
     endcase
     end
  end

  
always @ ( posedge rx_clk or posedge srrfn ) 
  begin
  	if ( srrfn )
  	  ram_read_e <= #TP 1'b0;
  	else if (clk_en)
  	begin
  	if ((wrdata_addr != rddata_addr) && ipgt_cnt[2])
  	  ram_read_e <= #TP 1'b1;
  	else if (rpef_o == 1'b1)
  	  ram_read_e <= #TP 1'b0;
    end	  
  end  

always @ ( posedge rx_clk or posedge srrfn )
begin
    if ( srrfn )
       dadisma   <= #TP 1'b0;
    else if (clk_en)
    begin
    if ((rsv_i[25]==1'b1)&&(fbc==1'b1))   
       dadisma   <= #TP 1'b1;      
    else if ((hashe == 1'b1) && (hashv != dahash) && (rsv_i[24] == 1'b1)&&(rsv_i[25]==1'b0) && (fmc == 1'b1))  
       dadisma   <= #TP 1'b1;
    else if ((rsvp_i==1'b1)&&(damac != dmac) && (rsv_i[24] == 1'b0) &&(rsv_i[25]==1'b0)&& (fuc == 1'b1))
       dadisma   <= #TP 1'b1; 
    else if((rsvp_i==1'b1)&&((rsv_i[20]== 1'b1)||(rsv_i[28]== 1'b1)||(rsv_i[21]== 1'b1)))   
       dadisma   <= #TP 1'b1;   
    else if (rpsf_i == 1'b1)
       dadisma   <= #TP 1'b0; 
    end   
end
 
 reg      rvalid_d;
always @ ( posedge rx_clk or posedge srrfn )
begin
  if ( srrfn )  	 
    begin  
      rdata_d1   <= #TP 8'b0;
      rvalid_d   <= #TP 1'b0;
      rlast_d1   <= #TP 1'b0;
    end
  else if (clk_en)
    begin
      rdata_d1   <=  #TP rpd_o ;
      rvalid_d   <=  #TP rpdv_o;
      rlast_d1   <=  #TP rpef_o;
    end
end  


always @ ( posedge rx_clk or posedge srrfn )
begin
  if ( srrfn )  	 
    begin  
      rsvp_d1    <= #TP 1'b0;
    end
  else if (clk_en)
  begin
  if((rsv_i_d1[20] == 1'b1)|(rsv_i_d1[28] == 1'b1)|(dadisma == 1'b1))
      rsvp_d1    <=  #TP rsvp_i_d1;
  else   
      rsvp_d1    <=  #TP rpef_o;
  end      
end  

always @ ( posedge rx_clk or posedge srrfn )
begin
   if ( srrfn )  	 
       rsv_i_d2     <= #TP 33'b0;  
   else if (clk_en)
       rsv_i_d2     <=  #TP rsv_i_d1 ; 
end    

always @ ( posedge rx_clk or posedge srrfn )
begin
  if ( srrfn )  	 
       rsv_d1     <= #TP 33'b0;  
   else if (clk_en)
       rsv_d1     <=  #TP rsv_i_d2 ; 
end    

always @ ( posedge rx_clk or posedge srrfn )
begin
  if ( srrfn )  	 
    begin      
      rvalid_d1  <= #TP 1'b0;
    end
  else if (clk_en)
    begin
      rvalid_d1  <=  #TP rvalid_d; 
    end
end  
  

always @ ( posedge rx_clk or posedge srrfn ) begin
    if ( srrfn )
      wr_addr  <= #TP {WR_ADDR_WIDTH{1'b0}}; 
    else if (clk_en)
    begin
    if (rsvp_i_d1 & ((rsv_i[20] == 1'b1)|(rsv_i[28] == 1'b1)|(dadisma==1'b1)))
      wr_addr  <= #TP wr_ptr_sta;
    else if(rpdv_d)
      wr_addr  <= #TP wr_addr + 1'b1;
    end  
  end

always @ ( posedge rx_clk or posedge srrfn ) begin
    if ( srrfn )
      rd_addr  <= #TP {WR_ADDR_WIDTH{1'b0}}; 
    else if (clk_en)
    begin
    if(ram_read_e&!ram_rdata[8])
      rd_addr  <= #TP rd_addr + 1'b1;
    end  
  end

always @ ( posedge rx_clk or posedge srrfn ) begin
    if ( srrfn )           
        wr_ptr_sta <= #TP {WR_ADDR_WIDTH{1'b0}};
    else if (clk_en)
    begin
    if ( rpsf_i )           
        wr_ptr_sta <= #TP wr_addr;
    end       
  end
 
 reg[7:0] rpd_d;
 always @ ( posedge rx_clk or posedge srrfn ) begin
    if ( srrfn )           
           rpd_d <= #TP 8'b0;
    else if (clk_en)            
           rpd_d <= #TP rpd_i;
  end
 
 reg   rpef_d;
 always @ ( posedge rx_clk or posedge srrfn ) begin
    if ( srrfn )           
           rpef_d <= #TP 1'b0;
    else if (clk_en)            
           rpef_d <= #TP rpef_i;
  end
  

 always @ ( posedge rx_clk or posedge srrfn ) begin
    if ( srrfn )           
           rpdv_d <= #TP 1'b0;
    else if (clk_en)            
           rpdv_d <= #TP rpdv_i;
  end 
  
//abandon crc
always @ ( posedge rx_clk or posedge srrfn )
begin
  if ( srrfn )  	 
    begin  
      rdata_d2   <= #TP 8'b0;
      rvalid_d2  <= #TP 1'b0;
      rlast_d2   <= #TP 1'b0;
      rsv_d2     <= #TP 33'b0;        
      rsvp_d2    <= #TP 1'b0;
    end
  else if (clk_en)
    begin
     rdata_d2   <=  #TP rdata_d1  ;
     rvalid_d2  <=  #TP rvalid_d1 ;
     rlast_d2   <=  #TP rlast_d1  ;
     rsv_d2     <=  #TP rsv_d1    ; 
     rsvp_d2    <=  #TP rsvp_d1   ; 
    end
end  

always @ ( posedge rx_clk or posedge srrfn )
begin
  if ( srrfn )  	 
    begin  
      rdata_d3   <= #TP 8'b0;
      rvalid_d3  <= #TP 1'b0;
      rlast_d3   <= #TP 1'b0;
      rsv_d3     <= #TP 33'b0;        
      rsvp_d3    <= #TP 1'b0;
    end
  else if (clk_en)
    begin
     rdata_d3   <=  #TP rdata_d2  ;
     rvalid_d3  <=  #TP rvalid_d2 ;
     rlast_d3   <=  #TP rlast_d2  ;
     rsv_d3     <=  #TP rsv_d2    ; 
     rsvp_d3    <=  #TP rsvp_d2   ; 
    end
end  

always @ ( posedge rx_clk or posedge srrfn )
begin
  if ( srrfn )  	 
    begin  
      rdata_d4   <= #TP 8'b0;
      rvalid_d4  <= #TP 1'b0;
      rlast_d4   <= #TP 1'b0;
      rsv_d4     <= #TP 33'b0;        
      rsvp_d4    <= #TP 1'b0;
    end
  else if (clk_en)
    begin
     rdata_d4   <=  #TP rdata_d3  ;
     rvalid_d4  <=  #TP rvalid_d3 ;
     rlast_d4   <=  #TP rlast_d3  ;
     rsv_d4     <=  #TP rsv_d3    ; 
     rsvp_d4    <=  #TP rsvp_d3   ; 
    end
end    

always @ ( posedge rx_clk or posedge srrfn )
begin
  if ( srrfn )  	 
    begin  
      rdata_d5   <= #TP 8'b0;
      rvalid_d5  <= #TP 1'b0;
      rlast_d5   <= #TP 1'b0;
      rsv_d5     <= #TP 33'b0;        
      rsvp_d5    <= #TP 1'b0;
    end
  else if (clk_en)
    begin
     rdata_d5   <=  #TP rdata_d4  ;
     rvalid_d5  <=  #TP rvalid_d4 ;
     rlast_d5   <=  #TP rlast_d4  ;
     rsv_d5     <=  #TP rsv_d4    ; 
     rsvp_d5    <=  #TP rsvp_d4   ; 
    end
end  
 
always @ ( posedge rx_clk or posedge srrfn )
begin
  if ( srrfn )  	 
  begin  
      rdata   <= #TP 8'b0;
      rvalid  <= #TP 1'b0;
      rlast   <= #TP 1'b0;
      rsv     <= #TP 33'b0;        
      rsvp    <= #TP 1'b0;
  end
  else if (clk_en)
  begin
    	if(nfcs)
    	begin
    		   rdata   <=  #TP rdata_d5  ;
           rvalid  <=  #TP rvalid_d5&rvalid_d1 ;
           rlast  <=   #TP rlast_d1  ;
           rsv     <=  #TP rsv_d1    ; 
           rsvp    <=  #TP rsvp_d1   ; 
      end
    	else    	
      begin
           rdata   <=  #TP rdata_d5  ;
           rvalid  <=  #TP rvalid_d5 ;
           rlast   <=  #TP rlast_d5  ;
           rsv     <=  #TP rsv_d5    ; 
           rsvp    <=  #TP rsvp_d5   ; 
      end
   end
end    
// ---------------------------------------------
// FIFO Instantiation ------------------------------------------------
// ---------------------------------------------
assign ram_wdata={rpef_d,rpd_d};

PGL_SDPRAM_11 I_tsmac_data_ram_v1_1   
(
    .wr_data    (ram_wdata     ), //input write data
    .wr_addr    (wr_addr       ), //input write address
    .wr_en      (rpdv_d        ), //input write enable
    .wr_clk     (rx_clk        ), //input write clock
    .wr_rst     (srrfn         ), //input write reset
    .rd_data    (ram_rdata     ), //output read data
    .rd_addr    (rd_addr       ), //input read address
    .rd_clk     (rx_clk        ), //input read clock
    .rd_clk_en  (clk_en        ), //input read clock enable
    .rd_rst     (srrfn         )  //input read reset
    );

endmodule