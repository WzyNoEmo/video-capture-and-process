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
////////////////////////////////////////////////////////////////////////////////
//
// Library:
// Filename:
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100fs

module u_hsst_if (
    
    input          i_free_clk                    ,
    input          i_p_refckn_0                  ,
    input          i_p_refckp_0                  ,
    input          i_wtchdg_clr_0                ,
    output [1:0]   o_wtchdg_st_0                 ,
    output         o_pll_done_0                  ,
    output         o_txlane_done_2               ,
    output         o_txlane_done_3               ,
    output         o_rxlane_done_2               ,
    output         o_rxlane_done_3               ,
    output         o_p_clk2core_tx_2             ,
    input          i_p_tx2_clk_fr_core           ,
    input          i_p_tx3_clk_fr_core           ,
    input          i_p_rx2_clk_fr_core           ,
    input          i_p_rx3_clk_fr_core           ,
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
    input  [31:0]  i_txd_2                       ,
    input  [3:0]   i_tdispsel_2                  ,
    input  [3:0]   i_tdispctrl_2                 ,
    input  [3:0]   i_txk_2                       ,
    input  [31:0]  i_txd_3                       ,
    input  [3:0]   i_tdispsel_3                  ,
    input  [3:0]   i_tdispctrl_3                 ,
    input  [3:0]   i_txk_3                       ,
    output [2:0]   o_rxstatus_2                  ,
    output [31:0]  o_rxd_2                       ,
    output [3:0]   o_rdisper_2                   ,
    output [3:0]   o_rdecer_2                    ,
    output [3:0]   o_rxk_2                       ,
    output [2:0]   o_rxstatus_3                  ,
    output [31:0]  o_rxd_3                       ,
    output [3:0]   o_rdisper_3                   ,
    output [3:0]   o_rdecer_3                    ,
    output [3:0]   o_rxk_3                       ,
    input          i_pll_rst_0                     
);


// ********************* UI parameters *********************
localparam CH0_EN = "DISABLE";
localparam CH1_EN = "DISABLE";
localparam CH2_EN = "Fullduplex";
localparam CH3_EN = "Fullduplex";
localparam CH0_PROTOCOL = "CUSTOMERIZEDx1";
localparam CH1_PROTOCOL = "CUSTOMERIZEDx1";
localparam CH2_PROTOCOL = "CUSTOMERIZEDx2";
localparam CH3_PROTOCOL = "CUSTOMERIZEDx2";
localparam CH0_PROTOCOL_DEFAULT = "FALSE";
localparam CH1_PROTOCOL_DEFAULT = "FALSE";
localparam CH2_PROTOCOL_DEFAULT = "FALSE";
localparam CH3_PROTOCOL_DEFAULT = "FALSE";
localparam CH0_TX_RATE = 0.0;
localparam CH1_TX_RATE = 0.0;
localparam CH2_TX_RATE = 5.0;
localparam CH3_TX_RATE = 5.0;
localparam CH0_RX_RATE = 0.0;
localparam CH1_RX_RATE = 0.0;
localparam CH2_RX_RATE = 5.0;
localparam CH3_RX_RATE = 5.0;
localparam CH0_TX_ENCODER = "Bypassed";
localparam CH1_TX_ENCODER = "Bypassed";
localparam CH2_TX_ENCODER = "8B10B";
localparam CH3_TX_ENCODER = "8B10B";
localparam CH0_RX_DECODER = "Bypassed";
localparam CH1_RX_DECODER = "Bypassed";
localparam CH2_RX_DECODER = "8B10B";
localparam CH3_RX_DECODER = "8B10B";
localparam CH0_TDATA_WIDTH = 8;
localparam CH1_TDATA_WIDTH = 8;
localparam CH2_TDATA_WIDTH = 32;
localparam CH3_TDATA_WIDTH = 32;
localparam CH0_RDATA_WIDTH = 8;
localparam CH1_RDATA_WIDTH = 8;
localparam CH2_RDATA_WIDTH = 32;
localparam CH3_RDATA_WIDTH = 32;
localparam CH0_TX_FABRIC_FEQ = 0.0;
localparam CH1_TX_FABRIC_FEQ = 0.0;
localparam CH2_TX_FABRIC_FEQ = 125.0;
localparam CH3_TX_FABRIC_FEQ = 125.0;
localparam CH0_RX_FABRIC_FEQ = 0.0;
localparam CH1_RX_FABRIC_FEQ = 0.0;
localparam CH2_RX_FABRIC_FEQ = 125.0;
localparam CH3_RX_FABRIC_FEQ = 125.0;
localparam PLL_NUM = 1;
localparam PLL0_EN = "TRUE";
localparam PLL1_EN = "FALSE";
localparam PLL_REFCLK_SAME = "FALSE";
localparam PLL0_REF_SEL = "Diff_REFCK0";
localparam PLL1_REF_SEL = "Diff_REFCK1";
localparam PLL0_FRQ_INDEX = 1;
localparam PLL1_FRQ_INDEX = 0;
localparam PLL0_REF_FRQ = 125.0;
localparam PLL1_REF_FRQ = 125.0;
localparam CH0_TX_PLL_SEL = "PLL0";
localparam CH1_TX_PLL_SEL = "PLL0";
localparam CH2_TX_PLL_SEL = "PLL0";
localparam CH3_TX_PLL_SEL = "PLL0";
localparam CH0_RX_PLL_SEL = "PLL0";
localparam CH1_RX_PLL_SEL = "PLL0";
localparam CH2_RX_PLL_SEL = "PLL0";
localparam CH3_RX_PLL_SEL = "PLL0";
localparam CH0_RXPCS_ALIGN = "Bypassed";
localparam CH1_RXPCS_ALIGN = "Bypassed";
localparam CH2_RXPCS_ALIGN = "GE_MODE";
localparam CH3_RXPCS_ALIGN = "GE_MODE";
localparam CH0_RXPCS_COMMA_SEL = "K28.5";
localparam CH1_RXPCS_COMMA_SEL = "K28.5";
localparam CH2_RXPCS_COMMA_SEL = "K28.5";
localparam CH3_RXPCS_COMMA_SEL = "K28.5";
localparam CH0_RXPCS_BONDING = "Bypassed";
localparam CH1_RXPCS_BONDING = "Bypassed";
localparam CH2_RXPCS_BONDING = "Bypassed";
localparam CH3_RXPCS_BONDING = "Bypassed";
localparam CH0_RXPCS_CTC = "Bypassed";
localparam CH1_RXPCS_CTC = "Bypassed";
localparam CH2_RXPCS_CTC = "GE";
localparam CH3_RXPCS_CTC = "GE";
localparam [9:0] CH0_RXPCS_COMMA_REG0 = 10'b0;
localparam [9:0] CH1_RXPCS_COMMA_REG0 = 10'b0;
localparam [9:0] CH2_RXPCS_COMMA_REG0 = 10'b0101111100;
localparam [9:0] CH3_RXPCS_COMMA_REG0 = 10'b0101111100;
localparam [9:0] CH0_RXPCS_COMMA_MASK = 10'b0;
localparam [9:0] CH1_RXPCS_COMMA_MASK = 10'b0;
localparam [9:0] CH2_RXPCS_COMMA_MASK = 10'b0000000000;
localparam [9:0] CH3_RXPCS_COMMA_MASK = 10'b0000000000;
localparam [9:0] CH0_RXPCS_SKIP_REG0 = 10'b0;
localparam [9:0] CH1_RXPCS_SKIP_REG0 = 10'b0;
localparam [9:0] CH2_RXPCS_SKIP_REG0 = 10'b110111100;
localparam [9:0] CH3_RXPCS_SKIP_REG0 = 10'b110111100;
localparam [9:0] CH0_RXPCS_SKIP_REG1 = 10'b0;
localparam [9:0] CH1_RXPCS_SKIP_REG1 = 10'b0;
localparam [9:0] CH2_RXPCS_SKIP_REG1 = 10'b001010000;
localparam [9:0] CH3_RXPCS_SKIP_REG1 = 10'b001010000;
localparam [9:0] CH0_RXPCS_SKIP_REG2 = 10'b0;
localparam [9:0] CH1_RXPCS_SKIP_REG2 = 10'b0;
localparam [9:0] CH2_RXPCS_SKIP_REG2 = 10'b0;
localparam [9:0] CH3_RXPCS_SKIP_REG2 = 10'b0;
localparam [9:0] CH0_RXPCS_SKIP_REG3 = 10'b0;
localparam [9:0] CH1_RXPCS_SKIP_REG3 = 10'b0;
localparam [9:0] CH2_RXPCS_SKIP_REG3 = 10'b0;
localparam [9:0] CH3_RXPCS_SKIP_REG3 = 10'b0;
localparam [7:0] CH0_RXPCS_A_REG = 8'b01111100;
localparam [7:0] CH1_RXPCS_A_REG = 8'b01111100;
localparam [7:0] CH2_RXPCS_A_REG = 8'b01111100;
localparam [7:0] CH3_RXPCS_A_REG = 8'b01111100;
localparam INNER_RST_EN = "TRUE";
localparam FREE_FRQ = 100.0;
localparam CH0_RXPCS_ALIGN_TIMER = 65535;
localparam CH1_RXPCS_ALIGN_TIMER = 65535;
localparam CH2_RXPCS_ALIGN_TIMER = 32767;
localparam CH3_RXPCS_ALIGN_TIMER = 65535;
localparam CH0_RXPCS_BONDING_RANGE = "80BIT";
localparam CH1_RXPCS_BONDING_RANGE = "80BIT";
localparam CH2_RXPCS_BONDING_RANGE = "80BIT";
localparam CH3_RXPCS_BONDING_RANGE = "80BIT";
localparam CH0_RXPMA_RTERM = 6;
localparam CH1_RXPMA_RTERM = 6;
localparam CH2_RXPMA_RTERM = 6;
localparam CH3_RXPMA_RTERM = 6;
localparam CH0_POST_CURSOR_EN = "FALSE";
localparam CH1_POST_CURSOR_EN = "FALSE";
localparam CH2_POST_CURSOR_EN = "FALSE";
localparam CH3_POST_CURSOR_EN = "FALSE";
localparam CH0_POST_CURSOR_EMPHASIS = 0;
localparam CH1_POST_CURSOR_EMPHASIS = 0;
localparam CH2_POST_CURSOR_EMPHASIS = 0;
localparam CH3_POST_CURSOR_EMPHASIS = 0;
localparam CH0_POST1_CURSOR_EMPHASIS = 0;
localparam CH1_POST1_CURSOR_EMPHASIS = 0;
localparam CH2_POST1_CURSOR_EMPHASIS = 0;
localparam CH3_POST1_CURSOR_EMPHASIS = 0;
localparam CH0_POST2_CURSOR_EMPHASIS = 0;
localparam CH1_POST2_CURSOR_EMPHASIS = 0;
localparam CH2_POST2_CURSOR_EMPHASIS = 0;
localparam CH3_POST2_CURSOR_EMPHASIS = 0;
localparam P_APB_EN = "FALSE";
localparam PLL0_VCO = 2500.0;
localparam PLL0_M = 1;
localparam PLL0_N1 = 5;
localparam PLL0_N2 = 4;
localparam PLL1_VCO = 2125.0;
localparam PLL1_M = 1;
localparam PLL1_N1 = 4;
localparam PLL1_N2 = 5;
localparam P_LX_TX_CKDIV_0 = 1;
localparam P_LX_TX_CKDIV_1 = 1;
localparam P_LX_TX_CKDIV_2 = 3;
localparam P_LX_TX_CKDIV_3 = 3;
localparam LX_RX_CKDIV_0 = 1;
localparam LX_RX_CKDIV_1 = 1;
localparam LX_RX_CKDIV_2 = 3;
localparam LX_RX_CKDIV_3 = 3;
localparam RX0_CLK2_FR_CORE = "FALSE";
localparam RX1_CLK2_FR_CORE = "FALSE";
localparam RX2_CLK2_FR_CORE = "FALSE";
localparam RX3_CLK2_FR_CORE = "FALSE";
localparam TX0_CLK2_FR_CORE = "FALSE";
localparam TX1_CLK2_FR_CORE = "FALSE";
localparam TX2_CLK2_FR_CORE = "FALSE";
localparam TX3_CLK2_FR_CORE = "FALSE";
localparam CH0_DEBUG_BUS = "FALSE";
localparam CH1_DEBUG_BUS = "FALSE";
localparam CH2_DEBUG_BUS = "FALSE";
localparam CH3_DEBUG_BUS = "FALSE";
localparam CH0_FFE_CTRL_EN = "FALSE";
localparam CH1_FFE_CTRL_EN = "FALSE";
localparam CH2_FFE_CTRL_EN = "FALSE";
localparam CH3_FFE_CTRL_EN = "FALSE";
localparam CH0_RX_CLK_SLIP_EN = "FALSE";
localparam CH1_RX_CLK_SLIP_EN = "FALSE";
localparam CH2_RX_CLK_SLIP_EN = "FALSE";
localparam CH3_RX_CLK_SLIP_EN = "FALSE";

//-- GTP PARAMETER ---//

//renamed parameters
//CHx_TDATA_WIDTH_TYPE: "8bit_only", "10bit_only", "8b10b_8bit", "16bit_only", "20bit_only", "8b10b_16bit", "32bit_only", "40bit_only", "8b10b_32bit"
//CHx_RDATA_WIDTH_TYPE: "8bit_only", "10bit_only", "8b10b_8bit", "16bit_only", "20bit_only", "8b10b_16bit", "32bit_only", "40bit_only", "8b10b_32bit"
localparam           CH0_TDATA_WIDTH_TYPE          = ((CH0_TX_ENCODER=="Bypassed")&&(CH0_TDATA_WIDTH==8)) ? "8bit_only" :
                                                     ((CH0_TX_ENCODER=="Bypassed")&&(CH0_TDATA_WIDTH==10)) ? "10bit_only" :
                                                     ((CH0_TX_ENCODER=="Bypassed")&&(CH0_TDATA_WIDTH==16)) ? "16bit_only" :
                                                     ((CH0_TX_ENCODER=="Bypassed")&&(CH0_TDATA_WIDTH==20)) ? "20bit_only" :
                                                     ((CH0_TX_ENCODER=="Bypassed")&&(CH0_TDATA_WIDTH==32)) ? "32bit_only" :
                                                     ((CH0_TX_ENCODER=="Bypassed")&&(CH0_TDATA_WIDTH==40)) ? "40bit_only" :
                                                     ((CH0_TX_ENCODER=="8B10B") &&  (CH0_TDATA_WIDTH==8)) ? "8b10b_8bit"  :
                                                     ((CH0_TX_ENCODER=="8B10B") &&  (CH0_TDATA_WIDTH==16)) ? "8b10b_16bit" : 
                                                     ((CH0_TX_ENCODER=="64B66B_transparent") &&  (CH0_TDATA_WIDTH==16)) ? "64b66b_16bit" :
                                                     ((CH0_TX_ENCODER=="64B66B_transparent") &&  (CH0_TDATA_WIDTH==32)) ? "64b66b_32bit" :
                                                     ((CH0_TX_ENCODER=="64B67B_transparent") &&  (CH0_TDATA_WIDTH==16)) ? "64b67b_16bit" :
                                                     ((CH0_TX_ENCODER=="64B67B_transparent") &&  (CH0_TDATA_WIDTH==32)) ? "64b67b_32bit" : "8b10b_32bit";
localparam           CH1_TDATA_WIDTH_TYPE          = ((CH1_TX_ENCODER=="Bypassed")&&(CH1_TDATA_WIDTH==8)) ? "8bit_only" :
                                                     ((CH1_TX_ENCODER=="Bypassed")&&(CH1_TDATA_WIDTH==10)) ? "10bit_only" :
                                                     ((CH1_TX_ENCODER=="Bypassed")&&(CH1_TDATA_WIDTH==16)) ? "16bit_only" :
                                                     ((CH1_TX_ENCODER=="Bypassed")&&(CH1_TDATA_WIDTH==20)) ? "20bit_only" :
                                                     ((CH1_TX_ENCODER=="Bypassed")&&(CH1_TDATA_WIDTH==32)) ? "32bit_only" :
                                                     ((CH1_TX_ENCODER=="Bypassed")&&(CH1_TDATA_WIDTH==40)) ? "40bit_only" :
                                                     ((CH1_TX_ENCODER=="8B10B") &&  (CH1_TDATA_WIDTH==8)) ? "8b10b_8bit" :
                                                     ((CH1_TX_ENCODER=="8B10B") &&  (CH1_TDATA_WIDTH==16)) ? "8b10b_16bit" :
                                                     ((CH1_TX_ENCODER=="64B66B_transparent") &&  (CH1_TDATA_WIDTH==16)) ? "64b66b_16bit" :
                                                     ((CH1_TX_ENCODER=="64B66B_transparent") &&  (CH1_TDATA_WIDTH==32)) ? "64b66b_32bit" :
                                                     ((CH1_TX_ENCODER=="64B67B_transparent") &&  (CH1_TDATA_WIDTH==16)) ? "64b67b_16bit" :
                                                     ((CH1_TX_ENCODER=="64B67B_transparent") &&  (CH1_TDATA_WIDTH==32)) ? "64b67b_32bit" : "8b10b_32bit";
localparam           CH2_TDATA_WIDTH_TYPE          = ((CH2_TX_ENCODER=="Bypassed")&&(CH2_TDATA_WIDTH==8)) ? "8bit_only" :
                                                     ((CH2_TX_ENCODER=="Bypassed")&&(CH2_TDATA_WIDTH==10)) ? "10bit_only" :
                                                     ((CH2_TX_ENCODER=="Bypassed")&&(CH2_TDATA_WIDTH==16)) ? "16bit_only" :
                                                     ((CH2_TX_ENCODER=="Bypassed")&&(CH2_TDATA_WIDTH==20)) ? "20bit_only" :
                                                     ((CH2_TX_ENCODER=="Bypassed")&&(CH2_TDATA_WIDTH==32)) ? "32bit_only" :
                                                     ((CH2_TX_ENCODER=="Bypassed")&&(CH2_TDATA_WIDTH==40)) ? "40bit_only" :
                                                     ((CH2_TX_ENCODER=="8B10B") &&  (CH2_TDATA_WIDTH==8)) ? "8b10b_8bit" :
                                                     ((CH2_TX_ENCODER=="8B10B") &&  (CH2_TDATA_WIDTH==16)) ? "8b10b_16bit" : 
                                                     ((CH2_TX_ENCODER=="64B66B_transparent") &&  (CH2_TDATA_WIDTH==16)) ? "64b66b_16bit" :
                                                     ((CH2_TX_ENCODER=="64B66B_transparent") &&  (CH2_TDATA_WIDTH==32)) ? "64b66b_32bit" :
                                                     ((CH2_TX_ENCODER=="64B67B_transparent") &&  (CH2_TDATA_WIDTH==16)) ? "64b67b_16bit" :
                                                     ((CH2_TX_ENCODER=="64B67B_transparent") &&  (CH2_TDATA_WIDTH==32)) ? "64b67b_32bit" : "8b10b_32bit";
localparam           CH3_TDATA_WIDTH_TYPE          = ((CH3_TX_ENCODER=="Bypassed")&&(CH3_TDATA_WIDTH==8)) ? "8bit_only" :
                                                     ((CH3_TX_ENCODER=="Bypassed")&&(CH3_TDATA_WIDTH==10)) ? "10bit_only" :
                                                     ((CH3_TX_ENCODER=="Bypassed")&&(CH3_TDATA_WIDTH==16)) ? "16bit_only" :
                                                     ((CH3_TX_ENCODER=="Bypassed")&&(CH3_TDATA_WIDTH==20)) ? "20bit_only" :
                                                     ((CH3_TX_ENCODER=="Bypassed")&&(CH3_TDATA_WIDTH==32)) ? "32bit_only" :
                                                     ((CH3_TX_ENCODER=="Bypassed")&&(CH3_TDATA_WIDTH==40)) ? "40bit_only" :
                                                     ((CH3_TX_ENCODER=="8B10B") &&  (CH3_TDATA_WIDTH==8)) ? "8b10b_8bit" :
                                                     ((CH3_TX_ENCODER=="8B10B") &&  (CH3_TDATA_WIDTH==16)) ? "8b10b_16bit" :
                                                     ((CH3_TX_ENCODER=="64B66B_transparent") &&  (CH3_TDATA_WIDTH==16)) ? "64b66b_16bit" :
                                                     ((CH3_TX_ENCODER=="64B66B_transparent") &&  (CH3_TDATA_WIDTH==32)) ? "64b66b_32bit" :
                                                     ((CH3_TX_ENCODER=="64B67B_transparent") &&  (CH3_TDATA_WIDTH==16)) ? "64b67b_16bit" :
                                                     ((CH3_TX_ENCODER=="64B67B_transparent") &&  (CH3_TDATA_WIDTH==32)) ? "64b67b_32bit" : "8b10b_32bit";
localparam           CH0_RDATA_WIDTH_TYPE          = ((CH0_RX_DECODER=="Bypassed")&&(CH0_RDATA_WIDTH==8)) ? "8bit_only" :
                                                     ((CH0_RX_DECODER=="Bypassed")&&(CH0_RDATA_WIDTH==10)) ? "10bit_only" :
                                                     ((CH0_RX_DECODER=="Bypassed")&&(CH0_RDATA_WIDTH==16)) ? "16bit_only" :
                                                     ((CH0_RX_DECODER=="Bypassed")&&(CH0_RDATA_WIDTH==20)) ? "20bit_only" :
                                                     ((CH0_RX_DECODER=="Bypassed")&&(CH0_RDATA_WIDTH==32)) ? "32bit_only" :
                                                     ((CH0_RX_DECODER=="Bypassed")&&(CH0_RDATA_WIDTH==40)) ? "40bit_only" :
                                                     ((CH0_RX_DECODER=="8B10B") &&  (CH0_RDATA_WIDTH==8)) ? "8b10b_8bit" :
                                                     ((CH0_RX_DECODER=="8B10B") &&  (CH0_RDATA_WIDTH==16)) ? "8b10b_16bit" :
                                                     ((CH0_RX_DECODER=="64B66B_transparent") &&  (CH0_RDATA_WIDTH==16)) ? "64b66b_16bit" :
                                                     ((CH0_RX_DECODER=="64B66B_transparent") &&  (CH0_RDATA_WIDTH==32)) ? "64b66b_32bit" :
                                                     ((CH0_RX_DECODER=="64B67B_transparent") &&  (CH0_RDATA_WIDTH==16)) ? "64b67b_16bit" :
                                                     ((CH0_RX_DECODER=="64B67B_transparent") &&  (CH0_RDATA_WIDTH==32)) ? "64b67b_32bit" : "8b10b_32bit";
localparam           CH1_RDATA_WIDTH_TYPE          = ((CH1_RX_DECODER=="Bypassed")&&(CH1_RDATA_WIDTH==8)) ? "8bit_only" :
                                                     ((CH1_RX_DECODER=="Bypassed")&&(CH1_RDATA_WIDTH==10)) ? "10bit_only" :
                                                     ((CH1_RX_DECODER=="Bypassed")&&(CH1_RDATA_WIDTH==16)) ? "16bit_only" :
                                                     ((CH1_RX_DECODER=="Bypassed")&&(CH1_RDATA_WIDTH==20)) ? "20bit_only" :
                                                     ((CH1_RX_DECODER=="Bypassed")&&(CH1_RDATA_WIDTH==32)) ? "32bit_only" :
                                                     ((CH1_RX_DECODER=="Bypassed")&&(CH1_RDATA_WIDTH==40)) ? "40bit_only" :
                                                     ((CH1_RX_DECODER=="8B10B") &&  (CH1_RDATA_WIDTH==8)) ? "8b10b_8bit" :
                                                     ((CH1_RX_DECODER=="8B10B") &&  (CH1_RDATA_WIDTH==16)) ? "8b10b_16bit" :
                                                     ((CH1_RX_DECODER=="64B66B_transparent") &&  (CH1_RDATA_WIDTH==16)) ? "64b66b_16bit" :
                                                     ((CH1_RX_DECODER=="64B66B_transparent") &&  (CH1_RDATA_WIDTH==32)) ? "64b66b_32bit" :
                                                     ((CH1_RX_DECODER=="64B67B_transparent") &&  (CH1_RDATA_WIDTH==16)) ? "64b67b_16bit" :
                                                     ((CH1_RX_DECODER=="64B67B_transparent") &&  (CH1_RDATA_WIDTH==32)) ? "64b67b_32bit" : "8b10b_32bit";
