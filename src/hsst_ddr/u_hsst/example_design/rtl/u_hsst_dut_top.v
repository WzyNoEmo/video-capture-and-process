// Created by IP Generator (Version 2022.1 build 99559)


///////////////////////////////////////////////////////////////////////////////
//
// Copyright (c) 2019 PANGO MICROSYSTEMS, INC
// ALL RIGHTS REVERVED.
//
// THE SOURCE CODE CONTAINED HEREIN IS PROPRIETARY TO PANGO MICROSYSTEMS, INC.
// IT SHALL NOT BE REPRODUCED OR DISCLOSED IN WHOLE OR IN PART OR USED BY
// PARTIES WITHOUT WRITTEN AUTHORIZATION FROM THE OWNER.
//
///////////////////////////////////////////////////////////////////////////////
//
// Library:
// Filename:
///////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100fs

module u_hsst_dut_top (
    
    input          i_free_clk                    ,
    input          i_pll_rst_0                   ,
    input          i_wtchdg_clr_0                ,
    output [1:0]   o_wtchdg_st_0                 ,
    output         o_pll_done_0                  ,
    output         o_txlane_done_2               ,
    output         o_txlane_done_3               ,
    output         o_rxlane_done_2               ,
    output         o_rxlane_done_3               ,
    input          i_p_refckn_0                  ,
    input          i_p_refckp_0                  ,
    output         o_p_pll_lock_0                ,
    output         o_p_rx_sigdet_sta_2           ,
    output         o_p_rx_sigdet_sta_3           ,
    output         o_p_lx_cdr_align_2            ,
    output         o_p_lx_cdr_align_3            ,
    output         o_p_pcs_lsm_synced_2          ,
    output         o_p_pcs_lsm_synced_3          ,
    input          i_p_l2rxn                     ,
    input          i_p_l2rxp                     ,
    input          i_p_l3rxn                     ,
    input          i_p_l3rxp                     ,
    output         o_p_l2txn                     ,
    output         o_p_l2txp                     ,
    output         o_p_l3txn                     ,
    output         o_p_l3txp                     ,
    output [2:0]   o_rxstatus_2                  ,
    output [2:0]   o_rxstatus_3                  ,
    output [3:0]   o_rdisper_2                   ,
    output [3:0]   o_rdecer_2                    ,
    output [3:0]   o_rdisper_3                   ,
    output [3:0]   o_rdecer_3                    , 
    input          src_rst                       ,
    input          chk_rst                       ,
    output [3:0]   o_pl_err                      
);


