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

module u_hsst_top (
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
localparam CH0_TX_PLL_SEL = "PLL0";
localparam CH1_TX_PLL_SEL = "PLL0";
localparam CH2_TX_PLL_SEL = "PLL0";
localparam CH3_TX_PLL_SEL = "PLL0";
localparam CH0_RX_PLL_SEL = "PLL0";
localparam CH1_RX_PLL_SEL = "PLL0";
localparam CH2_RX_PLL_SEL = "PLL0";
localparam CH3_RX_PLL_SEL = "PLL0";
localparam PLL0_EN = "TRUE";
localparam PLL1_EN = "FALSE";
localparam PLL0_REF_SEL = "Diff_REFCK0";
localparam PLL0_FRQ_INDEX = 1;
localparam PLL0_REF_FRQ = 125.0;
localparam PLL1_REF_SEL = "Diff_REFCK1";
localparam PLL1_FRQ_INDEX = 0;
localparam PLL1_REF_FRQ = 125.0;
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
localparam [9:0] CH0_RXPCS_SKIP_REG0 = 10'b00;
localparam [9:0] CH1_RXPCS_SKIP_REG0 = 10'b00;
localparam [9:0] CH2_RXPCS_SKIP_REG0 = 10'b0110111100;
localparam [9:0] CH3_RXPCS_SKIP_REG0 = 10'b0110111100;
localparam [9:0] CH0_RXPCS_SKIP_REG1 = 10'b00;
localparam [9:0] CH1_RXPCS_SKIP_REG1 = 10'b00;
localparam [9:0] CH2_RXPCS_SKIP_REG1 = 10'b0001010000;
localparam [9:0] CH3_RXPCS_SKIP_REG1 = 10'b0001010000;
localparam [9:0] CH0_RXPCS_SKIP_REG2 = 10'b00;
localparam [9:0] CH1_RXPCS_SKIP_REG2 = 10'b00;
localparam [9:0] CH2_RXPCS_SKIP_REG2 = 10'b00;
localparam [9:0] CH3_RXPCS_SKIP_REG2 = 10'b00;
localparam [9:0] CH0_RXPCS_SKIP_REG3 = 10'b00;
localparam [9:0] CH1_RXPCS_SKIP_REG3 = 10'b00;
localparam [9:0] CH2_RXPCS_SKIP_REG3 = 10'b00;
localparam [9:0] CH3_RXPCS_SKIP_REG3 = 10'b00;
localparam [7:0] CH0_RXPCS_A_REG = 8'b01111100;
localparam [7:0] CH1_RXPCS_A_REG = 8'b01111100;
localparam [7:0] CH2_RXPCS_A_REG = 8'b01111100;
localparam [7:0] CH3_RXPCS_A_REG = 8'b01111100;
localparam INNER_RST_EN = "TRUE";
localparam FREE_FRQ = 100.0;
localparam CH0_RXPCS_BONDING_RANGE = "80BIT";
localparam CH1_RXPCS_BONDING_RANGE = "80BIT";
localparam CH2_RXPCS_BONDING_RANGE = "80BIT";
localparam CH3_RXPCS_BONDING_RANGE = "80BIT";
localparam CH0_RXPMA_RTERM = 6;
localparam CH1_RXPMA_RTERM = 6;
localparam CH2_RXPMA_RTERM = 6;
localparam CH3_RXPMA_RTERM = 6;
localparam PLL0_VCO = 2500.0;
localparam PLL0_M = 1;
localparam PLL0_N = 5;
localparam PLL0_N2 = 4;
localparam PLL1_VCO = 2125.0;
localparam PLL1_M = 1;
localparam PLL1_N = 4;
localparam PLL1_N2 = 5;
localparam P_LX_TX_CKDIV_0 = 1;
localparam P_LX_TX_CKDIV_1 = 1;
localparam P_LX_TX_CKDIV_2 = 3;
localparam P_LX_TX_CKDIV_3 = 3;
localparam LX_RX_CKDIV_0 = 1;
localparam LX_RX_CKDIV_1 = 1;
localparam LX_RX_CKDIV_2 = 3;
localparam LX_RX_CKDIV_3 = 3;
localparam O_P_REFCK2CORE_0 = "FALSE";
localparam O_P_REFCK2CORE_1 = "FALSE";

// ********************* Clock and Reset *********************

reg rst;
initial
begin
 rst = 1;
    #10
 rst = 1;
    #20
 rst = 0;
end

reg src_rst;
initial
begin
    src_rst = 0;
    #10
    src_rst = 1;
    #30000
    src_rst = 0;
end

reg chk_rst;
initial
begin
    chk_rst = 0;
    #10
    chk_rst = 1;
    #60000
    chk_rst = 0;
end

reg clk_pll0;
reg clk_pll0_if;
generate
if (PLL1_REF_SEL=="Diff_REFCK0" && PLL1_EN=="TRUE") begin : CLKMODE_0
    initial
    begin
        clk_pll0 = 0;
        forever #(500.0/PLL1_REF_FRQ) clk_pll0 = ~clk_pll0;
    end
    
    initial
    begin
        clk_pll0_if = 0;
        forever #(500.0/PLL1_REF_FRQ) clk_pll0_if = ~clk_pll0_if;
    end
end
else begin : CLKMODE_1
    initial
    begin
        clk_pll0 = 0;
        forever #(500.0/PLL0_REF_FRQ) clk_pll0 = ~clk_pll0;
    end
    
    initial
    begin
        clk_pll0_if = 0;
        forever #(500.0/PLL0_REF_FRQ) clk_pll0_if = ~clk_pll0_if;
    end
end
endgenerate

reg clk_pll1;
reg clk_pll1_if;
generate
if (PLL0_REF_SEL=="Diff_REFCK1" && PLL0_EN=="TRUE") begin : CLKMODE_2
    initial
    begin
        clk_pll1 = 0;
        forever #(500.0/PLL0_REF_FRQ) clk_pll1 = ~clk_pll1;
    end
    
    initial
    begin
        clk_pll1_if = 0;
        forever #(500.0/PLL0_REF_FRQ) clk_pll1_if = ~clk_pll1_if;
    end
end
else begin : CLKMODE_3
    initial
    begin
        clk_pll1 = 0;
        forever #(500.0/PLL1_REF_FRQ) clk_pll1 = ~clk_pll1;
    end
    
    initial
    begin
        clk_pll1_if = 0;
        forever #(500.0/PLL1_REF_FRQ) clk_pll1_if = ~clk_pll1_if;
    end
end
endgenerate

reg clk_fabric0;
reg clk_fabric0_if;
generate
if (PLL1_REF_SEL=="Fabric_REFCK0" && PLL1_EN=="TRUE") begin : CLKMODE_4
    initial
    begin
        clk_fabric0 = 0;
        forever #(500.0/PLL1_REF_FRQ) clk_fabric0 = ~clk_fabric0;
    end
    
    initial
    begin
        clk_fabric0_if = 0;
        forever #(500.0/PLL1_REF_FRQ) clk_fabric0_if = ~clk_fabric0_if;
    end
end
else begin : CLKMODE_5
    initial
    begin
        clk_fabric0 = 0;
        forever #(500.0/PLL0_REF_FRQ) clk_fabric0 = ~clk_fabric0;
    end
    
    initial
    begin
        clk_fabric0_if = 0;
        forever #(500.0/PLL0_REF_FRQ) clk_fabric0_if = ~clk_fabric0_if;
    end
end
endgenerate

reg clk_fabric1;
reg clk_fabric1_if;
generate
if (PLL0_REF_SEL=="Fabric_REFCK1" && PLL0_EN=="TRUE") begin : CLKMODE_6
    initial
    begin
        clk_fabric1 = 0;
        forever #(500.0/PLL0_REF_FRQ) clk_fabric1 = ~clk_fabric1;
    end
    
    initial
    begin
        clk_fabric1_if = 0;
        forever #(500.0/PLL0_REF_FRQ) clk_fabric1_if = ~clk_fabric1_if;
    end
end
else begin : CLKMODE_7
    initial
    begin
        clk_fabric1 = 0;
        forever #(500.0/PLL1_REF_FRQ) clk_fabric1 = ~clk_fabric1;
    end
    
    initial
    begin
        clk_fabric1_if = 0;
        forever #(500.0/PLL1_REF_FRQ) clk_fabric1_if = ~clk_fabric1_if;
    end
end
endgenerate


reg free_clk;
initial
begin
    free_clk = 0;
    forever #(500.0/FREE_FRQ) free_clk = ~free_clk;
end

// ********************* DUT *********************


wire           i_free_clk                    = free_clk;          
wire           i_pll_rst_0                   = rst;          
wire           i_pll_rst_1                   = rst;          
wire           i_wtchdg_clr_0                = 1'b0;          
wire           i_wtchdg_clr_1                = 1'b0;          
wire           i_txlane_rst_0                = 1'b0;          
wire           i_txlane_rst_1                = 1'b0;          
wire           i_txlane_rst_2                = 1'b0;          
wire           i_txlane_rst_3                = 1'b0;          
wire           i_rxlane_rst_0                = 1'b0;          
wire           i_rxlane_rst_1                = 1'b0;          
wire           i_rxlane_rst_2                = 1'b0;          
wire           i_rxlane_rst_3                = 1'b0;          
wire           i_tx_rate_chng_0              = 1'b0;          
wire           i_tx_rate_chng_1              = 1'b0;          
wire           i_tx_rate_chng_2              = 1'b0;          
wire           i_tx_rate_chng_3              = 1'b0;          
wire   [1:0]   i_txckdiv_0                   = P_LX_TX_CKDIV_0;         
wire   [1:0]   i_txckdiv_1                   = P_LX_TX_CKDIV_1;         
wire   [1:0]   i_txckdiv_2                   = P_LX_TX_CKDIV_2;         
wire   [1:0]   i_txckdiv_3                   = P_LX_TX_CKDIV_3;         
wire           i_rx_rate_chng_0              = 1'b0;          
wire           i_rx_rate_chng_1              = 1'b0;          
wire           i_rx_rate_chng_2              = 1'b0;          
wire           i_rx_rate_chng_3              = 1'b0;          
wire   [1:0]   i_rxckdiv_0                   = LX_RX_CKDIV_0;         
wire   [1:0]   i_rxckdiv_1                   = LX_RX_CKDIV_1;         
wire   [1:0]   i_rxckdiv_2                   = LX_RX_CKDIV_2;         
wire   [1:0]   i_rxckdiv_3                   = LX_RX_CKDIV_3;         
wire           i_hsst_fifo_clr_0             = 1'b0;         
wire   [2:0]   i_loop_dbg_0                  = 3'b000;
wire           i_hsst_fifo_clr_1             = 1'b0;         
wire   [2:0]   i_loop_dbg_1                  = 3'b000;
wire           i_hsst_fifo_clr_2             = 1'b0;         
wire   [2:0]   i_loop_dbg_2                  = 3'b000;
wire           i_hsst_fifo_clr_3             = 1'b0;         
wire   [2:0]   i_loop_dbg_3                  = 3'b000;
wire   [1:0]   o_wtchdg_st_0                 ;          
wire   [1:0]   o_wtchdg_st_1                 ;          
wire           o_pll_done_0                  ;          
wire           o_pll_done_1                  ;          
wire           o_txlane_done_0               ;          
wire           o_txlane_done_1               ;          
wire           o_txlane_done_2               ;          
wire           o_txlane_done_3               ;          
wire           o_tx_ckdiv_done_0             ;          
wire           o_tx_ckdiv_done_1             ;          
wire           o_tx_ckdiv_done_2             ;          
wire           o_tx_ckdiv_done_3             ;          
wire           o_rxlane_done_0               ;          
wire           o_rxlane_done_1               ;          
wire           o_rxlane_done_2               ;          
wire           o_rxlane_done_3               ;          
wire           o_rx_ckdiv_done_0             ;          
wire           o_rx_ckdiv_done_1             ;          
wire           o_rx_ckdiv_done_2             ;          
wire           o_rx_ckdiv_done_3             ;          
wire           i_p_pllpowerdown_0            = 1'b0; // input           
wire           i_p_pllpowerdown_1            = 1'b0; // input           
wire           i_p_tx_lane_pd_clkpath_0      = 1'b0; // input           
wire           i_p_tx_lane_pd_clkpath_1      = 1'b0; // input           
wire           i_p_tx_lane_pd_clkpath_2      = 1'b0; // input           
wire           i_p_tx_lane_pd_clkpath_3      = 1'b0; // input           
wire           i_p_tx_lane_pd_piso_0         = 1'b0; // input           
wire           i_p_tx_lane_pd_piso_1         = 1'b0; // input           
wire           i_p_tx_lane_pd_piso_2         = 1'b0; // input           
wire           i_p_tx_lane_pd_piso_3         = 1'b0; // input           
wire           i_p_tx_lane_pd_driver_0       = 1'b0; // input           
wire           i_p_tx_lane_pd_driver_1       = 1'b0; // input           
wire           i_p_tx_lane_pd_driver_2       = 1'b0; // input           
wire           i_p_tx_lane_pd_driver_3       = 1'b0; // input           
wire           i_p_lane_pd_0                 = 1'b0; // input           
wire           i_p_lane_pd_1                 = 1'b0; // input           
wire           i_p_lane_pd_2                 = 1'b0; // input           
wire           i_p_lane_pd_3                 = 1'b0; // input           
wire           i_p_lane_rst_0                = 1'b0; // input           
wire           i_p_lane_rst_1                = 1'b0; // input           
wire           i_p_lane_rst_2                = 1'b0; // input           
wire           i_p_lane_rst_3                = 1'b0; // input           
wire           i_p_rx_lane_pd_0              = 1'b0; // input           
wire           i_p_rx_lane_pd_1              = 1'b0; // input           
wire           i_p_rx_lane_pd_2              = 1'b0; // input           
wire           i_p_rx_lane_pd_3              = 1'b0; // input           
wire           i_p_refckn_0                  = clk_pll0; 
wire           i_p_refckp_0                  = ~clk_pll0; 
wire           i_p_refckn_1                  = clk_pll1; 
wire           i_p_refckp_1                  = ~clk_pll1; 
wire           i_p_pll_ref_clk_0             = clk_fabric0; 
wire           i_p_pll_ref_clk_1             = clk_fabric1; 
wire           o_p_refck2core_0              ; 
wire           o_p_refck2core_1              ; 
wire           i_p_pll_rst_0                 = rst; 
wire           i_p_pll_rst_1                 = rst; 
wire           i_p_tx_pma_rst_0              = rst; 
wire           i_p_tx_pma_rst_1              = rst; 
wire           i_p_tx_pma_rst_2              = rst; 
wire           i_p_tx_pma_rst_3              = rst; 
wire           i_p_pcs_tx_rst_0              = rst; 
wire           i_p_pcs_tx_rst_1              = rst; 
wire           i_p_pcs_tx_rst_2              = rst; 
wire           i_p_pcs_tx_rst_3              = rst; 
wire           i_p_rx_pll_rst_0              = rst; 
wire           i_p_rx_pll_rst_1              = rst; 
wire           i_p_rx_pll_rst_2              = rst; 
wire           i_p_rx_pll_rst_3              = rst; 
wire           i_p_rx_pma_rst_0              = rst; 
wire           i_p_rx_pma_rst_1              = rst; 
wire           i_p_rx_pma_rst_2              = rst; 
wire           i_p_rx_pma_rst_3              = rst; 
wire           i_p_pcs_rx_rst_0              = rst; 
wire           i_p_pcs_rx_rst_1              = rst; 
wire           i_p_pcs_rx_rst_2              = rst; 
wire           i_p_pcs_rx_rst_3              = rst; 
wire   [2:0]   i_p_lx_margin_ctl_0           = 3'b0; 
wire   [2:0]   i_p_lx_margin_ctl_1           = 3'b0; 
wire   [2:0]   i_p_lx_margin_ctl_2           = 3'b0; 
wire   [2:0]   i_p_lx_margin_ctl_3           = 3'b0; 
wire           i_p_lx_swing_ctl_0            = 1'b0; 
wire           i_p_lx_swing_ctl_1            = 1'b0; 
wire           i_p_lx_swing_ctl_2            = 1'b0; 
wire           i_p_lx_swing_ctl_3            = 1'b0; 
wire   [1:0]   i_p_lx_deemp_ctl_0            = 2'b0; 
wire   [1:0]   i_p_lx_deemp_ctl_1            = 2'b0; 
wire   [1:0]   i_p_lx_deemp_ctl_2            = 2'b0; 
wire   [1:0]   i_p_lx_deemp_ctl_3            = 2'b0;
wire           i_p_lane_sync_0               = 1'b0;
wire           i_p_lane_sync_1               = 1'b0;
wire           i_p_lane_sync_en_0            = 1'b0; 
wire           i_p_lane_sync_en_1            = 1'b0;  
wire   [1:0]   i_p_tx_ckdiv_0                = P_LX_TX_CKDIV_0; 
wire   [1:0]   i_p_tx_ckdiv_1                = P_LX_TX_CKDIV_1; 
wire   [1:0]   i_p_tx_ckdiv_2                = P_LX_TX_CKDIV_2; 
wire   [1:0]   i_p_tx_ckdiv_3                = P_LX_TX_CKDIV_3; 
wire   [1:0]   i_p_lx_rx_ckdiv_0             = LX_RX_CKDIV_0; 
wire   [1:0]   i_p_lx_rx_ckdiv_1             = LX_RX_CKDIV_1; 
wire   [1:0]   i_p_lx_rx_ckdiv_2             = LX_RX_CKDIV_2; 
wire   [1:0]   i_p_lx_rx_ckdiv_3             = LX_RX_CKDIV_3; 
wire   [1:0]   i_p_lx_elecidle_en_0          = 2'b0; 
wire   [1:0]   i_p_lx_elecidle_en_1          = 2'b0; 
wire   [1:0]   i_p_lx_elecidle_en_2          = 2'b0; 
wire   [1:0]   i_p_lx_elecidle_en_3          = 2'b0; 
wire           o_p_pll_lock_0                ; 
wire           o_p_pll_lock_1                ; 
wire           o_p_rx_sigdet_sta_0           ; 
wire           o_p_rx_sigdet_sta_1           ; 
wire           o_p_rx_sigdet_sta_2           ; 
wire           o_p_rx_sigdet_sta_3           ; 
wire           o_p_lx_cdr_align_0            ; 
wire           o_p_lx_cdr_align_1            ; 
wire           o_p_lx_cdr_align_2            ; 
wire           o_p_lx_cdr_align_3            ; 
wire   [1:0]   o_p_lx_oob_sta_0              ; 
wire   [1:0]   o_p_lx_oob_sta_1              ; 
wire   [1:0]   o_p_lx_oob_sta_2              ; 
wire   [1:0]   o_p_lx_oob_sta_3              ; 
wire           i_p_lx_rxdct_en_0             = 1'b0; 
wire           i_p_lx_rxdct_en_1             = 1'b0; 
wire           i_p_lx_rxdct_en_2             = 1'b0; 
wire           i_p_lx_rxdct_en_3             = 1'b0; 
wire           o_p_lx_rxdct_out_0            = 1'b0; 
wire           o_p_lx_rxdct_out_1            = 1'b0; 
wire           o_p_lx_rxdct_out_2            = 1'b0; 
wire           o_p_lx_rxdct_out_3            ; 
wire           o_p_lx_rxdct_done_0           ; 
wire           o_p_lx_rxdct_done_1           ; 
wire           o_p_lx_rxdct_done_2           ; 
wire           o_p_lx_rxdct_done_3           ; 
wire           o_p_pcs_lsm_synced_0          ; 
wire           o_p_pcs_lsm_synced_1          ; 
wire           o_p_pcs_lsm_synced_2          ; 
wire           o_p_pcs_lsm_synced_3          ; 
wire           o_p_pcs_rx_mcb_status_0       ; 
wire           o_p_pcs_rx_mcb_status_1       ; 
wire           o_p_pcs_rx_mcb_status_2       ; 
wire           o_p_pcs_rx_mcb_status_3       ; 
wire           i_p_cfg_rst                   = rst; 
wire           i_p_l0rxn                     ; 
wire           i_p_l0rxp                     ; 
wire           i_p_l1rxn                     ; 
wire           i_p_l1rxp                     ; 
wire           i_p_l2rxn                     ; 
wire           i_p_l2rxp                     ; 
wire           i_p_l3rxn                     ; 
wire           i_p_l3rxp                     ; 
wire           o_p_l0txn                     ; 
wire           o_p_l0txp                     ; 
wire           o_p_l1txn                     ; 
wire           o_p_l1txp                     ; 
wire           o_p_l2txn                     ; 
wire           o_p_l2txp                     ; 
wire           o_p_l3txn                     ; 
wire           o_p_l3txp                     ; 
wire   [3:0]   o_pl_err                      ;

u_hsst_dut_top  U_DUT_TOP (
    
    .i_free_clk                    (i_free_clk                    ), // input          
    .i_pll_rst_0                   (i_pll_rst_0                   ), // input          
    .i_wtchdg_clr_0                (i_wtchdg_clr_0                ), // input          
    .o_wtchdg_st_0                 (o_wtchdg_st_0                 ), // output [1:0]   
    .o_pll_done_0                  (o_pll_done_0                  ), // output         
    .o_txlane_done_2               (o_txlane_done_2               ), // output         
    .o_txlane_done_3               (o_txlane_done_3               ), // output         
    .o_rxlane_done_2               (o_rxlane_done_2               ), // output         
    .o_rxlane_done_3               (o_rxlane_done_3               ), // output         
    .i_p_refckn_0                  (i_p_refckn_0                  ), // input          
    .i_p_refckp_0                  (i_p_refckp_0                  ), // input          
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
    .o_rxstatus_2                  (                              ), // output [2:0]    
    .o_rdisper_2                   (                              ), // output [3:0]   
    .o_rdecer_2                    (                              ), // output [3:0]   
    .o_rxstatus_3                  (                              ), // output [2:0]    
    .o_rdisper_3                   (                              ), // output [3:0]   
    .o_rdecer_3                    (                              ), // output [3:0]      
    .src_rst                       (src_rst                       ), // input                     
    .chk_rst                       (chk_rst                       ), // input                             
    .o_pl_err                      (o_pl_err                      )  // output [3:0]    
);





// ********************* Interface *********************


wire           i_free_clk_if                 = free_clk;                 
wire           i_pll_rst_0_if                = rst;                 
wire           i_pll_rst_1_if                = rst;                 
wire           i_wtchdg_clr_0_if             = 1'b0;                 
wire           i_wtchdg_clr_1_if             = 1'b0;                 
wire           i_hsst_fifo_clr_0_if          = 1'b0;         
wire   [2:0]   i_loop_dbg_0_if               = 3'b000;
wire           i_hsst_fifo_clr_1_if          = 1'b0;         
wire   [2:0]   i_loop_dbg_1_if               = 3'b000;
wire           i_hsst_fifo_clr_2_if          = 1'b0;         
wire   [2:0]   i_loop_dbg_2_if               = 3'b000;
wire           i_hsst_fifo_clr_3_if          = 1'b0;         
wire   [2:0]   i_loop_dbg_3_if               = 3'b000;
wire [1:0]     o_wtchdg_st_0_if              ; 
wire [1:0]     o_wtchdg_st_1_if              ; 
wire           o_tx_ckdiv_done_0_if          ;          
wire           o_tx_ckdiv_done_1_if          ;          
wire           o_tx_ckdiv_done_2_if          ;          
wire           o_tx_ckdiv_done_3_if          ;          
wire           o_rx_ckdiv_done_0_if          ;          
wire           o_rx_ckdiv_done_1_if          ;          
wire           o_rx_ckdiv_done_2_if          ;          
wire           o_rx_ckdiv_done_3_if          ;          
wire           o_pll_done_0_if               ; 
wire           o_pll_done_1_if               ; 
wire           o_txlane_done_0_if            ; 
wire           o_txlane_done_1_if            ; 
wire           o_txlane_done_2_if            ; 
wire           o_txlane_done_3_if            ; 
wire           o_rxlane_done_0_if            ; 
wire           o_rxlane_done_1_if            ; 
wire           o_rxlane_done_2_if            ; 
wire           o_rxlane_done_3_if            ; 
wire           i_p_refckn_0_if               = clk_pll0_if;        
wire           i_p_refckp_0_if               = ~clk_pll0_if;        
wire           i_p_refckn_1_if               = clk_pll1_if;        
wire           i_p_refckp_1_if               = ~clk_pll1_if;        
wire           i_p_pll_ref_clk_0_if          = clk_fabric0_if;        
wire           i_p_pll_ref_clk_1_if          = clk_fabric1_if;        
wire   [2:0]   i_p_lx_margin_ctl_0_if        = 3'b0; 
wire   [2:0]   i_p_lx_margin_ctl_1_if        = 3'b0; 
wire   [2:0]   i_p_lx_margin_ctl_2_if        = 3'b0; 
wire   [2:0]   i_p_lx_margin_ctl_3_if        = 3'b0; 
wire           i_p_lx_swing_ctl_0_if         = 1'b0; 
wire           i_p_lx_swing_ctl_1_if         = 1'b0; 
wire           i_p_lx_swing_ctl_2_if         = 1'b0; 
wire           i_p_lx_swing_ctl_3_if         = 1'b0; 
wire   [1:0]   i_p_lx_deemp_ctl_0_if         = 2'b0; 
wire   [1:0]   i_p_lx_deemp_ctl_1_if         = 2'b0; 
wire   [1:0]   i_p_lx_deemp_ctl_2_if         = 2'b0; 
wire   [1:0]   i_p_lx_deemp_ctl_3_if         = 2'b0; 
wire   [1:0]   i_p_lx_elecidle_en_0_if       ;
wire   [1:0]   i_p_lx_elecidle_en_1_if       ;
wire   [1:0]   i_p_lx_elecidle_en_2_if       ;
wire   [1:0]   i_p_lx_elecidle_en_3_if       ;
wire           o_p_pll_lock_0_if             ;
wire           o_p_pll_lock_1_if             ;
wire           o_p_rx_sigdet_sta_0_if        ; 
wire           o_p_rx_sigdet_sta_1_if        ; 
wire           o_p_rx_sigdet_sta_2_if        ; 
wire           o_p_rx_sigdet_sta_3_if        ; 
wire           o_p_lx_cdr_align_0_if         ; 
wire           o_p_lx_cdr_align_1_if         ; 
wire           o_p_lx_cdr_align_2_if         ; 
wire           o_p_lx_cdr_align_3_if         ; 
wire   [1:0]   o_p_lx_oob_sta_0_if           ; 
wire   [1:0]   o_p_lx_oob_sta_1_if           ; 
wire   [1:0]   o_p_lx_oob_sta_2_if           ; 
wire   [1:0]   o_p_lx_oob_sta_3_if           ; 
wire           o_p_pcs_lsm_synced_0_if       ;        
wire           o_p_pcs_lsm_synced_1_if       ;        
wire           o_p_pcs_lsm_synced_2_if       ;        
wire           o_p_pcs_lsm_synced_3_if       ;        
wire           o_p_pcs_rx_mcb_status_0_if    ;        
wire           o_p_pcs_rx_mcb_status_1_if    ;        
wire           o_p_pcs_rx_mcb_status_2_if    ;        
wire           o_p_pcs_rx_mcb_status_3_if    ;        
wire           o_p_l0txn_if                  ; 
wire           o_p_l0txp_if                  ; 
wire           o_p_l1txn_if                  ; 
wire           o_p_l1txp_if                  ; 
wire           o_p_l2txn_if                  ; 
wire           o_p_l2txp_if                  ; 
wire           o_p_l3txn_if                  ; 
wire           o_p_l3txp_if                  ; 
wire           i_p_l0rxn_if                  ; 
wire           i_p_l0rxp_if                  ; 
wire           i_p_l1rxn_if                  ; 
wire           i_p_l1rxp_if                  ; 
wire           i_p_l2rxn_if                  ; 
wire           i_p_l2rxp_if                  ; 
wire           i_p_l3rxn_if                  ; 
wire           i_p_l3rxp_if                  ; 
wire   [3:0]   o_pl_err_if                   ;

u_hsst_if_top  U_IF_TOP (
    
    .i_free_clk                    (i_free_clk_if                 ), // input          
    .i_pll_rst_0                   (i_pll_rst_0_if                ), // input          
    .i_wtchdg_clr_0                (i_wtchdg_clr_0_if             ), // input          
    .o_wtchdg_st_0                 (o_wtchdg_st_0_if              ), // output [1:0]   
    .o_pll_done_0                  (o_pll_done_0_if               ), // output         
    .o_txlane_done_2               (o_txlane_done_2_if            ), // output         
    .o_txlane_done_3               (o_txlane_done_3_if            ), // output         
    .o_rxlane_done_2               (o_rxlane_done_2_if            ), // output         
    .o_rxlane_done_3               (o_rxlane_done_3_if            ), // output         
    .i_p_refckn_0                  (i_p_refckn_0_if               ), // input          
    .i_p_refckp_0                  (i_p_refckp_0_if               ), // input          
    .o_p_pll_lock_0                (o_p_pll_lock_0_if             ), // output         
    .o_p_rx_sigdet_sta_2           (o_p_rx_sigdet_sta_2_if        ), // output         
    .o_p_rx_sigdet_sta_3           (o_p_rx_sigdet_sta_3_if        ), // output         
    .o_p_lx_cdr_align_2            (o_p_lx_cdr_align_2_if         ), // output         
    .o_p_lx_cdr_align_3            (o_p_lx_cdr_align_3_if         ), // output         
    .o_p_pcs_lsm_synced_2          (o_p_pcs_lsm_synced_2_if       ), // output         
    .o_p_pcs_lsm_synced_3          (o_p_pcs_lsm_synced_3_if       ), // output         
    .i_p_l2rxn                     (i_p_l2rxn_if                  ), // input          
    .i_p_l2rxp                     (i_p_l2rxp_if                  ), // input          
    .i_p_l3rxn                     (i_p_l3rxn_if                  ), // input          
    .i_p_l3rxp                     (i_p_l3rxp_if                  ), // input          
    .o_p_l2txn                     (o_p_l2txn_if                  ), // output         
    .o_p_l2txp                     (o_p_l2txp_if                  ), // output         
    .o_p_l3txn                     (o_p_l3txn_if                  ), // output         
    .o_p_l3txp                     (o_p_l3txp_if                  ), // output         
    .o_rxstatus_2                  (                              ), // output [2:0]    
    .o_rdisper_2                   (                              ), // output [3:0]   
    .o_rdecer_2                    (                              ), // output [3:0]   
    .o_rxstatus_3                  (                              ), // output [2:0]    
    .o_rdisper_3                   (                              ), // output [3:0]   
    .o_rdecer_3                    (                              ), // output [3:0]      
    .src_rst                       (src_rst                       ), // input                        
    .chk_rst                       (chk_rst                       ), // input              
    .o_pl_err                      (o_pl_err_if                   )  // output [3:0]    
);


assign         i_p_l2rxn                     = o_p_l2txn_if; 
assign         i_p_l2rxp                     = o_p_l2txp_if; 
assign         i_p_l3rxn                     = o_p_l3txn_if; 
assign         i_p_l3rxp                     = o_p_l3txp_if; 
assign         i_p_l2rxn_if                  = o_p_l2txn; 
assign         i_p_l2rxp_if                  = o_p_l2txp; 
assign         i_p_l3rxn_if                  = o_p_l3txn; 
assign         i_p_l3rxp_if                  = o_p_l3txp; 

endmodule    