localparam           CH2_RDATA_WIDTH_TYPE          = ((CH2_RX_DECODER=="Bypassed")&&(CH2_RDATA_WIDTH==8)) ? "8bit_only" :
                                                     ((CH2_RX_DECODER=="Bypassed")&&(CH2_RDATA_WIDTH==10)) ? "10bit_only" :
                                                     ((CH2_RX_DECODER=="Bypassed")&&(CH2_RDATA_WIDTH==16)) ? "16bit_only" :
                                                     ((CH2_RX_DECODER=="Bypassed")&&(CH2_RDATA_WIDTH==20)) ? "20bit_only" :
                                                     ((CH2_RX_DECODER=="Bypassed")&&(CH2_RDATA_WIDTH==32)) ? "32bit_only" :
                                                     ((CH2_RX_DECODER=="Bypassed")&&(CH2_RDATA_WIDTH==40)) ? "40bit_only" :
                                                     ((CH2_RX_DECODER=="8B10B") &&  (CH2_RDATA_WIDTH==8)) ? "8b10b_8bit" :
                                                     ((CH2_RX_DECODER=="8B10B") &&  (CH2_RDATA_WIDTH==16)) ? "8b10b_16bit" :
                                                     ((CH2_RX_DECODER=="64B66B_transparent") &&  (CH2_RDATA_WIDTH==16)) ? "64b66b_16bit" :
                                                     ((CH2_RX_DECODER=="64B66B_transparent") &&  (CH2_RDATA_WIDTH==32)) ? "64b66b_32bit" :
                                                     ((CH2_RX_DECODER=="64B67B_transparent") &&  (CH2_RDATA_WIDTH==16)) ? "64b67b_16bit" :
                                                     ((CH2_RX_DECODER=="64B67B_transparent") &&  (CH2_RDATA_WIDTH==32)) ? "64b67b_32bit" : "8b10b_32bit";
localparam           CH3_RDATA_WIDTH_TYPE          = ((CH3_RX_DECODER=="Bypassed")&&(CH3_RDATA_WIDTH==8)) ? "8bit_only" :
                                                     ((CH3_RX_DECODER=="Bypassed")&&(CH3_RDATA_WIDTH==10)) ? "10bit_only" :
                                                     ((CH3_RX_DECODER=="Bypassed")&&(CH3_RDATA_WIDTH==16)) ? "16bit_only" :
                                                     ((CH3_RX_DECODER=="Bypassed")&&(CH3_RDATA_WIDTH==20)) ? "20bit_only" :
                                                     ((CH3_RX_DECODER=="Bypassed")&&(CH3_RDATA_WIDTH==32)) ? "32bit_only" :
                                                     ((CH3_RX_DECODER=="Bypassed")&&(CH3_RDATA_WIDTH==40)) ? "40bit_only" :
                                                     ((CH3_RX_DECODER=="8B10B") &&  (CH3_RDATA_WIDTH==8)) ? "8b10b_8bit" :
                                                     ((CH3_RX_DECODER=="8B10B") &&  (CH3_RDATA_WIDTH==16)) ? "8b10b_16bit" :
                                                     ((CH3_RX_DECODER=="64B66B_transparent") &&  (CH3_RDATA_WIDTH==16)) ? "64b66b_16bit" :
                                                     ((CH3_RX_DECODER=="64B66B_transparent") &&  (CH3_RDATA_WIDTH==32)) ? "64b66b_32bit" :
                                                     ((CH3_RX_DECODER=="64B67B_transparent") &&  (CH3_RDATA_WIDTH==16)) ? "64b67b_16bit" :
                                                     ((CH3_RX_DECODER=="64B67B_transparent") &&  (CH3_RDATA_WIDTH==32)) ? "64b67b_32bit" : "8b10b_32bit";
localparam           PCS_CH0_BYPASS_WORD_ALIGN     = (CH0_RXPCS_ALIGN=="Bypassed") ? "TRUE" : "FALSE";         
localparam           PCS_CH1_BYPASS_WORD_ALIGN     = (CH1_RXPCS_ALIGN=="Bypassed") ? "TRUE" : "FALSE";         
localparam           PCS_CH2_BYPASS_WORD_ALIGN     = (CH2_RXPCS_ALIGN=="Bypassed") ? "TRUE" : "FALSE";         
localparam           PCS_CH3_BYPASS_WORD_ALIGN     = (CH3_RXPCS_ALIGN=="Bypassed") ? "TRUE" : "FALSE";         
localparam           PCS_CH0_BYPASS_BONDING        = (CH0_RXPCS_BONDING=="Bypassed") ? "TRUE" : "FALSE";         
localparam           PCS_CH1_BYPASS_BONDING        = (CH1_RXPCS_BONDING=="Bypassed") ? "TRUE" : "FALSE";         
localparam           PCS_CH2_BYPASS_BONDING        = (CH2_RXPCS_BONDING=="Bypassed") ? "TRUE" : "FALSE";         
localparam           PCS_CH3_BYPASS_BONDING        = (CH3_RXPCS_BONDING=="Bypassed") ? "TRUE" : "FALSE";         
localparam           PCS_CH0_BYPASS_CTC            = (CH0_RXPCS_CTC=="Bypassed") ? "TRUE" : "FALSE";         
localparam           PCS_CH1_BYPASS_CTC            = (CH1_RXPCS_CTC=="Bypassed") ? "TRUE" : "FALSE";         
localparam           PCS_CH2_BYPASS_CTC            = (CH2_RXPCS_CTC=="Bypassed") ? "TRUE" : "FALSE";         
localparam           PCS_CH3_BYPASS_CTC            = (CH3_RXPCS_CTC=="Bypassed") ? "TRUE" : "FALSE";         
localparam           PCS_CH0_ALIGN_MODE            = (CH0_RXPCS_ALIGN=="CUSTOMERIZED_MODE") ? "OUTSIDE" : 
                                                     (CH0_RXPCS_ALIGN=="RAPIDIO_MODE") ? "RAPIDIO" :            
                                                     (CH0_RXPCS_ALIGN=="XAUI_MODE") ? "10GB" : "1GB";           
localparam           PCS_CH1_ALIGN_MODE            = (CH1_RXPCS_ALIGN=="CUSTOMERIZED_MODE") ? "OUTSIDE" : 
                                                     (CH1_RXPCS_ALIGN=="RAPIDIO_MODE") ? "RAPIDIO" :            
                                                     (CH1_RXPCS_ALIGN=="XAUI_MODE") ? "10GB" : "1GB";           
localparam           PCS_CH2_ALIGN_MODE            = (CH2_RXPCS_ALIGN=="CUSTOMERIZED_MODE") ? "OUTSIDE" : 
                                                     (CH2_RXPCS_ALIGN=="RAPIDIO_MODE") ? "RAPIDIO" :            
                                                     (CH2_RXPCS_ALIGN=="XAUI_MODE") ? "10GB" : "1GB";           
localparam           PCS_CH3_ALIGN_MODE            = (CH3_RXPCS_ALIGN=="CUSTOMERIZED_MODE") ? "OUTSIDE" : 
                                                     (CH3_RXPCS_ALIGN=="RAPIDIO_MODE") ? "RAPIDIO" :            
                                                     (CH3_RXPCS_ALIGN=="XAUI_MODE") ? "10GB" : "1GB";           
localparam   integer PCS_CH0_COMMA_REG0            = CH0_RXPCS_COMMA_REG0;               
localparam   integer PCS_CH1_COMMA_REG0            = CH1_RXPCS_COMMA_REG0;               
localparam   integer PCS_CH2_COMMA_REG0            = CH2_RXPCS_COMMA_REG0;               
localparam   integer PCS_CH3_COMMA_REG0            = CH3_RXPCS_COMMA_REG0;               
localparam   integer PCS_CH0_COMMA_REG1            = 1023 - CH0_RXPCS_COMMA_REG0;               
localparam   integer PCS_CH1_COMMA_REG1            = 1023 - CH1_RXPCS_COMMA_REG0;               
localparam   integer PCS_CH2_COMMA_REG1            = 1023 - CH2_RXPCS_COMMA_REG0;               
localparam   integer PCS_CH3_COMMA_REG1            = 1023 - CH3_RXPCS_COMMA_REG0;               
localparam   integer PCS_CH0_RAPID_IMAX            = 5;               
localparam   integer PCS_CH1_RAPID_IMAX            = 5;               
localparam   integer PCS_CH2_RAPID_IMAX            = 5;               
localparam   integer PCS_CH3_RAPID_IMAX            = 5;               
localparam   integer PCS_CH0_RAPID_VMIN_1          = 250;
localparam   integer PCS_CH1_RAPID_VMIN_1          = 250;
localparam   integer PCS_CH2_RAPID_VMIN_1          = 250;
localparam   integer PCS_CH3_RAPID_VMIN_1          = 250;
localparam   integer PCS_CH0_RAPID_VMIN_2          = 1;
localparam   integer PCS_CH1_RAPID_VMIN_2          = 1;
localparam   integer PCS_CH2_RAPID_VMIN_2          = 1;
localparam   integer PCS_CH3_RAPID_VMIN_2          = 1;
localparam   integer PCS_CH0_COMMA_MASK            = CH0_RXPCS_COMMA_MASK;               
localparam   integer PCS_CH1_COMMA_MASK            = CH1_RXPCS_COMMA_MASK;               
localparam   integer PCS_CH2_COMMA_MASK            = CH2_RXPCS_COMMA_MASK;               
localparam   integer PCS_CH3_COMMA_MASK            = CH3_RXPCS_COMMA_MASK;               
localparam           PCS_CH0_CEB_MODE              = (CH0_RXPCS_BONDING=="CUSTOMERIZED_MODE") ? "OUTSIDE" :
                                                     (CH0_RXPCS_BONDING=="RAPIDIO_MODE") ? "RAPIDIO" : "10GB";          
localparam           PCS_CH1_CEB_MODE              = (CH1_RXPCS_BONDING=="CUSTOMERIZED_MODE") ? "OUTSIDE" :
                                                     (CH1_RXPCS_BONDING=="RAPIDIO_MODE") ? "RAPIDIO" : "10GB";          
localparam           PCS_CH2_CEB_MODE              = (CH2_RXPCS_BONDING=="CUSTOMERIZED_MODE") ? "OUTSIDE" :
                                                     (CH2_RXPCS_BONDING=="RAPIDIO_MODE") ? "RAPIDIO" : "10GB";          
localparam           PCS_CH3_CEB_MODE              = (CH3_RXPCS_BONDING=="CUSTOMERIZED_MODE") ? "OUTSIDE" :
                                                     (CH3_RXPCS_BONDING=="RAPIDIO_MODE") ? "RAPIDIO" : "10GB";          
localparam           PCS_CH0_CTC_MODE              = ((CH0_RXPCS_CTC=="CUSTOMERIZED_4BYTE")||(CH0_RXPCS_CTC=="PCIE_4BYTE")) ? "4SKIP" :          
                                                     ((CH0_RXPCS_CTC=="CUSTOMERIZED_2BYTE")||(CH0_RXPCS_CTC=="GE"  )) ? "2SKIP" : 
                                                      (CH0_RXPCS_CTC=="PCIE_2BYTE") ? "PCIE_2BYTE" : "1SKIP";          
localparam           PCS_CH1_CTC_MODE              = ((CH1_RXPCS_CTC=="CUSTOMERIZED_4BYTE")||(CH1_RXPCS_CTC=="PCIE_4BYTE")) ? "4SKIP" :          
                                                     ((CH1_RXPCS_CTC=="CUSTOMERIZED_2BYTE")||(CH1_RXPCS_CTC=="GE"  )) ? "2SKIP" : 
                                                      (CH1_RXPCS_CTC=="PCIE_2BYTE") ? "PCIE_2BYTE" : "1SKIP";          
localparam           PCS_CH2_CTC_MODE              = ((CH2_RXPCS_CTC=="CUSTOMERIZED_4BYTE")||(CH2_RXPCS_CTC=="PCIE_4BYTE")) ? "4SKIP" :          
                                                     ((CH2_RXPCS_CTC=="CUSTOMERIZED_2BYTE")||(CH2_RXPCS_CTC=="GE"  )) ? "2SKIP" :        
                                                      (CH2_RXPCS_CTC=="PCIE_2BYTE") ? "PCIE_2BYTE" : "1SKIP";          
localparam           PCS_CH3_CTC_MODE              = ((CH3_RXPCS_CTC=="CUSTOMERIZED_4BYTE")||(CH3_RXPCS_CTC=="PCIE_4BYTE")) ? "4SKIP" :          
                                                     ((CH3_RXPCS_CTC=="CUSTOMERIZED_2BYTE")||(CH3_RXPCS_CTC=="GE"  )) ? "2SKIP" :       
                                                      (CH3_RXPCS_CTC=="PCIE_2BYTE") ? "PCIE_2BYTE" : "1SKIP";          
localparam   integer PCS_CH0_SKIP_REG0             = CH0_RXPCS_SKIP_REG0;               
localparam   integer PCS_CH1_SKIP_REG0             = CH1_RXPCS_SKIP_REG0;               
localparam   integer PCS_CH2_SKIP_REG0             = CH2_RXPCS_SKIP_REG0;               
localparam   integer PCS_CH3_SKIP_REG0             = CH3_RXPCS_SKIP_REG0;               
localparam   integer PCS_CH0_SKIP_REG1             = CH0_RXPCS_SKIP_REG1;               
localparam   integer PCS_CH1_SKIP_REG1             = CH1_RXPCS_SKIP_REG1;               
localparam   integer PCS_CH2_SKIP_REG1             = CH2_RXPCS_SKIP_REG1;               
localparam   integer PCS_CH3_SKIP_REG1             = CH3_RXPCS_SKIP_REG1;               
localparam   integer PCS_CH0_SKIP_REG2             = CH0_RXPCS_SKIP_REG2;               
localparam   integer PCS_CH1_SKIP_REG2             = CH1_RXPCS_SKIP_REG2;               
localparam   integer PCS_CH2_SKIP_REG2             = CH2_RXPCS_SKIP_REG2;               
localparam   integer PCS_CH3_SKIP_REG2             = CH3_RXPCS_SKIP_REG2;               
localparam   integer PCS_CH0_SKIP_REG3             = CH0_RXPCS_SKIP_REG3;               
localparam   integer PCS_CH1_SKIP_REG3             = CH1_RXPCS_SKIP_REG3;               
localparam   integer PCS_CH2_SKIP_REG3             = CH2_RXPCS_SKIP_REG3;               
localparam   integer PCS_CH3_SKIP_REG3             = CH3_RXPCS_SKIP_REG3;               
localparam           PCS_CH0_GE_AUTO_EN            = (CH0_RXPCS_CTC=="GE") ? "TRUE" : "FALSE";         
localparam           PCS_CH1_GE_AUTO_EN            = (CH1_RXPCS_CTC=="GE") ? "TRUE" : "FALSE";         
localparam           PCS_CH2_GE_AUTO_EN            = (CH2_RXPCS_CTC=="GE") ? "TRUE" : "FALSE";         
localparam           PCS_CH3_GE_AUTO_EN            = (CH3_RXPCS_CTC=="GE") ? "TRUE" : "FALSE";         
localparam   integer PCS_CH0_A_REG                 = CH0_RXPCS_A_REG;               
localparam   integer PCS_CH1_A_REG                 = CH1_RXPCS_A_REG;               
localparam   integer PCS_CH2_A_REG                 = CH2_RXPCS_A_REG;               
localparam   integer PCS_CH3_A_REG                 = CH3_RXPCS_A_REG;               
localparam           PCS_CH0_PCIE_SLAVE            = "MASTER";        
localparam           PCS_CH1_PCIE_SLAVE            = (CH0_PROTOCOL=="PCIEx4" || CH0_PROTOCOL=="PCIEx2") ? "SLAVE" : "MASTER";        
localparam           PCS_CH2_PCIE_SLAVE            = (CH0_PROTOCOL=="PCIEx4") ? "SLAVE" : "MASTER";        
localparam           PCS_CH3_PCIE_SLAVE            = (CH0_PROTOCOL=="PCIEx4" || CH2_PROTOCOL=="PCIEx2") ? "SLAVE" : "MASTER";        
localparam           PCS_CH0_SLAVE                 = "MASTER";        
localparam           PCS_CH1_SLAVE                 = (PCS_CH1_BYPASS_BONDING=="FALSE") ? "SLAVE" : "MASTER";
localparam           PCS_CH2_SLAVE                 = (CH0_PROTOCOL=="CUSTOMERIZEDx4" && PCS_CH2_BYPASS_BONDING=="FALSE") ? "SLAVE" : 
                                                     (CH0_PROTOCOL=="XAUI" && PCS_CH2_BYPASS_BONDING=="FALSE") ? "SLAVE" : "MASTER";
localparam           PCS_CH3_SLAVE                 = (CH0_PROTOCOL=="CUSTOMERIZEDx4" && PCS_CH3_BYPASS_BONDING=="FALSE") ? "SLAVE" : 
                                                     (CH0_PROTOCOL=="XAUI" && PCS_CH3_BYPASS_BONDING=="FALSE") ? "SLAVE" :
                                                     (CH2_PROTOCOL=="CUSTOMERIZEDx2" && PCS_CH3_BYPASS_BONDING=="FALSE") ? "SLAVE" : "MASTER";
localparam           PCS_CH0_TX_SLAVE              = "MASTER";         
localparam           PCS_CH1_TX_SLAVE              = (CH0_PROTOCOL=="CUSTOMERIZEDx4") ? "SLAVE" : 
                                                     (CH0_PROTOCOL=="PCIEx4") ? "SLAVE" :
                                                     (CH0_PROTOCOL=="XAUI") ? "SLAVE" :
                                                     (CH0_PROTOCOL=="CUSTOMERIZEDx2" || CH0_PROTOCOL=="PCIEx2") ? "SLAVE" : 
                                                     "MASTER";
localparam           PCS_CH2_TX_SLAVE               = (CH0_PROTOCOL=="CUSTOMERIZEDx4") ? "SLAVE" : 
                                                     (CH0_PROTOCOL=="PCIEx4") ? "SLAVE" :
                                                     (CH0_PROTOCOL=="XAUI") ? "SLAVE" : "MASTER";
localparam           PCS_CH3_TX_SLAVE               = (CH0_PROTOCOL=="CUSTOMERIZEDx4") ? "SLAVE" : 
                                                     (CH0_PROTOCOL=="PCIEx4") ? "SLAVE" :
                                                     (CH0_PROTOCOL=="XAUI") ? "SLAVE" :
                                                     (CH2_PROTOCOL=="CUSTOMERIZEDx2" || CH2_PROTOCOL=="PCIEx2") ? "SLAVE" : "MASTER";
localparam   integer PCS_CH0_MASTER_CHECK_OFFSET   = 4;               
localparam   integer PCS_CH1_MASTER_CHECK_OFFSET   = 4;               
localparam   integer PCS_CH2_MASTER_CHECK_OFFSET   = 4;               
localparam   integer PCS_CH3_MASTER_CHECK_OFFSET   = 4;               
localparam   integer PCS_CH0_DELAY_SET             = 3;               
localparam   integer PCS_CH1_DELAY_SET             = 2; //to be done for CH0 PCIEx2               
localparam   integer PCS_CH2_DELAY_SET             = (CH2_PROTOCOL=="CUSTOMERIZEDx2") ? 3 : 1;               
localparam   integer PCS_CH3_DELAY_SET             = (CH2_PROTOCOL=="CUSTOMERIZEDx2") ? 2 : 0; //to be done for CH2 PCIEx2               
localparam           PCS_CH0_SEACH_OFFSET          = CH0_RXPCS_BONDING_RANGE;         
localparam           PCS_CH1_SEACH_OFFSET          = CH1_RXPCS_BONDING_RANGE;         
localparam           PCS_CH2_SEACH_OFFSET          = CH2_RXPCS_BONDING_RANGE;         
localparam           PCS_CH3_SEACH_OFFSET          = CH3_RXPCS_BONDING_RANGE;         
localparam   integer PCS_CH0_CEB_RAPIDLS_MMAX      = 5;         
localparam   integer PCS_CH1_CEB_RAPIDLS_MMAX      = 5;         
localparam   integer PCS_CH2_CEB_RAPIDLS_MMAX      = 5;         
localparam   integer PCS_CH3_CEB_RAPIDLS_MMAX      = 5;         
localparam           PCS_CH0_REG_TX2RX_PLOOP_EN    = CH0_DEBUG_BUS ;//TRUE, FALSE                                                                  
localparam           PCS_CH1_REG_TX2RX_PLOOP_EN    = CH1_DEBUG_BUS ;//TRUE, FALSE                                                                  
localparam           PCS_CH2_REG_TX2RX_PLOOP_EN    = CH2_DEBUG_BUS ;//TRUE, FALSE                                                                  
localparam           PCS_CH3_REG_TX2RX_PLOOP_EN    = CH3_DEBUG_BUS ;//TRUE, FALSE                                                                  
localparam           PCS_CH0_REG_TX2RX_SLOOP_EN    = CH0_DEBUG_BUS ;//TRUE, FALSE                                                                  
localparam           PCS_CH1_REG_TX2RX_SLOOP_EN    = CH1_DEBUG_BUS ;//TRUE, FALSE                                                                  
localparam           PCS_CH2_REG_TX2RX_SLOOP_EN    = CH2_DEBUG_BUS ;//TRUE, FALSE                                                                  
localparam           PCS_CH3_REG_TX2RX_SLOOP_EN    = CH3_DEBUG_BUS ;//TRUE, FALSE                                                                  
localparam           PCS_CH0_REG_RX2TX_PLOOP_EN    = CH0_DEBUG_BUS ;//TRUE, FALSE                                                                  
localparam           PCS_CH1_REG_RX2TX_PLOOP_EN    = CH1_DEBUG_BUS ;//TRUE, FALSE                                                                  
localparam           PCS_CH2_REG_RX2TX_PLOOP_EN    = CH2_DEBUG_BUS ;//TRUE, FALSE                                                                  
localparam           PCS_CH3_REG_RX2TX_PLOOP_EN    = CH3_DEBUG_BUS ;//TRUE, FALSE                                                                  