// ********************* UI parameters *********************
localparam CH0_PROTOCOL = "CUSTOMERIZEDx1";
localparam CH1_PROTOCOL = "CUSTOMERIZEDx1";
localparam CH2_PROTOCOL = "CUSTOMERIZEDx2";
localparam CH3_PROTOCOL = "CUSTOMERIZEDx2";
localparam CH0_RXPCS_CTC = "Bypassed";
localparam CH1_RXPCS_CTC = "Bypassed";
localparam CH2_RXPCS_CTC = "GE";
localparam CH3_RXPCS_CTC = "GE";
localparam PLL0_REF_FRQ = 125.0;
localparam PLL1_REF_FRQ = 125.0;
 localparam TD_8BIT_ONLY_0 = "FALSE"; 
 localparam TD_10BIT_ONLY_0 = "FALSE"; 
 localparam TD_8B10B_8BIT_0 = "FALSE"; 
 localparam TD_16BIT_ONLY_0 = "FALSE"; 
 localparam TD_20BIT_ONLY_0 = "FALSE"; 
 localparam TD_8B10B_16BIT_0 = "FALSE"; 
 localparam TD_32BIT_ONLY_0 = "FALSE"; 
 localparam TD_40BIT_ONLY_0 = "FALSE"; 
 localparam TD_8B10B_32BIT_0 = "FALSE"; 
 localparam TD_64B66B_16BIT_0 = "FALSE"; 
 localparam TD_64B66B_32BIT_0 = "FALSE"; 
 localparam TD_64B67B_16BIT_0 = "FALSE"; 
 localparam TD_64B67B_32BIT_0 = "FALSE"; 
 localparam TD_8BIT_ONLY_1 = "FALSE"; 
 localparam TD_10BIT_ONLY_1 = "FALSE"; 
 localparam TD_8B10B_8BIT_1 = "FALSE"; 
 localparam TD_16BIT_ONLY_1 = "FALSE"; 
 localparam TD_20BIT_ONLY_1 = "FALSE"; 
 localparam TD_8B10B_16BIT_1 = "FALSE"; 
 localparam TD_32BIT_ONLY_1 = "FALSE"; 
 localparam TD_40BIT_ONLY_1 = "FALSE"; 
 localparam TD_8B10B_32BIT_1 = "FALSE"; 
 localparam TD_64B66B_16BIT_1 = "FALSE"; 
 localparam TD_64B66B_32BIT_1 = "FALSE"; 
 localparam TD_64B67B_16BIT_1 = "FALSE"; 
 localparam TD_64B67B_32BIT_1 = "FALSE"; 
 localparam TD_8BIT_ONLY_2 = "FALSE"; 
 localparam TD_10BIT_ONLY_2 = "FALSE"; 
 localparam TD_8B10B_8BIT_2 = "FALSE"; 
 localparam TD_16BIT_ONLY_2 = "FALSE"; 
 localparam TD_20BIT_ONLY_2 = "FALSE"; 
 localparam TD_8B10B_16BIT_2 = "FALSE"; 
 localparam TD_32BIT_ONLY_2 = "FALSE"; 
 localparam TD_40BIT_ONLY_2 = "FALSE"; 
 localparam TD_8B10B_32BIT_2 = "TRUE"; 
 localparam TD_64B66B_16BIT_2 = "FALSE"; 
 localparam TD_64B66B_32BIT_2 = "FALSE"; 
 localparam TD_64B67B_16BIT_2 = "FALSE"; 
 localparam TD_64B67B_32BIT_2 = "FALSE"; 
 localparam TD_8BIT_ONLY_3 = "FALSE"; 
 localparam TD_10BIT_ONLY_3 = "FALSE"; 
 localparam TD_8B10B_8BIT_3 = "FALSE"; 
 localparam TD_16BIT_ONLY_3 = "FALSE"; 
 localparam TD_20BIT_ONLY_3 = "FALSE"; 
 localparam TD_8B10B_16BIT_3 = "FALSE"; 
 localparam TD_32BIT_ONLY_3 = "FALSE"; 
 localparam TD_40BIT_ONLY_3 = "FALSE"; 
 localparam TD_8B10B_32BIT_3 = "TRUE"; 
 localparam TD_64B66B_16BIT_3 = "FALSE"; 
 localparam TD_64B66B_32BIT_3 = "FALSE"; 
 localparam TD_64B67B_16BIT_3 = "FALSE"; 
 localparam TD_64B67B_32BIT_3 = "FALSE"; 
 localparam RD_8BIT_ONLY_0 = "FALSE"; 
 localparam RD_10BIT_ONLY_0 = "FALSE"; 
 localparam RD_8B10B_8BIT_0 = "FALSE"; 
 localparam RD_16BIT_ONLY_0 = "FALSE"; 
 localparam RD_20BIT_ONLY_0 = "FALSE"; 
 localparam RD_8B10B_16BIT_0 = "FALSE"; 
 localparam RD_32BIT_ONLY_0 = "FALSE"; 
 localparam RD_40BIT_ONLY_0 = "FALSE"; 
 localparam RD_8B10B_32BIT_0 = "FALSE"; 
 localparam RD_64B66B_16BIT_0 = "FALSE"; 
 localparam RD_64B66B_32BIT_0 = "FALSE"; 
 localparam RD_64B67B_16BIT_0 = "FALSE"; 
 localparam RD_64B67B_32BIT_0 = "FALSE"; 
 localparam RD_8BIT_ONLY_1 = "FALSE"; 
 localparam RD_10BIT_ONLY_1 = "FALSE"; 
 localparam RD_8B10B_8BIT_1 = "FALSE"; 
 localparam RD_16BIT_ONLY_1 = "FALSE"; 
 localparam RD_20BIT_ONLY_1 = "FALSE"; 
 localparam RD_8B10B_16BIT_1 = "FALSE"; 
 localparam RD_32BIT_ONLY_1 = "FALSE"; 
 localparam RD_40BIT_ONLY_1 = "FALSE"; 
 localparam RD_8B10B_32BIT_1 = "FALSE"; 
 localparam RD_64B66B_16BIT_1 = "FALSE"; 
 localparam RD_64B66B_32BIT_1 = "FALSE"; 
 localparam RD_64B67B_16BIT_1 = "FALSE"; 
 localparam RD_64B67B_32BIT_1 = "FALSE"; 
 localparam RD_8BIT_ONLY_2 = "FALSE"; 
 localparam RD_10BIT_ONLY_2 = "FALSE"; 
 localparam RD_8B10B_8BIT_2 = "FALSE"; 
 localparam RD_16BIT_ONLY_2 = "FALSE"; 
 localparam RD_20BIT_ONLY_2 = "FALSE"; 
 localparam RD_8B10B_16BIT_2 = "FALSE"; 
 localparam RD_32BIT_ONLY_2 = "FALSE"; 
 localparam RD_40BIT_ONLY_2 = "FALSE"; 
 localparam RD_8B10B_32BIT_2 = "TRUE"; 
 localparam RD_64B66B_16BIT_2 = "FALSE"; 
 localparam RD_64B66B_32BIT_2 = "FALSE"; 
 localparam RD_64B67B_16BIT_2 = "FALSE"; 
 localparam RD_64B67B_32BIT_2 = "FALSE"; 
 localparam RD_8BIT_ONLY_3 = "FALSE"; 
 localparam RD_10BIT_ONLY_3 = "FALSE"; 
 localparam RD_8B10B_8BIT_3 = "FALSE"; 
 localparam RD_16BIT_ONLY_3 = "FALSE"; 
 localparam RD_20BIT_ONLY_3 = "FALSE"; 
 localparam RD_8B10B_16BIT_3 = "FALSE"; 
 localparam RD_32BIT_ONLY_3 = "FALSE"; 
 localparam RD_40BIT_ONLY_3 = "FALSE"; 
 localparam RD_8B10B_32BIT_3 = "TRUE"; 
 localparam RD_64B66B_16BIT_3 = "FALSE"; 
 localparam RD_64B66B_32BIT_3 = "FALSE"; 
 localparam RD_64B67B_16BIT_3 = "FALSE"; 
 localparam RD_64B67B_32BIT_3 = "FALSE"; 

// ********************* DUT *********************

assign         o_txlane_done_0               =0; // 
assign         o_txlane_done_1               =0; // 
assign         o_tx_ckdiv_done_0             =0; // 
assign         o_tx_ckdiv_done_1             =0; // 
assign         o_tx_ckdiv_done_2             =0; // 
assign         o_tx_ckdiv_done_3             =0; // 
assign         o_rxlane_done_0               =0; // 
assign         o_rxlane_done_1               =0; // 
assign         o_rx_ckdiv_done_0              =0; // 
assign         o_rx_ckdiv_done_1              =0; // 
assign         o_rx_ckdiv_done_2              =0; // 
assign         o_rx_ckdiv_done_3              =0; // 
assign         o_p_rx_sigdet_sta_0           =0; // 
assign         o_p_rx_sigdet_sta_1           =0; // 
assign         o_p_lx_cdr_align_0            =0; // 
assign         o_p_lx_cdr_align_1            =0; // 
assign         o_p_pcs_lsm_synced_0          =0; // 
assign         o_p_pcs_lsm_synced_1          =0; // 
assign         o_p_pcs_rx_mcb_status_0       =0; // 
assign         o_p_pcs_rx_mcb_status_1       =0; // 
assign         o_p_pcs_rx_mcb_status_2       =0; // 
assign         o_p_pcs_rx_mcb_status_3       =0; //  
wire           i_pll_lock_tx_0               = 1'b1;
wire           i_pll_lock_tx_1               = 1'b1;
wire           i_pll_lock_tx_2               = 1'b1;
wire           i_pll_lock_tx_3               = 1'b1;
wire           i_pll_lock_rx_0               = 1'b1;
wire           i_pll_lock_rx_1               = 1'b1;
wire           i_pll_lock_rx_2               = 1'b1;
wire           i_pll_lock_rx_3               = 1'b1;

