`timescale 1ns / 1ns

// ------------------------------------------------------------------------
// --- Module Description

// This module serves as the host processor interface.  An 8-bit address,
// 32-bit data interface is provided.  A chip select, in the form of a host
// request and a read/write direction are also inputs.  Outputs of this
// module include the 32-bit output data and the various configuration
// and control signals to the respective modules within the MAC.


// ------------------------------------------------------------------------
// --- Module Definition

module pgs_tsmac_apb_port_v1_0

(
  hstrst,  hstclk,  hstcsn,  hstwrn,
  hstadx,  hstidat, packet_cnt,
  crc_err_cnt,pause_ctr_cnt,addr_err_cnt ,
  len_err_cnt,frame_trc_cnt,ifg_sma_cnt  ,
  bcad_cnt   ,mcad_cnt     ,ucad_cnt     ,    

  hstoe,hstodat, dahash , 
  ppad,    pcrc,    phug,    povr,
  fbc,     fuc,     fmc,     nfcs,  dmac
);


// ------------------------------------------------------------------------
// --- Port Declarations

input         hstrst,  hstclk,  hstcsn,    hstwrn;
input   [7:0] hstadx;
input  [31:0] hstidat; 
input  [63:0] packet_cnt ;       //count the total number of frame                                                         
input  [63:0] crc_err_cnt;       //count the number of frame that is droped due to the crc error                           
input  [63:0] pause_ctr_cnt;     //count the number of pause control frame                                                 
input  [63:0] addr_err_cnt;      //count the number of frame that is droped due to the address error                       
input  [63:0] len_err_cnt;       //count the number of frame that is droped due to the length of frame error               
input  [63:0] frame_trc_cnt;     //count the number of frame that is truncated                                             
input  [63:0] ifg_sma_cnt;       //count the number of frame that is droped due to the small ifg                           
input  [63:0] bcad_cnt;          //count the number of frame that the destination address contained the broadcast address  
input  [63:0] mcad_cnt;          //count the number of frame that the destination address contained a multicast address    
input  [63:0] ucad_cnt;          //count the number of frame that the destination address contained a unicast address      

output [31:0] hstodat;
output		    hstoe;
output [8:0]  dahash;
output [47:0] dmac;
output        fbc ;
output        fuc;
output        fmc;
output        nfcs;
output        ppad,    pcrc,    phug,    povr;

wire   [31:0] hstodat;
reg    [8:0]  dahash;
reg    [47:0] dmac;
reg           fbc ;
reg           fuc;
reg           fmc; 
reg           nfcs;  
reg           ppad,    pcrc,    phug,    povr; 


// ------------------------------------------------------------------------
// --- Port Descriptions

// Inputs

// hstrst        ::= Host Reset
// hstclk        ::= Host Clock
// hstcsn        ::= Host Request
// hstwrn        ::= Host Read/Write
// hstadx[7:0]   ::= Host Address
// hstidat[31:0] ::= Host Data In

// Outputs

// hstodat[31:0] ::= Host Data Out


// ------------------------------------------------------------------------
// --- Parameter Declarations

parameter TP = 1;

// ------------------------------------------------------------------------
// --- Module Interconnection Signals

wire          lmac1,   emac1; 

wire          lmac2,   emac2;

wire          lmac3,   emac3;

wire          emac4; 

wire          emac5;

wire          emac6;

wire          emac7; 

wire          emac8;

wire          emac9  ;

wire          emac10 ;

wire          emac11 ;

wire          emac12 ;

wire          emac13 ;

wire          emac14 ;

wire          emac15 ;

wire          emac16 ;

wire          emac17 ;

wire          emac18 ;

wire          emac19 ;

wire          emac20 ;

wire          emac21 ;

wire          emac22 ;

wire          emac23 ;







// lmac1       ::= Load MAC Configuration #1 register
// emacc       ::= Enable MAC Configuration #1 register

// ------------------------------------------------------------------------
// --- Host Access Decode

// x00-x07

// lmac1 :: Load MAC Configuration #1 register

assign lmac1 = hstadx[7:0] == 8'h12 & ~hstwrn & ~hstcsn;

assign emac1 = hstadx[7:0] == 8'h12 &  hstwrn & ~hstcsn;

assign lmac2 = hstadx[7:0] == 8'h13 & ~hstwrn & ~hstcsn;

assign emac2 = hstadx[7:0] == 8'h13 &  hstwrn & ~hstcsn;

assign lmac3 = hstadx[7:0] == 8'h14 & ~hstwrn & ~hstcsn;

assign emac3 = hstadx[7:0] == 8'h14 &  hstwrn & ~hstcsn;

assign emac4 = hstadx[7:0] == 8'h15 &  hstwrn & ~hstcsn;

assign emac5 = hstadx[7:0] == 8'h16 &  hstwrn & ~hstcsn;

assign emac6 = hstadx[7:0] == 8'h17 &  hstwrn & ~hstcsn;

assign emac7 = hstadx[7:0] == 8'h18 &  hstwrn & ~hstcsn;

assign emac8 = hstadx[7:0] == 8'h19 &  hstwrn & ~hstcsn;

assign emac9 = hstadx[7:0] == 8'h1a &  hstwrn & ~hstcsn;

assign emac10 = hstadx[7:0] == 8'h1b &  hstwrn & ~hstcsn;

assign emac11 = hstadx[7:0] == 8'h1c &  hstwrn & ~hstcsn;

assign emac12 = hstadx[7:0] == 8'h1d &  hstwrn & ~hstcsn;

assign emac13 = hstadx[7:0] == 8'h1e &  hstwrn & ~hstcsn;

assign emac14 = hstadx[7:0] == 8'h1f &  hstwrn & ~hstcsn;

assign emac15 = hstadx[7:0] == 8'h20 &  hstwrn & ~hstcsn;

assign emac16 = hstadx[7:0] == 8'h21 &  hstwrn & ~hstcsn;

assign emac17 = hstadx[7:0] == 8'h22 &  hstwrn & ~hstcsn;

assign emac18 = hstadx[7:0] == 8'h23 &  hstwrn & ~hstcsn;

assign emac19 = hstadx[7:0] == 8'h24 &  hstwrn & ~hstcsn;

assign emac20 = hstadx[7:0] == 8'h25 &  hstwrn & ~hstcsn;

assign emac21 = hstadx[7:0] == 8'h26 &  hstwrn & ~hstcsn;

assign emac22 = hstadx[7:0] == 8'h27 &  hstwrn & ~hstcsn;

assign emac23 = hstadx[7:0] == 8'h28 &  hstwrn & ~hstcsn;


// ------------------------------------------------------------------------
// --- Host Registers

// ------------------------------------------------------------------------


always @ ( posedge hstclk or posedge hstrst )
begin
     if ( hstrst )   {nfcs,ppad, pcrc, phug, povr, fbc, fuc, fmc, dahash  } <= #TP { 17'h00080 };
                                                         
else if ( lmac1 )    {nfcs,ppad, pcrc, phug, povr, fbc, fuc, fmc, dahash  } <= #TP { hstidat[16:0]};
end

always @ ( posedge hstclk or posedge hstrst )
begin
     if ( hstrst )    { dmac[7:0],   dmac[15:8], 
                        dmac[23:16], dmac[31:24] } <= #TP { 32'b0 };
                                                         
else if ( lmac2 )    { dmac[7:0],   dmac[15:8], 
                       dmac[23:16], dmac[31:24] } <= #TP hstidat[31:0];
end

always @ ( posedge hstclk or posedge hstrst )
begin
     if ( hstrst )   { dmac[39:32], dmac[47:40] } <= #TP 16'h0;
                                                         
else if ( lmac3 )    { dmac[39:32], dmac[47:40] } <= #TP hstidat[31:16];
end

// ------------------------------------------------------------------------
// --- Host Data Output Multiplexer

assign hstoe = hstwrn & ~hstcsn;

assign hstodat[31:0] =

                   { 32 { emac1 } } & { 15'b0,nfcs,ppad, pcrc, phug, povr, fbc, fuc, fmc, dahash}     // adx -x00

                 | { 32 { emac2 } } & { dmac[31:0]  }     // adx -x00

                 | { 32 { emac3 } } & {dmac[39:32], dmac[47:40], 16'b0  }     // adx -x00    

                 | { 32 { emac4 } } & {crc_err_cnt[31:0]  }     // adx -x00    
                
                 | { 32 { emac5 } } & {crc_err_cnt[63:32]  }     // adx -x00 
                 
                 | { 32 { emac6 } } & {packet_cnt[31:0]  }     // adx -x00    
                
                 | { 32 { emac7 } } & {packet_cnt[63:32]  }     // adx -x00 
                  
                 | { 32 { emac8 } } & {addr_err_cnt [31:0 ]  }     // adx -x00    
                 | { 32 { emac9 } } & {addr_err_cnt [63:32]  }     // adx -x00                    
                 | { 32 { emac10 } } & {pause_ctr_cnt[31:0 ]  }     // adx -x00                  
                 | { 32 { emac11 } } & {pause_ctr_cnt[63:32]  }     // adx -x00                                                                     
                 | { 32 { emac12 } } & {frame_trc_cnt[31:0 ]}     // adx -x00    
                 | { 32 { emac13 } } & {frame_trc_cnt[63:32]}     // adx -x00 
                 | { 32 { emac14 } } & {  len_err_cnt[31:0 ]}     // adx -x00 
                 | { 32 { emac15 } } & {  len_err_cnt[63:32]}     // adx -x00                     
                 | { 32 { emac16 } } & { ifg_sma_cnt[31:0 ] }     // adx -x00                      
                 | { 32 { emac17 } } & { ifg_sma_cnt[63:32] }     // adx -x00 
                 | { 32 { emac18 } } & { bcad_cnt[31:0 ]}     // adx -x00 
                 | { 32 { emac19 } } & { bcad_cnt[63:32]}     // adx -x00                 
                 | { 32 { emac20 } } & { ucad_cnt[31:0 ]}     // adx -x00      
                 | { 32 { emac21 } } & { ucad_cnt[63:32]}     // adx -x00 
                 | { 32 { emac22 } } & { mcad_cnt[31:0 ]}     // adx -x00  
                 | { 32 { emac23 } } & { mcad_cnt[63:32]};     // adx -x00                                                                                                          
endmodule                     
                              