localparam           PMA_CH0_REG_TX_BUSWIDTH_OW    = "ENABLE";       
localparam           PMA_CH1_REG_TX_BUSWIDTH_OW    = "ENABLE";       
localparam           PMA_CH2_REG_TX_BUSWIDTH_OW    = "ENABLE";       
localparam           PMA_CH3_REG_TX_BUSWIDTH_OW    = "ENABLE";       
localparam           PMA_CH0_REG_RX_BUSWIDTH_EN    = "TRUE";       
localparam           PMA_CH1_REG_RX_BUSWIDTH_EN    = "TRUE";       
localparam           PMA_CH2_REG_RX_BUSWIDTH_EN    = "TRUE";       
localparam           PMA_CH3_REG_RX_BUSWIDTH_EN    = "TRUE";       
localparam   integer PMA_CH0_REG_RX_TERM_MODE_CTRL = CH0_RXPMA_RTERM;
localparam   integer PMA_CH1_REG_RX_TERM_MODE_CTRL = CH1_RXPMA_RTERM;
localparam   integer PMA_CH2_REG_RX_TERM_MODE_CTRL = CH2_RXPMA_RTERM;
localparam   integer PMA_CH3_REG_RX_TERM_MODE_CTRL = CH3_RXPMA_RTERM;
localparam           PMA_CH0_REG_RX_HIGHZ          = "FALSE";       
localparam           PMA_CH1_REG_RX_HIGHZ          = "FALSE";       
localparam           PMA_CH2_REG_RX_HIGHZ          = "FALSE";       
localparam           PMA_CH3_REG_RX_HIGHZ          = "FALSE";       
localparam           PMA_CH0_REG_RX_HIGHZ_EN       = "FALSE";       
localparam           PMA_CH1_REG_RX_HIGHZ_EN       = "FALSE";       
localparam           PMA_CH2_REG_RX_HIGHZ_EN       = "FALSE";       
localparam           PMA_CH3_REG_RX_HIGHZ_EN       = "FALSE";       
localparam           PMA_CH0_REG_CDR_LOCK_TIMER    = (CH0_PROTOCOL=="PCIEx1" || CH0_PROTOCOL=="PCIEx2" || CH0_PROTOCOL=="PCIEx4") ? "1_2U" : "25_6U";
localparam           PMA_CH1_REG_CDR_LOCK_TIMER    = (CH1_PROTOCOL=="PCIEx1" || CH1_PROTOCOL=="PCIEx2" || CH1_PROTOCOL=="PCIEx4") ? "1_2U" : "25_6U";
localparam           PMA_CH2_REG_CDR_LOCK_TIMER    = (CH2_PROTOCOL=="PCIEx1" || CH2_PROTOCOL=="PCIEx2" || CH2_PROTOCOL=="PCIEx4") ? "1_2U" : "25_6U";
localparam           PMA_CH3_REG_CDR_LOCK_TIMER    = (CH3_PROTOCOL=="PCIEx1" || CH3_PROTOCOL=="PCIEx2" || CH3_PROTOCOL=="PCIEx4") ? "1_2U" : "25_6U";
localparam           PMA_CH0_REG_TX_PD_POST        = (CH0_POST_CURSOR_EN=="TRUE" || CH0_FFE_CTRL_EN=="TRUE") ? "ON" : "OFF";
localparam           PMA_CH1_REG_TX_PD_POST        = (CH1_POST_CURSOR_EN=="TRUE" || CH1_FFE_CTRL_EN=="TRUE") ? "ON" : "OFF";
localparam           PMA_CH2_REG_TX_PD_POST        = (CH2_POST_CURSOR_EN=="TRUE" || CH2_FFE_CTRL_EN=="TRUE") ? "ON" : "OFF";
localparam           PMA_CH3_REG_TX_PD_POST        = (CH3_POST_CURSOR_EN=="TRUE" || CH3_FFE_CTRL_EN=="TRUE") ? "ON" : "OFF";
localparam   integer PMA_CH0_REG_CFG_POST          = CH0_POST_CURSOR_EMPHASIS;       
localparam   integer PMA_CH1_REG_CFG_POST          = CH1_POST_CURSOR_EMPHASIS;       
localparam   integer PMA_CH2_REG_CFG_POST          = CH2_POST_CURSOR_EMPHASIS;       
localparam   integer PMA_CH3_REG_CFG_POST          = CH3_POST_CURSOR_EMPHASIS;       
localparam   integer PMA_CH0_REG_CFG_POST1         = CH0_POST1_CURSOR_EMPHASIS;       
localparam   integer PMA_CH1_REG_CFG_POST1         = CH1_POST1_CURSOR_EMPHASIS;       
localparam   integer PMA_CH2_REG_CFG_POST1         = CH2_POST1_CURSOR_EMPHASIS;       
localparam   integer PMA_CH3_REG_CFG_POST1         = CH3_POST1_CURSOR_EMPHASIS;       
localparam   integer PMA_CH0_REG_CFG_POST2         = CH0_POST2_CURSOR_EMPHASIS;       
localparam   integer PMA_CH1_REG_CFG_POST2         = CH1_POST2_CURSOR_EMPHASIS;       
localparam   integer PMA_CH2_REG_CFG_POST2         = CH2_POST2_CURSOR_EMPHASIS;       
localparam   integer PMA_CH3_REG_CFG_POST2         = CH3_POST2_CURSOR_EMPHASIS;       

localparam           PMA_PLL0_REG_REFCLK_SEL           = (PLL0_REF_SEL=="Fabric_REFCK0" || PLL0_REF_SEL=="Fabric_REFCK1") ? "TRUE" : "FALSE";         
localparam           PMA_PLL1_REG_REFCLK_SEL           = (PLL1_REF_SEL=="Fabric_REFCK0" || PLL1_REF_SEL=="Fabric_REFCK1") ? "TRUE" : "FALSE";         
localparam           PMA_PLL0_REG_PLL_REFCLK_CML_SEL   = (PLL0_REF_SEL=="Diff_REFCK1") ? 1 : 0;
localparam           PMA_PLL1_REG_PLL_REFCLK_CML_SEL   = (PLL1_REF_SEL=="Diff_REFCK0" && PLL1_EN=="TRUE") ? 1 : 0;
localparam           PMA_PLL0_REG_REFCLK_OUT_PD        = (PLL1_REF_SEL=="Diff_REFCK0" && PLL1_EN=="TRUE") ? "ON" : "OFF";
localparam           PMA_PLL1_REG_REFCLK_OUT_PD        = (PLL0_REF_SEL=="Diff_REFCK1") ? "ON" : "OFF";

localparam           PARM_PLL0_POWERUP                  = "ON";         
localparam           PMA_PLL0_REG_PLL_CLKBUF_PD_LEFT    = "ON";         
localparam           PMA_PLL0_REG_PLL_CLKBUF_PD_RIGHT   = (CH2_TX_PLL_SEL=="PLL0" && CH3_TX_PLL_SEL=="PLL0") ? "ON" : "OFF";
localparam           PMA_PLL0_REG_PLL_LOCKDET_MODE      = "FALSE";

            
localparam   integer PMA_PLL0_REG_RESERVED_167_160      = PLL0_M==2  ? 8'd1 : 8'd0;
localparam           PMA_PLL0_REG_FBDIVA_5_EN           = PLL0_N1==5 ? "TRUE" : "FALSE";
localparam   integer PMA_PLL0_REG_FBDIVB                = PLL0_N2==2 ? 2'b00 : 
                                                          PLL0_N2==4 ? 2'b10 : 2'b01;
                                            
localparam           PARM_PLL1_POWERUP                  = ((PLL_NUM==2 && PLL1_EN=="TRUE") || PLL0_REF_SEL=="Diff_REFCK1") ? "ON" : "OFF";  
localparam           PMA_PLL1_REG_PLL_POWERDOWN_OW      = (PLL0_REF_SEL=="Diff_REFCK1") ? "ENABLE" : "DISABLE";
localparam           PMA_PLL1_REG_PLL_CLKBUF_PD_LEFT    = (CH2_TX_PLL_SEL=="PLL1" || CH3_TX_PLL_SEL=="PLL1") ? "ON" : "OFF";
localparam           PMA_PLL1_REG_PLL_CLKBUF_PD_RIGHT   = "OFF";         
localparam           PMA_PLL1_REG_PLL_LOCKDET_MODE      = "FALSE";      
            
localparam   integer PMA_PLL1_REG_RESERVED_167_160      = PLL1_M==2  ? 8'd1 : 8'd0;
localparam           PMA_PLL1_REG_FBDIVA_5_EN           = PLL1_N1==5 ? "TRUE" : "FALSE";
localparam   integer PMA_PLL1_REG_FBDIVB                = PLL1_N2==2 ? 2'b00 : 
                                                          PLL1_N2==4 ? 2'b10 : 2'b01;

//*******************************************************************************************************************
localparam PCS_CH0_TX_BYPASS_ENC  =  CH0_TDATA_WIDTH_TYPE == "8b10b_8bit"   ? "FALSE" :
                                    CH0_TDATA_WIDTH_TYPE == "8b10b_16bit"  ? "FALSE" :
                                    CH0_TDATA_WIDTH_TYPE == "8b10b_32bit"  ? "FALSE" : "TRUE";
localparam PCS_CH1_TX_BYPASS_ENC  =  CH1_TDATA_WIDTH_TYPE == "8b10b_8bit"   ? "FALSE" :
                                    CH1_TDATA_WIDTH_TYPE == "8b10b_16bit"  ? "FALSE" :
                                    CH1_TDATA_WIDTH_TYPE == "8b10b_32bit"  ? "FALSE" : "TRUE";
localparam PCS_CH2_TX_BYPASS_ENC  =  CH2_TDATA_WIDTH_TYPE == "8b10b_8bit"   ? "FALSE" :
                                    CH2_TDATA_WIDTH_TYPE == "8b10b_16bit"  ? "FALSE" :
                                    CH2_TDATA_WIDTH_TYPE == "8b10b_32bit"  ? "FALSE" : "TRUE";
localparam PCS_CH3_TX_BYPASS_ENC  =  CH3_TDATA_WIDTH_TYPE == "8b10b_8bit"   ? "FALSE" :
                                    CH3_TDATA_WIDTH_TYPE == "8b10b_16bit"  ? "FALSE" :
                                    CH3_TDATA_WIDTH_TYPE == "8b10b_32bit"  ? "FALSE" : "TRUE";                                                                                                            
                                    
localparam PCS_CH0_TX_BYPASS_GEAR = CH0_TDATA_WIDTH_TYPE == "32bit_only"  ? "FALSE" :
                                    CH0_TDATA_WIDTH_TYPE == "40bit_only"  ? "FALSE" :
                                    CH0_TDATA_WIDTH_TYPE == "8b10b_32bit" ? "FALSE" :
                                    CH0_TDATA_WIDTH_TYPE == "64b66b_16bit"? "FALSE" :
                                    CH0_TDATA_WIDTH_TYPE == "64b66b_32bit"? "FALSE" : 
                                    CH0_TDATA_WIDTH_TYPE == "64b67b_16bit"? "FALSE" : 
                                    CH0_TDATA_WIDTH_TYPE == "64b67b_32bit"? "FALSE" : "TRUE";
localparam PCS_CH1_TX_BYPASS_GEAR = CH1_TDATA_WIDTH_TYPE == "32bit_only"  ? "FALSE" :
                                    CH1_TDATA_WIDTH_TYPE == "40bit_only"  ? "FALSE" :
                                    CH1_TDATA_WIDTH_TYPE == "8b10b_32bit" ? "FALSE" :
                                    CH1_TDATA_WIDTH_TYPE == "64b66b_16bit"? "FALSE" :
                                    CH1_TDATA_WIDTH_TYPE == "64b66b_32bit"? "FALSE" : 
                                    CH1_TDATA_WIDTH_TYPE == "64b67b_16bit"? "FALSE" : 
                                    CH1_TDATA_WIDTH_TYPE == "64b67b_32bit"? "FALSE" : "TRUE";
localparam PCS_CH2_TX_BYPASS_GEAR = CH2_TDATA_WIDTH_TYPE == "32bit_only"  ? "FALSE" :
                                    CH2_TDATA_WIDTH_TYPE == "40bit_only"  ? "FALSE" :
                                    CH2_TDATA_WIDTH_TYPE == "8b10b_32bit" ? "FALSE" :
                                    CH2_TDATA_WIDTH_TYPE == "64b66b_16bit"? "FALSE" :
                                    CH2_TDATA_WIDTH_TYPE == "64b66b_32bit"? "FALSE" : 
                                    CH2_TDATA_WIDTH_TYPE == "64b67b_16bit"? "FALSE" : 
                                    CH2_TDATA_WIDTH_TYPE == "64b67b_32bit"? "FALSE" : "TRUE";
localparam PCS_CH3_TX_BYPASS_GEAR = CH3_TDATA_WIDTH_TYPE == "32bit_only"  ? "FALSE" :
                                    CH3_TDATA_WIDTH_TYPE == "40bit_only"  ? "FALSE" :
                                    CH3_TDATA_WIDTH_TYPE == "8b10b_32bit" ? "FALSE" :
                                    CH3_TDATA_WIDTH_TYPE == "64b66b_16bit"? "FALSE" :
                                    CH3_TDATA_WIDTH_TYPE == "64b66b_32bit"? "FALSE" : 
                                    CH3_TDATA_WIDTH_TYPE == "64b67b_16bit"? "FALSE" : 
                                    CH3_TDATA_WIDTH_TYPE == "64b67b_32bit"? "FALSE" : "TRUE";

localparam PCS_CH0_TX_PCS_CLK_EN_SEL = TX0_CLK2_FR_CORE == "TRUE"  ? "FALSE" :
                                      CH0_TDATA_WIDTH_TYPE == "32bit_only"  ? "TRUE" :        
                                      CH0_TDATA_WIDTH_TYPE == "40bit_only"  ? "TRUE" :        
                                      CH0_TDATA_WIDTH_TYPE == "8b10b_32bit" ? "TRUE" : 
                                      CH0_TDATA_WIDTH_TYPE == "64b66b_32bit"? "TRUE" :
                                      CH0_TDATA_WIDTH_TYPE == "64b67b_32bit"? "TRUE" : "FALSE";
localparam PCS_CH1_TX_PCS_CLK_EN_SEL = TX1_CLK2_FR_CORE == "TRUE"  ? "FALSE" :
                                      CH1_TDATA_WIDTH_TYPE == "32bit_only"  ? "TRUE" :        
                                      CH1_TDATA_WIDTH_TYPE == "40bit_only"  ? "TRUE" :        
                                      CH1_TDATA_WIDTH_TYPE == "8b10b_32bit" ? "TRUE" :
                                      CH1_TDATA_WIDTH_TYPE == "64b66b_32bit"? "TRUE" :
                                      CH1_TDATA_WIDTH_TYPE == "64b67b_32bit"? "TRUE" : "FALSE";
localparam PCS_CH2_TX_PCS_CLK_EN_SEL = TX2_CLK2_FR_CORE == "TRUE"  ? "FALSE" :
                                      CH2_TDATA_WIDTH_TYPE == "32bit_only"  ? "TRUE" :        
                                      CH2_TDATA_WIDTH_TYPE == "40bit_only"  ? "TRUE" :        
                                      CH2_TDATA_WIDTH_TYPE == "8b10b_32bit" ? "TRUE" :
                                      CH2_TDATA_WIDTH_TYPE == "64b66b_32bit"? "TRUE" :
                                      CH2_TDATA_WIDTH_TYPE == "64b67b_32bit"? "TRUE" : "FALSE";
localparam PCS_CH3_TX_PCS_CLK_EN_SEL = TX3_CLK2_FR_CORE == "TRUE"  ? "FALSE" :
                                      CH3_TDATA_WIDTH_TYPE == "32bit_only"  ? "TRUE" :        
                                      CH3_TDATA_WIDTH_TYPE == "40bit_only"  ? "TRUE" :        
                                      CH3_TDATA_WIDTH_TYPE == "8b10b_32bit" ? "TRUE" :                                                                      
                                      CH3_TDATA_WIDTH_TYPE == "64b66b_32bit"? "TRUE" :
                                      CH3_TDATA_WIDTH_TYPE == "64b67b_32bit"? "TRUE" : "FALSE";
                                      
localparam PCS_CH0_TX_BRIDGE_TCLK_SEL = TX0_CLK2_FR_CORE == "TRUE"  ? "TCLK2" :  "TCLK";       
localparam PCS_CH1_TX_BRIDGE_TCLK_SEL = TX1_CLK2_FR_CORE == "TRUE"  ? "TCLK2" :  "TCLK";       
localparam PCS_CH2_TX_BRIDGE_TCLK_SEL = TX2_CLK2_FR_CORE == "TRUE"  ? "TCLK2" :  "TCLK";       
localparam PCS_CH3_TX_BRIDGE_TCLK_SEL = TX3_CLK2_FR_CORE == "TRUE"  ? "TCLK2" :  "TCLK";       

localparam PCS_CH0_TX_PCS_TCLK_SEL = "PMA_TCLK";
localparam PCS_CH1_TX_PCS_TCLK_SEL = "PMA_TCLK";
localparam PCS_CH2_TX_PCS_TCLK_SEL = "PMA_TCLK";
localparam PCS_CH3_TX_PCS_TCLK_SEL = "PMA_TCLK";

localparam PCS_CH0_TX_GEAR_TCLK_EN_SEL = TX0_CLK2_FR_CORE == "TRUE"  ? "TRUE" :  "FALSE";       
localparam PCS_CH1_TX_GEAR_TCLK_EN_SEL = TX1_CLK2_FR_CORE == "TRUE"  ? "TRUE" :  "FALSE";       
localparam PCS_CH2_TX_GEAR_TCLK_EN_SEL = TX2_CLK2_FR_CORE == "TRUE"  ? "TRUE" :  "FALSE";       
localparam PCS_CH3_TX_GEAR_TCLK_EN_SEL = TX3_CLK2_FR_CORE == "TRUE"  ? "TRUE" :  "FALSE";       
                                      
localparam PCS_CH0_TX_GEAR_TCLK_SEL = TX0_CLK2_FR_CORE == "TRUE"  ? "TCLK2" :  "PMA_TCLK"; 
localparam PCS_CH1_TX_GEAR_TCLK_SEL = TX1_CLK2_FR_CORE == "TRUE"  ? "TCLK2" :  "PMA_TCLK"; 
localparam PCS_CH2_TX_GEAR_TCLK_SEL = TX2_CLK2_FR_CORE == "TRUE"  ? "TCLK2" :  "PMA_TCLK"; 
localparam PCS_CH3_TX_GEAR_TCLK_SEL = TX3_CLK2_FR_CORE == "TRUE"  ? "TCLK2" :  "PMA_TCLK"; 

localparam PCS_CH0_TX_BRIDGE_GEAR_SEL = TX0_CLK2_FR_CORE == "TRUE"  ? "TRUE" :  "FALSE"; 
localparam PCS_CH1_TX_BRIDGE_GEAR_SEL = TX1_CLK2_FR_CORE == "TRUE"  ? "TRUE" :  "FALSE"; 
localparam PCS_CH2_TX_BRIDGE_GEAR_SEL = TX2_CLK2_FR_CORE == "TRUE"  ? "TRUE" :  "FALSE"; 
localparam PCS_CH3_TX_BRIDGE_GEAR_SEL = TX3_CLK2_FR_CORE == "TRUE"  ? "TRUE" :  "FALSE"; 

localparam PCS_CH0_TX_BYPASS_BRIDGE_UINT = "FALSE";
localparam PCS_CH1_TX_BYPASS_BRIDGE_UINT = "FALSE";
localparam PCS_CH2_TX_BYPASS_BRIDGE_UINT = "FALSE";
localparam PCS_CH3_TX_BYPASS_BRIDGE_UINT = "FALSE";

localparam PCS_CH0_TX_BYPASS_BRIDGE_FIFO = "FALSE";
localparam PCS_CH1_TX_BYPASS_BRIDGE_FIFO = "FALSE";
localparam PCS_CH2_TX_BYPASS_BRIDGE_FIFO = "FALSE";
localparam PCS_CH3_TX_BYPASS_BRIDGE_FIFO = "FALSE";

localparam PCS_CH0_TX_TCLK2FABRIC_SEL 	= CH0_TDATA_WIDTH_TYPE == "32bit_only"  ? "TRUE" :
                                          CH0_TDATA_WIDTH_TYPE == "40bit_only"  ? "TRUE" :
                                          CH0_TDATA_WIDTH_TYPE == "8b10b_32bit" ? "TRUE" :
                                          CH0_TDATA_WIDTH_TYPE == "64b66b_32bit"? "TRUE" :
                                          CH0_TDATA_WIDTH_TYPE == "64b67b_32bit"? "TRUE" : "FALSE";
localparam PCS_CH1_TX_TCLK2FABRIC_SEL 	= CH1_TDATA_WIDTH_TYPE == "32bit_only"  ? "TRUE" :
                                          CH1_TDATA_WIDTH_TYPE == "40bit_only"  ? "TRUE" :
                                          CH1_TDATA_WIDTH_TYPE == "8b10b_32bit" ? "TRUE" :
                                          CH1_TDATA_WIDTH_TYPE == "64b66b_32bit"? "TRUE" :
                                          CH1_TDATA_WIDTH_TYPE == "64b67b_32bit"? "TRUE" : "FALSE";
localparam PCS_CH2_TX_TCLK2FABRIC_SEL 	= CH2_TDATA_WIDTH_TYPE == "32bit_only"  ? "TRUE" :
                                          CH2_TDATA_WIDTH_TYPE == "40bit_only"  ? "TRUE" :
                                          CH2_TDATA_WIDTH_TYPE == "8b10b_32bit" ? "TRUE" :
                                          CH2_TDATA_WIDTH_TYPE == "64b66b_32bit"? "TRUE" :
                                          CH2_TDATA_WIDTH_TYPE == "64b67b_32bit"? "TRUE" : "FALSE";
localparam PCS_CH3_TX_TCLK2FABRIC_SEL 	= CH3_TDATA_WIDTH_TYPE == "32bit_only"  ? "TRUE" :
                                          CH3_TDATA_WIDTH_TYPE == "40bit_only"  ? "TRUE" :
                                          CH3_TDATA_WIDTH_TYPE == "8b10b_32bit" ? "TRUE" :
                                          CH3_TDATA_WIDTH_TYPE == "64b66b_32bit"? "TRUE" :
                                          CH3_TDATA_WIDTH_TYPE == "64b67b_32bit"? "TRUE" : "FALSE";
//
localparam PCS_CH0_TX_OUTZZ =  "FALSE";
localparam PCS_CH1_TX_OUTZZ =  "FALSE";  
localparam PCS_CH2_TX_OUTZZ =  "FALSE";
localparam PCS_CH3_TX_OUTZZ =  "FALSE";                     

localparam PCS_CH0_DATA_WIDTH_MODE 	= CH0_TDATA_WIDTH_TYPE == "8bit_only"   ? "X8"  :
                                      CH0_TDATA_WIDTH_TYPE == "10bit_only"  ? "X10" :
                                      CH0_TDATA_WIDTH_TYPE == "8b10b_8bit"  ? "X10" :
                                      CH0_TDATA_WIDTH_TYPE == "16bit_only"  ? "X16" :
                                      CH0_TDATA_WIDTH_TYPE == "20bit_only"  ? "X20" :
                                      CH0_TDATA_WIDTH_TYPE == "8b10b_16bit" ? "X20" :
                                      CH0_TDATA_WIDTH_TYPE == "32bit_only"  ? "X16" :
                                      CH0_TDATA_WIDTH_TYPE == "64b66b_16bit"? "X16" : 
                                      CH0_TDATA_WIDTH_TYPE == "64b66b_32bit"? "X16" : 
                                      CH0_TDATA_WIDTH_TYPE == "64b67b_16bit"? "X16" :
                                      CH0_TDATA_WIDTH_TYPE == "64b67b_32bit"? "X16" : "X20";
localparam PCS_CH1_DATA_WIDTH_MODE 	= CH1_TDATA_WIDTH_TYPE == "8bit_only"   ? "X8"  :
                                      CH1_TDATA_WIDTH_TYPE == "10bit_only"  ? "X10" :
                                      CH1_TDATA_WIDTH_TYPE == "8b10b_8bit"  ? "X10" :
                                      CH1_TDATA_WIDTH_TYPE == "16bit_only"  ? "X16" :
                                      CH1_TDATA_WIDTH_TYPE == "20bit_only"  ? "X20" :
                                      CH1_TDATA_WIDTH_TYPE == "8b10b_16bit" ? "X20" :
                                      CH1_TDATA_WIDTH_TYPE == "32bit_only"  ? "X16" :
                                      CH1_TDATA_WIDTH_TYPE == "64b66b_16bit"? "X16" : 
                                      CH1_TDATA_WIDTH_TYPE == "64b66b_32bit"? "X16" : 
                                      CH1_TDATA_WIDTH_TYPE == "64b67b_16bit"? "X16" :
                                      CH1_TDATA_WIDTH_TYPE == "64b67b_32bit"? "X16" : "X20";
localparam PCS_CH2_DATA_WIDTH_MODE 	= CH2_TDATA_WIDTH_TYPE == "8bit_only"   ? "X8"  :
                                      CH2_TDATA_WIDTH_TYPE == "10bit_only"  ? "X10" :
                                      CH2_TDATA_WIDTH_TYPE == "8b10b_8bit"  ? "X10" :
                                      CH2_TDATA_WIDTH_TYPE == "16bit_only"  ? "X16" :
                                      CH2_TDATA_WIDTH_TYPE == "20bit_only"  ? "X20" :
                                      CH2_TDATA_WIDTH_TYPE == "8b10b_16bit" ? "X20" :
                                      CH2_TDATA_WIDTH_TYPE == "32bit_only"  ? "X16" :                                   
                                      CH2_TDATA_WIDTH_TYPE == "64b66b_16bit"? "X16" : 
                                      CH2_TDATA_WIDTH_TYPE == "64b66b_32bit"? "X16" : 
                                      CH2_TDATA_WIDTH_TYPE == "64b67b_16bit"? "X16" :
                                      CH2_TDATA_WIDTH_TYPE == "64b67b_32bit"? "X16" : "X20";
localparam PCS_CH3_DATA_WIDTH_MODE 	= CH3_TDATA_WIDTH_TYPE == "8bit_only"   ? "X8"  :
                                      CH3_TDATA_WIDTH_TYPE == "10bit_only"  ? "X10" :
                                      CH3_TDATA_WIDTH_TYPE == "8b10b_8bit"  ? "X10" :
                                      CH3_TDATA_WIDTH_TYPE == "16bit_only"  ? "X16" :
                                      CH3_TDATA_WIDTH_TYPE == "20bit_only"  ? "X20" :
                                      CH3_TDATA_WIDTH_TYPE == "8b10b_16bit" ? "X20" :
                                      CH3_TDATA_WIDTH_TYPE == "32bit_only"  ? "X16" :                                                                          
                                      CH3_TDATA_WIDTH_TYPE == "64b66b_16bit"? "X16" : 
                                      CH3_TDATA_WIDTH_TYPE == "64b66b_32bit"? "X16" : 
                                      CH3_TDATA_WIDTH_TYPE == "64b67b_16bit"? "X16" :
                                      CH3_TDATA_WIDTH_TYPE == "64b67b_32bit"? "X16" : "X20";
                                         