wire           o_p_clk2core_tx_0             =1'b0;
wire           o_p_clk2core_tx_1             =1'b0;
wire           o_p_clk2core_tx_2             ;
wire           o_p_clk2core_tx_3             =1'b0;
wire           i_p_tx0_clk_fr_core           ;
wire           i_p_tx1_clk_fr_core           ;
wire           i_p_tx2_clk_fr_core           ;
wire           i_p_tx3_clk_fr_core           ;
wire           i_p_tx0_clk2_fr_core          ;
wire           i_p_tx1_clk2_fr_core          ;
wire           i_p_tx2_clk2_fr_core          ;
wire           i_p_tx3_clk2_fr_core          ;

wire           o_p_clk2core_rx_0             =1'b0;
wire           o_p_clk2core_rx_1             =1'b0;
wire           o_p_clk2core_rx_2             =1'b0;
wire           o_p_clk2core_rx_3             =1'b0;
wire           i_p_clk2core_rx_0             ;
wire           i_p_clk2core_rx_1             ;
wire           i_p_clk2core_rx_2             ;
wire           i_p_clk2core_rx_3             ;
wire           i_p_rx0_clk_fr_core           ;
wire           i_p_rx1_clk_fr_core           ;
wire           i_p_rx2_clk_fr_core           ;
wire           i_p_rx3_clk_fr_core           ;
wire           i_p_rx0_clk2_fr_core          ;
wire           i_p_rx1_clk2_fr_core          ;
wire           i_p_rx2_clk2_fr_core          ;
wire           i_p_rx3_clk2_fr_core          ;

wire   [31:0]  i_txd_2                       ;
wire   [3:0]   i_tdispsel_2                  ;
wire   [3:0]   i_tdispctrl_2                 ;
wire   [3:0]   i_txk_2                       ;
wire   [31:0]  i_txd_3                       ;
wire   [3:0]   i_tdispsel_3                  ;
wire   [3:0]   i_tdispctrl_3                 ;
wire   [3:0]   i_txk_3                       ;
//fabric clock
generate
    if((CH0_PROTOCOL=="XAUI")||(CH0_PROTOCOL=="PCIEx4")||(CH0_PROTOCOL=="CUSTOMERIZEDx4")) begin : BONDING_LANE0123
        assign          i_p_tx0_clk_fr_core           = o_p_clk2core_tx_0; 
        assign          i_p_tx1_clk_fr_core           = o_p_clk2core_tx_0; 
        assign          i_p_tx2_clk_fr_core           = o_p_clk2core_tx_0; 
        assign          i_p_tx3_clk_fr_core           = o_p_clk2core_tx_0; 
        assign          i_p_rx0_clk_fr_core           = (CH0_RXPCS_CTC=="Bypassed") ? o_p_clk2core_rx_0 : o_p_clk2core_tx_0;
        assign          i_p_rx1_clk_fr_core           = (CH1_RXPCS_CTC=="Bypassed") ? o_p_clk2core_rx_0 : o_p_clk2core_tx_0;
        assign          i_p_rx2_clk_fr_core           = (CH2_RXPCS_CTC=="Bypassed") ? o_p_clk2core_rx_0 : o_p_clk2core_tx_0;
        assign          i_p_rx3_clk_fr_core           = (CH3_RXPCS_CTC=="Bypassed") ? o_p_clk2core_rx_0 : o_p_clk2core_tx_0;
    end
    else if((CH0_PROTOCOL=="CUSTOMERIZEDx2" || CH0_PROTOCOL=="PCIEx2") && (CH2_PROTOCOL!="CUSTOMERIZEDx2" && CH2_PROTOCOL!="PCIEx2"))begin : BONDING_LANE01
        assign          i_p_tx0_clk_fr_core           = o_p_clk2core_tx_0; 
        assign          i_p_tx1_clk_fr_core           = o_p_clk2core_tx_0; 
        assign          i_p_tx2_clk_fr_core           = o_p_clk2core_tx_2; 
        assign          i_p_tx3_clk_fr_core           = o_p_clk2core_tx_3; 
        assign          i_p_rx0_clk_fr_core           = (CH0_RXPCS_CTC=="Bypassed") ? o_p_clk2core_rx_0 : o_p_clk2core_tx_0;
        assign          i_p_rx1_clk_fr_core           = (CH1_RXPCS_CTC=="Bypassed") ? o_p_clk2core_rx_0 : o_p_clk2core_tx_0;
        assign          i_p_rx2_clk_fr_core           = (CH2_RXPCS_CTC=="Bypassed") ? o_p_clk2core_rx_2 : o_p_clk2core_tx_2;
        assign          i_p_rx3_clk_fr_core           = (CH3_RXPCS_CTC=="Bypassed") ? o_p_clk2core_rx_3 : o_p_clk2core_tx_3;
    end
    else if((CH0_PROTOCOL!="CUSTOMERIZEDx2" && CH0_PROTOCOL!="PCIEx2") && (CH2_PROTOCOL=="CUSTOMERIZEDx2" || CH2_PROTOCOL=="PCIEx2")) begin : BONDING_LANE23
        assign          i_p_tx0_clk_fr_core           = o_p_clk2core_tx_0; 
        assign          i_p_tx1_clk_fr_core           = o_p_clk2core_tx_1; 
        assign          i_p_tx2_clk_fr_core           = o_p_clk2core_tx_2; 
        assign          i_p_tx3_clk_fr_core           = o_p_clk2core_tx_2; 
        assign          i_p_rx0_clk_fr_core           = (CH0_RXPCS_CTC=="Bypassed") ? o_p_clk2core_rx_0 : o_p_clk2core_tx_0;
        assign          i_p_rx1_clk_fr_core           = (CH1_RXPCS_CTC=="Bypassed") ? o_p_clk2core_rx_1 : o_p_clk2core_tx_1;
        assign          i_p_rx2_clk_fr_core           = (CH2_RXPCS_CTC=="Bypassed") ? o_p_clk2core_rx_2 : o_p_clk2core_tx_2;
        assign          i_p_rx3_clk_fr_core           = (CH3_RXPCS_CTC=="Bypassed") ? o_p_clk2core_rx_2 : o_p_clk2core_tx_2;
    end
    else if((CH0_PROTOCOL=="CUSTOMERIZEDx2" || CH0_PROTOCOL=="PCIEx2") && (CH2_PROTOCOL=="CUSTOMERIZEDx2" || CH2_PROTOCOL=="PCIEx2")) begin : BONDING_LANE01_23
        assign          i_p_tx0_clk_fr_core           = o_p_clk2core_tx_0; 
        assign          i_p_tx1_clk_fr_core           = o_p_clk2core_tx_0; 
        assign          i_p_tx2_clk_fr_core           = o_p_clk2core_tx_2; 
        assign          i_p_tx3_clk_fr_core           = o_p_clk2core_tx_2; 
        assign          i_p_rx0_clk_fr_core           = (CH0_RXPCS_CTC=="Bypassed") ? o_p_clk2core_rx_0 : o_p_clk2core_tx_0;
        assign          i_p_rx1_clk_fr_core           = (CH1_RXPCS_CTC=="Bypassed") ? o_p_clk2core_rx_0 : o_p_clk2core_tx_0;
        assign          i_p_rx2_clk_fr_core           = (CH2_RXPCS_CTC=="Bypassed") ? o_p_clk2core_rx_2 : o_p_clk2core_tx_2;
        assign          i_p_rx3_clk_fr_core           = (CH3_RXPCS_CTC=="Bypassed") ? o_p_clk2core_rx_2 : o_p_clk2core_tx_2;
    end
    else begin : NO_BONDING
        assign          i_p_tx0_clk_fr_core           = o_p_clk2core_tx_0; 
        assign          i_p_tx1_clk_fr_core           = o_p_clk2core_tx_1; 
        assign          i_p_tx2_clk_fr_core           = o_p_clk2core_tx_2; 
        assign          i_p_tx3_clk_fr_core           = o_p_clk2core_tx_3; 
        assign          i_p_rx0_clk_fr_core           = (CH0_RXPCS_CTC=="Bypassed") ? o_p_clk2core_rx_0 : o_p_clk2core_tx_0;
        assign          i_p_rx1_clk_fr_core           = (CH1_RXPCS_CTC=="Bypassed") ? o_p_clk2core_rx_1 : o_p_clk2core_tx_1;
        assign          i_p_rx2_clk_fr_core           = (CH2_RXPCS_CTC=="Bypassed") ? o_p_clk2core_rx_2 : o_p_clk2core_tx_2;
        assign          i_p_rx3_clk_fr_core           = (CH3_RXPCS_CTC=="Bypassed") ? o_p_clk2core_rx_3 : o_p_clk2core_tx_3;
    end
