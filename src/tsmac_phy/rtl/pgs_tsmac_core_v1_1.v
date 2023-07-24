//************************************************************************
//Copyright (c) 2015, PANGO MICROSYSTEMS,INC
//All Rights Reserved
//************************************************************************
`timescale 1ns / 1ns
// ***********************************************************************
// --- Module Definition
module pgs_tsmac_core_v1_1 #(
       parameter WR_ADDR_WIDTH =11  ,
       parameter SPEED_TYPE ="10/100/1000M_MAC"            
     )
(
  // --- Clock Inputs
input         tx_clki,                                 //MII Transmit Clock, Input 
input         tx_rst,                                  //Transmit Reset, Input
input         rx_clki,                                 //MII Receive Clock, Input  
input         rx_rst,                                  //Receive Reset, Input
input         txceni ,                                 //Transmit Clock Enable, Input
input         rxceni ,                                 //Receive Clock Enable, Input
// --- MII Inputs                                      
input         crs,                                     //MII Carrier Sense
input         col,                                     //MII Collision    
// --- MII Management Input                            
input         mdi,                                     //MII Management Data Input
output        mdc,                                     //MII Management Data Clock        
output        mdo,                                     //MII Management Data Output       
output        mdoen,                                   //MII Management Data Output Enable
// --- System Transmit Interface Inputs
input   [7:0] tdata,                                   //Transmit Packet Data          
input         tstart,                                  //Transmit Packet Start of Frame
input         tlast,                                   //Transmit Packet End of Frame  
// --- Transmit Flow Control Inputs
input         tcrq,                                    //Transmit (PAUSE) Control Request
input  [15:0] cfpt,                                    //Control Frame Parameter         
                                                      
input         thdf,                                    //Transmit Half Duplex Flow control
// --- MII Receive Inputs                              
input         rx_dv,                                   //G/MII Receive Data Valid
input   [7:0] rxd,                                     //G/MII Receive Data      
input         rx_er,                                   //G/MII Receive Error     
// --- System Transmit Interface Inputs 
// --- APB Interface       
input         presetn,                                 //APB Reset       
input         pclk,                                    //APB Clock       
input         pselx,                                   //APB Chip Of Select     
input         pwrite,                                  //APB Read / Write
input         penable,                                 //APB Enable     
input   [7:0] paddr,                                   //APB Address     
input  [31:0] pwdata,                                  //APB Data In 
output [31:0] prdata ,                                 //APB Data Outputs
// --- MII Transmit Outputs
output        tx_en,                                   //G/MII Transmit Enable
output  [7:0] txd,                                     //G/MII Transmit Data  
output        tx_er,                                   //G/MII Transmit Error 
// --- System Transmit Interface Outputs
output        tpnd,                                    //Transmit Packet Need Data    
output        tprt,                                    //Transmit Packet Retry 
output        tpar,                                    //Transmit Packet Abort / Ready       
output        tsvp,                                    //Transmit Statistics Vector Pulse
output [51:0] tsv,                                     //Transmit Statistics Vector                       
output        txcf,                                    //Transmitting Control Frame         
output        tcdr,                                    //Transmit Control Frame Done / Ready
// --- System Receive Interface Outputs                
output  [7:0] rdata,                                   //Receive Packet Data        
output        rvalid,                                  //Receive Packet Data Valid  
output        rlast,                                   //Receive Packet End of Frame
output        rsvp,                                    //Receive Statistics Vector Pulse 
output [32:0] rsv,                                     //Receive Statistics Vector                                                                              
// --- Mode of MAC 
output        speed,                                    //1:1000M ; 0:10/100M
output[63:0] packet_cnt   ,    
output[63:0] crc_err_cnt  
);
//-------------------------------------------------------
wire         rrst  ;
wire  [7:0]  rpd_i ;
wire         rpdv_i;
wire         rpsf_i;
wire         rpef_i; 
wire         rsvp_i;
wire  [32:0] rsv_i ;
wire  [8:0]  dahash;
wire         pwrt  ;
wire         psel  ;
wire  [31:0] hstodat1;
wire  [31:0] hstodat2;
wire         fbc    ; 
wire         fuc    ;
wire         fmc    ;
wire         nfcs   ;
wire[47:0]   dmac   ;
wire[47:0]   damac  ;

//wire[63:0] packet_cnt   ;    
//wire[63:0] crc_err_cnt  ;    
wire[63:0] pause_ctr_cnt;
wire[63:0] addr_err_cnt ;   
wire[63:0] len_err_cnt  ;    
wire[63:0] frame_trc_cnt;  
wire[63:0] ifg_sma_cnt  ;    
wire[63:0] bcad_cnt     ;       
wire[63:0] mcad_cnt     ;       
wire[63:0] ucad_cnt     ;   
                      
wire [8:0] hashv        ;
wire       hashe        ;  
wire      tx_clko;
wire      txceno ;
wire      rx_clko;
wire      rxceno ;  

wire      tpdr          ; 
wire      rptd          ;
wire      bcad          ;
wire      mcad          ;
wire      ucad          ;  
wire      trst          ;

wire       ppad         ;
wire       pcrc         ;
wire       phug         ;
wire       povr         ;

//---------------------------------------------------
pgs_tsmac_rx_sm_v1_1 #(
       .WR_ADDR_WIDTH   ( WR_ADDR_WIDTH   )     
)
U_pgs_tsmac_rx_sm_v1_1 
(
  .rpd_i      (rpd_i   ),               
  .rpdv_i     (rpdv_i  ),               
  .rpsf_i     (rpsf_i  ),               
  .rpef_i     (rpef_i  ),                             
  .rsvp_i     (rsvp_i  ),               
  .rsv_i      (rsv_i   ),               
  .rx_clk     (rx_clki ),
  .clk_en     (rxceni  ),               
  .dahash     (dahash  ),               
  .hashe      (hashe   ),               
  .hashv      (hashv   ),                             
  .damac      (damac   ),               
  .dmac       (dmac    ),               
  .fuc        (fuc     ),               
  .fmc        (fmc     ),               
  .fbc        (fbc     ), 
  .nfcs       (nfcs    ),              
  .srrfn      (rrst    ),               
  .rdata      (rdata   ),               
  .rvalid     (rvalid  ),                             
  .rlast      (rlast   ),                           
  .rsvp       (rsvp    ),              
  .rsv        (rsv     ),
                                        
  .packet_cnt   (packet_cnt   ),        
  .crc_err_cnt  (crc_err_cnt  ),        
  .pause_ctr_cnt(pause_ctr_cnt),        
  .addr_err_cnt (addr_err_cnt ),        
  .len_err_cnt  (len_err_cnt  ),        
  .frame_trc_cnt(frame_trc_cnt),        
  .ifg_sma_cnt  (ifg_sma_cnt  ),        
  .bcad_cnt     (bcad_cnt     ),        
  .mcad_cnt     (mcad_cnt     ),        
  .ucad_cnt     (ucad_cnt     )         
);
pgs_tsmac_apb_modify_v1_0 U_pgs_tsmac_apb_modify_v1_0
(
   .hstcsn(pselx),   .hstable(penable)    ,.hstwrn(pwrite) , 
   .pwrt(pwrt)  ,    .psel(psel)  
);

pgs_tsmac_apb_port_v1_0 U_pgs_tsmac_apb_port_v1_0
(
 .hstrst(presetn),   .hstclk(pclk),  .hstcsn(psel),   .hstwrn(pwrt),                                               
 .hstadx(paddr),   .hstidat(pwdata),.packet_cnt(packet_cnt   ),                                                    
 .crc_err_cnt  (crc_err_cnt  ),.pause_ctr_cnt(pause_ctr_cnt),.addr_err_cnt (addr_err_cnt ),                        
 .len_err_cnt  (len_err_cnt  ),.frame_trc_cnt(frame_trc_cnt),.ifg_sma_cnt  (ifg_sma_cnt  ),                        
 .bcad_cnt     (bcad_cnt     ),.mcad_cnt     (mcad_cnt     ),.ucad_cnt     (ucad_cnt     ),                        
 .hstodat(hstodat1),.fbc(fbc), .fuc(fuc),    .fmc(fmc),      .dmac(dmac),  .hstoe(),  
 .ppad       (ppad    ), 
 .pcrc       (pcrc    ), 
 .phug       (phug    ), 
 .povr       (povr    ), 
 .nfcs       (nfcs    ),                                            
 .dahash(dahash)                                                                                                   
);                                                                                                                 
assign prdata=(paddr[7:0]>=8'h12)?hstodat1:hstodat2;                


//----------------------------------------------------------
pe_mcxmac  #(
       .SPEED_TYPE      ( SPEED_TYPE      )     
     )
 U_pe_mcxmac                                                                                                    
(                                                                                                               
  .pre_ref(1'b0), .ref_clk(1'b0),.divref(1'b0),                                                                             
  .tx_clk(tx_clki),   .tx_clki(tx_clki),.txceni(txceni),.tx_rst(tx_rst),
  .rx_clk(rx_clki),   .rx_clki(rx_clki),.rxceni(rxceni),.rx_rst(rx_rst),
  .crs(crs),      .col(col),                                                                                            
  .mdi(mdi),                                                                                                            
  .tpd(tdata),       .tpsf(tstart),    .tpef(tlast),     .tpur(1'b0),                                                   
  .tctl(1'b0),       .tcrq(tcrq),      .cfpt(cfpt),      .cfep(16'h0000),                                               
  .thdf(thdf),                                                                                                          
  .rx_dv(rx_dv),     .rxd(rxd),        .rx_er(rx_er),                                                                   
  .ppad(ppad),       .pcrc(pcrc),      .phug(phug),      .povr(povr),                                                   
  .hstrst(presetn),  .hstclk(pclk),    .hstcsn(psel),    .hstwrn(pwrt),                                                 
  .hstadx(paddr),    .hstidat(pwdata),                                                                                  
  .mgtclk(pclk),	   .ssrr(5'b0),                                                                                       
  .rstbp(presetn),                                                                                                      
                                                                                                                        
  .tx_clko(tx_clko), .txceno(txceno),                                                                                              
  .rx_clko(rx_clko), .rxceno(rxceno),                                                                                              
  .tx_en(tx_en),     .txd(txd),        .tx_er(tx_er),                                                                   
  .mdc(mdc),         .mdo(mdo),        .mdoen(mdoen),                                                                   
  .tpnd(tpnd),       .tpdr(tpdr),      .tprt(tprt),      .tpar(tpar),                                                 
  .tpst(),                                                                                                              
  .tsvp(tsvp),       .tsv(tsv),        .txcf(txcf),      .tcdr(tcdr),                                                   
  .rpd(rpd_i),       .rpdv(rpdv_i),    .rpsf(rpsf_i),    .rpef(rpef_i),                                                 
  .rptd(rptd),       .rpst(),                                                                                           
  .rsvp(rsvp_i),     .rsv(rsv_i),                                                                                       
  .hashv(hashv),     .hashe(hashe),                                                                                     
  .bcad(bcad),       .mcad(mcad),      .ucad(ucad),      .damac(damac),                                                       
  .hstodat(hstodat2),.hstoe(),                                                                                          
  .tbimode(),		     .ghdmode(),	     .lhdmode(),		   .phymod(),                                                     
  .srstint_ref(),	   .srstint_tx(),	   .srstint_rx(),                                                                   
  .srtfn(),		 .srrfn(),		 .trst(trst),  .rrst(rrst),.speed(speed)                                                    
);                                                                                                              
                                                                                                                
endmodule