localparam PCS_CH0_ENC_DUAL = CH0_TDATA_WIDTH_TYPE == "8b10b_8bit" ? "FALSE" : "TRUE";
localparam PCS_CH1_ENC_DUAL = CH1_TDATA_WIDTH_TYPE == "8b10b_8bit" ? "FALSE" : "TRUE";
localparam PCS_CH2_ENC_DUAL = CH2_TDATA_WIDTH_TYPE == "8b10b_8bit" ? "FALSE" : "TRUE";
localparam PCS_CH3_ENC_DUAL = CH3_TDATA_WIDTH_TYPE == "8b10b_8bit" ? "FALSE" : "TRUE";

localparam PCS_CH0_TX_GEAR_SPLIT =CH0_TDATA_WIDTH_TYPE == "32bit_only"  ? "TRUE" :
                                  CH0_TDATA_WIDTH_TYPE == "40bit_only"  ? "TRUE" :
                                  CH0_TDATA_WIDTH_TYPE == "8b10b_32bit" ? "TRUE" :
                                  CH0_TDATA_WIDTH_TYPE == "64b66b_32bit"? "TRUE" :
                                  CH0_TDATA_WIDTH_TYPE == "64b67b_32bit"? "TRUE" : "FALSE";
localparam PCS_CH1_TX_GEAR_SPLIT =CH1_TDATA_WIDTH_TYPE == "32bit_only"  ? "TRUE" :
                                  CH1_TDATA_WIDTH_TYPE == "40bit_only"  ? "TRUE" :
                                  CH1_TDATA_WIDTH_TYPE == "8b10b_32bit" ? "TRUE" : 
                                  CH1_TDATA_WIDTH_TYPE == "64b66b_32bit"? "TRUE" :
                                  CH1_TDATA_WIDTH_TYPE == "64b67b_32bit"? "TRUE" : "FALSE";
localparam PCS_CH2_TX_GEAR_SPLIT =CH2_TDATA_WIDTH_TYPE == "32bit_only"  ? "TRUE" :
                                  CH2_TDATA_WIDTH_TYPE == "40bit_only"  ? "TRUE" :
                                  CH2_TDATA_WIDTH_TYPE == "8b10b_32bit" ? "TRUE" : 
                                  CH2_TDATA_WIDTH_TYPE == "64b66b_32bit"? "TRUE" :
                                  CH2_TDATA_WIDTH_TYPE == "64b67b_32bit"? "TRUE" : "FALSE";
localparam PCS_CH3_TX_GEAR_SPLIT =CH3_TDATA_WIDTH_TYPE == "32bit_only"  ? "TRUE" :
                                  CH3_TDATA_WIDTH_TYPE == "40bit_only"  ? "TRUE" :
                                  CH3_TDATA_WIDTH_TYPE == "8b10b_32bit" ? "TRUE" : 
                                  CH3_TDATA_WIDTH_TYPE == "64b66b_32bit"? "TRUE" :
                                  CH3_TDATA_WIDTH_TYPE == "64b67b_32bit"? "TRUE" : "FALSE";

localparam PMA_CH0_TXDATA_WIDTH  = CH0_TDATA_WIDTH_TYPE == "8bit_only"   ? "8BIT"  :
                                  CH0_TDATA_WIDTH_TYPE == "10bit_only"  ? "10BIT" :
                                  CH0_TDATA_WIDTH_TYPE == "8b10b_8bit"  ? "10BIT" :
                                  CH0_TDATA_WIDTH_TYPE == "16bit_only"  ? "16BIT" :
                                  CH0_TDATA_WIDTH_TYPE == "20bit_only"  ? "20BIT" :
                                  CH0_TDATA_WIDTH_TYPE == "8b10b_16bit" ? "20BIT" :
                                  CH0_TDATA_WIDTH_TYPE == "32bit_only"  ? "16BIT" :
                                  CH0_TDATA_WIDTH_TYPE == "64b66b_16bit"? "16BIT" : 
                                  CH0_TDATA_WIDTH_TYPE == "64b66b_32bit"? "16BIT" : 
                                  CH0_TDATA_WIDTH_TYPE == "64b67b_16bit"? "16BIT" : 
                                  CH0_TDATA_WIDTH_TYPE == "64b67b_32bit"? "16BIT" : "20BIT";
localparam PMA_CH1_TXDATA_WIDTH  =CH1_TDATA_WIDTH_TYPE == "8bit_only"   ? "8BIT"  :
                                  CH1_TDATA_WIDTH_TYPE == "10bit_only"  ? "10BIT" :
                                  CH1_TDATA_WIDTH_TYPE == "8b10b_8bit"  ? "10BIT" :
                                  CH1_TDATA_WIDTH_TYPE == "16bit_only"  ? "16BIT" :
                                  CH1_TDATA_WIDTH_TYPE == "20bit_only"  ? "20BIT" :
                                  CH1_TDATA_WIDTH_TYPE == "8b10b_16bit" ? "20BIT" :
                                  CH1_TDATA_WIDTH_TYPE == "32bit_only"  ? "16BIT" : 
                                  CH1_TDATA_WIDTH_TYPE == "64b66b_16bit"? "16BIT" : 
                                  CH1_TDATA_WIDTH_TYPE == "64b66b_32bit"? "16BIT" : 
                                  CH1_TDATA_WIDTH_TYPE == "64b67b_16bit"? "16BIT" : 
                                  CH1_TDATA_WIDTH_TYPE == "64b67b_32bit"? "16BIT" : "20BIT";
localparam PMA_CH2_TXDATA_WIDTH  =CH2_TDATA_WIDTH_TYPE == "8bit_only"   ? "8BIT"  :
                                  CH2_TDATA_WIDTH_TYPE == "10bit_only"  ? "10BIT" :
                                  CH2_TDATA_WIDTH_TYPE == "8b10b_8bit"  ? "10BIT" :
                                  CH2_TDATA_WIDTH_TYPE == "16bit_only"  ? "16BIT" :
                                  CH2_TDATA_WIDTH_TYPE == "20bit_only"  ? "20BIT" :
                                  CH2_TDATA_WIDTH_TYPE == "8b10b_16bit" ? "20BIT" :
                                  CH2_TDATA_WIDTH_TYPE == "32bit_only"  ? "16BIT" :
                                  CH2_TDATA_WIDTH_TYPE == "64b66b_16bit"? "16BIT" : 
                                  CH2_TDATA_WIDTH_TYPE == "64b66b_32bit"? "16BIT" : 
                                  CH2_TDATA_WIDTH_TYPE == "64b67b_16bit"? "16BIT" : 
                                  CH2_TDATA_WIDTH_TYPE == "64b67b_32bit"? "16BIT" : "20BIT";
localparam PMA_CH3_TXDATA_WIDTH  =CH3_TDATA_WIDTH_TYPE == "8bit_only"   ? "8BIT"  :
                                  CH3_TDATA_WIDTH_TYPE == "10bit_only"  ? "10BIT" :
                                  CH3_TDATA_WIDTH_TYPE == "8b10b_8bit"  ? "10BIT" :
                                  CH3_TDATA_WIDTH_TYPE == "16bit_only"  ? "16BIT" :
                                  CH3_TDATA_WIDTH_TYPE == "20bit_only"  ? "20BIT" :
                                  CH3_TDATA_WIDTH_TYPE == "8b10b_16bit" ? "20BIT" :
                                  CH3_TDATA_WIDTH_TYPE == "32bit_only"  ? "16BIT" : 
                                  CH3_TDATA_WIDTH_TYPE == "64b66b_16bit"? "16BIT" : 
                                  CH3_TDATA_WIDTH_TYPE == "64b66b_32bit"? "16BIT" : 
                                  CH3_TDATA_WIDTH_TYPE == "64b67b_16bit"? "16BIT" : 
                                  CH3_TDATA_WIDTH_TYPE == "64b67b_32bit"? "16BIT" : "20BIT";
//
localparam PCS_CH0_TX_64B66B_67B = CH0_TX_ENCODER == "64B66B_transparent" ? "64B_66B"  :
                                   CH0_TX_ENCODER == "64B67B_transparent" ? "64B_67B"  : "NORMAL";
localparam PCS_CH1_TX_64B66B_67B = CH1_TX_ENCODER == "64B66B_transparent" ? "64B_66B"  :
                                   CH1_TX_ENCODER == "64B67B_transparent" ? "64B_67B"  : "NORMAL";
localparam PCS_CH2_TX_64B66B_67B = CH2_TX_ENCODER == "64B66B_transparent" ? "64B_66B"  :
                                   CH2_TX_ENCODER == "64B67B_transparent" ? "64B_67B"  : "NORMAL";
localparam PCS_CH3_TX_64B66B_67B = CH3_TX_ENCODER == "64B66B_transparent" ? "64B_66B"  :
                                   CH3_TX_ENCODER == "64B67B_transparent" ? "64B_67B"  : "NORMAL";
//******************************************************************************************************************
localparam PCS_CH0_BYPASS_DENC  = CH0_RDATA_WIDTH_TYPE == "8b10b_8bit"   ? "FALSE" :
                                 CH0_RDATA_WIDTH_TYPE == "8b10b_16bit"  ? "FALSE" :
                                 CH0_RDATA_WIDTH_TYPE == "8b10b_32bit"  ? "FALSE" : "TRUE";
localparam PCS_CH1_BYPASS_DENC  = CH1_RDATA_WIDTH_TYPE == "8b10b_8bit"   ? "FALSE" :
                                 CH1_RDATA_WIDTH_TYPE == "8b10b_16bit"  ? "FALSE" :
                                 CH1_RDATA_WIDTH_TYPE == "8b10b_32bit"  ? "FALSE" : "TRUE";
localparam PCS_CH2_BYPASS_DENC  = CH2_RDATA_WIDTH_TYPE == "8b10b_8bit"   ? "FALSE" :
                                 CH2_RDATA_WIDTH_TYPE == "8b10b_16bit"  ? "FALSE" :
                                 CH2_RDATA_WIDTH_TYPE == "8b10b_32bit"  ? "FALSE" : "TRUE";
localparam PCS_CH3_BYPASS_DENC  = CH3_RDATA_WIDTH_TYPE == "8b10b_8bit"   ? "FALSE" :
                                 CH3_RDATA_WIDTH_TYPE == "8b10b_16bit"  ? "FALSE" :
                                 CH3_RDATA_WIDTH_TYPE == "8b10b_32bit"  ? "FALSE" : "TRUE";                                                                                                   

localparam PCS_CH0_SAMP_16B     =  CH0_RDATA_WIDTH_TYPE == "8bit_only"   ? "X16" :
                                  CH0_RDATA_WIDTH_TYPE == "16bit_only"  ? "X16" :
                                  CH0_RDATA_WIDTH_TYPE == "32bit_only"  ? "X16" :
                                  CH0_RDATA_WIDTH_TYPE == "64b66b_16bit"? "X16" : 
                                  CH0_RDATA_WIDTH_TYPE == "64b66b_32bit"? "X16" : 
                                  CH0_RDATA_WIDTH_TYPE == "64b67b_16bit"? "X16" : 
                                  CH0_RDATA_WIDTH_TYPE == "64b67b_32bit"? "X16" : "X20";
localparam PCS_CH1_SAMP_16B     =  CH1_RDATA_WIDTH_TYPE == "8bit_only"   ? "X16" :
                                  CH1_RDATA_WIDTH_TYPE == "16bit_only"  ? "X16" :
                                  CH1_RDATA_WIDTH_TYPE == "32bit_only"  ? "X16" : 
                                  CH1_RDATA_WIDTH_TYPE == "64b66b_16bit"? "X16" : 
                                  CH1_RDATA_WIDTH_TYPE == "64b66b_32bit"? "X16" : 
                                  CH1_RDATA_WIDTH_TYPE == "64b67b_16bit"? "X16" : 
                                  CH1_RDATA_WIDTH_TYPE == "64b67b_32bit"? "X16" : "X20";
localparam PCS_CH2_SAMP_16B     =  CH2_RDATA_WIDTH_TYPE == "8bit_only"   ? "X16" :
                                  CH2_RDATA_WIDTH_TYPE == "16bit_only"  ? "X16" :
                                  CH2_RDATA_WIDTH_TYPE == "32bit_only"  ? "X16" :   
                                  CH2_RDATA_WIDTH_TYPE == "64b66b_16bit"? "X16" : 
                                  CH2_RDATA_WIDTH_TYPE == "64b66b_32bit"? "X16" : 
                                  CH2_RDATA_WIDTH_TYPE == "64b67b_16bit"? "X16" : 
                                  CH2_RDATA_WIDTH_TYPE == "64b67b_32bit"? "X16" : "X20";
localparam PCS_CH3_SAMP_16B     =  CH3_RDATA_WIDTH_TYPE == "8bit_only"   ? "X16" :
                                  CH3_RDATA_WIDTH_TYPE == "16bit_only"  ? "X16" :
                                  CH3_RDATA_WIDTH_TYPE == "32bit_only"  ? "X16" :
                                  CH3_RDATA_WIDTH_TYPE == "64b66b_16bit"? "X16" : 
                                  CH3_RDATA_WIDTH_TYPE == "64b66b_32bit"? "X16" : 
                                  CH3_RDATA_WIDTH_TYPE == "64b67b_16bit"? "X16" : 
                                  CH3_RDATA_WIDTH_TYPE == "64b67b_32bit"? "X16" : "X20";
                                                                                                                                    
localparam PCS_CH0_DATA_MODE    =  CH0_RDATA_WIDTH_TYPE == "8bit_only"   ? "X8"  :
                                  CH0_RDATA_WIDTH_TYPE == "10bit_only"  ? "X10" :
                                  CH0_RDATA_WIDTH_TYPE == "8b10b_8bit"  ? "X10" :
                                  CH0_RDATA_WIDTH_TYPE == "16bit_only"  ? "X16" :
                                  CH0_RDATA_WIDTH_TYPE == "20bit_only"  ? "X20" :
                                  CH0_RDATA_WIDTH_TYPE == "8b10b_16bit" ? "X20" :
                                  CH0_RDATA_WIDTH_TYPE == "32bit_only"  ? "X16" :
                                  CH0_RDATA_WIDTH_TYPE == "64b66b_16bit"? "X16" : 
                                  CH0_RDATA_WIDTH_TYPE == "64b66b_32bit"? "X16" : 
                                  CH0_RDATA_WIDTH_TYPE == "64b67b_16bit"? "X16" : 
                                  CH0_RDATA_WIDTH_TYPE == "64b67b_32bit"? "X16" : "X20";
localparam PCS_CH1_DATA_MODE    =  CH1_RDATA_WIDTH_TYPE == "8bit_only"   ? "X8"  :
                                  CH1_RDATA_WIDTH_TYPE == "10bit_only"  ? "X10" :
                                  CH1_RDATA_WIDTH_TYPE == "8b10b_8bit"  ? "X10" :
                                  CH1_RDATA_WIDTH_TYPE == "16bit_only"  ? "X16" :
                                  CH1_RDATA_WIDTH_TYPE == "20bit_only"  ? "X20" :
                                  CH1_RDATA_WIDTH_TYPE == "8b10b_16bit" ? "X20" :
                                  CH1_RDATA_WIDTH_TYPE == "32bit_only"  ? "X16" : 
                                  CH1_RDATA_WIDTH_TYPE == "64b66b_16bit"? "X16" : 
                                  CH1_RDATA_WIDTH_TYPE == "64b66b_32bit"? "X16" : 
                                  CH1_RDATA_WIDTH_TYPE == "64b67b_16bit"? "X16" : 
                                  CH1_RDATA_WIDTH_TYPE == "64b67b_32bit"? "X16" : "X20";
localparam PCS_CH2_DATA_MODE    =  CH2_RDATA_WIDTH_TYPE == "8bit_only"   ? "X8"  :
                                  CH2_RDATA_WIDTH_TYPE == "10bit_only"  ? "X10" :
                                  CH2_RDATA_WIDTH_TYPE == "8b10b_8bit"  ? "X10" :
                                  CH2_RDATA_WIDTH_TYPE == "16bit_only"  ? "X16" :
                                  CH2_RDATA_WIDTH_TYPE == "20bit_only"  ? "X20" :
                                  CH2_RDATA_WIDTH_TYPE == "8b10b_16bit" ? "X20" :
                                  CH2_RDATA_WIDTH_TYPE == "32bit_only"  ? "X16" : 
                                  CH2_RDATA_WIDTH_TYPE == "64b66b_16bit"? "X16" : 
                                  CH2_RDATA_WIDTH_TYPE == "64b66b_32bit"? "X16" : 
                                  CH2_RDATA_WIDTH_TYPE == "64b67b_16bit"? "X16" : 
                                  CH2_RDATA_WIDTH_TYPE == "64b67b_32bit"? "X16" : "X20";
localparam PCS_CH3_DATA_MODE    =  CH3_RDATA_WIDTH_TYPE == "8bit_only"   ? "X8"  :
                                  CH3_RDATA_WIDTH_TYPE == "10bit_only"  ? "X10" :
                                  CH3_RDATA_WIDTH_TYPE == "8b10b_8bit"  ? "X10" :
                                  CH3_RDATA_WIDTH_TYPE == "16bit_only"  ? "X16" :
                                  CH3_RDATA_WIDTH_TYPE == "20bit_only"  ? "X20" :
                                  CH3_RDATA_WIDTH_TYPE == "8b10b_16bit" ? "X20" :
                                  CH3_RDATA_WIDTH_TYPE == "32bit_only"  ? "X16" :
                                  CH3_RDATA_WIDTH_TYPE == "64b66b_16bit"? "X16" : 
                                  CH3_RDATA_WIDTH_TYPE == "64b66b_32bit"? "X16" : 
                                  CH3_RDATA_WIDTH_TYPE == "64b67b_16bit"? "X16" : 
                                  CH3_RDATA_WIDTH_TYPE == "64b67b_32bit"? "X16" : "X20";

localparam PCS_CH0_SPLIT        =  CH0_RDATA_WIDTH_TYPE == "8bit_only"   ? "TRUE" :
                                  CH0_RDATA_WIDTH_TYPE == "10bit_only"   ? "TRUE" :
                                  CH0_RDATA_WIDTH_TYPE == "8b10b_8bit"   ? "TRUE" :
                                  CH0_RDATA_WIDTH_TYPE == "64b66b_16bit" ? "TRUE" :
                                  CH0_RDATA_WIDTH_TYPE == "64b67b_16bit" ? "TRUE" : "FALSE";
localparam PCS_CH1_SPLIT        =  CH1_RDATA_WIDTH_TYPE == "8bit_only"   ? "TRUE" :
                                  CH1_RDATA_WIDTH_TYPE == "10bit_only"   ? "TRUE" :
                                  CH1_RDATA_WIDTH_TYPE == "8b10b_8bit"   ? "TRUE" :
                                  CH1_RDATA_WIDTH_TYPE == "64b66b_16bit" ? "TRUE" :
                                  CH1_RDATA_WIDTH_TYPE == "64b67b_16bit" ? "TRUE" : "FALSE";
localparam PCS_CH2_SPLIT        =  CH2_RDATA_WIDTH_TYPE == "8bit_only"   ? "TRUE" :
                                  CH2_RDATA_WIDTH_TYPE == "10bit_only"   ? "TRUE" :
                                  CH2_RDATA_WIDTH_TYPE == "8b10b_8bit"   ? "TRUE" : 
                                  CH2_RDATA_WIDTH_TYPE == "64b66b_16bit" ? "TRUE" :
                                  CH2_RDATA_WIDTH_TYPE == "64b67b_16bit" ? "TRUE" : "FALSE";
localparam PCS_CH3_SPLIT        =  CH3_RDATA_WIDTH_TYPE == "8bit_only"   ? "TRUE" :
                                  CH3_RDATA_WIDTH_TYPE == "10bit_only"   ? "TRUE" :
                                  CH3_RDATA_WIDTH_TYPE == "8b10b_8bit"   ? "TRUE" :                                                                   
                                  CH3_RDATA_WIDTH_TYPE == "64b66b_16bit" ? "TRUE" :
                                  CH3_RDATA_WIDTH_TYPE == "64b67b_16bit" ? "TRUE" : "FALSE";

localparam PCS_CH0_COMMA_DET_MODE = CH0_RX_CLK_SLIP_EN=="TRUE" ? "RX_CLK_SLIP" : "COMMA_PATTERN";
localparam PCS_CH1_COMMA_DET_MODE = CH1_RX_CLK_SLIP_EN=="TRUE" ? "RX_CLK_SLIP" : "COMMA_PATTERN";
localparam PCS_CH2_COMMA_DET_MODE = CH2_RX_CLK_SLIP_EN=="TRUE" ? "RX_CLK_SLIP" : "COMMA_PATTERN";
localparam PCS_CH3_COMMA_DET_MODE = CH3_RX_CLK_SLIP_EN=="TRUE" ? "RX_CLK_SLIP" : "COMMA_PATTERN";

localparam PCS_CH0_DEC_DUAL     =  CH0_RDATA_WIDTH_TYPE == "8b10b_8bit"   ? "TRUE" :
                                  CH0_RDATA_WIDTH_TYPE == "8b10b_16bit"  ? "TRUE" :
                                  CH0_RDATA_WIDTH_TYPE == "8b10b_32bit"  ? "TRUE" : "FALSE";
localparam PCS_CH1_DEC_DUAL     =  CH1_RDATA_WIDTH_TYPE == "8b10b_8bit"   ? "TRUE" :
                                  CH1_RDATA_WIDTH_TYPE == "8b10b_16bit"  ? "TRUE" :
                                  CH1_RDATA_WIDTH_TYPE == "8b10b_32bit"  ? "TRUE" : "FALSE";
localparam PCS_CH2_DEC_DUAL     =  CH2_RDATA_WIDTH_TYPE == "8b10b_8bit"   ? "TRUE" :
                                  CH2_RDATA_WIDTH_TYPE == "8b10b_16bit"  ? "TRUE" :
                                  CH2_RDATA_WIDTH_TYPE == "8b10b_32bit"  ? "TRUE" : "FALSE";
localparam PCS_CH3_DEC_DUAL     =  CH3_RDATA_WIDTH_TYPE == "8b10b_8bit"   ? "TRUE" :
                                  CH3_RDATA_WIDTH_TYPE == "8b10b_16bit"  ? "TRUE" :
                                  CH3_RDATA_WIDTH_TYPE == "8b10b_32bit"  ? "TRUE" : "FALSE";                                  
                                  
localparam PCS_CH0_PCS_RCLK_EN  = CH0_RDATA_WIDTH_TYPE == "8b10b_8bit"  ? "TRUE" : "FALSE";
localparam PCS_CH1_PCS_RCLK_EN  = CH1_RDATA_WIDTH_TYPE == "8b10b_8bit"  ? "TRUE" : "FALSE";
localparam PCS_CH2_PCS_RCLK_EN  = CH2_RDATA_WIDTH_TYPE == "8b10b_8bit"  ? "TRUE" : "FALSE";
localparam PCS_CH3_PCS_RCLK_EN  = CH3_RDATA_WIDTH_TYPE == "8b10b_8bit"  ? "TRUE" : "FALSE";
                                  
localparam PCS_CH0_CB_RCLK_EN  = CH0_RDATA_WIDTH_TYPE == "8b10b_8bit"  ? "TRUE" : "FALSE";
localparam PCS_CH1_CB_RCLK_EN  = CH1_RDATA_WIDTH_TYPE == "8b10b_8bit"  ? "TRUE" : "FALSE";
localparam PCS_CH2_CB_RCLK_EN  = CH2_RDATA_WIDTH_TYPE == "8b10b_8bit"  ? "TRUE" : "FALSE";
localparam PCS_CH3_CB_RCLK_EN  = CH3_RDATA_WIDTH_TYPE == "8b10b_8bit"  ? "TRUE" : "FALSE";
                                  