endgenerate

generate
    if(CH0_PROTOCOL=="PCIEx4") begin : PCIEx4
        assign          i_p_rx0_clk2_fr_core           = o_p_clk2core_rx_0;
        assign          i_p_rx1_clk2_fr_core           = o_p_clk2core_rx_0;
        assign          i_p_rx2_clk2_fr_core           = o_p_clk2core_rx_0;
        assign          i_p_rx3_clk2_fr_core           = o_p_clk2core_rx_0;
    end
    else if(CH0_PROTOCOL=="PCIEx2" && CH2_PROTOCOL!="PCIEx2")begin : PCIEx2_01
        assign          i_p_rx0_clk2_fr_core           = o_p_clk2core_rx_0;
        assign          i_p_rx1_clk2_fr_core           = o_p_clk2core_rx_0;
        assign          i_p_rx2_clk2_fr_core           = 1'b0;
        assign          i_p_rx3_clk2_fr_core           = 1'b0;
    end
    else if(CH0_PROTOCOL!="PCIEx2" && CH2_PROTOCOL=="PCIEx2") begin : PCIEx2_23
        assign          i_p_rx0_clk2_fr_core           = 1'b0;
        assign          i_p_rx1_clk2_fr_core           = 1'b0;
        assign          i_p_rx2_clk2_fr_core           = o_p_clk2core_rx_2;
        assign          i_p_rx3_clk2_fr_core           = o_p_clk2core_rx_2;
    end
    else if(CH0_PROTOCOL=="PCIEx2" && CH2_PROTOCOL=="PCIEx2") begin : PCIEx2_01_23
        assign          i_p_rx0_clk2_fr_core           = o_p_clk2core_rx_0;
        assign          i_p_rx1_clk2_fr_core           = o_p_clk2core_rx_0;
        assign          i_p_rx2_clk2_fr_core           = o_p_clk2core_rx_2;
        assign          i_p_rx3_clk2_fr_core           = o_p_clk2core_rx_2;
    end
    else begin : NO_PCIEx2x4 
        assign          i_p_rx0_clk2_fr_core           = o_p_clk2core_rx_0;
        assign          i_p_rx1_clk2_fr_core           = o_p_clk2core_rx_1;
        assign          i_p_rx2_clk2_fr_core           = o_p_clk2core_rx_2;
        assign          i_p_rx3_clk2_fr_core           = o_p_clk2core_rx_3;
    end
endgenerate

assign i_p_tx0_clk2_fr_core = i_p_rx0_clk2_fr_core;
assign i_p_tx1_clk2_fr_core = i_p_rx1_clk2_fr_core;
assign i_p_tx2_clk2_fr_core = i_p_rx2_clk2_fr_core;
assign i_p_tx3_clk2_fr_core = i_p_rx3_clk2_fr_core;



//Checker
wire  [39:0] o_rxd_0                       ; // output [39:0]
wire  [3:0]  o_rxk_0                       ; // output [3:0]
wire         o_rxd_vld_0                   ; // output         
wire  [2:0]  o_rxh_0                       ; // output [2:0]   
wire         o_rxh_vld_0                   ; // output         
wire         o_rxq_start_0                 ; // output         
wire  [39:0] o_rxd_1                       ; // output [39:0]
wire  [3:0]  o_rxk_1                       ; // output [3:0]
wire         o_rxd_vld_1                   ; // output         
wire  [2:0]  o_rxh_1                       ; // output [2:0]   
wire         o_rxh_vld_1                   ; // output         
wire         o_rxq_start_1                 ; // output         
wire  [39:0] o_rxd_2                       ; // output [39:0]
wire  [3:0]  o_rxk_2                       ; // output [3:0]
wire         o_rxd_vld_2                   ; // output         
wire  [2:0]  o_rxh_2                       ; // output [2:0]   
wire         o_rxh_vld_2                   ; // output         
wire         o_rxq_start_2                 ; // output         
wire  [39:0] o_rxd_3                       ; // output [39:0]
wire  [3:0]  o_rxk_3                       ; // output [3:0]
wire         o_rxd_vld_3                   ; // output         
wire  [2:0]  o_rxh_3                       ; // output [2:0]   
wire         o_rxh_vld_3                   ; // output         
wire         o_rxq_start_3                 ; // output         
wire         o_p_rxgear_slip_0             ; 
wire         o_p_rxgear_slip_1             ; 
wire         o_p_rxgear_slip_2             ; 
wire         o_p_rxgear_slip_3             ; 