localparam PCS_CH0_AFTER_CTC_RCLK_EN  = CH0_RDATA_WIDTH_TYPE == "8b10b_8bit"  ? "TRUE" : "FALSE";
localparam PCS_CH1_AFTER_CTC_RCLK_EN  = CH1_RDATA_WIDTH_TYPE == "8b10b_8bit"  ? "TRUE" : "FALSE";
localparam PCS_CH2_AFTER_CTC_RCLK_EN  = CH2_RDATA_WIDTH_TYPE == "8b10b_8bit"  ? "TRUE" : "FALSE";
localparam PCS_CH3_AFTER_CTC_RCLK_EN  = CH3_RDATA_WIDTH_TYPE == "8b10b_8bit"  ? "TRUE" : "FALSE";

localparam PCS_CH0_AFTER_CTC_RCLK_EN_GB   =  CH0_RDATA_WIDTH_TYPE == "32bit_only"  ? "TRUE" :
                                            CH0_RDATA_WIDTH_TYPE == "40bit_only"  ? "TRUE" :
                                            CH0_RDATA_WIDTH_TYPE == "8b10b_32bit" ? "TRUE" :
                                            CH0_RDATA_WIDTH_TYPE == "64b66b_32bit"? "TRUE" : 
                                            CH0_RDATA_WIDTH_TYPE == "64b67b_32bit"? "TRUE" : "FALSE";
localparam PCS_CH1_AFTER_CTC_RCLK_EN_GB   =  CH1_RDATA_WIDTH_TYPE == "32bit_only"  ? "TRUE" :
                                            CH1_RDATA_WIDTH_TYPE == "40bit_only"  ? "TRUE" :
                                            CH1_RDATA_WIDTH_TYPE == "8b10b_32bit" ? "TRUE" :
                                            CH1_RDATA_WIDTH_TYPE == "64b66b_32bit"? "TRUE" : 
                                            CH1_RDATA_WIDTH_TYPE == "64b67b_32bit"? "TRUE" : "FALSE";
localparam PCS_CH2_AFTER_CTC_RCLK_EN_GB   =  CH2_RDATA_WIDTH_TYPE == "32bit_only"  ? "TRUE" :
                                            CH2_RDATA_WIDTH_TYPE == "40bit_only"  ? "TRUE" :
                                            CH2_RDATA_WIDTH_TYPE == "8b10b_32bit" ? "TRUE" : 
                                            CH2_RDATA_WIDTH_TYPE == "64b66b_32bit"? "TRUE" : 
                                            CH2_RDATA_WIDTH_TYPE == "64b67b_32bit"? "TRUE" : "FALSE";
localparam PCS_CH3_AFTER_CTC_RCLK_EN_GB   =  CH3_RDATA_WIDTH_TYPE == "32bit_only"  ? "TRUE" :
                                            CH3_RDATA_WIDTH_TYPE == "40bit_only"  ? "TRUE" :
                                            CH3_RDATA_WIDTH_TYPE == "8b10b_32bit" ? "TRUE" :
                                            CH3_RDATA_WIDTH_TYPE == "64b66b_32bit"? "TRUE" : 
                                            CH3_RDATA_WIDTH_TYPE == "64b67b_32bit"? "TRUE" : "FALSE";
 
localparam PCS_CH0_AFTER_CTC_RCLK_EN_GB_1   =  (CH0_PROTOCOL=="PCIEx1" || CH0_PROTOCOL=="PCIEx2" || CH0_PROTOCOL=="PCIEx4") ? "FALSE" :
                                            CH0_RDATA_WIDTH_TYPE == "32bit_only"  ? "TRUE" :
                                            CH0_RDATA_WIDTH_TYPE == "40bit_only"  ? "TRUE" :
                                            CH0_RDATA_WIDTH_TYPE == "8b10b_32bit" ? "TRUE" :
                                            CH0_RDATA_WIDTH_TYPE == "64b66b_32bit"? "TRUE" : 
                                            CH0_RDATA_WIDTH_TYPE == "64b67b_32bit"? "TRUE" : "FALSE";
localparam PCS_CH1_AFTER_CTC_RCLK_EN_GB_1   =  (CH1_PROTOCOL=="PCIEx1" || CH1_PROTOCOL=="PCIEx2" || CH1_PROTOCOL=="PCIEx4") ? "FALSE" :
                                            CH1_RDATA_WIDTH_TYPE == "32bit_only"  ? "TRUE" :
                                            CH1_RDATA_WIDTH_TYPE == "40bit_only"  ? "TRUE" :
                                            CH1_RDATA_WIDTH_TYPE == "8b10b_32bit" ? "TRUE" :
                                            CH1_RDATA_WIDTH_TYPE == "64b66b_32bit"? "TRUE" : 
                                            CH1_RDATA_WIDTH_TYPE == "64b67b_32bit"? "TRUE" : "FALSE";
localparam PCS_CH2_AFTER_CTC_RCLK_EN_GB_1   =  (CH2_PROTOCOL=="PCIEx1" || CH2_PROTOCOL=="PCIEx2" || CH2_PROTOCOL=="PCIEx4") ? "FALSE" :
                                            CH2_RDATA_WIDTH_TYPE == "32bit_only"  ? "TRUE" :
                                            CH2_RDATA_WIDTH_TYPE == "40bit_only"  ? "TRUE" :
                                            CH2_RDATA_WIDTH_TYPE == "8b10b_32bit" ? "TRUE" : 
                                            CH2_RDATA_WIDTH_TYPE == "64b66b_32bit"? "TRUE" : 
                                            CH2_RDATA_WIDTH_TYPE == "64b67b_32bit"? "TRUE" : "FALSE";
localparam PCS_CH3_AFTER_CTC_RCLK_EN_GB_1   =  (CH3_PROTOCOL=="PCIEx1" || CH3_PROTOCOL=="PCIEx2" || CH3_PROTOCOL=="PCIEx4") ? "FALSE":
                                            CH3_RDATA_WIDTH_TYPE == "32bit_only"  ? "TRUE" :
                                            CH3_RDATA_WIDTH_TYPE == "40bit_only"  ? "TRUE" :
                                            CH3_RDATA_WIDTH_TYPE == "8b10b_32bit" ? "TRUE" :
                                            CH3_RDATA_WIDTH_TYPE == "64b66b_32bit"? "TRUE" : 
                                            CH3_RDATA_WIDTH_TYPE == "64b67b_32bit"? "TRUE" : "FALSE";

localparam PMA_CH0_SIPO_BIT_SETTING  = CH0_RDATA_WIDTH_TYPE == "8bit_only"   ? "8BIT"  :
                                      CH0_RDATA_WIDTH_TYPE == "10bit_only"  ? "10BIT" :
                                      CH0_RDATA_WIDTH_TYPE == "8b10b_8bit"  ? "10BIT" :
                                      CH0_RDATA_WIDTH_TYPE == "16bit_only"  ? "16BIT" :
                                      CH0_RDATA_WIDTH_TYPE == "20bit_only"  ? "20BIT" :
                                      CH0_RDATA_WIDTH_TYPE == "8b10b_16bit" ? "20BIT" :
                                      CH0_RDATA_WIDTH_TYPE == "32bit_only"  ? "16BIT" : 
                                      CH0_RDATA_WIDTH_TYPE == "64b66b_16bit"? "16BIT" : 
                                      CH0_RDATA_WIDTH_TYPE == "64b66b_32bit"? "16BIT" : 
                                      CH0_RDATA_WIDTH_TYPE == "64b67b_16bit"? "16BIT" : 
                                      CH0_RDATA_WIDTH_TYPE == "64b67b_32bit"? "16BIT" : "20BIT";
localparam PMA_CH1_SIPO_BIT_SETTING  = CH1_RDATA_WIDTH_TYPE == "8bit_only"   ? "8BIT"  :
                                      CH1_RDATA_WIDTH_TYPE == "10bit_only"  ? "10BIT" :
                                      CH1_RDATA_WIDTH_TYPE == "8b10b_8bit"  ? "10BIT" :
                                      CH1_RDATA_WIDTH_TYPE == "16bit_only"  ? "16BIT" :
                                      CH1_RDATA_WIDTH_TYPE == "20bit_only"  ? "20BIT" :
                                      CH1_RDATA_WIDTH_TYPE == "8b10b_16bit" ? "20BIT" :
                                      CH1_RDATA_WIDTH_TYPE == "32bit_only"  ? "16BIT" :
                                      CH1_RDATA_WIDTH_TYPE == "64b66b_16bit"? "16BIT" : 
                                      CH1_RDATA_WIDTH_TYPE == "64b66b_32bit"? "16BIT" : 
                                      CH1_RDATA_WIDTH_TYPE == "64b67b_16bit"? "16BIT" : 
                                      CH1_RDATA_WIDTH_TYPE == "64b67b_32bit"? "16BIT" : "20BIT";
localparam PMA_CH2_SIPO_BIT_SETTING  = CH2_RDATA_WIDTH_TYPE == "8bit_only"   ? "8BIT"  :
                                      CH2_RDATA_WIDTH_TYPE == "10bit_only"  ? "10BIT" :
                                      CH2_RDATA_WIDTH_TYPE == "8b10b_8bit"  ? "10BIT" :
                                      CH2_RDATA_WIDTH_TYPE == "16bit_only"  ? "16BIT" :
                                      CH2_RDATA_WIDTH_TYPE == "20bit_only"  ? "20BIT" :
                                      CH2_RDATA_WIDTH_TYPE == "8b10b_16bit" ? "20BIT" :
                                      CH2_RDATA_WIDTH_TYPE == "32bit_only"  ? "16BIT" :                                                                        
                                      CH2_RDATA_WIDTH_TYPE == "64b66b_16bit"? "16BIT" : 
                                      CH2_RDATA_WIDTH_TYPE == "64b66b_32bit"? "16BIT" : 
                                      CH2_RDATA_WIDTH_TYPE == "64b67b_16bit"? "16BIT" : 
                                      CH2_RDATA_WIDTH_TYPE == "64b67b_32bit"? "16BIT" : "20BIT";
localparam PMA_CH3_SIPO_BIT_SETTING  = CH3_RDATA_WIDTH_TYPE == "8bit_only"   ? "8BIT"  :
                                      CH3_RDATA_WIDTH_TYPE == "10bit_only"  ? "10BIT" :
                                      CH3_RDATA_WIDTH_TYPE == "8b10b_8bit"  ? "10BIT" :
                                      CH3_RDATA_WIDTH_TYPE == "16bit_only"  ? "16BIT" :
                                      CH3_RDATA_WIDTH_TYPE == "20bit_only"  ? "20BIT" :
                                      CH3_RDATA_WIDTH_TYPE == "8b10b_16bit" ? "20BIT" :
                                      CH3_RDATA_WIDTH_TYPE == "32bit_only"  ? "16BIT" : 
                                      CH3_RDATA_WIDTH_TYPE == "64b66b_16bit"? "16BIT" : 
                                      CH3_RDATA_WIDTH_TYPE == "64b66b_32bit"? "16BIT" : 
                                      CH3_RDATA_WIDTH_TYPE == "64b67b_16bit"? "16BIT" : 
                                      CH3_RDATA_WIDTH_TYPE == "64b67b_32bit"? "16BIT" : "20BIT";

localparam PCS_CH0_BYPASS_GEAR   =  CH0_RDATA_WIDTH_TYPE == "16bit_only"  ? "TRUE" :
                                   CH0_RDATA_WIDTH_TYPE == "20bit_only"  ? "TRUE" :
                                   CH0_RDATA_WIDTH_TYPE == "8b10b_16bit" ? "TRUE" : "FALSE";
localparam PCS_CH1_BYPASS_GEAR   =  CH1_RDATA_WIDTH_TYPE == "16bit_only"  ? "TRUE" :
                                   CH1_RDATA_WIDTH_TYPE == "20bit_only"  ? "TRUE" :
                                   CH1_RDATA_WIDTH_TYPE == "8b10b_16bit" ? "TRUE" : "FALSE";
localparam PCS_CH2_BYPASS_GEAR   =  CH2_RDATA_WIDTH_TYPE == "16bit_only"  ? "TRUE" :
                                   CH2_RDATA_WIDTH_TYPE == "20bit_only"  ? "TRUE" :
                                   CH2_RDATA_WIDTH_TYPE == "8b10b_16bit" ? "TRUE" : "FALSE";
localparam PCS_CH3_BYPASS_GEAR   =  CH3_RDATA_WIDTH_TYPE == "16bit_only"  ? "TRUE" :
                                   CH3_RDATA_WIDTH_TYPE == "20bit_only"  ? "TRUE" :
                                   CH3_RDATA_WIDTH_TYPE == "8b10b_16bit" ? "TRUE" : "FALSE";  
//
localparam PCS_CH0_BYPASS_BRIDGE = RX0_CLK2_FR_CORE=="TRUE" ? "FALSE" : "TRUE";
localparam PCS_CH1_BYPASS_BRIDGE = RX1_CLK2_FR_CORE=="TRUE" ? "FALSE" : "TRUE";
localparam PCS_CH2_BYPASS_BRIDGE = RX2_CLK2_FR_CORE=="TRUE" ? "FALSE" : "TRUE";
localparam PCS_CH3_BYPASS_BRIDGE = RX3_CLK2_FR_CORE=="TRUE" ? "FALSE" : "TRUE";
//
localparam PCS_CH0_BYPASS_BRIDGE_FIFO = RX0_CLK2_FR_CORE=="TRUE" ? "TRUE" : "FALSE";
localparam PCS_CH1_BYPASS_BRIDGE_FIFO = RX1_CLK2_FR_CORE=="TRUE" ? "TRUE" : "FALSE";
localparam PCS_CH2_BYPASS_BRIDGE_FIFO = RX2_CLK2_FR_CORE=="TRUE" ? "TRUE" : "FALSE";
localparam PCS_CH3_BYPASS_BRIDGE_FIFO = RX3_CLK2_FR_CORE=="TRUE" ? "TRUE" : "FALSE";
//
localparam PCS_CH0_PCS_RCLK_SEL = "PMA_RCLK";
localparam PCS_CH1_PCS_RCLK_SEL = "PMA_RCLK";
localparam PCS_CH2_PCS_RCLK_SEL = "PMA_RCLK";
localparam PCS_CH3_PCS_RCLK_SEL = "PMA_RCLK";
//
localparam PCS_CH0_CB_RCLK_SEL = PCS_CH0_BYPASS_BONDING == "FALSE" ? "MCB_RCLK" : "PMA_RCLK";
localparam PCS_CH1_CB_RCLK_SEL = PCS_CH1_BYPASS_BONDING == "FALSE" ? "MCB_RCLK" : "PMA_RCLK";
localparam PCS_CH2_CB_RCLK_SEL = PCS_CH2_BYPASS_BONDING == "FALSE" ? "MCB_RCLK" : "PMA_RCLK";
localparam PCS_CH3_CB_RCLK_SEL = PCS_CH3_BYPASS_BONDING == "FALSE" ? "MCB_RCLK" : "PMA_RCLK";
//
localparam PCS_CH0_AFTER_CTC_RCLK_SEL = RX0_CLK2_FR_CORE   == "TRUE"      ? "RCLK2"    :
                                        PCS_CH0_BYPASS_CTC == "FALSE"     ? "PMA_TCLK" :
                                        PCS_CH0_BYPASS_BONDING == "FALSE" ? "MCB_RCLK" : "PMA_RCLK";
localparam PCS_CH1_AFTER_CTC_RCLK_SEL = RX1_CLK2_FR_CORE   == "TRUE"      ? "RCLK2"    :
                                        PCS_CH1_BYPASS_CTC == "FALSE"     ? "PMA_TCLK" :
                                        PCS_CH1_BYPASS_BONDING == "FALSE" ? "MCB_RCLK" : "PMA_RCLK";
localparam PCS_CH2_AFTER_CTC_RCLK_SEL = RX2_CLK2_FR_CORE   == "TRUE"      ? "RCLK2"    :
                                        PCS_CH2_BYPASS_CTC == "FALSE"     ? "PMA_TCLK" :
                                        PCS_CH2_BYPASS_BONDING == "FALSE" ? "MCB_RCLK" : "PMA_RCLK";                                       
localparam PCS_CH3_AFTER_CTC_RCLK_SEL = RX3_CLK2_FR_CORE   == "TRUE"      ? "RCLK2"    :
                                        PCS_CH3_BYPASS_CTC == "FALSE"     ? "PMA_TCLK" :
                                        PCS_CH3_BYPASS_BONDING == "FALSE" ? "MCB_RCLK" : "PMA_RCLK";   
//                                       
localparam PCS_CH0_AFTER_CTC_RCLK_SEL_1 = (CH0_PROTOCOL=="PCIEx1" || CH0_PROTOCOL=="PCIEx2" || CH0_PROTOCOL=="PCIEx4") ? "PMA_TCLK" :
                                        RX0_CLK2_FR_CORE   == "TRUE"      ? "RCLK2"    :
                                        PCS_CH0_BYPASS_CTC == "FALSE"     ? "PMA_TCLK" :
                                        PCS_CH0_BYPASS_BONDING == "FALSE" ? "MCB_RCLK" : "PMA_RCLK";
localparam PCS_CH1_AFTER_CTC_RCLK_SEL_1 = (CH1_PROTOCOL=="PCIEx1" || CH1_PROTOCOL=="PCIEx2" || CH1_PROTOCOL=="PCIEx4") ? "PMA_TCLK" :
                                        RX1_CLK2_FR_CORE   == "TRUE"      ? "RCLK2"    :
                                        PCS_CH1_BYPASS_CTC == "FALSE"     ? "PMA_TCLK" :
                                        PCS_CH1_BYPASS_BONDING == "FALSE" ? "MCB_RCLK" : "PMA_RCLK";
localparam PCS_CH2_AFTER_CTC_RCLK_SEL_1 = (CH2_PROTOCOL=="PCIEx1" || CH2_PROTOCOL=="PCIEx2" || CH2_PROTOCOL=="PCIEx4") ? "PMA_TCLK" :
                                        RX2_CLK2_FR_CORE   == "TRUE"      ? "RCLK2"    :
                                        PCS_CH2_BYPASS_CTC == "FALSE"     ? "PMA_TCLK" :
                                        PCS_CH2_BYPASS_BONDING == "FALSE" ? "MCB_RCLK" : "PMA_RCLK";                                       
localparam PCS_CH3_AFTER_CTC_RCLK_SEL_1 = (CH3_PROTOCOL=="PCIEx1" || CH3_PROTOCOL=="PCIEx2" || CH3_PROTOCOL=="PCIEx4") ? "PMA_TCLK" :
                                        RX3_CLK2_FR_CORE   == "TRUE"      ? "RCLK2"    :
                                        PCS_CH3_BYPASS_CTC == "FALSE"     ? "PMA_TCLK" :
                                        PCS_CH3_BYPASS_BONDING == "FALSE" ? "MCB_RCLK" : "PMA_RCLK";   
// 
localparam PCS_CH0_RX_64B66B_67B = CH0_RX_DECODER == "64B66B_transparent" ? "64B_66B"  :
                                   CH0_RX_DECODER == "64B67B_transparent" ? "64B_67B"  : "NORMAL";
localparam PCS_CH1_RX_64B66B_67B = CH1_RX_DECODER == "64B66B_transparent" ? "64B_66B"  :
                                   CH1_RX_DECODER == "64B67B_transparent" ? "64B_67B"  : "NORMAL";
localparam PCS_CH2_RX_64B66B_67B = CH2_RX_DECODER == "64B66B_transparent" ? "64B_66B"  :
                                   CH2_RX_DECODER == "64B67B_transparent" ? "64B_67B"  : "NORMAL";
localparam PCS_CH3_RX_64B66B_67B = CH3_RX_DECODER == "64B66B_transparent" ? "64B_66B"  :
                                   CH3_RX_DECODER == "64B67B_transparent" ? "64B_67B"  : "NORMAL";
//
//*******************************************************************************************************************

//-- INNER RESET PARAMETER ---//
localparam FREE_CLOCK_FREQ         = (FREE_FRQ==0) ? 100.0 : FREE_FRQ;
localparam CH0_TX_ENABLE           = ((CH0_EN=="Fullduplex")||(CH0_EN=="TX_only")) ? "TRUE" : "FALSE";
localparam CH1_TX_ENABLE           = ((CH1_EN=="Fullduplex")||(CH1_EN=="TX_only")) ? "TRUE" : "FALSE";
localparam CH2_TX_ENABLE           = ((CH2_EN=="Fullduplex")||(CH2_EN=="TX_only")) ? "TRUE" : "FALSE";
localparam CH3_TX_ENABLE           = ((CH3_EN=="Fullduplex")||(CH3_EN=="TX_only")) ? "TRUE" : "FALSE";
localparam CH0_RX_ENABLE           = ((CH0_EN=="Fullduplex")||(CH0_EN=="RX_only")) ? "TRUE" : "FALSE";
localparam CH1_RX_ENABLE           = ((CH1_EN=="Fullduplex")||(CH1_EN=="RX_only")) ? "TRUE" : "FALSE";
localparam CH2_RX_ENABLE           = ((CH2_EN=="Fullduplex")||(CH2_EN=="RX_only")) ? "TRUE" : "FALSE";
localparam CH3_RX_ENABLE           = ((CH3_EN=="Fullduplex")||(CH3_EN=="RX_only")) ? "TRUE" : "FALSE";
localparam CH0_MULT_LANE_MODE      = ((CH0_PROTOCOL=="CUSTOMERIZEDx4")||(CH0_PROTOCOL=="PCIEx4")||(CH0_PROTOCOL=="XAUI")) ? 4 : 
                                      ((CH0_PROTOCOL=="CUSTOMERIZEDx2")||(CH0_PROTOCOL=="PCIEx2")) ? 2 : 1;
localparam CH1_MULT_LANE_MODE      = ((CH0_PROTOCOL=="CUSTOMERIZEDx4")||(CH0_PROTOCOL=="PCIEx4")||(CH0_PROTOCOL=="XAUI")) ? 4 : 
                                      ((CH0_PROTOCOL=="CUSTOMERIZEDx2")||(CH0_PROTOCOL=="PCIEx2")) ? 2 : 1;
localparam CH2_MULT_LANE_MODE      = ((CH0_PROTOCOL=="CUSTOMERIZEDx4")||(CH0_PROTOCOL=="PCIEx4")||(CH0_PROTOCOL=="XAUI")) ? 4 : 
                                      ((CH2_PROTOCOL=="CUSTOMERIZEDx2")||(CH2_PROTOCOL=="PCIEx2")) ? 2 : 1;
localparam CH3_MULT_LANE_MODE      = ((CH0_PROTOCOL=="CUSTOMERIZEDx4")||(CH0_PROTOCOL=="PCIEx4")||(CH0_PROTOCOL=="XAUI")) ? 4 : 
                                      ((CH2_PROTOCOL=="CUSTOMERIZEDx2")||(CH2_PROTOCOL=="PCIEx2")) ? 2 : 1;
localparam CHANNEL0_EN             =  (CH0_TX_ENABLE == "TRUE" || CH0_RX_ENABLE == "TRUE") ? "TRUE" : "FALSE";
localparam CHANNEL1_EN             =  (CH1_TX_ENABLE == "TRUE" || CH1_RX_ENABLE == "TRUE") ? "TRUE" : "FALSE";
localparam CHANNEL2_EN             =  (CH2_TX_ENABLE == "TRUE" || CH2_RX_ENABLE == "TRUE") ? "TRUE" : "FALSE";
localparam CHANNEL3_EN             =  (CH3_TX_ENABLE == "TRUE" || CH3_RX_ENABLE == "TRUE") ? "TRUE" : "FALSE";
localparam TX_CHANNEL0_PLL         =  CH0_TX_PLL_SEL == "PLL1" ? 1 : 0;
localparam TX_CHANNEL1_PLL         =  CH1_TX_PLL_SEL == "PLL1" ? 1 : 0;
localparam TX_CHANNEL2_PLL         =  CH2_TX_PLL_SEL == "PLL1" ? 1 : 0;
localparam TX_CHANNEL3_PLL         =  CH3_TX_PLL_SEL == "PLL1" ? 1 : 0;
localparam RX_CHANNEL0_PLL         =  CH0_RX_PLL_SEL == "PLL1" ? 1 : 0;
localparam RX_CHANNEL1_PLL         =  CH1_RX_PLL_SEL == "PLL1" ? 1 : 0;
localparam RX_CHANNEL2_PLL         =  CH2_RX_PLL_SEL == "PLL1" ? 1 : 0;
localparam RX_CHANNEL3_PLL         =  CH3_RX_PLL_SEL == "PLL1" ? 1 : 0;
localparam PCS_CH0_BYPASS_ALIGN    = (CH0_RXPCS_ALIGN=="Bypassed" || CH0_RXPCS_ALIGN=="CUSTOMERIZED_MODE" || CH0_RX_CLK_SLIP_EN=="TRUE") ? "TRUE" : "FALSE";         
localparam PCS_CH1_BYPASS_ALIGN    = (CH1_RXPCS_ALIGN=="Bypassed" || CH1_RXPCS_ALIGN=="CUSTOMERIZED_MODE" || CH1_RX_CLK_SLIP_EN=="TRUE") ? "TRUE" : "FALSE";         
localparam PCS_CH2_BYPASS_ALIGN    = (CH2_RXPCS_ALIGN=="Bypassed" || CH2_RXPCS_ALIGN=="CUSTOMERIZED_MODE" || CH2_RX_CLK_SLIP_EN=="TRUE") ? "TRUE" : "FALSE";         
localparam PCS_CH3_BYPASS_ALIGN    = (CH3_RXPCS_ALIGN=="Bypassed" || CH3_RXPCS_ALIGN=="CUSTOMERIZED_MODE" || CH3_RX_CLK_SLIP_EN=="TRUE") ? "TRUE" : "FALSE";         
localparam PCS_CH0_BYPASS_BOND     = (CH0_RXPCS_BONDING=="Bypassed" || CH0_RXPCS_BONDING=="CUSTOMERIZED_MODE") ? "TRUE" : "FALSE";
localparam PCS_CH1_BYPASS_BOND     = (CH1_RXPCS_BONDING=="Bypassed" || CH1_RXPCS_BONDING=="CUSTOMERIZED_MODE") ? "TRUE" : "FALSE";
localparam PCS_CH2_BYPASS_BOND     = (CH2_RXPCS_BONDING=="Bypassed" || CH2_RXPCS_BONDING=="CUSTOMERIZED_MODE") ? "TRUE" : "FALSE";
localparam PCS_CH3_BYPASS_BOND     = (CH3_RXPCS_BONDING=="Bypassed" || CH3_RXPCS_BONDING=="CUSTOMERIZED_MODE") ? "TRUE" : "FALSE";

//-- PLL RATECHANGE CLK SELECTED PARAMETER ---//
localparam PLL0_TXPCLK_PLL_SEL     = (CH0_TX_PLL_SEL=="PLL0" && CH0_TX_ENABLE=="TRUE") ? 0 :
                                     (CH1_TX_PLL_SEL=="PLL0" && CH1_TX_ENABLE=="TRUE") ? 1 :
                                     (CH2_TX_PLL_SEL=="PLL0" && CH2_TX_ENABLE=="TRUE") ? 2 :
                                     (CH3_TX_PLL_SEL=="PLL0" && CH3_TX_ENABLE=="TRUE") ? 3 :
                                     (CHANNEL0_EN=="TRUE") ? 0 :
                                     (CHANNEL1_EN=="TRUE") ? 1 :
                                     (CHANNEL2_EN=="TRUE") ? 2 : 3;
localparam PLL1_TXPCLK_PLL_SEL     = (CH0_TX_PLL_SEL=="PLL1" && CH0_TX_ENABLE=="TRUE") ? 0 :
                                     (CH1_TX_PLL_SEL=="PLL1" && CH1_TX_ENABLE=="TRUE") ? 1 :
                                     (CH2_TX_PLL_SEL=="PLL1" && CH2_TX_ENABLE=="TRUE") ? 2 :
                                     (CH3_TX_PLL_SEL=="PLL1" && CH3_TX_ENABLE=="TRUE") ? 3 :
                                     (CHANNEL0_EN=="TRUE") ? 0 :
                                     (CHANNEL1_EN=="TRUE") ? 1 :
                                     (CHANNEL2_EN=="TRUE") ? 2 : 3;

//-- wire INNER RESET & HSST  ---//
wire            P_PLL_READY_0           ; // input  wire                    
wire            P_PLL_READY_1           ; // input  wire                    
wire            P_RX_SIGDET_STATUS_0    ; // input  wire                    
wire            P_RX_SIGDET_STATUS_1    ; // input  wire                    
wire            P_RX_SIGDET_STATUS_2    ; // input  wire                    
wire            P_RX_SIGDET_STATUS_3    ; // input  wire                    
wire            P_LX_CDR_ALIGN_0        ; // input  wire                    
wire            P_LX_CDR_ALIGN_1        ; // input  wire                    
wire            P_LX_CDR_ALIGN_2        ; // input  wire                    
wire            P_LX_CDR_ALIGN_3        ; // input  wire                    
wire            P_PLLPOWERDOWN_0        ; // output wire                    
wire            P_PLLPOWERDOWN_1        ; // output wire                    
wire            P_PLL_RST_0             ; // output wire                    
wire            P_PLL_RST_1             ; // output wire                    
wire            P_LANE_SYNC_0           ; // output wire                    
wire            P_LANE_SYNC_1           ; // output wire
wire            P_LANE_SYNC_EN_0        ; // output wire
wire            P_LANE_SYNC_EN_1        ; // output wire
wire            P_RATE_CHANGE_TCLK_ON_0 ; // output wire                   
wire            P_RATE_CHANGE_TCLK_ON_1 ; // output wire                   
wire            P_TX_LANE_PD_0          ; // output wire                   
wire            P_TX_LANE_PD_1          ; // output wire                   
wire            P_TX_LANE_PD_2          ; // output wire                   
wire            P_TX_LANE_PD_3          ; // output wire                   
wire    [2 : 0] P_TX_RATE_0             ; // output wire    [2 : 0]         
wire    [2 : 0] P_TX_RATE_1             ; // output wire    [2 : 0]         
wire    [2 : 0] P_TX_RATE_2             ; // output wire    [2 : 0]         
wire    [2 : 0] P_TX_RATE_3             ; // output wire    [2 : 0]         
wire            P_TX_PMA_RST_0          ; // output wire                    
wire            P_TX_PMA_RST_1          ; // output wire                    
wire            P_TX_PMA_RST_2          ; // output wire                    
wire            P_TX_PMA_RST_3          ; // output wire                    
wire            P_PCS_TX_RST_0          ; // output wire                    
wire            P_PCS_TX_RST_1          ; // output wire                    
wire            P_PCS_TX_RST_2          ; // output wire                    
wire            P_PCS_TX_RST_3          ; // output wire                    
wire            P_RX_PMA_RST_0          ; // output wire                    
wire            P_RX_PMA_RST_1          ; // output wire                    
wire            P_RX_PMA_RST_2          ; // output wire                    
wire            P_RX_PMA_RST_3          ; // output wire                    
wire            P_LANE_PD_0             ; // output wire                    
wire            P_LANE_PD_1             ; // output wire                    
wire            P_LANE_PD_2             ; // output wire                    
wire            P_LANE_PD_3             ; // output wire                    
wire            P_LANE_RST_0            ; // output wire                    
wire            P_LANE_RST_1            ; // output wire                    
wire            P_LANE_RST_2            ; // output wire                    
wire            P_LANE_RST_3            ; // output wire                    
wire            P_RX_LANE_PD_0          ; // output wire                    
wire            P_RX_LANE_PD_1          ; // output wire                    
wire            P_RX_LANE_PD_2          ; // output wire                    
wire            P_RX_LANE_PD_3          ; // output wire                    
wire            P_PCS_RX_RST_0          ; // output wire                    
wire            P_PCS_RX_RST_1          ; // output wire                    
wire            P_PCS_RX_RST_2          ; // output wire                    
wire            P_PCS_RX_RST_3          ; // output wire                    
wire    [2 : 0] P_RX_RATE_0             ; // output wire    [2 : 0]          
wire    [2 : 0] P_RX_RATE_1             ; // output wire    [2 : 0]         
wire    [2 : 0] P_RX_RATE_2             ; // output wire    [2 : 0]         
wire    [2 : 0] P_RX_RATE_3             ; // output wire    [2 : 0]         
wire            P_PCS_CB_RST_0          ; // output wire                    
wire            P_PCS_CB_RST_1          ; // output wire                    
wire            P_PCS_CB_RST_2          ; // output wire                    
wire            P_PCS_CB_RST_3          ; // output wire                    
wire            i_force_rxfsm_det_0     ; // input  wire                    
wire            i_force_rxfsm_det_1     ; // input  wire                    
wire            i_force_rxfsm_det_2     ; // input  wire                    
wire            i_force_rxfsm_det_3     ; // input  wire                    
wire            i_force_rxfsm_cdr_0     ; // input  wire                    
wire            i_force_rxfsm_cdr_1     ; // input  wire                    
wire            i_force_rxfsm_cdr_2     ; // input  wire                    
wire            i_force_rxfsm_cdr_3     ; // input  wire                    
wire            i_force_rxfsm_lsm_0     ; // input  wire                    
wire            i_force_rxfsm_lsm_1     ; // input  wire                    
wire            i_force_rxfsm_lsm_2     ; // input  wire                    
wire            i_force_rxfsm_lsm_3     ; // input  wire                    

wire    [3:0]   P_TCLK2FABRIC           ; // output wire    
wire    [3:0]   P_RCLK2FABRIC           ; // output wire    
wire    [3:0]   P_PCS_WORD_ALIGN_EN     ; // input  wire    
wire    [3:0]   P_RX_POLARITY_INVERT    ; // input  wire    
wire    [3:0]   P_PCS_MCB_EXT_EN        ; // input  wire    
wire    [3:0]   P_PCS_LSM_SYNCED        ; // output wire    
wire    [3:0]   P_PCS_RX_MCB_STATUS     ; // output wire    
wire    [3:0]   P_PCS_NEAREND_LOOP      ; // input  wire    
wire    [3:0]   P_PCS_FAREND_LOOP       ; // input  wire    
wire    [3:0]   P_PMA_NEAREND_PLOOP     ; // input  wire    
wire    [3:0]   P_PMA_NEAREND_SLOOP     ; // input  wire    
wire    [3:0]   P_PMA_FAREND_PLOOP      ; // input  wire    


wire         i_pll_rst_1                   = 1'b0;
wire         i_wtchdg_clr_1                = 1'b0;
wire         i_lane_pd_0                   = 1'b0;
wire         i_lane_pd_1                   = 1'b0;
wire         i_lane_pd_2                   = 1'b0;
wire         i_lane_pd_3                   = 1'b0;
wire         i_txlane_rst_0                = 1'b0;
wire         i_txlane_rst_1                = 1'b0;
wire         i_txlane_rst_2                = 1'b0;
wire         i_txlane_rst_3                = 1'b0;
wire         i_rxlane_rst_0                = 1'b0;
wire         i_rxlane_rst_1                = 1'b0;
wire         i_rxlane_rst_2                = 1'b0;
wire         i_rxlane_rst_3                = 1'b0;
wire         i_tx_rate_chng_0              = 1'b0;
wire         i_tx_rate_chng_1              = 1'b0;
wire         i_tx_rate_chng_2              = 1'b0;
wire         i_tx_rate_chng_3              = 1'b0;
wire [1:0]   i_txckdiv_0                   = P_LX_TX_CKDIV_0;
wire [1:0]   i_txckdiv_1                   = P_LX_TX_CKDIV_1;
wire [1:0]   i_txckdiv_2                   = P_LX_TX_CKDIV_2;
wire [1:0]   i_txckdiv_3                   = P_LX_TX_CKDIV_3;
wire         i_rx_rate_chng_0              = 1'b0;
wire         i_rx_rate_chng_1              = 1'b0;
wire         i_rx_rate_chng_2              = 1'b0;
wire         i_rx_rate_chng_3              = 1'b0;
wire [1:0]   i_rxckdiv_0                   = LX_RX_CKDIV_0;
wire [1:0]   i_rxckdiv_1                   = LX_RX_CKDIV_1;
wire [1:0]   i_rxckdiv_2                   = LX_RX_CKDIV_2;
wire [1:0]   i_rxckdiv_3                   = LX_RX_CKDIV_3;
wire         i_pcs_cb_rst_0                = 1'b0;         
wire         i_hsst_fifo_clr_0             = 1'b0;         
assign       i_force_rxfsm_det_0           = 1'b0;
assign       i_force_rxfsm_cdr_0           = 1'b0;
assign       i_force_rxfsm_lsm_0           = 1'b0;
wire         i_pcs_cb_rst_1                = 1'b0;         
wire         i_hsst_fifo_clr_1             = 1'b0;         
assign       i_force_rxfsm_det_1           = 1'b0;
assign       i_force_rxfsm_cdr_1           = 1'b0;
assign       i_force_rxfsm_lsm_1           = 1'b0;
wire         i_pcs_cb_rst_2                = 1'b0;         
wire         i_hsst_fifo_clr_2             = 1'b0;         
assign       i_force_rxfsm_det_2           = 1'b0;
assign       i_force_rxfsm_cdr_2           = 1'b0;
assign       i_force_rxfsm_lsm_2           = 1'b0;
wire         i_pcs_cb_rst_3                = 1'b0;         
wire         i_hsst_fifo_clr_3             = 1'b0;         
assign       i_force_rxfsm_det_3           = 1'b0;
assign       i_force_rxfsm_cdr_3           = 1'b0;
assign       i_force_rxfsm_lsm_3           = 1'b0;
wire [1:0]   o_wtchdg_st_1                 ;
wire         o_pll_done_1                  ;
wire         o_txlane_done_0               ;
wire         o_txlane_done_1               ;
wire         o_tx_ckdiv_done_0             ;
wire         o_tx_ckdiv_done_1             ;
wire         o_tx_ckdiv_done_2             ;
wire         o_tx_ckdiv_done_3             ;
wire         o_rxlane_done_0               ;
wire         o_rxlane_done_1               ;
wire         o_rx_ckdiv_done_0             ;
wire         o_rx_ckdiv_done_1             ;
wire         o_rx_ckdiv_done_2             ;
wire         o_rx_ckdiv_done_3             ;
wire         i_p_pllpowerdown_0            = 1'b1;
wire         i_p_pllpowerdown_1            = 1'b1;
wire         i_p_tx_lane_pd_0              = 1'b1;
wire         i_p_tx_lane_pd_1              = 1'b1;
wire         i_p_tx_lane_pd_2              = 1'b1;
wire         i_p_tx_lane_pd_3              = 1'b1;
wire         i_p_lane_pd_0                 = 1'b1;
wire         i_p_lane_pd_1                 = 1'b1;
wire         i_p_lane_pd_2                 = 1'b1;
wire         i_p_lane_pd_3                 = 1'b1;
wire         i_p_lane_rst_0                = 1'b0;
wire         i_p_lane_rst_1                = 1'b0;
wire         i_p_lane_rst_2                = 1'b0;
wire         i_p_lane_rst_3                = 1'b0;
wire         i_p_rx_lane_pd_0              = 1'b1;
wire         i_p_rx_lane_pd_1              = 1'b1;
wire         i_p_rx_lane_pd_2              = 1'b1;
wire         i_p_rx_lane_pd_3              = 1'b1;             
assign       o_p_clk2core_tx_2             = P_TCLK2FABRIC[2];
wire         i_p_tx0_clk_fr_core           = 1'b0;
wire         i_p_tx1_clk_fr_core           = 1'b0;
wire         i_p_tx0_clk2_fr_core          = 1'b0;
wire         i_p_tx1_clk2_fr_core          = 1'b0;
wire         i_p_tx2_clk2_fr_core          = 1'b0;
wire         i_p_tx3_clk2_fr_core          = 1'b0;
wire         i_pll_lock_tx_0               = 1'b1;
wire         i_pll_lock_tx_1               = 1'b1;
wire         i_pll_lock_tx_2               = 1'b1;
wire         i_pll_lock_tx_3               = 1'b1;
wire         i_p_rx0_clk_fr_core           = 1'b0;
wire         i_p_rx1_clk_fr_core           = 1'b0;
wire         i_p_rx0_clk2_fr_core          = 1'b0;
wire         i_p_rx1_clk2_fr_core          = 1'b0;
wire         i_p_rx2_clk2_fr_core          = 1'b0;
wire         i_p_rx3_clk2_fr_core          = 1'b0;
wire         i_pll_lock_rx_0               = 1'b1;
wire         i_pll_lock_rx_1               = 1'b1;
wire         i_pll_lock_rx_2               = 1'b1;
wire         i_pll_lock_rx_3               = 1'b1;
wire         o_p_refck2core_0              ;
wire         o_p_refck2core_1              ;
wire         i_p_pll_rst_0                 = 1'b1;
wire         i_p_pll_rst_1                 = 1'b1;
wire         i_p_tx_pma_rst_0              = 1'b1;
wire         i_p_tx_pma_rst_1              = 1'b1;
wire         i_p_tx_pma_rst_2              = 1'b1;
wire         i_p_tx_pma_rst_3              = 1'b1;
wire         i_p_pcs_tx_rst_0              = 1'b1;
wire         i_p_pcs_tx_rst_1              = 1'b1;
wire         i_p_pcs_tx_rst_2              = 1'b1;
wire         i_p_pcs_tx_rst_3              = 1'b1;
wire         i_p_rx_pma_rst_0              = 1'b1;
wire         i_p_rx_pma_rst_1              = 1'b1;
wire         i_p_rx_pma_rst_2              = 1'b1;
wire         i_p_rx_pma_rst_3              = 1'b1;
wire         i_p_pcs_rx_rst_0              = 1'b1;
wire         i_p_pcs_rx_rst_1              = 1'b1;
wire         i_p_pcs_rx_rst_2              = 1'b1;
wire         i_p_pcs_rx_rst_3              = 1'b1;
wire         i_p_pcs_cb_rst_0              = 1'b0;
wire         i_p_pcs_cb_rst_1              = 1'b0;
wire         i_p_pcs_cb_rst_2              = 1'b0;
wire         i_p_pcs_cb_rst_3              = 1'b0;
wire [2:0]   i_p_lx_margin_ctl_0           = 3'b0;
wire [2:0]   i_p_lx_margin_ctl_1           = 3'b0;
wire [2:0]   i_p_lx_margin_ctl_2           = 3'b0;
wire [2:0]   i_p_lx_margin_ctl_3           = 3'b0;
wire         i_p_lx_swing_ctl_0            = 1'b0;
wire         i_p_lx_swing_ctl_1            = 1'b0;
wire         i_p_lx_swing_ctl_2            = 1'b0;
wire         i_p_lx_swing_ctl_3            = 1'b0;
wire [1:0]   i_p_lx_deemp_ctl_0            = 2'b0;
wire [1:0]   i_p_lx_deemp_ctl_1            = 2'b0;
wire [1:0]   i_p_lx_deemp_ctl_2            = 2'b0;
wire [1:0]   i_p_lx_deemp_ctl_3            = 2'b0;
wire         i_p_rx_highz_0                =1'b0;
wire         i_p_rx_highz_1                =1'b0;
wire         i_p_rx_highz_2                =1'b0;
wire         i_p_rx_highz_3                =1'b0;
wire         i_p_lane_sync_0               =1'b0;    
wire         i_p_lane_sync_en_0            =1'b0;
wire         i_p_lane_sync_1               =1'b0;
wire         i_p_lane_sync_en_1            =1'b0;
wire         i_p_rate_change_tclk_on_0     =1'b1;
wire         i_p_rate_change_tclk_on_1     =1'b1;
wire [1:0]   i_p_tx_ckdiv_0                = P_LX_TX_CKDIV_0;
wire [1:0]   i_p_tx_ckdiv_1                = P_LX_TX_CKDIV_1;
wire [1:0]   i_p_tx_ckdiv_2                = P_LX_TX_CKDIV_2;
wire [1:0]   i_p_tx_ckdiv_3                = P_LX_TX_CKDIV_3;
wire [1:0]   i_p_lx_rx_ckdiv_0             = LX_RX_CKDIV_0;
wire [1:0]   i_p_lx_rx_ckdiv_1             = LX_RX_CKDIV_1;
wire [1:0]   i_p_lx_rx_ckdiv_2             = LX_RX_CKDIV_2;
wire [1:0]   i_p_lx_rx_ckdiv_3             = LX_RX_CKDIV_3;
wire [1:0]   i_p_lx_elecidle_en_0          = 2'b0;
wire [1:0]   i_p_lx_elecidle_en_1          = 2'b0;
wire [1:0]   i_p_lx_elecidle_en_2          = 2'b0;
wire [1:0]   i_p_lx_elecidle_en_3          = 2'b0;
assign       o_p_pll_lock_0                = P_PLL_READY_0;
assign       o_p_rx_sigdet_sta_2           = P_RX_SIGDET_STATUS_2;
assign       o_p_rx_sigdet_sta_3           = P_RX_SIGDET_STATUS_3;
assign       o_p_lx_cdr_align_2            = P_LX_CDR_ALIGN_2;
assign       o_p_lx_cdr_align_3            = P_LX_CDR_ALIGN_3;
wire [1:0]   o_p_lx_oob_sta_0              ;
wire [1:0]   o_p_lx_oob_sta_1              ;
wire [1:0]   o_p_lx_oob_sta_2              ;
wire [1:0]   o_p_lx_oob_sta_3              ;
wire         i_p_lx_rxdct_en_0             = 1'b0;
wire         i_p_lx_rxdct_en_1             = 1'b0;
wire         i_p_lx_rxdct_en_2             = 1'b0;
wire         i_p_lx_rxdct_en_3             = 1'b0;
wire         o_p_lx_rxdct_out_0            ;
wire         o_p_lx_rxdct_out_1            ;
wire         o_p_lx_rxdct_out_2            ;
wire         o_p_lx_rxdct_out_3            ;
wire         i_p_rxgear_slip_0             = 1'b0;
wire         i_p_rxgear_slip_1             = 1'b0;
wire         i_p_rxgear_slip_2             = 1'b0;
wire         i_p_rxgear_slip_3             = 1'b0;
assign       P_PCS_WORD_ALIGN_EN[0]        = 1'b0;
assign       P_PCS_WORD_ALIGN_EN[1]        = 1'b0;
assign       P_PCS_WORD_ALIGN_EN[2]        = 1'b0;
assign       P_PCS_WORD_ALIGN_EN[3]        = 1'b0;
assign       P_PCS_MCB_EXT_EN[0]           = 1'b0;
assign       P_PCS_MCB_EXT_EN[1]           = 1'b0;
assign       P_PCS_MCB_EXT_EN[2]           = 1'b0;
assign       P_PCS_MCB_EXT_EN[3]           = 1'b0;
assign       o_p_pcs_lsm_synced_2          = P_PCS_LSM_SYNCED[2];
assign       o_p_pcs_lsm_synced_3          = P_PCS_LSM_SYNCED[3];
assign       P_PCS_NEAREND_LOOP[0]         = 1'b0; 
assign       P_PCS_FAREND_LOOP[0]          = 1'b0;  
assign       P_PMA_NEAREND_PLOOP[0]        = 1'b0;
assign       P_PMA_NEAREND_SLOOP[0]        = 1'b0;
assign       P_PMA_FAREND_PLOOP[0]         = 1'b0; 
assign       P_PCS_NEAREND_LOOP[1]         = 1'b0; 
assign       P_PCS_FAREND_LOOP[1]          = 1'b0;  
assign       P_PMA_NEAREND_PLOOP[1]        = 1'b0;
assign       P_PMA_NEAREND_SLOOP[1]        = 1'b0;
assign       P_PMA_FAREND_PLOOP[1]         = 1'b0; 
assign       P_PCS_NEAREND_LOOP[2]         = 1'b0; 
assign       P_PCS_FAREND_LOOP[2]          = 1'b0;  
assign       P_PMA_NEAREND_PLOOP[2]        = 1'b0;
assign       P_PMA_NEAREND_SLOOP[2]        = 1'b0;
assign       P_PMA_FAREND_PLOOP[2]         = 1'b0; 
assign       P_PCS_NEAREND_LOOP[3]         = 1'b0; 
assign       P_PCS_FAREND_LOOP[3]          = 1'b0;  
assign       P_PMA_NEAREND_PLOOP[3]        = 1'b0;
assign       P_PMA_NEAREND_SLOOP[3]        = 1'b0;
assign       P_PMA_FAREND_PLOOP[3]         = 1'b0; 
assign       P_RX_POLARITY_INVERT[0]       = 1'b0;
assign       P_RX_POLARITY_INVERT[1]       = 1'b0;
assign       P_RX_POLARITY_INVERT[2]       = 1'b0;
assign       P_RX_POLARITY_INVERT[3]       = 1'b0;
wire         i_p_tx_beacon_en_0            = 1'b0;
wire         i_p_tx_beacon_en_1            = 1'b0;
wire         i_p_tx_beacon_en_2            = 1'b0;
wire         i_p_tx_beacon_en_3            = 1'b0;
wire         i_p_cfg_clk                   = 1'b0;
wire         i_p_cfg_rst                   = 1'b1;
wire         i_p_cfg_psel                  = 1'b0;
wire         i_p_cfg_enable                = 1'b0;
wire         i_p_cfg_write                 = 1'b0;
wire [15:0]  i_p_cfg_addr                  = 16'b0;
wire [7:0]   i_p_cfg_wdata                 = 8'b0;
wire [7:0]   o_p_cfg_rdata                 ;
wire         o_p_cfg_int                   ;
wire         o_p_cfg_ready                 ;
wire         o_p_l0txn                     ;
wire         o_p_l0txp                     ;
wire         o_p_l1txn                     ;
wire         o_p_l1txp                     ;
wire [45:0]  i_p_tdata_0                   = 46'b0;
wire [45:0]  i_p_tdata_1                   = 46'b0;
wire [45:0]  i_p_tdata_2                   = {i_p_lx_elecidle_en_2,
                                              i_txk_2[3],i_tdispctrl_2[3],i_tdispsel_2[3],i_txd_2[31:24],
                                              i_txk_2[2],i_tdispctrl_2[2],i_tdispsel_2[2],i_txd_2[23:16],
                                              i_txk_2[1],i_tdispctrl_2[1],i_tdispsel_2[1],i_txd_2[15:8],
                                              i_txk_2[0],i_tdispctrl_2[0],i_tdispsel_2[0],i_txd_2[7:0]};