u_hsst U_INST (
    
    .i_free_clk                    (i_free_clk                    ), // input          
    .i_wtchdg_clr_0                (i_wtchdg_clr_0                ), // input          
    .o_wtchdg_st_0                 (o_wtchdg_st_0                 ), // output [1:0]   
    .o_pll_done_0                  (o_pll_done_0                  ), // output         
    .o_txlane_done_2               (o_txlane_done_2               ), // output         
    .o_txlane_done_3               (o_txlane_done_3               ), // output         
    .o_rxlane_done_2               (o_rxlane_done_2               ), // output         
    .o_rxlane_done_3               (o_rxlane_done_3               ), // output         
    .i_p_refckn_0                  (i_p_refckn_0                  ), // input          
    .i_p_refckp_0                  (i_p_refckp_0                  ), // input          
    .o_p_clk2core_tx_2             (o_p_clk2core_tx_2             ), // output         
    .i_p_tx2_clk_fr_core           (i_p_tx2_clk_fr_core           ), // input          
    .i_p_tx3_clk_fr_core           (i_p_tx3_clk_fr_core           ), // input          
    .i_p_rx2_clk_fr_core           (i_p_rx2_clk_fr_core           ), // input          
    .i_p_rx3_clk_fr_core           (i_p_rx3_clk_fr_core           ), // input          
    .o_p_pll_lock_0                (o_p_pll_lock_0                ), // output         
    .o_p_rx_sigdet_sta_2           (o_p_rx_sigdet_sta_2           ), // output         
    .o_p_rx_sigdet_sta_3           (o_p_rx_sigdet_sta_3           ), // output         
    .o_p_lx_cdr_align_2            (o_p_lx_cdr_align_2            ), // output         
    .o_p_lx_cdr_align_3            (o_p_lx_cdr_align_3            ), // output         
    .o_p_pcs_lsm_synced_2          (o_p_pcs_lsm_synced_2          ), // output         
    .o_p_pcs_lsm_synced_3          (o_p_pcs_lsm_synced_3          ), // output         
    .i_p_l2rxn                     (i_p_l2rxn                     ), // input          
    .i_p_l2rxp                     (i_p_l2rxp                     ), // input          
    .i_p_l3rxn                     (i_p_l3rxn                     ), // input          
    .i_p_l3rxp                     (i_p_l3rxp                     ), // input          
    .o_p_l2txn                     (o_p_l2txn                     ), // output         
    .o_p_l2txp                     (o_p_l2txp                     ), // output         
    .o_p_l3txn                     (o_p_l3txn                     ), // output         
    .o_p_l3txp                     (o_p_l3txp                     ), // output         
    .i_txd_2                       (i_txd_2                       ), // input  [31:0]  
    .i_tdispsel_2                  (i_tdispsel_2                  ), // input  [3:0]   
    .i_tdispctrl_2                 (i_tdispctrl_2                 ), // input  [3:0]   
    .i_txk_2                       (i_txk_2                       ), // input  [3:0]   
    .i_txd_3                       (i_txd_3                       ), // input  [31:0]  
    .i_tdispsel_3                  (i_tdispsel_3                  ), // input  [3:0]   
    .i_tdispctrl_3                 (i_tdispctrl_3                 ), // input  [3:0]   
    .i_txk_3                       (i_txk_3                       ), // input  [3:0]   
    .o_rxstatus_2                  (o_rxstatus_2[2:0]             ), // output [2:0]   
    .o_rxd_2                       (o_rxd_2[31:0]                 ), // output [31:0]  
    .o_rdisper_2                   (o_rdisper_2[3:0]              ), // output [3:0]   
    .o_rdecer_2                    (o_rdecer_2[3:0]               ), // output [3:0]   
    .o_rxk_2                       (o_rxk_2[3:0]                  ), // output [3:0]   
    .o_rxstatus_3                  (o_rxstatus_3[2:0]             ), // output [2:0]   
    .o_rxd_3                       (o_rxd_3[31:0]                 ), // output [31:0]  
    .o_rdisper_3                   (o_rdisper_3[3:0]              ), // output [3:0]   
    .o_rdecer_3                    (o_rdecer_3[3:0]               ), // output [3:0]   
    .o_rxk_3                       (o_rxk_3[3:0]                  ), // output [3:0]   
    .i_pll_rst_0                   (i_pll_rst_0                   )  // input  
);


// ********************* Source of DUT *********************

wire           i_src_clk0                    ;
wire           i_src_clk1                    ;
wire           i_src_clk2                    ;
wire           i_src_clk3                    ;
wire           i_src_rstn                    = ~src_rst;
wire   [39:0]  o_txd_0                       ;
wire   [3:0]   o_txk_0                       ;
wire   [6:0]   o_txq_0                       ;
wire   [2:0]   o_txh_0                       ;
wire   [39:0]  o_txd_1                       ;
wire   [3:0]   o_txk_1                       ;
wire   [6:0]   o_txq_1                       ;
wire   [2:0]   o_txh_1                       ;
wire   [39:0]  o_txd_2                       ;
wire   [3:0]   o_txk_2                       ;
wire   [6:0]   o_txq_2                       ;
wire   [2:0]   o_txh_2                       ;
wire   [39:0]  o_txd_3                       ;
wire   [3:0]   o_txk_3                       ;
wire   [6:0]   o_txq_3                       ;
wire   [2:0]   o_txh_3                       ;