wire [45:0]  i_p_tdata_3                   = {i_p_lx_elecidle_en_3,
                                              i_txk_3[3],i_tdispctrl_3[3],i_tdispsel_3[3],i_txd_3[31:24],
                                              i_txk_3[2],i_tdispctrl_3[2],i_tdispsel_3[2],i_txd_3[23:16],
                                              i_txk_3[1],i_tdispctrl_3[1],i_tdispsel_3[1],i_txd_3[15:8],
                                              i_txk_3[0],i_tdispctrl_3[0],i_tdispsel_3[0],i_txd_3[7:0]};
wire [46:0]  o_p_rdata_0                   ;

wire [46:0]  o_p_rdata_1                   ;

wire [46:0]  o_p_rdata_2                   ;

assign       o_rxstatus_2                  = o_p_rdata_2[46:44];
assign       o_rxd_2                       = {o_p_rdata_2[40:33],o_p_rdata_2[29:22],o_p_rdata_2[18:11],o_p_rdata_2[7:0]};
assign       o_rdisper_2                   = {o_p_rdata_2[41],o_p_rdata_2[30],o_p_rdata_2[19],o_p_rdata_2[8]};
assign       o_rdecer_2                    = {o_p_rdata_2[42],o_p_rdata_2[31],o_p_rdata_2[20],o_p_rdata_2[9]};
assign       o_rxk_2                       = {o_p_rdata_2[43],o_p_rdata_2[32],o_p_rdata_2[21],o_p_rdata_2[10]};
wire [46:0]  o_p_rdata_3                   ;

assign       o_rxstatus_3                  = o_p_rdata_3[46:44];
assign       o_rxd_3                       = {o_p_rdata_3[40:33],o_p_rdata_3[29:22],o_p_rdata_3[18:11],o_p_rdata_3[7:0]};
assign       o_rdisper_3                   = {o_p_rdata_3[41],o_p_rdata_3[30],o_p_rdata_3[19],o_p_rdata_3[8]};
assign       o_rdecer_3                    = {o_p_rdata_3[42],o_p_rdata_3[31],o_p_rdata_3[20],o_p_rdata_3[9]};
assign       o_rxk_3                       = {o_p_rdata_3[43],o_p_rdata_3[32],o_p_rdata_3[21],o_p_rdata_3[10]};
ipml_hsst_rst_v1_1#(
    .INNER_RST_EN                  (INNER_RST_EN                  ), //TRUE: HSST Reset Auto Control, FALSE: HSST Reset Control by User
    .FREE_CLOCK_FREQ               (FREE_CLOCK_FREQ               ), //Unit is MHz, free clock  freq from GUI Freq: 0~200MHz
    .CH0_TX_ENABLE                 (CH0_TX_ENABLE                 ), //TRUE:lane0 TX Reset Logic used, FALSE: lane0 TX Reset Logic remove
    .CH1_TX_ENABLE                 (CH1_TX_ENABLE                 ), //TRUE:lane1 TX Reset Logic used, FALSE: lane1 TX Reset Logic remove
    .CH2_TX_ENABLE                 (CH2_TX_ENABLE                 ), //TRUE:lane2 TX Reset Logic used, FALSE: lane2 TX Reset Logic remove
    .CH3_TX_ENABLE                 (CH3_TX_ENABLE                 ), //TRUE:lane3 TX Reset Logic used, FALSE: lane3 TX Reset Logic remove
    .CH0_RX_ENABLE                 (CH0_RX_ENABLE                 ), //TRUE:lane0 RX Reset Logic used, FALSE: lane0 RX Reset Logic remove
    .CH1_RX_ENABLE                 (CH1_RX_ENABLE                 ), //TRUE:lane1 RX Reset Logic used, FALSE: lane1 RX Reset Logic remove
    .CH2_RX_ENABLE                 (CH2_RX_ENABLE                 ), //TRUE:lane2 RX Reset Logic used, FALSE: lane2 RX Reset Logic remove
    .CH3_RX_ENABLE                 (CH3_RX_ENABLE                 ), //TRUE:lane3 RX Reset Logic used, FALSE: lane3 RX Reset Logic remove
    .CH0_MULT_LANE_MODE            (CH0_MULT_LANE_MODE            ), //Lane0 --> 1: Singel Lane 2:Two Lane 4:Four Lane
    .CH1_MULT_LANE_MODE            (CH1_MULT_LANE_MODE            ), //Lane1 --> 1: Singel Lane 2:Two Lane 4:Four Lane
    .CH2_MULT_LANE_MODE            (CH2_MULT_LANE_MODE            ), //Lane2 --> 1: Singel Lane 2:Two Lane 4:Four Lane
    .CH3_MULT_LANE_MODE            (CH3_MULT_LANE_MODE            ), //Lane3 --> 1: Singel Lane 2:Two Lane 4:Four Lane
    .PCS_CH0_BYPASS_WORD_ALIGN     (PCS_CH0_BYPASS_ALIGN          ), //TRUE: Lane0 Bypass Word Alignment or OUTSIDE Mode, FALSE: Lane0 No Bypass Word Alignment
    .PCS_CH1_BYPASS_WORD_ALIGN     (PCS_CH1_BYPASS_ALIGN          ), //TRUE: Lane1 Bypass Word Alignment or OUTSIDE Mode, FALSE: Lane1 No Bypass Word Alignment
    .PCS_CH2_BYPASS_WORD_ALIGN     (PCS_CH2_BYPASS_ALIGN          ), //TRUE: Lane2 Bypass Word Alignment or OUTSIDE Mode, FALSE: Lane0 No Bypass Word Alignment
    .PCS_CH3_BYPASS_WORD_ALIGN     (PCS_CH3_BYPASS_ALIGN          ), //TRUE: Lane3 Bypass Word Alignment or OUTSIDE Mode, FALSE: Lane0 No Bypass Word Alignment
    .PCS_CH0_BYPASS_BONDING        (PCS_CH0_BYPASS_BOND           ), //TRUE: Lane0 Bypass Channel Bonding, FALSE: Lane0 No Bypass Channel Bonding
    .PCS_CH1_BYPASS_BONDING        (PCS_CH1_BYPASS_BOND           ), //TRUE: Lane1 Bypass Channel Bonding, FALSE: Lane1 No Bypass Channel Bonding
    .PCS_CH2_BYPASS_BONDING        (PCS_CH2_BYPASS_BOND           ), //TRUE: Lane2 Bypass Channel Bonding, FALSE: Lane2 No Bypass Channel Bonding
    .PCS_CH3_BYPASS_BONDING        (PCS_CH3_BYPASS_BOND           ), //TRUE: Lane3 Bypass Channel Bonding, FALSE: Lane3 No Bypass Channel Bonding
    .PCS_CH0_BYPASS_CTC            (PCS_CH0_BYPASS_CTC            ), //TRUE: Lane0 Bypass CTC, FALSE: Lane0 No Bypass CTC
    .PCS_CH1_BYPASS_CTC            (PCS_CH1_BYPASS_CTC            ), //TRUE: Lane1 Bypass CTC, FALSE: Lane1 No Bypass CTC
    .PCS_CH2_BYPASS_CTC            (PCS_CH2_BYPASS_CTC            ), //TRUE: Lane2 Bypass CTC, FALSE: Lane2 No Bypass CTC
    .PCS_CH3_BYPASS_CTC            (PCS_CH3_BYPASS_CTC            ), //TRUE: Lane3 Bypass CTC, FALSE: Lane3 No Bypass CTC
    .P_LX_TX_CKDIV_0               (P_LX_TX_CKDIV_0               ), //TX initial clock division value
    .P_LX_TX_CKDIV_1               (P_LX_TX_CKDIV_1               ), //TX initial clock division value
    .P_LX_TX_CKDIV_2               (P_LX_TX_CKDIV_2               ), //TX initial clock division value
    .P_LX_TX_CKDIV_3               (P_LX_TX_CKDIV_3               ), //TX initial clock division value
    .LX_RX_CKDIV_0                 (LX_RX_CKDIV_0                 ), //RX initial clock division value
    .LX_RX_CKDIV_1                 (LX_RX_CKDIV_1                 ), //RX initial clock division value
    .LX_RX_CKDIV_2                 (LX_RX_CKDIV_2                 ), //RX initial clock division value
    .LX_RX_CKDIV_3                 (LX_RX_CKDIV_3                 ), //RX initial clock division value
    .CH0_TX_PLL_SEL                (TX_CHANNEL0_PLL               ), //Lane0 --> 1:PLL1  0:PLL0
    .CH1_TX_PLL_SEL                (TX_CHANNEL1_PLL               ), //Lane1 --> 1:PLL1  0:PLL0
    .CH2_TX_PLL_SEL                (TX_CHANNEL2_PLL               ), //Lane2 --> 1:PLL1  0:PLL0
    .CH3_TX_PLL_SEL                (TX_CHANNEL3_PLL               ), //Lane3 --> 1:PLL1  0:PLL0
    .CH0_RX_PLL_SEL                (RX_CHANNEL0_PLL               ), //Lane0 --> 1:PLL1  0:PLL0
    .CH1_RX_PLL_SEL                (RX_CHANNEL1_PLL               ), //Lane1 --> 1:PLL1  0:PLL0
    .CH2_RX_PLL_SEL                (RX_CHANNEL2_PLL               ), //Lane2 --> 1:PLL1  0:PLL0
    .CH3_RX_PLL_SEL                (RX_CHANNEL3_PLL               ), //Lane3 --> 1:PLL1  0:PLL0
    .PLL_NUBER                     (PLL_NUM                       ), //1 or 2          
    .PCS_TX_CLK_EXPLL_USE_CH0      (TX0_CLK2_FR_CORE              ), //
    .PCS_TX_CLK_EXPLL_USE_CH1      (TX0_CLK2_FR_CORE              ), //
    .PCS_TX_CLK_EXPLL_USE_CH2      (TX0_CLK2_FR_CORE              ), //
    .PCS_TX_CLK_EXPLL_USE_CH3      (TX0_CLK2_FR_CORE              ), //
    .PCS_RX_CLK_EXPLL_USE_CH0      (RX0_CLK2_FR_CORE              ), //
    .PCS_RX_CLK_EXPLL_USE_CH1      (RX1_CLK2_FR_CORE              ), //
    .PCS_RX_CLK_EXPLL_USE_CH2      (RX2_CLK2_FR_CORE              ), //
    .PCS_RX_CLK_EXPLL_USE_CH3      (RX3_CLK2_FR_CORE              )  //
) U_IPML_HSST_RST (
    //BOTH NEED
    .i_pll_lock_tx_0               (i_pll_lock_tx_0               ), // input  wire                   
    .i_pll_lock_tx_1               (i_pll_lock_tx_1               ), // input  wire                   
    .i_pll_lock_tx_2               (i_pll_lock_tx_2               ), // input  wire                   
    .i_pll_lock_tx_3               (i_pll_lock_tx_3               ), // input  wire                   
    .i_pll_lock_rx_0               (i_pll_lock_rx_0               ), // input  wire                   
    .i_pll_lock_rx_1               (i_pll_lock_rx_1               ), // input  wire                   
    .i_pll_lock_rx_2               (i_pll_lock_rx_2               ), // input  wire                   
    .i_pll_lock_rx_3               (i_pll_lock_rx_3               ), // input  wire                   
    //--- User Side ---
    //INNER_RST_EN is TRUE 
    .i_free_clk                    (i_free_clk                    ), // input  wire                    
    .i_pll_rst_0                   (i_pll_rst_0                   ), // input  wire                    
    .i_pll_rst_1                   (i_pll_rst_1                   ), // input  wire                    
    .i_wtchdg_clr_0                (i_wtchdg_clr_0                ), // input  wire                    
    .i_wtchdg_clr_1                (i_wtchdg_clr_1                ), // input  wire
    .i_lane_pd_0                   (i_lane_pd_0                   ), // input  wire
    .i_lane_pd_1                   (i_lane_pd_1                   ), // input  wire
    .i_lane_pd_2                   (i_lane_pd_2                   ), // input  wire
    .i_lane_pd_3                   (i_lane_pd_3                   ), // input  wire
    .i_txlane_rst_0                (i_txlane_rst_0                ), // input  wire                    
    .i_txlane_rst_1                (i_txlane_rst_1                ), // input  wire                    
    .i_txlane_rst_2                (i_txlane_rst_2                ), // input  wire                    
    .i_txlane_rst_3                (i_txlane_rst_3                ), // input  wire                    
    .i_rxlane_rst_0                (i_rxlane_rst_0                ), // input  wire                    
    .i_rxlane_rst_1                (i_rxlane_rst_1                ), // input  wire                    
    .i_rxlane_rst_2                (i_rxlane_rst_2                ), // input  wire                    
    .i_rxlane_rst_3                (i_rxlane_rst_3                ), // input  wire                    
    .i_tx_rate_chng_0              (i_tx_rate_chng_0              ), // input  wire
    .i_tx_rate_chng_1              (i_tx_rate_chng_1              ), // input  wire
    .i_tx_rate_chng_2              (i_tx_rate_chng_2              ), // input  wire
    .i_tx_rate_chng_3              (i_tx_rate_chng_3              ), // input  wire
    .i_rx_rate_chng_0              (i_rx_rate_chng_0              ), // input  wire                    
    .i_rx_rate_chng_1              (i_rx_rate_chng_1              ), // input  wire                    
    .i_rx_rate_chng_2              (i_rx_rate_chng_2              ), // input  wire                    
    .i_rx_rate_chng_3              (i_rx_rate_chng_3              ), // input  wire                    
    .i_txckdiv_0                   (i_txckdiv_0                   ), // input  wire    [1 : 0]         
    .i_txckdiv_1                   (i_txckdiv_1                   ), // input  wire    [1 : 0]         
    .i_txckdiv_2                   (i_txckdiv_2                   ), // input  wire    [1 : 0]         
    .i_txckdiv_3                   (i_txckdiv_3                   ), // input  wire    [1 : 0]         
    .i_rxckdiv_0                   (i_rxckdiv_0                   ), // input  wire    [1 : 0]         
    .i_rxckdiv_1                   (i_rxckdiv_1                   ), // input  wire    [1 : 0]         
    .i_rxckdiv_2                   (i_rxckdiv_2                   ), // input  wire    [1 : 0]         
    .i_rxckdiv_3                   (i_rxckdiv_3                   ), // input  wire    [1 : 0]         
    .i_pcs_cb_rst_0                (i_pcs_cb_rst_0                ), // input  wire                    
    .i_pcs_cb_rst_1                (i_pcs_cb_rst_1                ), // input  wire                    
    .i_pcs_cb_rst_2                (i_pcs_cb_rst_2                ), // input  wire                    
    .i_pcs_cb_rst_3                (i_pcs_cb_rst_3                ), // input  wire                    
    .i_hsst_fifo_clr_0             (i_hsst_fifo_clr_0             ), // input  wire                    
    .i_hsst_fifo_clr_1             (i_hsst_fifo_clr_1             ), // input  wire                    
    .i_hsst_fifo_clr_2             (i_hsst_fifo_clr_2             ), // input  wire                    
    .i_hsst_fifo_clr_3             (i_hsst_fifo_clr_3             ), // input  wire         
    .i_force_rxfsm_det_0           (i_force_rxfsm_det_0           ), // input  wire                   Debug signal for loopback mode
    .i_force_rxfsm_lsm_0           (i_force_rxfsm_lsm_0           ), // input  wire                   Debug signal for loopback mode
    .i_force_rxfsm_cdr_0           (i_force_rxfsm_cdr_0           ), // input  wire                   Debug signal for loopback mode
    .i_force_rxfsm_det_1           (i_force_rxfsm_det_1           ), // input  wire                   Debug signal for loopback mode
    .i_force_rxfsm_lsm_1           (i_force_rxfsm_lsm_1           ), // input  wire                   Debug signal for loopback mode
    .i_force_rxfsm_cdr_1           (i_force_rxfsm_cdr_1           ), // input  wire                   Debug signal for loopback mode
    .i_force_rxfsm_det_2           (i_force_rxfsm_det_2           ), // input  wire                   Debug signal for loopback mode
    .i_force_rxfsm_lsm_2           (i_force_rxfsm_lsm_2           ), // input  wire                   Debug signal for loopback mode
    .i_force_rxfsm_cdr_2           (i_force_rxfsm_cdr_2           ), // input  wire                   Debug signal for loopback mode
    .i_force_rxfsm_det_3           (i_force_rxfsm_det_3           ), // input  wire                   Debug signal for loopback mode
    .i_force_rxfsm_lsm_3           (i_force_rxfsm_lsm_3           ), // input  wire                   Debug signal for loopback mode
    .i_force_rxfsm_cdr_3           (i_force_rxfsm_cdr_3           ), // input  wire                   Debug signal for loopback mode
    .o_wtchdg_st_0                 (o_wtchdg_st_0                 ), // output wire    [1 : 0]         
    .o_wtchdg_st_1                 (o_wtchdg_st_1                 ), // output wire    [1 : 0]         
    .o_pll_done_0                  (o_pll_done_0                  ), // output wire                    
    .o_pll_done_1                  (o_pll_done_1                  ), // output wire                    
    .o_txlane_done_0               (o_txlane_done_0               ), // output wire                    
    .o_txlane_done_1               (o_txlane_done_1               ), // output wire                    
    .o_txlane_done_2               (o_txlane_done_2               ), // output wire                    
    .o_txlane_done_3               (o_txlane_done_3               ), // output wire                    
    .o_tx_ckdiv_done_0             (o_tx_ckdiv_done_0             ), // output wire                    
    .o_tx_ckdiv_done_1             (o_tx_ckdiv_done_1             ), // output wire                    
    .o_tx_ckdiv_done_2             (o_tx_ckdiv_done_2             ), // output wire                    
    .o_tx_ckdiv_done_3             (o_tx_ckdiv_done_3             ), // output wire                    
    .o_rxlane_done_0               (o_rxlane_done_0               ), // output wire                    
    .o_rxlane_done_1               (o_rxlane_done_1               ), // output wire                    
    .o_rxlane_done_2               (o_rxlane_done_2               ), // output wire                    
    .o_rxlane_done_3               (o_rxlane_done_3               ), // output wire                    
    .o_rx_ckdiv_done_0             (o_rx_ckdiv_done_0             ), // output wire                    
    .o_rx_ckdiv_done_1             (o_rx_ckdiv_done_1             ), // output wire                    
    .o_rx_ckdiv_done_2             (o_rx_ckdiv_done_2             ), // output wire                    
    .o_rx_ckdiv_done_3             (o_rx_ckdiv_done_3             ), // output wire                    
    //INNER_RST_EN is FALSE
    .i_f_pllpowerdown_0            (i_p_pllpowerdown_0            ), // input  wire                   
    .i_f_pllpowerdown_1            (i_p_pllpowerdown_1            ), // input  wire                   
    .i_f_pll_rst_0                 (i_p_pll_rst_0                 ), // input  wire                   
    .i_f_pll_rst_1                 (i_p_pll_rst_1                 ), // input  wire                   
    .i_f_lane_sync_0               (i_p_lane_sync_0               ), // input  wire          
    .i_f_lane_sync_1               (i_p_lane_sync_1               ), // input  wire          
    .i_f_lane_sync_en_0            (i_p_lane_sync_en_0            ), // input  wire
    .i_f_lane_sync_en_1            (i_p_lane_sync_en_1            ), // input  wire
    .i_f_rate_change_tclk_on_0     (i_p_rate_change_tclk_on_0     ), // input  wire
    .i_f_rate_change_tclk_on_1     (i_p_rate_change_tclk_on_1     ), // input  wire
    .i_f_tx_lane_pd_0              (i_p_tx_lane_pd_0              ), // input  wire    
    .i_f_tx_lane_pd_1              (i_p_tx_lane_pd_1              ), // input  wire    
    .i_f_tx_lane_pd_2              (i_p_tx_lane_pd_2              ), // input  wire    
    .i_f_tx_lane_pd_3              (i_p_tx_lane_pd_3              ), // input  wire    
    .i_f_tx_pma_rst_0              (i_p_tx_pma_rst_0              ), // input  wire                   
    .i_f_tx_pma_rst_1              (i_p_tx_pma_rst_1              ), // input  wire                   
    .i_f_tx_pma_rst_2              (i_p_tx_pma_rst_2              ), // input  wire                   
    .i_f_tx_pma_rst_3              (i_p_tx_pma_rst_3              ), // input  wire                   
    .i_f_tx_ckdiv_0                (i_p_tx_ckdiv_0                ), // input  wire    [1 : 0]        
    .i_f_tx_ckdiv_1                (i_p_tx_ckdiv_1                ), // input  wire    [1 : 0]        
    .i_f_tx_ckdiv_2                (i_p_tx_ckdiv_2                ), // input  wire    [1 : 0]        
    .i_f_tx_ckdiv_3                (i_p_tx_ckdiv_3                ), // input  wire    [1 : 0]        
    .i_f_pcs_tx_rst_0              (i_p_pcs_tx_rst_0              ), // input  wire                   
    .i_f_pcs_tx_rst_1              (i_p_pcs_tx_rst_1              ), // input  wire                   
    .i_f_pcs_tx_rst_2              (i_p_pcs_tx_rst_2              ), // input  wire                   
    .i_f_pcs_tx_rst_3              (i_p_pcs_tx_rst_3              ), // input  wire                   
    .i_f_lane_pd_0                 (i_p_lane_pd_0                 ), // input  wire                   
    .i_f_lane_pd_1                 (i_p_lane_pd_1                 ), // input  wire                   
    .i_f_lane_pd_2                 (i_p_lane_pd_2                 ), // input  wire                   
    .i_f_lane_pd_3                 (i_p_lane_pd_3                 ), // input  wire                   
    .i_f_lane_rst_0                (i_p_lane_rst_0                ), // input  wire                   
    .i_f_lane_rst_1                (i_p_lane_rst_1                ), // input  wire                   
    .i_f_lane_rst_2                (i_p_lane_rst_2                ), // input  wire                   
    .i_f_lane_rst_3                (i_p_lane_rst_3                ), // input  wire                   
    .i_f_rx_lane_pd_0              (i_p_rx_lane_pd_0              ), // input  wire                   
    .i_f_rx_lane_pd_1              (i_p_rx_lane_pd_1              ), // input  wire                   
    .i_f_rx_lane_pd_2              (i_p_rx_lane_pd_2              ), // input  wire                   
    .i_f_rx_lane_pd_3              (i_p_rx_lane_pd_3              ), // input  wire                   
    .i_f_rx_pma_rst_0              (i_p_rx_pma_rst_0              ), // input  wire                   
    .i_f_rx_pma_rst_1              (i_p_rx_pma_rst_1              ), // input  wire                   
    .i_f_rx_pma_rst_2              (i_p_rx_pma_rst_2              ), // input  wire                   
    .i_f_rx_pma_rst_3              (i_p_rx_pma_rst_3              ), // input  wire                   
    .i_f_pcs_rx_rst_0              (i_p_pcs_rx_rst_0              ), // input  wire                   
    .i_f_pcs_rx_rst_1              (i_p_pcs_rx_rst_1              ), // input  wire                   
    .i_f_pcs_rx_rst_2              (i_p_pcs_rx_rst_2              ), // input  wire                   
    .i_f_pcs_rx_rst_3              (i_p_pcs_rx_rst_3              ), // input  wire                   
    .i_f_lx_rx_ckdiv_0             (i_p_lx_rx_ckdiv_0             ), // input  wire    [1 : 0]        
    .i_f_lx_rx_ckdiv_1             (i_p_lx_rx_ckdiv_1             ), // input  wire    [1 : 0]        
    .i_f_lx_rx_ckdiv_2             (i_p_lx_rx_ckdiv_2             ), // input  wire    [1 : 0]        
    .i_f_lx_rx_ckdiv_3             (i_p_lx_rx_ckdiv_3             ), // input  wire    [1 : 0]       
    .i_f_pcs_cb_rst_0              (i_p_pcs_cb_rst_0              ), // input  wire                   
    .i_f_pcs_cb_rst_1              (i_p_pcs_cb_rst_1              ), // input  wire                   
    .i_f_pcs_cb_rst_2              (i_p_pcs_cb_rst_2              ), // input  wire                   
    .i_f_pcs_cb_rst_3              (i_p_pcs_cb_rst_3              ), // input  wire                   

    //--- Hsst Side ---
    .P_PLL_READY_0                 (P_PLL_READY_0                 ), // input  wire                   
    .P_PLL_READY_1                 (P_PLL_READY_1                 ), // input  wire                   
    .P_RX_SIGDET_STATUS_0          (P_RX_SIGDET_STATUS_0          ), // input  wire                    
    .P_RX_SIGDET_STATUS_1          (P_RX_SIGDET_STATUS_1          ), // input  wire                    
    .P_RX_SIGDET_STATUS_2          (P_RX_SIGDET_STATUS_2          ), // input  wire                    
    .P_RX_SIGDET_STATUS_3          (P_RX_SIGDET_STATUS_3          ), // input  wire                    
    .P_RX_READY_0                  (P_LX_CDR_ALIGN_0              ), // input  wire                    
    .P_RX_READY_1                  (P_LX_CDR_ALIGN_1              ), // input  wire                    
    .P_RX_READY_2                  (P_LX_CDR_ALIGN_2              ), // input  wire                    
    .P_RX_READY_3                  (P_LX_CDR_ALIGN_3              ), // input  wire                    
    .P_PCS_LSM_SYNCED_0            (P_PCS_LSM_SYNCED[0]           ), // input  wire             
    .P_PCS_LSM_SYNCED_1            (P_PCS_LSM_SYNCED[1]           ), // input  wire             
    .P_PCS_LSM_SYNCED_2            (P_PCS_LSM_SYNCED[2]           ), // input  wire             
    .P_PCS_LSM_SYNCED_3            (P_PCS_LSM_SYNCED[3]           ), // input  wire             
    .P_PCS_RX_MCB_STATUS_0         (P_PCS_RX_MCB_STATUS[0]        ), // input  wire          
    .P_PCS_RX_MCB_STATUS_1         (P_PCS_RX_MCB_STATUS[1]        ), // input  wire          
    .P_PCS_RX_MCB_STATUS_2         (P_PCS_RX_MCB_STATUS[2]        ), // input  wire          
    .P_PCS_RX_MCB_STATUS_3         (P_PCS_RX_MCB_STATUS[3]        ), // input  wire          
    .P_PLLPOWERDOWN_0              (P_PLLPOWERDOWN_0              ), // output wire                    
    .P_PLLPOWERDOWN_1              (P_PLLPOWERDOWN_1              ), // output wire                    
    .P_PLL_RST_0                   (P_PLL_RST_0                   ), // output wire                    
    .P_PLL_RST_1                   (P_PLL_RST_1                   ), // output wire                    
    .P_LANE_SYNC_0                 (P_LANE_SYNC_0                 ), // output wire
    .P_LANE_SYNC_1                 (P_LANE_SYNC_1                 ), // output wire
    .P_LANE_SYNC_EN_0              (P_LANE_SYNC_EN_0              ), // output wire
    .P_LANE_SYNC_EN_1              (P_LANE_SYNC_EN_1              ), // output wire
    .P_RATE_CHANGE_TCLK_ON_0       (P_RATE_CHANGE_TCLK_ON_0       ), // output wire
    .P_RATE_CHANGE_TCLK_ON_1       (P_RATE_CHANGE_TCLK_ON_1       ), // output wire
    .P_TX_LANE_PD_0                (P_TX_LANE_PD_0                ), // output wire                   
    .P_TX_LANE_PD_1                (P_TX_LANE_PD_1                ), // output wire                   
    .P_TX_LANE_PD_2                (P_TX_LANE_PD_2                ), // output wire                   
    .P_TX_LANE_PD_3                (P_TX_LANE_PD_3                ), // output wire                   
    .P_TX_RATE_0                   (P_TX_RATE_0                   ), // output wire    [2 : 0]       
    .P_TX_RATE_1                   (P_TX_RATE_1                   ), // output wire    [2 : 0]       
    .P_TX_RATE_2                   (P_TX_RATE_2                   ), // output wire    [2 : 0]       
    .P_TX_RATE_3                   (P_TX_RATE_3                   ), // output wire    [2 : 0]       
    .P_TX_PMA_RST_0                (P_TX_PMA_RST_0                ), // output wire                    
    .P_TX_PMA_RST_1                (P_TX_PMA_RST_1                ), // output wire                    
    .P_TX_PMA_RST_2                (P_TX_PMA_RST_2                ), // output wire                    
    .P_TX_PMA_RST_3                (P_TX_PMA_RST_3                ), // output wire                    
    .P_PCS_TX_RST_0                (P_PCS_TX_RST_0                ), // output wire                    
    .P_PCS_TX_RST_1                (P_PCS_TX_RST_1                ), // output wire                    
    .P_PCS_TX_RST_2                (P_PCS_TX_RST_2                ), // output wire                    
    .P_PCS_TX_RST_3                (P_PCS_TX_RST_3                ), // output wire  
    .P_RX_PMA_RST_0                (P_RX_PMA_RST_0                ), // output wire                   
    .P_RX_PMA_RST_1                (P_RX_PMA_RST_1                ), // output wire                   
    .P_RX_PMA_RST_2                (P_RX_PMA_RST_2                ), // output wire                   
    .P_RX_PMA_RST_3                (P_RX_PMA_RST_3                ), // output wire                   
    .P_LANE_PD_0                   (P_LANE_PD_0                   ), // output wire                   
    .P_LANE_PD_1                   (P_LANE_PD_1                   ), // output wire                   
    .P_LANE_PD_2                   (P_LANE_PD_2                   ), // output wire                   
    .P_LANE_PD_3                   (P_LANE_PD_3                   ), // output wire                   
    .P_LANE_RST_0                  (P_LANE_RST_0                  ), // output wire                   
    .P_LANE_RST_1                  (P_LANE_RST_1                  ), // output wire                   
    .P_LANE_RST_2                  (P_LANE_RST_2                  ), // output wire                   
    .P_LANE_RST_3                  (P_LANE_RST_3                  ), // output wire                   
    .P_RX_LANE_PD_0                (P_RX_LANE_PD_0                ), // output wire                   
    .P_RX_LANE_PD_1                (P_RX_LANE_PD_1                ), // output wire                   
    .P_RX_LANE_PD_2                (P_RX_LANE_PD_2                ), // output wire                   
    .P_RX_LANE_PD_3                (P_RX_LANE_PD_3                ), // output wire                   
    .P_PCS_RX_RST_0                (P_PCS_RX_RST_0                ), // output wire                   
    .P_PCS_RX_RST_1                (P_PCS_RX_RST_1                ), // output wire                   
    .P_PCS_RX_RST_2                (P_PCS_RX_RST_2                ), // output wire                   
    .P_PCS_RX_RST_3                (P_PCS_RX_RST_3                ), // output wire                   
    .P_RX_RATE_0                   (P_RX_RATE_0                   ), // output wire    [2 : 0]         
    .P_RX_RATE_1                   (P_RX_RATE_1                   ), // output wire    [2 : 0]        
    .P_RX_RATE_2                   (P_RX_RATE_2                   ), // output wire    [2 : 0]        
    .P_RX_RATE_3                   (P_RX_RATE_3                   ), // output wire    [2 : 0]       
    .P_PCS_CB_RST_0                (P_PCS_CB_RST_0                ), // output wire
    .P_PCS_CB_RST_1                (P_PCS_CB_RST_1                ), // output wire
    .P_PCS_CB_RST_2                (P_PCS_CB_RST_2                ), // output wire
    .P_PCS_CB_RST_3                (P_PCS_CB_RST_3                )  // output wire
);