assign i_src_clk2 = i_p_tx2_clk_fr_core        ; 
assign i_src_clk3 = i_p_tx3_clk_fr_core        ; u_hsst_src #(
    .TD_8BIT_ONLY_0   (TD_8BIT_ONLY_0   ), 
    .TD_10BIT_ONLY_0  (TD_10BIT_ONLY_0  ), 
    .TD_8B10B_8BIT_0  (TD_8B10B_8BIT_0  ), 
    .TD_16BIT_ONLY_0  (TD_16BIT_ONLY_0  ), 
    .TD_20BIT_ONLY_0  (TD_20BIT_ONLY_0  ), 
    .TD_8B10B_16BIT_0 (TD_8B10B_16BIT_0 ), 
    .TD_32BIT_ONLY_0  (TD_32BIT_ONLY_0  ), 
    .TD_40BIT_ONLY_0  (TD_40BIT_ONLY_0  ), 
    .TD_8B10B_32BIT_0 (TD_8B10B_32BIT_0 ), 
    .TD_64B66B_16BIT_0(TD_64B66B_16BIT_0), 
    .TD_64B66B_32BIT_0(TD_64B66B_32BIT_0), 
    .TD_64B67B_16BIT_0(TD_64B67B_16BIT_0), 
    .TD_64B67B_32BIT_0(TD_64B67B_32BIT_0), 
    .TD_8BIT_ONLY_1   (TD_8BIT_ONLY_1   ), 
    .TD_10BIT_ONLY_1  (TD_10BIT_ONLY_1  ), 
    .TD_8B10B_8BIT_1  (TD_8B10B_8BIT_1  ), 
    .TD_16BIT_ONLY_1  (TD_16BIT_ONLY_1  ), 
    .TD_20BIT_ONLY_1  (TD_20BIT_ONLY_1  ), 
    .TD_8B10B_16BIT_1 (TD_8B10B_16BIT_1 ), 
    .TD_32BIT_ONLY_1  (TD_32BIT_ONLY_1  ), 
    .TD_40BIT_ONLY_1  (TD_40BIT_ONLY_1  ), 
    .TD_8B10B_32BIT_1 (TD_8B10B_32BIT_1 ), 
    .TD_64B66B_16BIT_1(TD_64B66B_16BIT_1), 
    .TD_64B66B_32BIT_1(TD_64B66B_32BIT_1), 
    .TD_64B67B_16BIT_1(TD_64B67B_16BIT_1), 
    .TD_64B67B_32BIT_1(TD_64B67B_32BIT_1), 
    .TD_8BIT_ONLY_2   (TD_8BIT_ONLY_2   ), 
    .TD_10BIT_ONLY_2  (TD_10BIT_ONLY_2  ), 
    .TD_8B10B_8BIT_2  (TD_8B10B_8BIT_2  ), 
    .TD_16BIT_ONLY_2  (TD_16BIT_ONLY_2  ), 
    .TD_20BIT_ONLY_2  (TD_20BIT_ONLY_2  ), 
    .TD_8B10B_16BIT_2 (TD_8B10B_16BIT_2 ), 
    .TD_32BIT_ONLY_2  (TD_32BIT_ONLY_2  ), 
    .TD_40BIT_ONLY_2  (TD_40BIT_ONLY_2  ), 
    .TD_8B10B_32BIT_2 (TD_8B10B_32BIT_2 ), 
    .TD_64B66B_16BIT_2(TD_64B66B_16BIT_2), 
    .TD_64B66B_32BIT_2(TD_64B66B_32BIT_2), 
    .TD_64B67B_16BIT_2(TD_64B67B_16BIT_2), 
    .TD_64B67B_32BIT_2(TD_64B67B_32BIT_2), 
    .TD_8BIT_ONLY_3   (TD_8BIT_ONLY_3   ), 
    .TD_10BIT_ONLY_3  (TD_10BIT_ONLY_3  ), 
    .TD_8B10B_8BIT_3  (TD_8B10B_8BIT_3  ), 
    .TD_16BIT_ONLY_3  (TD_16BIT_ONLY_3  ), 
    .TD_20BIT_ONLY_3  (TD_20BIT_ONLY_3  ), 
    .TD_8B10B_16BIT_3 (TD_8B10B_16BIT_3 ), 
    .TD_32BIT_ONLY_3  (TD_32BIT_ONLY_3  ), 
    .TD_40BIT_ONLY_3  (TD_40BIT_ONLY_3  ), 
    .TD_8B10B_32BIT_3 (TD_8B10B_32BIT_3 ),  
    .TD_64B66B_16BIT_3(TD_64B66B_16BIT_3), 
    .TD_64B66B_32BIT_3(TD_64B66B_32BIT_3), 
    .TD_64B67B_16BIT_3(TD_64B67B_16BIT_3), 
    .TD_64B67B_32BIT_3(TD_64B67B_32BIT_3) 
) U_INST_SRC (
    .i_src_clk0                    (i_src_clk0                    ), // input          
    .i_src_clk1                    (i_src_clk1                    ), // input          
    .i_src_clk2                    (i_src_clk2                    ), // input          
    .i_src_clk3                    (i_src_clk3                    ), // input          
    .i_src_rstn                    (i_src_rstn                    ), // input          
    .o_txd_0                       (o_txd_0                       ), // output [39:0]  
    .o_txk_0                       (o_txk_0                       ), // output [3:0]   
    .o_txq_0                       (o_txq_0                       ), // output [6:0]   
    .o_txh_0                       (o_txh_0                       ), // output [2:0]   
    .o_txd_1                       (o_txd_1                       ), // output [39:0]  
    .o_txk_1                       (o_txk_1                       ), // output [3:0]   
    .o_txq_1                       (o_txq_1                       ), // output [6:0]   
    .o_txh_1                       (o_txh_1                       ), // output [2:0]   
    .o_txd_2                       (o_txd_2                       ), // output [39:0]  
    .o_txk_2                       (o_txk_2                       ), // output [3:0]   
    .o_txq_2                       (o_txq_2                       ), // output [6:0]   
    .o_txh_2                       (o_txh_2                       ), // output [2:0]   
    .o_txd_3                       (o_txd_3                       ), // output [39:0]  
    .o_txk_3                       (o_txk_3                       ), // output [3:0]   
    .o_txq_3                       (o_txq_3                       ), // output [6:0]   
    .o_txh_3                       (o_txh_3                       )  // output [2:0]   
);


assign i_txd_2                       = o_txd_2[31:0];
assign i_tdispsel_2                  = 4'b0;
assign i_tdispctrl_2                 = 4'b0;
assign i_txk_2                       = o_txk_2[3:0] ;
assign i_txd_3                       = o_txd_3[31:0];
assign i_tdispsel_3                  = 4'b0;
assign i_tdispctrl_3                 = 4'b0;
assign i_txk_3                       = o_txk_3[3:0] ;
// ********************* Checker of DUT *********************