ipml_hsst_u_hsst_wrapper_v1_3e U_GTP_HSST_WRAPPER (
    //APB
    .P_CFG_CLK                         (i_p_cfg_clk                  ), // input          
    .P_CFG_RST                         (i_p_cfg_rst                  ), // input          
    .P_CFG_PSEL                        (i_p_cfg_psel                 ), // input          
    .P_CFG_ENABLE                      (i_p_cfg_enable               ), // input          
    .P_CFG_WRITE                       (i_p_cfg_write                ), // input          
    .P_CFG_ADDR                        (i_p_cfg_addr                 ), // input  [15:0]  
    .P_CFG_WDATA                       (i_p_cfg_wdata                ), // input  [7:0]   
    .P_CFG_RDATA                       (o_p_cfg_rdata                ), // output [7:0]   
    .P_CFG_INT                         (o_p_cfg_int                  ), // output         
    .P_CFG_READY                       (o_p_cfg_ready                ), // output         
    //PLL Common
    .P_HSST_RST                        (1'b0                         ), // input to be done
    //PLL0
    .P_PLLPOWERDOWN_0                  (P_PLLPOWERDOWN_0             ), // input          
    .P_PLL_RST_0                       (P_PLL_RST_0                  ), // input          
    .P_LANE_SYNC_0                     (P_LANE_SYNC_0                ), // input 
    .P_LANE_SYNC_EN_0                  (P_LANE_SYNC_EN_0             ), // input to be done 
    .P_RATE_CHANGE_TCLK_ON_0           (P_RATE_CHANGE_TCLK_ON_0      ), // input

    .P_PLL_REF_CLK_0                   (1'b0                         ), // input     
    
    .P_REFCK2CORE_0                    (o_p_refck2core_0             ), // output         
    .P_PLL_READY_0                     (P_PLL_READY_0                ), // output         
    
    .P_REFCLKN_0                       (i_p_refckn_0                 ), // input          
    .P_REFCLKP_0                       (i_p_refckp_0                 ), // input
        
    //PLL1
    .P_PLLPOWERDOWN_1                  (P_PLLPOWERDOWN_1             ), // input          
    .P_PLL_RST_1                       (P_PLL_RST_1                  ), // input          
    .P_LANE_SYNC_1                     (P_LANE_SYNC_1                ), // input    
    .P_LANE_SYNC_EN_1                  (P_LANE_SYNC_EN_1             ), // input to be done 
    .P_RATE_CHANGE_TCLK_ON_1           (P_RATE_CHANGE_TCLK_ON_1      ), // input   

    .P_PLL_REF_CLK_1                   (1'b0                         ), // input     
    
    .P_REFCK2CORE_1                    (o_p_refck2core_1             ), // output         
    .P_PLL_READY_1                     (P_PLL_READY_1                ), // output         
    
    .P_TCLK2FABRIC                     (P_TCLK2FABRIC                ), // output
    .P_RCLK2FABRIC                     (P_RCLK2FABRIC                ), // output
    .P_PCS_WORD_ALIGN_EN               (P_PCS_WORD_ALIGN_EN          ), // input
    .P_RX_POLARITY_INVERT              (P_RX_POLARITY_INVERT         ), // input 
    .P_PCS_MCB_EXT_EN                  (P_PCS_MCB_EXT_EN             ), // input             
    .P_PCS_NEAREND_LOOP                (P_PCS_NEAREND_LOOP           ), // input             
    .P_PCS_FAREND_LOOP                 (P_PCS_FAREND_LOOP            ), // input             
    .P_PMA_NEAREND_PLOOP               (P_PMA_NEAREND_PLOOP          ), // input             
    .P_PMA_NEAREND_SLOOP               (P_PMA_NEAREND_SLOOP          ), // input             
    .P_PMA_FAREND_PLOOP                (P_PMA_FAREND_PLOOP           ), // input             
    .P_PCS_LSM_SYNCED                  (P_PCS_LSM_SYNCED             ), // output  
    .P_PCS_RX_MCB_STATUS               (P_PCS_RX_MCB_STATUS          ), // output   
    .P_TX_PMA_RST_0                    (P_TX_PMA_RST_0               ), // input               
    .P_TX_LANE_PD_0                    (P_TX_LANE_PD_0               ), // input               
    .P_LANE_PD_0                       (P_LANE_PD_0                  ), // input               
    .P_LANE_RST_0                      (P_LANE_RST_0                 ), // input               
    .P_RX_LANE_PD_0                    (P_RX_LANE_PD_0               ), // input               
    .P_TX0_CLK_FR_CORE                 (i_p_tx0_clk_fr_core          ), // input          
    .P_TX0_CLK2_FR_CORE                (i_p_tx0_clk2_fr_core         ), // input          
    .P_RX0_CLK_FR_CORE                 (i_p_rx0_clk_fr_core          ), // input          
    .P_RX0_CLK2_FR_CORE                (i_p_rx0_clk2_fr_core         ), // input          
    .P_RX_PMA_RST_0                    (P_RX_PMA_RST_0               ), // input          
    .P_PCS_TX_RST_0                    (P_PCS_TX_RST_0               ), // input          
    .P_PCS_RX_RST_0                    (P_PCS_RX_RST_0               ), // input          
    .P_PCS_CB_RST_0                    (P_PCS_CB_RST_0               ), // input          
    .P_TX_MARGIN_0                     (i_p_lx_margin_ctl_0          ), // input  [2:0]   
    .P_TX_SWING_0                      (i_p_lx_swing_ctl_0           ), // input          
    .P_TX_DEEMP_0                      (i_p_lx_deemp_ctl_0           ), // input  [1:0]  
    .P_RX_HIGHZ_0                      (i_p_rx_highz_0               ), // input 
    .P_TX_BEACON_EN_0                  (i_p_tx_beacon_en_0           ), // input              
    .P_RXGEAR_SLIP_0                   (i_p_rxgear_slip_0            ), // input              
    .P_TX_RATE_0                       (P_TX_RATE_0                  ), // input  [2:0]   
    .P_RX_RATE_0                       (P_RX_RATE_0                  ), // input  [2:0]   
    .P_RX_SIGDET_STATUS_0              (P_RX_SIGDET_STATUS_0         ), // output         
    .P_RX_READY_0                      (P_LX_CDR_ALIGN_0             ), // output         
    .P_RX_SATA_COMINIT_0               (o_p_lx_oob_sta_0[0]          ), // output         
    .P_RX_SATA_COMWAKE_0               (o_p_lx_oob_sta_0[1]          ), // output         
    .P_TX_RXDET_REQ_0                  (i_p_lx_rxdct_en_0            ), // input       
    .P_TX_RXDET_STATUS_0               (o_p_lx_rxdct_out_0           ), // output         
    .P_TDATA_0                         (i_p_tdata_0                  ), // input  [45:0]  
    .P_RDATA_0                         (o_p_rdata_0                  ), // output [46:0]  
    .P_TX_SDN0                         (o_p_l0txn                    ), // output         
    .P_TX_SDP0                         (o_p_l0txp                    ), // output         

    .P_TX_PMA_RST_1                    (P_TX_PMA_RST_1               ), // input               
    .P_TX_LANE_PD_1                    (P_TX_LANE_PD_1               ), // input               
    .P_LANE_PD_1                       (P_LANE_PD_1                  ), // input               
    .P_LANE_RST_1                      (P_LANE_RST_1                 ), // input               
    .P_RX_LANE_PD_1                    (P_RX_LANE_PD_1               ), // input               
    .P_TX1_CLK_FR_CORE                 (i_p_tx1_clk_fr_core          ), // input          
    .P_TX1_CLK2_FR_CORE                (i_p_tx1_clk2_fr_core         ), // input          
    .P_RX1_CLK_FR_CORE                 (i_p_rx1_clk_fr_core          ), // input          
    .P_RX1_CLK2_FR_CORE                (i_p_rx1_clk2_fr_core         ), // input          
    .P_RX_PMA_RST_1                    (P_RX_PMA_RST_1               ), // input          
    .P_PCS_TX_RST_1                    (P_PCS_TX_RST_1               ), // input          
    .P_PCS_RX_RST_1                    (P_PCS_RX_RST_1               ), // input          
    .P_PCS_CB_RST_1                    (P_PCS_CB_RST_1               ), // input          
    .P_TX_MARGIN_1                     (i_p_lx_margin_ctl_1          ), // input  [2:1]   
    .P_TX_SWING_1                      (i_p_lx_swing_ctl_1           ), // input          
    .P_TX_DEEMP_1                      (i_p_lx_deemp_ctl_1           ), // input  [1:1]  
    .P_RX_HIGHZ_1                      (i_p_rx_highz_1               ), // input 
    .P_TX_BEACON_EN_1                  (i_p_tx_beacon_en_1           ), // input              
    .P_RXGEAR_SLIP_1                   (i_p_rxgear_slip_1            ), // input              
    .P_TX_RATE_1                       (P_TX_RATE_1                  ), // input  [2:1]   
    .P_RX_RATE_1                       (P_RX_RATE_1                  ), // input  [2:1]   
    .P_RX_SIGDET_STATUS_1              (P_RX_SIGDET_STATUS_1         ), // output         
    .P_RX_READY_1                      (P_LX_CDR_ALIGN_1             ), // output         
    .P_RX_SATA_COMINIT_1               (o_p_lx_oob_sta_1[0]          ), // output         
    .P_RX_SATA_COMWAKE_1               (o_p_lx_oob_sta_1[1]          ), // output         
    .P_TX_RXDET_REQ_1                  (i_p_lx_rxdct_en_1            ), // input       
    .P_TX_RXDET_STATUS_1               (o_p_lx_rxdct_out_1           ), // output         
    .P_TDATA_1                         (i_p_tdata_1                  ), // input  [45:1]  
    .P_RDATA_1                         (o_p_rdata_1                  ), // output [46:1]  
    .P_TX_SDN1                         (o_p_l1txn                    ), // output         
    .P_TX_SDP1                         (o_p_l1txp                    ), // output         

    .P_TX_PMA_RST_2                    (P_TX_PMA_RST_2               ), // input               
    .P_TX_LANE_PD_2                    (P_TX_LANE_PD_2               ), // input               
    .P_LANE_PD_2                       (P_LANE_PD_2                  ), // input               
    .P_LANE_RST_2                      (P_LANE_RST_2                 ), // input               
    .P_RX_LANE_PD_2                    (P_RX_LANE_PD_2               ), // input               
    .P_TX2_CLK_FR_CORE                 (i_p_tx2_clk_fr_core          ), // input          
    .P_TX2_CLK2_FR_CORE                (i_p_tx2_clk2_fr_core         ), // input          
    .P_RX2_CLK_FR_CORE                 (i_p_rx2_clk_fr_core          ), // input          
    .P_RX2_CLK2_FR_CORE                (i_p_rx2_clk2_fr_core         ), // input          
    .P_RX_PMA_RST_2                    (P_RX_PMA_RST_2               ), // input          
    .P_PCS_TX_RST_2                    (P_PCS_TX_RST_2               ), // input          
    .P_PCS_RX_RST_2                    (P_PCS_RX_RST_2               ), // input          
    .P_PCS_CB_RST_2                    (P_PCS_CB_RST_2               ), // input          
    .P_TX_MARGIN_2                     (i_p_lx_margin_ctl_2          ), // input  [2:2]   
    .P_TX_SWING_2                      (i_p_lx_swing_ctl_2           ), // input          
    .P_TX_DEEMP_2                      (i_p_lx_deemp_ctl_2           ), // input  [1:2]  
    .P_RX_HIGHZ_2                      (i_p_rx_highz_2               ), // input 
    .P_TX_BEACON_EN_2                  (i_p_tx_beacon_en_2           ), // input              
    .P_RXGEAR_SLIP_2                   (i_p_rxgear_slip_2            ), // input              
    .P_TX_RATE_2                       (P_TX_RATE_2                  ), // input  [2:2]   
    .P_RX_RATE_2                       (P_RX_RATE_2                  ), // input  [2:2]   
    .P_RX_SIGDET_STATUS_2              (P_RX_SIGDET_STATUS_2         ), // output         
    .P_RX_READY_2                      (P_LX_CDR_ALIGN_2             ), // output         
    .P_RX_SATA_COMINIT_2               (o_p_lx_oob_sta_2[0]          ), // output         
    .P_RX_SATA_COMWAKE_2               (o_p_lx_oob_sta_2[1]          ), // output         
    .P_TX_RXDET_REQ_2                  (i_p_lx_rxdct_en_2            ), // input       
    .P_TX_RXDET_STATUS_2               (o_p_lx_rxdct_out_2           ), // output         
    .P_TDATA_2                         (i_p_tdata_2                  ), // input  [45:2]  
    .P_RDATA_2                         (o_p_rdata_2                  ), // output [46:2]  
    .P_TX_SDN2                         (o_p_l2txn                    ), // output         
    .P_TX_SDP2                         (o_p_l2txp                    ), // output         

    .P_RX_SDN2                         (i_p_l2rxn                    ),
    .P_RX_SDP2                         (i_p_l2rxp                    ),
    .P_TX_PMA_RST_3                    (P_TX_PMA_RST_3               ), // input               
    .P_TX_LANE_PD_3                    (P_TX_LANE_PD_3               ), // input               
    .P_LANE_PD_3                       (P_LANE_PD_3                  ), // input               
    .P_LANE_RST_3                      (P_LANE_RST_3                 ), // input               
    .P_RX_LANE_PD_3                    (P_RX_LANE_PD_3               ), // input               
    .P_TX3_CLK_FR_CORE                 (i_p_tx3_clk_fr_core          ), // input          
    .P_TX3_CLK2_FR_CORE                (i_p_tx3_clk2_fr_core         ), // input          
    .P_RX3_CLK_FR_CORE                 (i_p_rx3_clk_fr_core          ), // input          
    .P_RX3_CLK2_FR_CORE                (i_p_rx3_clk2_fr_core         ), // input          
    .P_RX_PMA_RST_3                    (P_RX_PMA_RST_3               ), // input          
    .P_PCS_TX_RST_3                    (P_PCS_TX_RST_3               ), // input          
    .P_PCS_RX_RST_3                    (P_PCS_RX_RST_3               ), // input          
    .P_PCS_CB_RST_3                    (P_PCS_CB_RST_3               ), // input          
    .P_TX_MARGIN_3                     (i_p_lx_margin_ctl_3          ), // input  [2:3]   
    .P_TX_SWING_3                      (i_p_lx_swing_ctl_3           ), // input          
    .P_TX_DEEMP_3                      (i_p_lx_deemp_ctl_3           ), // input  [1:3]  
    .P_RX_HIGHZ_3                      (i_p_rx_highz_3               ), // input 
    .P_TX_BEACON_EN_3                  (i_p_tx_beacon_en_3           ), // input              
    .P_RXGEAR_SLIP_3                   (i_p_rxgear_slip_3            ), // input              
    .P_TX_RATE_3                       (P_TX_RATE_3                  ), // input  [2:3]   
    .P_RX_RATE_3                       (P_RX_RATE_3                  ), // input  [2:3]   
    .P_RX_SIGDET_STATUS_3              (P_RX_SIGDET_STATUS_3         ), // output         
    .P_RX_READY_3                      (P_LX_CDR_ALIGN_3             ), // output         
    .P_RX_SATA_COMINIT_3               (o_p_lx_oob_sta_3[0]          ), // output         
    .P_RX_SATA_COMWAKE_3               (o_p_lx_oob_sta_3[1]          ), // output         
    .P_TX_RXDET_REQ_3                  (i_p_lx_rxdct_en_3            ), // input       
    .P_TX_RXDET_STATUS_3               (o_p_lx_rxdct_out_3           ), // output         
    .P_TDATA_3                         (i_p_tdata_3                  ), // input  [45:3]  
    .P_RDATA_3                         (o_p_rdata_3                  ), // output [46:3]  

    .P_RX_SDN3                         (i_p_l3rxn                    ),
    .P_RX_SDP3                         (i_p_l3rxp                    ),
    .P_TX_SDN3                         (o_p_l3txn                    ), // output         
    .P_TX_SDP3                         (o_p_l3txp                    )  // output  
);



endmodule    