wire            i_chk_clk0                    ;
wire            i_chk_clk1                    ;
wire            i_chk_clk2                    ;
wire            i_chk_clk3                    ;
wire    [3:0]   i_chk_rstn                    ;
wire    [2:0]   i_rxstatus_0                  ;
wire    [39:0]  i_rxd_0                       ;
wire    [3:0]   i_rdisper_0                   ;
wire    [3:0]   i_rdecer_0                    ;
wire    [3:0]   i_rxk_0                       ; 
wire            i_rxd_vld_0                   ;
wire    [2:0]   i_rxh_0                       ;
wire            i_rxh_vld_0                   ;
wire            i_rxq_start_0                 ;
wire    [2:0]   i_rxstatus_1                  ;
wire    [39:0]  i_rxd_1                       ;
wire    [3:0]   i_rdisper_1                   ;
wire    [3:0]   i_rdecer_1                    ;
wire    [3:0]   i_rxk_1                       ; 
wire            i_rxd_vld_1                   ;
wire    [2:0]   i_rxh_1                       ;
wire            i_rxh_vld_1                   ;
wire            i_rxq_start_1                 ;
wire    [2:0]   i_rxstatus_2                  ;
wire    [39:0]  i_rxd_2                       ;
wire    [3:0]   i_rdisper_2                   ;
wire    [3:0]   i_rdecer_2                    ;
wire    [3:0]   i_rxk_2                       ; 
wire            i_rxd_vld_2                   ;
wire    [2:0]   i_rxh_2                       ;
wire            i_rxh_vld_2                   ;
wire            i_rxq_start_2                 ;
wire    [2:0]   i_rxstatus_3                  ;
wire    [39:0]  i_rxd_3                       ;
wire    [3:0]   i_rdisper_3                   ;
wire    [3:0]   i_rdecer_3                    ;
wire    [3:0]   i_rxk_3                       ; 
wire            i_rxd_vld_3                   ;
wire    [2:0]   i_rxh_3                       ;
wire            i_rxh_vld_3                   ;
wire            i_rxq_start_3                 ;


assign i_chk_clk2 = i_p_rx2_clk_fr_core         ;  
assign i_chk_clk3 = i_p_rx3_clk_fr_core         ;   

//Sync Check Module Reset Signal
ipml_hsst_rst_sync_v1_0 chk_rstn_sync0 (.clk(i_chk_clk0), .rst_n(~chk_rst), .sig_async(1'b1), .sig_synced(i_chk_rstn[0]));
ipml_hsst_rst_sync_v1_0 chk_rstn_sync1 (.clk(i_chk_clk1), .rst_n(~chk_rst), .sig_async(1'b1), .sig_synced(i_chk_rstn[1]));
ipml_hsst_rst_sync_v1_0 chk_rstn_sync2 (.clk(i_chk_clk2), .rst_n(~chk_rst), .sig_async(1'b1), .sig_synced(i_chk_rstn[2]));
ipml_hsst_rst_sync_v1_0 chk_rstn_sync3 (.clk(i_chk_clk3), .rst_n(~chk_rst), .sig_async(1'b1), .sig_synced(i_chk_rstn[3]));

u_hsst_chk #(
    .RD_8BIT_ONLY_0   (RD_8BIT_ONLY_0   ), 
    .RD_10BIT_ONLY_0  (RD_10BIT_ONLY_0  ), 
    .RD_8B10B_8BIT_0  (RD_8B10B_8BIT_0  ), 
    .RD_16BIT_ONLY_0  (RD_16BIT_ONLY_0  ), 
    .RD_20BIT_ONLY_0  (RD_20BIT_ONLY_0  ), 
    .RD_8B10B_16BIT_0 (RD_8B10B_16BIT_0 ), 
    .RD_32BIT_ONLY_0  (RD_32BIT_ONLY_0  ), 
    .RD_40BIT_ONLY_0  (RD_40BIT_ONLY_0  ), 
    .RD_8B10B_32BIT_0 (RD_8B10B_32BIT_0 ), 
    .RD_64B66B_16BIT_0(RD_64B66B_16BIT_0), 
    .RD_64B66B_32BIT_0(RD_64B66B_32BIT_0), 
    .RD_64B67B_16BIT_0(RD_64B67B_16BIT_0), 
    .RD_64B67B_32BIT_0(RD_64B67B_32BIT_0), 
    .RD_8BIT_ONLY_1   (RD_8BIT_ONLY_1   ), 
    .RD_10BIT_ONLY_1  (RD_10BIT_ONLY_1  ), 
    .RD_8B10B_8BIT_1  (RD_8B10B_8BIT_1  ), 
    .RD_16BIT_ONLY_1  (RD_16BIT_ONLY_1  ), 
    .RD_20BIT_ONLY_1  (RD_20BIT_ONLY_1  ), 
    .RD_8B10B_16BIT_1 (RD_8B10B_16BIT_1 ), 
    .RD_32BIT_ONLY_1  (RD_32BIT_ONLY_1  ), 
    .RD_40BIT_ONLY_1  (RD_40BIT_ONLY_1  ), 
    .RD_8B10B_32BIT_1 (RD_8B10B_32BIT_1 ), 
    .RD_64B66B_16BIT_1(RD_64B66B_16BIT_1), 
    .RD_64B66B_32BIT_1(RD_64B66B_32BIT_1), 
    .RD_64B67B_16BIT_1(RD_64B67B_16BIT_1), 
    .RD_64B67B_32BIT_1(RD_64B67B_32BIT_1), 
    .RD_8BIT_ONLY_2   (RD_8BIT_ONLY_2   ), 
    .RD_10BIT_ONLY_2  (RD_10BIT_ONLY_2  ), 
    .RD_8B10B_8BIT_2  (RD_8B10B_8BIT_2  ), 
    .RD_16BIT_ONLY_2  (RD_16BIT_ONLY_2  ), 
    .RD_20BIT_ONLY_2  (RD_20BIT_ONLY_2  ), 
    .RD_8B10B_16BIT_2 (RD_8B10B_16BIT_2 ), 
    .RD_32BIT_ONLY_2  (RD_32BIT_ONLY_2  ), 
    .RD_40BIT_ONLY_2  (RD_40BIT_ONLY_2  ), 
    .RD_8B10B_32BIT_2 (RD_8B10B_32BIT_2 ), 
    .RD_64B66B_16BIT_2(RD_64B66B_16BIT_2), 
    .RD_64B66B_32BIT_2(RD_64B66B_32BIT_2), 
    .RD_64B67B_16BIT_2(RD_64B67B_16BIT_2), 
    .RD_64B67B_32BIT_2(RD_64B67B_32BIT_2), 
    .RD_8BIT_ONLY_3   (RD_8BIT_ONLY_3   ), 
    .RD_10BIT_ONLY_3  (RD_10BIT_ONLY_3  ), 
    .RD_8B10B_8BIT_3  (RD_8B10B_8BIT_3  ), 
    .RD_16BIT_ONLY_3  (RD_16BIT_ONLY_3  ), 
    .RD_20BIT_ONLY_3  (RD_20BIT_ONLY_3  ), 
    .RD_8B10B_16BIT_3 (RD_8B10B_16BIT_3 ), 
    .RD_32BIT_ONLY_3  (RD_32BIT_ONLY_3  ), 
    .RD_40BIT_ONLY_3  (RD_40BIT_ONLY_3  ), 
    .RD_8B10B_32BIT_3 (RD_8B10B_32BIT_3 ), 
    .RD_64B66B_16BIT_3(RD_64B66B_16BIT_3), 
    .RD_64B66B_32BIT_3(RD_64B66B_32BIT_3), 
    .RD_64B67B_16BIT_3(RD_64B67B_16BIT_3), 
    .RD_64B67B_32BIT_3(RD_64B67B_32BIT_3)  
) U_INST_CHK (
    .i_chk_clk0                    (i_chk_clk0                    ), // input           
    .i_chk_clk1                    (i_chk_clk1                    ), // input           
    .i_chk_clk2                    (i_chk_clk2                    ), // input           
    .i_chk_clk3                    (i_chk_clk3                    ), // input           
    .i_chk_rstn                    (i_chk_rstn                    ), // input  [3:0]          
    .i_rxstatus_0                  (i_rxstatus_0                  ), // input  [2:0]    
    .i_rxd_0                       (i_rxd_0                       ), // input  [39:0]   
    .i_rdisper_0                   (i_rdisper_0                   ), // input  [3:0]    
    .i_rdecer_0                    (i_rdecer_0                    ), // input  [3:0]    
    .i_rxk_0                       (i_rxk_0                       ), // input  [3:0]     
    .i_rxd_vld_0                   (i_rxd_vld_0                   ), // input 
    .i_rxh_0                       (i_rxh_0                       ), // input  [2:0] 
    .i_rxh_vld_0                   (i_rxh_vld_0                   ), // input 
    .i_rxq_start_0                 (i_rxq_start_0                 ), // input 
    .o_p_rxgear_slip_0             (o_p_rxgear_slip_0             ), // output
    .i_rxstatus_1                  (i_rxstatus_1                  ), // input  [2:0]    
    .i_rxd_1                       (i_rxd_1                       ), // input  [39:0]   
    .i_rdisper_1                   (i_rdisper_1                   ), // input  [3:0]    
    .i_rdecer_1                    (i_rdecer_1                    ), // input  [3:0]    
    .i_rxk_1                       (i_rxk_1                       ), // input  [3:0]     
    .i_rxd_vld_1                   (i_rxd_vld_1                   ), // input 
    .i_rxh_1                       (i_rxh_1                       ), // input  [2:0] 
    .i_rxh_vld_1                   (i_rxh_vld_1                   ), // input 
    .i_rxq_start_1                 (i_rxq_start_1                 ), // input 
    .o_p_rxgear_slip_1             (o_p_rxgear_slip_1             ), // output
    .i_rxstatus_2                  (i_rxstatus_2                  ), // input  [2:0]    
    .i_rxd_2                       (i_rxd_2                       ), // input  [39:0]   
    .i_rdisper_2                   (i_rdisper_2                   ), // input  [3:0]    
    .i_rdecer_2                    (i_rdecer_2                    ), // input  [3:0]    
    .i_rxk_2                       (i_rxk_2                       ), // input  [3:0]     
    .i_rxd_vld_2                   (i_rxd_vld_2                   ), // input 
    .i_rxh_2                       (i_rxh_2                       ), // input  [2:0] 
    .i_rxh_vld_2                   (i_rxh_vld_2                   ), // input 
    .i_rxq_start_2                 (i_rxq_start_2                 ), // input 
    .o_p_rxgear_slip_2             (o_p_rxgear_slip_2             ), // output
    .i_rxstatus_3                  (i_rxstatus_3                  ), // input  [2:0]    
    .i_rxd_3                       (i_rxd_3                       ), // input  [39:0]   
    .i_rdisper_3                   (i_rdisper_3                   ), // input  [3:0]    
    .i_rdecer_3                    (i_rdecer_3                    ), // input  [3:0]    
    .i_rxk_3                       (i_rxk_3                       ), // input  [3:0]   
    .i_rxd_vld_3                   (i_rxd_vld_3                   ), // input 
    .i_rxh_3                       (i_rxh_3                       ), // input  [2:0] 
    .i_rxh_vld_3                   (i_rxh_vld_3                   ), // input 
    .i_rxq_start_3                 (i_rxq_start_3                 ), // input 
    .o_p_rxgear_slip_3             (o_p_rxgear_slip_3             ), // output
    .o_pl_err                      (o_pl_err                      )  // output [3:0]    
);


assign i_rxstatus_2[2:0]             = o_rxstatus_2[2:0]       ;
assign i_rxd_2[31:0]                 = o_rxd_2[31:0]           ;
assign i_rdisper_2[3:0]              = o_rdisper_2[3:0]        ;
assign i_rdecer_2[3:0]               = o_rdecer_2[3:0]         ;
assign i_rxk_2[3:0]                  = o_rxk_2[3:0]            ;
assign i_rxd_vld_2                   = 1'b0                    ;
assign i_rxh_2                       = 3'b0                    ;
assign i_rxh_vld_2                   = 1'b0                    ;
assign i_rxq_start_2                 = 1'b0                    ;
assign i_rxstatus_3[2:0]             = o_rxstatus_3[2:0]       ;
assign i_rxd_3[31:0]                 = o_rxd_3[31:0]           ;
assign i_rdisper_3[3:0]              = o_rdisper_3[3:0]        ;
assign i_rdecer_3[3:0]               = o_rdecer_3[3:0]         ;
assign i_rxk_3[3:0]                  = o_rxk_3[3:0]            ;
assign i_rxd_vld_3                   = 1'b0                    ;
assign i_rxh_3                       = 3'b0                    ;
assign i_rxh_vld_3                   = 1'b0                    ;
assign i_rxq_start_3                 = 1'b0                    ;



endmodule    
