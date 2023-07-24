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
module u_hsst_top_tb (
 );

u_hsst_top U_INST_TB (
);


localparam CH0_EN = "DISABLE";
localparam CH1_EN = "DISABLE";
localparam CH2_EN = "Fullduplex";
localparam CH3_EN = "Fullduplex";
localparam PLL_NUM = 1;
localparam PLL0_EN = "TRUE";
localparam PLL1_EN = "FALSE";
localparam CH0_PROTOCOL = "CUSTOMERIZEDx1";
localparam CH1_PROTOCOL = "CUSTOMERIZEDx1";
localparam CH2_PROTOCOL = "CUSTOMERIZEDx2";
localparam CH3_PROTOCOL = "CUSTOMERIZEDx2";
localparam CH0_PROTOCOL_DEFAULT = "FALSE";
localparam CH1_PROTOCOL_DEFAULT = "FALSE";
localparam CH2_PROTOCOL_DEFAULT = "FALSE";
localparam CH3_PROTOCOL_DEFAULT = "FALSE";
localparam CH0_TX_FABRIC_FEQ = 0.0;
localparam CH1_TX_FABRIC_FEQ = 0.0;
localparam CH2_TX_FABRIC_FEQ = 125.0;
localparam CH3_TX_FABRIC_FEQ = 125.0;
localparam CH0_RX_FABRIC_FEQ = 0.0;
localparam CH1_RX_FABRIC_FEQ = 0.0;
localparam CH2_RX_FABRIC_FEQ = 125.0;
localparam CH3_RX_FABRIC_FEQ = 125.0;
localparam CH0_RXPCS_ALIGN = "Bypassed";
localparam CH1_RXPCS_ALIGN = "Bypassed";
localparam CH2_RXPCS_ALIGN = "GE_MODE";
localparam CH3_RXPCS_ALIGN = "GE_MODE";
localparam CH0_RXPCS_BONDING = "Bypassed";
localparam CH1_RXPCS_BONDING = "Bypassed";
localparam CH2_RXPCS_BONDING = "Bypassed";
localparam CH3_RXPCS_BONDING = "Bypassed";
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
localparam O_RXLANE_DONE_0 = "FALSE";
localparam O_RXLANE_DONE_1 = "FALSE";
localparam O_RXLANE_DONE_2 = "TRUE";
localparam O_RXLANE_DONE_3 = "TRUE";


genvar i;



localparam [3:0] RX_EN          = {{CH3_EN=="Fullduplex"||CH3_EN=="RX_only"},{CH2_EN=="Fullduplex"||CH2_EN=="RX_only"},{CH1_EN=="Fullduplex"||CH1_EN=="RX_only"},{CH0_EN=="Fullduplex"||CH0_EN=="RX_only"}};
localparam [3:0] TX_EN          = {{CH3_EN=="Fullduplex"||CH3_EN=="TX_only"},{CH2_EN=="Fullduplex"||CH2_EN=="TX_only"},{CH1_EN=="Fullduplex"||CH1_EN=="TX_only"},{CH0_EN=="Fullduplex"||CH0_EN=="TX_only"}};
localparam [3:0] PCIE_DEFAULT   = {{(CH3_PROTOCOL == "PCIEx1" || CH3_PROTOCOL == "PCIEx2" || CH3_PROTOCOL == "PCIEx4") && CH3_PROTOCOL_DEFAULT == "TRUE"},
                                   {(CH2_PROTOCOL == "PCIEx1" || CH2_PROTOCOL == "PCIEx2" || CH2_PROTOCOL == "PCIEx4") && CH2_PROTOCOL_DEFAULT == "TRUE"},
                                   {(CH1_PROTOCOL == "PCIEx1" || CH1_PROTOCOL == "PCIEx2" || CH1_PROTOCOL == "PCIEx4") && CH1_PROTOCOL_DEFAULT == "TRUE"},
                                   {(CH0_PROTOCOL == "PCIEx1" || CH0_PROTOCOL == "PCIEx2" || CH0_PROTOCOL == "PCIEx4") && CH0_PROTOCOL_DEFAULT == "TRUE"}};
localparam [3:0] ALIGN_EN       = {{CH3_RXPCS_ALIGN!="Bypassed" && CH3_RXPCS_ALIGN!="CUSTOMERIZED_MODE"},
                                   {CH2_RXPCS_ALIGN!="Bypassed" && CH2_RXPCS_ALIGN!="CUSTOMERIZED_MODE"},
                                   {CH1_RXPCS_ALIGN!="Bypassed" && CH1_RXPCS_ALIGN!="CUSTOMERIZED_MODE"},
                                   {CH0_RXPCS_ALIGN!="Bypassed" && CH0_RXPCS_ALIGN!="CUSTOMERIZED_MODE"}};  
localparam [3:0] BONDING_EN     = {{CH3_RXPCS_BONDING!="Bypassed" && CH3_RXPCS_BONDING!="CUSTOMERIZED_MODE"},
                                   {CH2_RXPCS_BONDING!="Bypassed" && CH2_RXPCS_BONDING!="CUSTOMERIZED_MODE"},
                                   {CH1_RXPCS_BONDING!="Bypassed" && CH1_RXPCS_BONDING!="CUSTOMERIZED_MODE"},
                                   {CH0_RXPCS_BONDING!="Bypassed" && CH0_RXPCS_BONDING!="CUSTOMERIZED_MODE"}};  
localparam [3:0] TD_8BIT_ONLY   = {{TD_8BIT_ONLY_3  =="TRUE"},{TD_8BIT_ONLY_2  =="TRUE"},{TD_8BIT_ONLY_1  =="TRUE"},{TD_8BIT_ONLY_0  =="TRUE"}}; 
localparam [3:0] TD_10BIT_ONLY  = {{TD_10BIT_ONLY_3 =="TRUE"},{TD_10BIT_ONLY_2 =="TRUE"},{TD_10BIT_ONLY_1 =="TRUE"},{TD_10BIT_ONLY_0 =="TRUE"}}; 
localparam [3:0] TD_8B10B_8BIT  = {{TD_8B10B_8BIT_3 =="TRUE"},{TD_8B10B_8BIT_2 =="TRUE"},{TD_8B10B_8BIT_1 =="TRUE"},{TD_8B10B_8BIT_0 =="TRUE"}}; 
localparam [3:0] TD_16BIT_ONLY  = {{TD_16BIT_ONLY_3 =="TRUE"},{TD_16BIT_ONLY_2 =="TRUE"},{TD_16BIT_ONLY_1 =="TRUE"},{TD_16BIT_ONLY_0 =="TRUE"}}; 
localparam [3:0] TD_20BIT_ONLY  = {{TD_20BIT_ONLY_3 =="TRUE"},{TD_20BIT_ONLY_2 =="TRUE"},{TD_20BIT_ONLY_1 =="TRUE"},{TD_20BIT_ONLY_0 =="TRUE"}}; 
localparam [3:0] TD_8B10B_16BIT = {{TD_8B10B_16BIT_3=="TRUE"},{TD_8B10B_16BIT_2=="TRUE"},{TD_8B10B_16BIT_1=="TRUE"},{TD_8B10B_16BIT_0=="TRUE"}}; 
localparam [3:0] TD_32BIT_ONLY  = {{TD_32BIT_ONLY_3 =="TRUE"},{TD_32BIT_ONLY_2 =="TRUE"},{TD_32BIT_ONLY_1 =="TRUE"},{TD_32BIT_ONLY_0 =="TRUE"}}; 
localparam [3:0] TD_40BIT_ONLY  = {{TD_40BIT_ONLY_3 =="TRUE"},{TD_40BIT_ONLY_2 =="TRUE"},{TD_40BIT_ONLY_1 =="TRUE"},{TD_40BIT_ONLY_0 =="TRUE"}}; 
localparam [3:0] TD_8B10B_32BIT = {{TD_8B10B_32BIT_3=="TRUE"},{TD_8B10B_32BIT_2=="TRUE"},{TD_8B10B_32BIT_1=="TRUE"},{TD_8B10B_32BIT_0=="TRUE"}};
localparam [3:0] TD_66B_16B   = {{TD_64B66B_16BIT_3=="TRUE"},{TD_64B66B_16BIT_2=="TRUE"},{TD_64B66B_16BIT_1=="TRUE"},{TD_64B66B_16BIT_0=="TRUE"}};
localparam [3:0] TD_66B_32B   = {{TD_64B66B_32BIT_3=="TRUE"},{TD_64B66B_32BIT_2=="TRUE"},{TD_64B66B_32BIT_1=="TRUE"},{TD_64B66B_32BIT_0=="TRUE"}};
localparam [3:0] TD_67B_16B   = {{TD_64B67B_16BIT_3=="TRUE"},{TD_64B67B_16BIT_2=="TRUE"},{TD_64B67B_16BIT_1=="TRUE"},{TD_64B67B_16BIT_0=="TRUE"}};
localparam [3:0] TD_67B_32B   = {{TD_64B67B_32BIT_3=="TRUE"},{TD_64B67B_32BIT_2=="TRUE"},{TD_64B67B_32BIT_1=="TRUE"},{TD_64B67B_32BIT_0=="TRUE"}};
localparam [3:0] RD_8BIT_ONLY   = {{RD_8BIT_ONLY_3  =="TRUE"},{RD_8BIT_ONLY_2  =="TRUE"},{RD_8BIT_ONLY_1  =="TRUE"},{RD_8BIT_ONLY_0  =="TRUE"}}; 
localparam [3:0] RD_10BIT_ONLY  = {{RD_10BIT_ONLY_3 =="TRUE"},{RD_10BIT_ONLY_2 =="TRUE"},{RD_10BIT_ONLY_1 =="TRUE"},{RD_10BIT_ONLY_0 =="TRUE"}}; 
localparam [3:0] RD_8B10B_8BIT  = {{RD_8B10B_8BIT_3 =="TRUE"},{RD_8B10B_8BIT_2 =="TRUE"},{RD_8B10B_8BIT_1 =="TRUE"},{RD_8B10B_8BIT_0 =="TRUE"}}; 
localparam [3:0] RD_16BIT_ONLY  = {{RD_16BIT_ONLY_3 =="TRUE"},{RD_16BIT_ONLY_2 =="TRUE"},{RD_16BIT_ONLY_1 =="TRUE"},{RD_16BIT_ONLY_0 =="TRUE"}}; 
localparam [3:0] RD_20BIT_ONLY  = {{RD_20BIT_ONLY_3 =="TRUE"},{RD_20BIT_ONLY_2 =="TRUE"},{RD_20BIT_ONLY_1 =="TRUE"},{RD_20BIT_ONLY_0 =="TRUE"}}; 
localparam [3:0] RD_8B10B_16BIT = {{RD_8B10B_16BIT_3=="TRUE"},{RD_8B10B_16BIT_2=="TRUE"},{RD_8B10B_16BIT_1=="TRUE"},{RD_8B10B_16BIT_0=="TRUE"}}; 
localparam [3:0] RD_32BIT_ONLY  = {{RD_32BIT_ONLY_3 =="TRUE"},{RD_32BIT_ONLY_2 =="TRUE"},{RD_32BIT_ONLY_1 =="TRUE"},{RD_32BIT_ONLY_0 =="TRUE"}}; 
localparam [3:0] RD_40BIT_ONLY  = {{RD_40BIT_ONLY_3 =="TRUE"},{RD_40BIT_ONLY_2 =="TRUE"},{RD_40BIT_ONLY_1 =="TRUE"},{RD_40BIT_ONLY_0 =="TRUE"}}; 
localparam [3:0] RD_8B10B_32BIT = {{RD_8B10B_32BIT_3=="TRUE"},{RD_8B10B_32BIT_2=="TRUE"},{RD_8B10B_32BIT_1=="TRUE"},{RD_8B10B_32BIT_0=="TRUE"}}; 
localparam [3:0] RD_66B_16B   = {{RD_64B66B_16BIT_3  =="TRUE"},{RD_64B66B_16BIT_2  =="TRUE"},{RD_64B66B_16BIT_1  =="TRUE"},{RD_64B66B_16BIT_0  =="TRUE"}}; 
localparam [3:0] RD_66B_32B   = {{RD_64B66B_32BIT_3  =="TRUE"},{RD_64B66B_32BIT_2  =="TRUE"},{RD_64B66B_32BIT_1  =="TRUE"},{RD_64B66B_32BIT_0  =="TRUE"}};
localparam [3:0] RD_67B_16B   = {{RD_64B67B_16BIT_3  =="TRUE"},{RD_64B67B_16BIT_2  =="TRUE"},{RD_64B67B_16BIT_1  =="TRUE"},{RD_64B67B_16BIT_0  =="TRUE"}};
localparam [3:0] RD_67B_32B   = {{RD_64B67B_32BIT_3  =="TRUE"},{RD_64B67B_32BIT_2  =="TRUE"},{RD_64B67B_32BIT_1  =="TRUE"},{RD_64B67B_32BIT_0  =="TRUE"}};


initial
begin
    
    force u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_pll.pll0_lock_deb.signal_deb
        = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_pll.pll0_lock_deb.signal_b;
    force u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_pll.pll0_lock_deb.signal_deb
        = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_pll.pll0_lock_deb.signal_b;
    
    force u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_tx.SYNC_TXLANE[2].pll_lock_deb.signal_deb
        = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_tx.SYNC_TXLANE[2].pll_lock_deb.signal_b;
    force u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_tx.SYNC_TXLANE[2].pll_lock_deb.signal_deb
        = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_tx.SYNC_TXLANE[2].pll_lock_deb.signal_b;
    
    force u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_tx.SYNC_TXLANE[3].pll_lock_deb.signal_deb
        = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_tx.SYNC_TXLANE[3].pll_lock_deb.signal_b;
    force u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_tx.SYNC_TXLANE[3].pll_lock_deb.signal_deb
        = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_tx.SYNC_TXLANE[3].pll_lock_deb.signal_b;
    
    force u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_rx.SYNC_RXLANE[2].i_pll_lock_deb.signal_deb 
        = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_rx.SYNC_RXLANE[2].i_pll_lock_deb.signal_b;
    force u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_rx.SYNC_RXLANE[2].cdr_align_deb.signal_deb 
        = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_rx.SYNC_RXLANE[2].cdr_align_deb.signal_b;
    force u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_rx.SYNC_RXLANE[2].i_pll_lock_deb.signal_deb 
        = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_rx.SYNC_RXLANE[2].i_pll_lock_deb.signal_b;
    force u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_rx.SYNC_RXLANE[2].cdr_align_deb.signal_deb 
        = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_rx.SYNC_RXLANE[2].cdr_align_deb.signal_b;
    
    force u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_rx.SYNC_RXLANE[3].i_pll_lock_deb.signal_deb 
        = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_rx.SYNC_RXLANE[3].i_pll_lock_deb.signal_b;
    force u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_rx.SYNC_RXLANE[3].cdr_align_deb.signal_deb 
        = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_rx.SYNC_RXLANE[3].cdr_align_deb.signal_b;
    force u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_rx.SYNC_RXLANE[3].i_pll_lock_deb.signal_deb 
        = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_rx.SYNC_RXLANE[3].i_pll_lock_deb.signal_b;
    force u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_rx.SYNC_RXLANE[3].cdr_align_deb.signal_deb 
        = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.U_IPML_HSST_RST.AUTO_MODE.ipml_hsst_rst_rx.SYNC_RXLANE[3].cdr_align_deb.signal_b;
    
end

wire                p_pll_lock_0            ;         
wire                p_pll_lock_1            ;         
wire    [3:0]       p_rx_sigdet_sta         ;         
wire    [3:0]       p_lx_cdr_align          ;         
wire    [3:0]       p_pcs_lsm_synced        ;         
wire    [3:0]       p_pcs_rx_mcb_status     ;         
wire    [3:0]       o_rxlane_done           ;         
wire    [4*4-1:0]   i_rdisper               ;
wire    [4*4-1:0]   i_rdecer                ;
wire    [3:0]       o_slip_finish           ;
wire    [3:0]       o_pl_err                ;
wire                o_p_clk2core_tx_0       ;
wire                o_p_clk2core_tx_1       ;
wire                o_p_clk2core_tx_2       ;
wire                o_p_clk2core_tx_3       ;
wire                o_p_clk2core_rx_0       ;
wire                o_p_clk2core_rx_1       ;
wire                o_p_clk2core_rx_2       ;
wire                o_p_clk2core_rx_3       ;
wire                o_txlane_done_0         ;
wire                o_txlane_done_1         ;
wire                o_txlane_done_2         ;
wire                o_txlane_done_3         ;
wire                o_rxlane_done_0         ;
wire                o_rxlane_done_1         ;
wire                o_rxlane_done_2         ;
wire                o_rxlane_done_3         ;
reg                 ll_pll_lock_0           ;         
reg                 ll_pll_lock_1           ;         
reg     [3:0]       ll_rx_sigdet_sta        ;         
reg     [3:0]       ll_lx_cdr_align         ;         
reg     [3:0]       ll_rxlane_done          ;         
reg     [3:0]       ll_pcs_lsm_synced       ;         
reg     [3:0]       ll_pcs_rx_mcb_status    ;
reg     [3:0]       ll_slip_finish          ;
reg     [4*4-1:0]   lh_rdisper              ;
reg     [4*4-1:0]   lh_rdecer               ;
reg     [3:0]       lh_pl_err               ;

assign p_pll_lock_0            = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.P_PLL_READY_0           ;       
assign p_pll_lock_1            = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.P_PLL_READY_1           ;         
assign p_rx_sigdet_sta[0]      = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.P_RX_SIGDET_STATUS_0    ;         
assign p_rx_sigdet_sta[1]      = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.P_RX_SIGDET_STATUS_1    ;         
assign p_rx_sigdet_sta[2]      = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.P_RX_SIGDET_STATUS_2    ;         
assign p_rx_sigdet_sta[3]      = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.P_RX_SIGDET_STATUS_3    ;         
assign p_lx_cdr_align[0]       = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.P_LX_CDR_ALIGN_0        ;         
assign p_lx_cdr_align[1]       = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.P_LX_CDR_ALIGN_1        ;         
assign p_lx_cdr_align[2]       = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.P_LX_CDR_ALIGN_2        ;         
assign p_lx_cdr_align[3]       = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.P_LX_CDR_ALIGN_3        ;         
assign p_pcs_lsm_synced        = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.P_PCS_LSM_SYNCED        ;
assign p_pcs_rx_mcb_status     = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.P_PCS_RX_MCB_STATUS     ;
assign i_rdisper[4*1-1:4*0]    = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST_CHK.i_rdisper_0         ;
assign i_rdecer[4*1-1:4*0]     = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST_CHK.i_rdecer_0          ;
assign i_rdisper[4*2-1:4*1]    = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST_CHK.i_rdisper_1         ;
assign i_rdecer[4*2-1:4*1]     = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST_CHK.i_rdecer_1          ;
assign i_rdisper[4*3-1:4*2]    = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST_CHK.i_rdisper_2         ;
assign i_rdecer[4*3-1:4*2]     = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST_CHK.i_rdecer_2          ;
assign i_rdisper[4*4-1:4*3]    = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST_CHK.i_rdisper_3         ;
assign i_rdecer[4*4-1:4*3]     = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST_CHK.i_rdecer_3          ;
assign o_slip_finish           = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST_CHK.slip_finish         ;
assign o_pl_err                = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST_CHK.o_pl_err            ;
assign o_p_clk2core_tx_0       = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_GTP_HSST_WRAPPER.P_TCLK2FABRIC[0]   ;
assign o_p_clk2core_tx_1       = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_GTP_HSST_WRAPPER.P_TCLK2FABRIC[1]   ;
assign o_p_clk2core_tx_2       = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_GTP_HSST_WRAPPER.P_TCLK2FABRIC[2]   ;
assign o_p_clk2core_tx_3       = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_GTP_HSST_WRAPPER.P_TCLK2FABRIC[3]   ;
assign o_p_clk2core_rx_0       = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_GTP_HSST_WRAPPER.P_RCLK2FABRIC[0]   ;
assign o_p_clk2core_rx_1       = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_GTP_HSST_WRAPPER.P_RCLK2FABRIC[1]   ;
assign o_p_clk2core_rx_2       = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_GTP_HSST_WRAPPER.P_RCLK2FABRIC[2]   ;
assign o_p_clk2core_rx_3       = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_GTP_HSST_WRAPPER.P_RCLK2FABRIC[3]   ;
assign o_txlane_done_0         = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_IPML_HSST_RST.o_txlane_done_0       ;
assign o_txlane_done_1         = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_IPML_HSST_RST.o_txlane_done_1       ;
assign o_txlane_done_2         = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_IPML_HSST_RST.o_txlane_done_2       ;
assign o_txlane_done_3         = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_IPML_HSST_RST.o_txlane_done_3       ;
assign o_rxlane_done_0         = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_IPML_HSST_RST.o_rxlane_done_0       ;
assign o_rxlane_done_1         = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_IPML_HSST_RST.o_rxlane_done_1       ;
assign o_rxlane_done_2         = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_IPML_HSST_RST.o_rxlane_done_2       ;
assign o_rxlane_done_3         = u_hsst_top_tb.U_INST_TB.U_DUT_TOP.U_INST.U_IPML_HSST_RST.o_rxlane_done_3       ;

wire                p_pll_lock_if_0            ;         
wire                p_pll_lock_if_1            ;         
wire    [3:0]       p_rx_sigdet_sta_if         ;         
wire    [3:0]       p_lx_cdr_align_if          ;         
wire    [3:0]       p_pcs_lsm_synced_if        ;         
wire    [3:0]       p_pcs_rx_mcb_status_if     ;         
wire    [3:0]       o_rxlane_done_if           ;         
wire    [4*4-1:0]   i_rdisper_if               ;
wire    [4*4-1:0]   i_rdecer_if                ;
wire    [3:0]       o_slip_finish_if           ;
wire    [3:0]       o_pl_err_if                ;
reg                 ll_pll_lock_if_0           ;         
reg                 ll_pll_lock_if_1           ;         
reg     [3:0]       ll_rx_sigdet_sta_if        ;         
reg     [3:0]       ll_lx_cdr_align_if         ;         
reg     [3:0]       ll_rxlane_done_if          ;         
reg     [3:0]       ll_pcs_lsm_synced_if       ;         
reg     [3:0]       ll_pcs_rx_mcb_status_if    ;
reg     [3:0]       ll_slip_finish_if          ;
reg     [4*4-1:0]   lh_rdisper_if              ;
reg     [4*4-1:0]   lh_rdecer_if               ;
reg     [3:0]       lh_pl_err_if               ;

assign p_pll_lock_if_0            = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.P_PLL_READY_0           ;         
assign p_pll_lock_if_1            = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.P_PLL_READY_1           ;         
assign p_rx_sigdet_sta_if[0]      = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.P_RX_SIGDET_STATUS_0    ;         
assign p_rx_sigdet_sta_if[1]      = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.P_RX_SIGDET_STATUS_1    ;         
assign p_rx_sigdet_sta_if[2]      = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.P_RX_SIGDET_STATUS_2    ;         
assign p_rx_sigdet_sta_if[3]      = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.P_RX_SIGDET_STATUS_3    ;         
assign p_lx_cdr_align_if[0]       = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.P_LX_CDR_ALIGN_0        ;         
assign p_lx_cdr_align_if[1]       = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.P_LX_CDR_ALIGN_1        ;         
assign p_lx_cdr_align_if[2]       = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.P_LX_CDR_ALIGN_2        ;         
assign p_lx_cdr_align_if[3]       = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.P_LX_CDR_ALIGN_3        ;         
assign p_pcs_lsm_synced_if        = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.P_PCS_LSM_SYNCED        ;
assign p_pcs_rx_mcb_status_if     = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF.P_PCS_RX_MCB_STATUS     ;
assign i_rdisper_if[4*1-1:4*0]    = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF_CHK.i_rdisper_0         ;
assign i_rdecer_if[4*1-1:4*0]     = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF_CHK.i_rdecer_0          ;
assign i_rdisper_if[4*2-1:4*1]    = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF_CHK.i_rdisper_1         ;
assign i_rdecer_if[4*2-1:4*1]     = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF_CHK.i_rdecer_1          ;
assign i_rdisper_if[4*3-1:4*2]    = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF_CHK.i_rdisper_2         ;
assign i_rdecer_if[4*3-1:4*2]     = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF_CHK.i_rdecer_2          ;
assign i_rdisper_if[4*4-1:4*3]    = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF_CHK.i_rdisper_3         ;
assign i_rdecer_if[4*4-1:4*3]     = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF_CHK.i_rdecer_3          ;
assign o_slip_finish_if           = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF_CHK.slip_finish         ;
assign o_pl_err_if                = u_hsst_top_tb.U_INST_TB.U_IF_TOP.U_INST_IF_CHK.o_pl_err            ;

generate
if(O_RXLANE_DONE_0=="TRUE") begin
    assign o_rxlane_done[0]    = u_hsst_top_tb.U_INST_TB.o_rxlane_done_0   ;
    assign o_rxlane_done_if[0] = u_hsst_top_tb.U_INST_TB.o_rxlane_done_0_if;
end
else begin
    assign o_rxlane_done[0]    = 1'b1;
    assign o_rxlane_done_if[0] = 1'b1;
end
if(O_RXLANE_DONE_1=="TRUE") begin
    assign o_rxlane_done[1]    = u_hsst_top_tb.U_INST_TB.o_rxlane_done_1   ;
    assign o_rxlane_done_if[1] = u_hsst_top_tb.U_INST_TB.o_rxlane_done_1_if;
end
else begin
    assign o_rxlane_done[1]    = 1'b1;
    assign o_rxlane_done_if[1] = 1'b1;
end
if(O_RXLANE_DONE_2=="TRUE") begin
    assign o_rxlane_done[2]    = u_hsst_top_tb.U_INST_TB.o_rxlane_done_2   ;
    assign o_rxlane_done_if[2] = u_hsst_top_tb.U_INST_TB.o_rxlane_done_2_if;
end
else begin
    assign o_rxlane_done[2]    = 1'b1;
    assign o_rxlane_done_if[2] = 1'b1;
end
if(O_RXLANE_DONE_3=="TRUE") begin
    assign o_rxlane_done[3]    = u_hsst_top_tb.U_INST_TB.o_rxlane_done_3   ;
    assign o_rxlane_done_if[3] = u_hsst_top_tb.U_INST_TB.o_rxlane_done_3_if;
end
else begin
    assign o_rxlane_done[3]    = 1'b1;
    assign o_rxlane_done_if[3] = 1'b1;
end
endgenerate


reg clk_chk;
initial
begin
    clk_chk = 0;
    forever #1.0 clk_chk = ~clk_chk;
end

wire check_ready = (&o_rxlane_done) & (&o_rxlane_done_if);
reg chk_rst_n;
initial
begin
    chk_rst_n = 0;
    @(posedge check_ready);
    #25000;
    chk_rst_n = 1;
end

// ********************* DUT Check Result *********************
generate
if(PLL0_EN=="TRUE") begin
    always @ (posedge clk_chk) begin
        if(chk_rst_n==1'b0) 
            ll_pll_lock_0 <= 1'b1;
        else if(p_pll_lock_0==1'b0)
            ll_pll_lock_0 <= 1'b0;
        else ;
    end    
end
else begin
    always @ (posedge clk_chk) begin
        if(chk_rst_n==1'b0) 
            ll_pll_lock_0 <= 1'b1;
        else ;
    end    
end

if(PLL1_EN=="TRUE") begin
    always @ (posedge clk_chk) begin
        if(chk_rst_n==1'b0) 
            ll_pll_lock_1 <= 1'b1;
        else if(p_pll_lock_1==1'b0)
            ll_pll_lock_1 <= 1'b0;
        else ;
    end    
end
else begin
    always @ (posedge clk_chk) begin
        if(chk_rst_n==1'b0) 
            ll_pll_lock_1 <= 1'b1;
        else ;
    end    
end

for (i=0; i<=3; i=i+1) begin: DUT_LANE_RX
    if(RX_EN[i]==1'b1) begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                ll_rx_sigdet_sta[i] <= 1'b1;
            else if(p_rx_sigdet_sta[i]==1'b0)
                ll_rx_sigdet_sta[i] <= 1'b0;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                ll_lx_cdr_align[i] <= 1'b1;
            else if(p_lx_cdr_align[i]==1'b0)
                ll_lx_cdr_align[i] <= 1'b0;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                ll_rxlane_done[i] <= 1'b1;
            else if(o_rxlane_done[i]==1'b0)
                ll_rxlane_done[i] <= 1'b0;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_pl_err[i] <= 1'b0;
            else if(o_pl_err[i]==1'b1)
                lh_pl_err[i] <= 1'b1;
            else ;
        end    
    end
    else begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                ll_rx_sigdet_sta[i] <= 1'b1;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                ll_lx_cdr_align[i] <= 1'b1;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                ll_rxlane_done[i] <= 1'b1;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_pl_err[i] <= 1'b0;
            else ;
        end    
    end

    if(ALIGN_EN[i]==1'b1) begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                ll_pcs_lsm_synced[i] <= 1'b1;
            else if(p_pcs_lsm_synced[i]==1'b0)
                ll_pcs_lsm_synced[i] <= 1'b0;
            else ;
        end    
    end
    else begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                ll_pcs_lsm_synced[i] <= 1'b1;
            else ;
        end    
    end

    if(BONDING_EN[i]==1'b1) begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                ll_pcs_rx_mcb_status[i] <= 1'b1;
            else if(p_pcs_rx_mcb_status[i]==1'b0)
                ll_pcs_rx_mcb_status[i] <= 1'b0;
            else ;
        end    
    end
    else begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                ll_pcs_rx_mcb_status[i] <= 1'b1;
            else ;
        end    
    end

    if((RD_8B10B_8BIT[i]==1'b1)||(RD_8B10B_16BIT[i]==1'b1)||(RD_8B10B_32BIT[i]==1'b1)) begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdisper[4*i] <= 1'b0;
            else if(i_rdisper[4*i]==1'b1)
                lh_rdisper[4*i] <= 1'b1;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdecer[4*i] <= 1'b0;
            else if(i_rdecer[4*i]==1'b1)
                lh_rdecer[4*i] <= 1'b1;
            else ;
        end    
    end
    else begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdisper[4*i] <= 1'b0;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdecer[4*i] <= 1'b0;
            else ;
        end    
    end

    if((RD_8B10B_16BIT[i]==1'b1)||(RD_8B10B_32BIT[i]==1'b1)) begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdisper[4*i+1] <= 1'b0;
            else if(i_rdisper[4*i+1]==1'b1)
                lh_rdisper[4*i+1] <= 1'b1;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdecer[4*i+1] <= 1'b0;
            else if(i_rdecer[4*i+1]==1'b1)
                lh_rdecer[4*i+1] <= 1'b1;
            else ;
        end    
    end
    else begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdisper[4*i+1] <= 1'b0;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdecer[4*i+1] <= 1'b0;
            else ;
        end    
    end

    if(RD_8B10B_32BIT[i]==1'b1) begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdisper[4*i+2] <= 1'b0;
            else if(i_rdisper[4*i+2]==1'b1)
                lh_rdisper[4*i+2] <= 1'b1;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdecer[4*i+2] <= 1'b0;
            else if(i_rdecer[4*i+2]==1'b1)
                lh_rdecer[4*i+2] <= 1'b1;
            else ;
        end    
    end
    else begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdisper[4*i+2] <= 1'b0;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdecer[4*i+2] <= 1'b0;
            else ;
        end    
    end

    if(RD_8B10B_32BIT[i]==1'b1) begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdisper[4*i+3] <= 1'b0;
            else if(i_rdisper[4*i+3]==1'b1)
                lh_rdisper[4*i+3] <= 1'b1;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdecer[4*i+3] <= 1'b0;
            else if(i_rdecer[4*i+3]==1'b1)
                lh_rdecer[4*i+3] <= 1'b1;
            else ;
        end    
    end
    else begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdisper[4*i+3] <= 1'b0;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdecer[4*i+3] <= 1'b0;
            else ;
        end    
    end
    if (TD_66B_16B[i] | TD_66B_32B[i] | TD_67B_16B[i] | TD_67B_32B[i]) begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                ll_slip_finish[i] <= 1'b1;
            else if(o_slip_finish[i]==1'b0)
                ll_slip_finish[i] <= 1'b0;
            else ;
        end
    end
    else begin
       always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                ll_slip_finish[i] <= 1'b1;
                else ;
        end
    end
end
endgenerate

wire dut_result = (ll_pll_lock_0==1'b1 && ll_pll_lock_1==1'b1) && 
                  (ll_rx_sigdet_sta==4'b1111) && 
                  (ll_lx_cdr_align==4'b1111) &&
                  (ll_rxlane_done==4'b1111) &&
                  (ll_pcs_lsm_synced==4'b1111) &&
                  (ll_pcs_rx_mcb_status==4'b1111) &&
                  (lh_rdisper==16'b0) &&
                  (lh_rdecer==16'b0) &&
                  (ll_slip_finish==4'b1111) &&
                  (lh_pl_err==4'b0); 

// ********************* IF Check Result *********************
generate
if(PLL0_EN=="TRUE") begin
    always @ (posedge clk_chk) begin
        if(chk_rst_n==1'b0) 
            ll_pll_lock_if_0 <= 1'b1;
        else if(p_pll_lock_if_0==1'b0)
            ll_pll_lock_if_0 <= 1'b0;
        else ;
    end    
end
else begin
    always @ (posedge clk_chk) begin
        if(chk_rst_n==1'b0) 
            ll_pll_lock_if_0 <= 1'b1;
        else ;
    end    
end

if(PLL1_EN=="TRUE") begin
    always @ (posedge clk_chk) begin
        if(chk_rst_n==1'b0) 
            ll_pll_lock_if_1 <= 1'b1;
        else if(p_pll_lock_if_1==1'b0)
            ll_pll_lock_if_1 <= 1'b0;
        else ;
    end    
end
else begin
    always @ (posedge clk_chk) begin
        if(chk_rst_n==1'b0) 
            ll_pll_lock_if_1 <= 1'b1;
        else ;
    end    
end

for (i=0; i<=3; i=i+1) begin: IF_LANE_RX
    if(RX_EN[i]==1'b1) begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                ll_rx_sigdet_sta_if[i] <= 1'b1;
            else if(p_rx_sigdet_sta_if[i]==1'b0)
                ll_rx_sigdet_sta_if[i] <= 1'b0;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                ll_lx_cdr_align_if[i] <= 1'b1;
            else if(p_lx_cdr_align_if[i]==1'b0)
                ll_lx_cdr_align_if[i] <= 1'b0;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                ll_rxlane_done_if[i] <= 1'b1;
            else if(o_rxlane_done_if[i]==1'b0)
                ll_rxlane_done_if[i] <= 1'b0;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_pl_err_if[i] <= 1'b0;
            else if(o_pl_err_if[i]==1'b1)
                lh_pl_err_if[i] <= 1'b1;
            else ;
        end    
    end
    else begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                ll_rx_sigdet_sta_if[i] <= 1'b1;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                ll_lx_cdr_align_if[i] <= 1'b1;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                ll_rxlane_done_if[i] <= 1'b1;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_pl_err_if[i] <= 1'b0;
            else ;
        end    
    end

    if(ALIGN_EN[i]==1'b1) begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                ll_pcs_lsm_synced_if[i] <= 1'b1;
            else if(p_pcs_lsm_synced_if[i]==1'b0)
                ll_pcs_lsm_synced_if[i] <= 1'b0;
            else ;
        end    
    end
    else begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                ll_pcs_lsm_synced_if[i] <= 1'b1;
            else ;
        end    
    end

    if(BONDING_EN[i]==1'b1) begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                ll_pcs_rx_mcb_status_if[i] <= 1'b1;
            else if(p_pcs_rx_mcb_status_if[i]==1'b0)
                ll_pcs_rx_mcb_status_if[i] <= 1'b0;
            else ;
        end    
    end
    else begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                ll_pcs_rx_mcb_status_if[i] <= 1'b1;
            else ;
        end    
    end

    if((TD_8B10B_8BIT[i]==1'b1)||(TD_8B10B_16BIT[i]==1'b1)||(TD_8B10B_32BIT[i]==1'b1)) begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdisper_if[4*i] <= 1'b0;
            else if(i_rdisper_if[4*i]==1'b1)
                lh_rdisper_if[4*i] <= 1'b1;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdecer_if[4*i] <= 1'b0;
            else if(i_rdecer_if[4*i]==1'b1)
                lh_rdecer_if[4*i] <= 1'b1;
            else ;
        end    
    end
    else begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdisper_if[4*i] <= 1'b0;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdecer_if[4*i] <= 1'b0;
            else ;
        end    
    end

    if((TD_8B10B_16BIT[i]==1'b1)||(TD_8B10B_32BIT[i]==1'b1)) begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdisper_if[4*i+1] <= 1'b0;
            else if(i_rdisper_if[4*i+1]==1'b1)
                lh_rdisper_if[4*i+1] <= 1'b1;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdecer_if[4*i+1] <= 1'b0;
            else if(i_rdecer_if[4*i+1]==1'b1)
                lh_rdecer_if[4*i+1] <= 1'b1;
            else ;
        end    
    end
    else begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdisper_if[4*i+1] <= 1'b0;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdecer_if[4*i+1] <= 1'b0;
            else ;
        end    
    end

    if(TD_8B10B_32BIT[i]==1'b1) begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdisper_if[4*i+2] <= 1'b0;
            else if(i_rdisper_if[4*i+2]==1'b1)
                lh_rdisper_if[4*i+2] <= 1'b1;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdecer_if[4*i+2] <= 1'b0;
            else if(i_rdecer_if[4*i+2]==1'b1)
                lh_rdecer_if[4*i+2] <= 1'b1;
            else ;
        end    
    end
    else begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdisper_if[4*i+2] <= 1'b0;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdecer_if[4*i+2] <= 1'b0;
            else ;
        end    
    end

    if(TD_8B10B_32BIT[i]==1'b1) begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdisper_if[4*i+3] <= 1'b0;
            else if(i_rdisper_if[4*i+3]==1'b1)
                lh_rdisper_if[4*i+3] <= 1'b1;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdecer_if[4*i+3] <= 1'b0;
            else if(i_rdecer_if[4*i+3]==1'b1)
                lh_rdecer_if[4*i+3] <= 1'b1;
            else ;
        end    
    end
    else begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdisper_if[4*i+3] <= 1'b0;
            else ;
        end    
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                lh_rdecer_if[4*i+3] <= 1'b0;
            else ;
        end    
    end

    if (TD_66B_16B[i] | TD_66B_32B[i] | TD_67B_16B[i] | TD_67B_32B[i]) begin
        always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                ll_slip_finish_if[i] <= 1'b1;
            else if(o_slip_finish_if[i]==1'b0)
                ll_slip_finish_if[i] <= 1'b0;
            else ;
        end
    end
    else begin
       always @ (posedge clk_chk) begin
            if(chk_rst_n==1'b0) 
                ll_slip_finish_if[i] <= 1'b1;
                else ;
        end
    end
end

endgenerate

wire if_result  = (ll_pll_lock_if_0==1'b1 && ll_pll_lock_if_1==1'b1) && 
                  (ll_rx_sigdet_sta_if==4'b1111) && 
                  (ll_lx_cdr_align_if==4'b1111) &&
                  (ll_rxlane_done_if==4'b1111) &&
                  (ll_pcs_lsm_synced_if==4'b1111) &&
                  (ll_pcs_rx_mcb_status_if==4'b1111) &&
                  (lh_rdisper_if==16'b0) &&
                  (lh_rdecer_if==16'b0) &&
                  (ll_slip_finish_if==4'b1111) &&
                  (lh_pl_err_if==4'b0); 

// ********************* FREQUENCY & DUTY CHECK *********************
// *********LANE0 TX
real txclk_pose_last_0,txclk_pose_next_0,txclk_nege_0,txclk_fre_0,txclk_duty_0;
real txclk_fre_ui_0 ;
reg  tx_fre_check_0,tx_duty_check_0;
reg  tx_fre_check_result_0,tx_duty_check_result_0;
initial
begin
    txclk_pose_last_0 = 0.0 ;
    txclk_pose_next_0 = 0.0 ;
    txclk_nege_0      = 0.0 ;
    txclk_fre_0       = 0.0 ;
    txclk_duty_0      = 0.0 ;
    txclk_fre_ui_0    = 1000.0/CH0_TX_FABRIC_FEQ ;
end
always@(posedge o_p_clk2core_tx_0 or negedge o_txlane_done_0)
begin
    if(!o_txlane_done_0)
        txclk_pose_last_0  <= 0.0               ;   
    else
        txclk_pose_last_0  <= txclk_pose_next_0 ;
end
always@(posedge o_p_clk2core_tx_0 or negedge o_txlane_done_0)
begin
    if(!o_txlane_done_0)
        txclk_pose_next_0  <= 0.0               ;   
    else
        txclk_pose_next_0  <= $realtime ;
end
always@(posedge o_p_clk2core_tx_0 or negedge o_txlane_done_0)
begin
    if(!o_txlane_done_0)
        txclk_fre_0  <= 0.0               ;   
    else
        txclk_fre_0  <= txclk_pose_next_0 - txclk_pose_last_0 ;
end
always@(posedge o_p_clk2core_tx_0 or negedge o_txlane_done_0)
begin
    if(!o_txlane_done_0)
        tx_fre_check_0  <= 1'b1                   ;   
    else if ((txclk_pose_last_0 > 0) && (txclk_fre_0 != txclk_pose_last_0))
        if (((txclk_fre_ui_0 + 0.02) > txclk_fre_0) && (txclk_fre_0 > (txclk_fre_ui_0 - 0.02)))
            tx_fre_check_0  <= 1'b1               ;
        else
            tx_fre_check_0  <= 1'b0               ;
    else
        tx_fre_check_0  <= 1'b1                   ;
end
always@(posedge o_p_clk2core_tx_0 or negedge o_txlane_done_0)
begin
    if(!o_txlane_done_0)
        tx_fre_check_result_0  <= 1'b1               ;   
    else if (tx_fre_check_0 == 1'b0)
        tx_fre_check_result_0  <= 1'b0               ;
    else
        tx_fre_check_result_0  <= tx_fre_check_result_0 ; 
end
always@(negedge o_p_clk2core_tx_0 or negedge o_txlane_done_0)
begin
    if(!o_txlane_done_0)
        txclk_nege_0      <= 0.0               ;
    else
        txclk_nege_0      <= $realtime         ;
end        
always@(posedge o_p_clk2core_tx_0 or negedge o_txlane_done_0)
begin
    if(!o_txlane_done_0)
        txclk_fre_0  <= 0.0               ;   
    else if (txclk_nege_0 > txclk_pose_next_0)
        txclk_duty_0 <= txclk_nege_0 - txclk_pose_next_0 ;
    else
        txclk_duty_0 <= txclk_pose_next_0 - txclk_nege_0 ;
end    
always@(posedge o_p_clk2core_tx_0 or negedge o_txlane_done_0)
begin
    if(!o_txlane_done_0)
        tx_duty_check_0  <= 1'b1                   ;   
    else if (txclk_fre_0 > 0)
        if (((txclk_fre_ui_0 + 0.02) > 2*txclk_duty_0) && (2*txclk_duty_0 > (txclk_fre_ui_0 - 0.02)))      //50% duty
            tx_duty_check_0  <= 1'b1               ;
        else
            tx_duty_check_0  <= 1'b0               ;
    else
        tx_duty_check_0  <= 1'b1                   ;
end    
always@(posedge o_p_clk2core_tx_0 or negedge o_txlane_done_0)
begin
    if(!o_txlane_done_0)
        tx_duty_check_result_0  <= 1'b1               ;   
    else if (tx_duty_check_0 == 1'b0)
        tx_duty_check_result_0  <= 1'b0               ;
    else
        tx_duty_check_result_0  <= tx_duty_check_result_0 ; 
end    

// *********LANE0 RX
real rxclk_pose_last_0,rxclk_pose_next_0,rxclk_nege_0,rxclk_fre_0,rxclk_duty_0;
real rxclk_fre_ui_0;
reg  rx_fre_check_0,rx_duty_check_0;
reg  rx_fre_check_result_0,rx_duty_check_result_0;
initial
begin
    rxclk_pose_last_0  = 0.0 ;
    rxclk_pose_next_0  = 0.0 ;
    rxclk_nege_0       = 0.0 ;
    rxclk_fre_0        = 0.0 ;
    rxclk_duty_0       = 0.0 ;
    rxclk_fre_ui_0     = PCIE_DEFAULT[0] ? 500.0/CH0_RX_FABRIC_FEQ : 1000.0/CH0_RX_FABRIC_FEQ ;
end
always@(posedge o_p_clk2core_rx_0 or negedge o_rxlane_done_0)
begin
    if(!o_rxlane_done_0)
        rxclk_pose_last_0  <= 0.0               ;   
    else
        rxclk_pose_last_0  <= rxclk_pose_next_0 ;
end
always@(posedge o_p_clk2core_rx_0 or negedge o_rxlane_done_0)
begin
    if(!o_rxlane_done_0)
        rxclk_pose_next_0  <= 0.0               ;   
    else
        rxclk_pose_next_0  <= $realtime ;
end
always@(posedge o_p_clk2core_rx_0 or negedge o_rxlane_done_0)
begin
    if(!o_rxlane_done_0)
        rxclk_fre_0  <= 0.0               ;   
    else
        rxclk_fre_0  <= rxclk_pose_next_0 - rxclk_pose_last_0 ;
end
always@(posedge o_p_clk2core_rx_0 or negedge o_rxlane_done_0)
begin
    if(!o_rxlane_done_0)
        rx_fre_check_0  <= 1'b1                   ;   
    else if ((rxclk_pose_last_0 > 0) && (rxclk_fre_0 != rxclk_pose_last_0))
        if (((rxclk_fre_ui_0 + 0.02) >= rxclk_fre_0) && (rxclk_fre_0 >= (rxclk_fre_ui_0 - 0.02)))
            rx_fre_check_0  <= 1'b1               ;
        else
            rx_fre_check_0  <= 1'b0               ;
    else
        rx_fre_check_0  <= 1'b1                   ;
end
always@(posedge o_p_clk2core_rx_0 or negedge o_rxlane_done_0)
begin
    if(!o_rxlane_done_0)
        rx_fre_check_result_0  <= 1'b1               ;   
    else if (rx_fre_check_0 == 1'b0)
        rx_fre_check_result_0  <= 1'b0               ;
    else
        rx_fre_check_result_0  <= rx_fre_check_result_0 ; 
end
always@(negedge o_p_clk2core_rx_0 or negedge o_rxlane_done_0)
begin
    if(!o_rxlane_done_0)
        rxclk_nege_0      <= 0.0               ;
    else
        rxclk_nege_0      <= $realtime         ;
end        
always@(posedge o_p_clk2core_rx_0 or negedge o_rxlane_done_0)
begin
    if(!o_rxlane_done_0)
        rxclk_fre_0  <= 0.0               ;   
    else if (rxclk_nege_0 > rxclk_pose_next_0)
        rxclk_duty_0 <= rxclk_nege_0 - rxclk_pose_next_0 ;
    else
        rxclk_duty_0 <= rxclk_pose_next_0 - rxclk_nege_0 ;
end
generate
if (RD_8BIT_ONLY[0] == 1) begin : YES_RD_8BIT_ONLY_0
    always@(posedge o_p_clk2core_rx_0 or negedge o_rxlane_done_0)
    begin
        if(!o_rxlane_done_0)
            rx_duty_check_0  <= 1'b1                   ;   
        else if (rxclk_fre_0 > 0)
            if (((rxclk_fre_ui_0 + 0.02) >= 1.6*rxclk_duty_0) && (1.6*rxclk_duty_0 >= (rxclk_fre_ui_0 - 0.02)))      //37.5% duty
                rx_duty_check_0  <= 1'b1               ;
            else
                rx_duty_check_0  <= 1'b0               ;
        else
            rx_duty_check_0  <= 1'b1                   ;
    end
end
else begin : NOT_RD_8BIT_ONLY_0
    always@(posedge o_p_clk2core_rx_0 or negedge o_rxlane_done_0)
    begin
        if(!o_rxlane_done_0)
            rx_duty_check_0  <= 1'b1                   ;   
        else if (rxclk_fre_0 > 0)
            if (((rxclk_fre_ui_0 + 0.02) >= 2*rxclk_duty_0) && (2*rxclk_duty_0 >= (rxclk_fre_ui_0 - 0.02)))      //50% duty
                rx_duty_check_0  <= 1'b1               ;
            else
                rx_duty_check_0  <= 1'b0               ;
        else
            rx_duty_check_0  <= 1'b1                   ;
    end
end
endgenerate
always@(posedge o_p_clk2core_rx_0 or negedge o_rxlane_done_0)
begin
    if(!o_rxlane_done_0)
        rx_duty_check_result_0  <= 1'b1               ;   
    else if (rx_duty_check_0 == 1'b0)
        rx_duty_check_result_0  <= 1'b0               ;
    else
        rx_duty_check_result_0  <= rx_duty_check_result_0 ; 
end

// *********LANE1 TX
real txclk_pose_last_1,txclk_pose_next_1,txclk_nege_1,txclk_fre_1,txclk_duty_1;
real txclk_fre_ui_1 ;
reg  tx_fre_check_1,tx_duty_check_1;
reg  tx_fre_check_result_1,tx_duty_check_result_1;
initial
begin
    txclk_pose_last_1 = 0.0 ;
    txclk_pose_next_1 = 0.0 ;
    txclk_nege_1      = 0.0 ;
    txclk_fre_1       = 0.0 ;
    txclk_duty_1      = 0.0 ;
    txclk_fre_ui_1    = 1000.0/CH1_TX_FABRIC_FEQ ;
end
always@(posedge o_p_clk2core_tx_1 or negedge o_txlane_done_1)
begin
    if(!o_txlane_done_1)
        txclk_pose_last_1  <= 0.0               ;   
    else
        txclk_pose_last_1  <= txclk_pose_next_1 ;
end
always@(posedge o_p_clk2core_tx_1 or negedge o_txlane_done_1)
begin
    if(!o_txlane_done_1)
        txclk_pose_next_1  <= 0.0               ;   
    else
        txclk_pose_next_1  <= $realtime ;
end
always@(posedge o_p_clk2core_tx_1 or negedge o_txlane_done_1)
begin
    if(!o_txlane_done_1)
        txclk_fre_1  <= 0.0               ;   
    else
        txclk_fre_1  <= txclk_pose_next_1 - txclk_pose_last_1 ;
end
always@(posedge o_p_clk2core_tx_1 or negedge o_txlane_done_1)
begin
    if(!o_txlane_done_1)
        tx_fre_check_1  <= 1'b1                   ;   
    else if ((txclk_pose_last_1 > 0) && (txclk_fre_1 != txclk_pose_last_1))
        if (((txclk_fre_ui_1 + 0.02) > txclk_fre_1) && (txclk_fre_1 > (txclk_fre_ui_0 - 0.02)))
            tx_fre_check_1  <= 1'b1               ;
        else
            tx_fre_check_1  <= 1'b0               ;
    else
        tx_fre_check_1  <= 1'b1                   ;
end
always@(posedge o_p_clk2core_tx_1 or negedge o_txlane_done_1)
begin
    if(!o_txlane_done_1)
        tx_fre_check_result_1  <= 1'b1               ;   
    else if (tx_fre_check_1 == 1'b0)
        tx_fre_check_result_1  <= 1'b0               ;
    else
        tx_fre_check_result_1  <= tx_fre_check_result_1 ; 
end
always@(negedge o_p_clk2core_tx_1 or negedge o_txlane_done_1)
begin
    if(!o_txlane_done_1)
        txclk_nege_1      <= 0.0               ;
    else
        txclk_nege_1      <= $realtime         ;
end        
always@(posedge o_p_clk2core_tx_1 or negedge o_txlane_done_1)
begin
    if(!o_txlane_done_1)
        txclk_fre_1  <= 0.0               ;   
    else if (txclk_nege_1 > txclk_pose_next_1)
        txclk_duty_1 <= txclk_nege_1 - txclk_pose_next_1 ;
    else
        txclk_duty_1 <= txclk_pose_next_1 - txclk_nege_1 ;
end    
always@(posedge o_p_clk2core_tx_1 or negedge o_txlane_done_1)
begin
    if(!o_txlane_done_1)
        tx_duty_check_1  <= 1'b1                   ;   
    else if (txclk_fre_1 > 0)
        if (((txclk_fre_ui_1 + 0.02) > 2*txclk_duty_1) && (2*txclk_duty_1 > (txclk_fre_ui_1 - 0.02)))      //50% duty
            tx_duty_check_1  <= 1'b1               ;
        else
            tx_duty_check_1  <= 1'b0               ;
    else
        tx_duty_check_1  <= 1'b1                   ;
end    
always@(posedge o_p_clk2core_tx_1 or negedge o_txlane_done_1)
begin
    if(!o_txlane_done_1)
        tx_duty_check_result_1  <= 1'b1               ;   
    else if (tx_duty_check_1 == 1'b0)
        tx_duty_check_result_1  <= 1'b0               ;
    else
        tx_duty_check_result_1  <= tx_duty_check_result_1 ; 
end    

// *********LANE1 RX
real rxclk_pose_last_1,rxclk_pose_next_1,rxclk_nege_1,rxclk_fre_1,rxclk_duty_1;
real rxclk_fre_ui_1;
reg  rx_fre_check_1,rx_duty_check_1;
reg  rx_fre_check_result_1,rx_duty_check_result_1;
initial
begin
    rxclk_pose_last_1  = 0.0 ;
    rxclk_pose_next_1  = 0.0 ;
    rxclk_nege_1       = 0.0 ;
    rxclk_fre_1        = 0.0 ;
    rxclk_duty_1       = 0.0 ;
    rxclk_fre_ui_1     = PCIE_DEFAULT[1] ? 500.0/CH1_RX_FABRIC_FEQ : 1000.0/CH1_RX_FABRIC_FEQ ;
end
always@(posedge o_p_clk2core_rx_1 or negedge o_rxlane_done_1)
begin
    if(!o_rxlane_done_1)
        rxclk_pose_last_1  <= 0.0               ;   
    else
        rxclk_pose_last_1  <= rxclk_pose_next_1 ;
end
always@(posedge o_p_clk2core_rx_1 or negedge o_rxlane_done_1)
begin
    if(!o_rxlane_done_1)
        rxclk_pose_next_1  <= 0.0               ;   
    else
        rxclk_pose_next_1  <= $realtime ;
end
always@(posedge o_p_clk2core_rx_1 or negedge o_rxlane_done_1)
begin
    if(!o_rxlane_done_1)
        rxclk_fre_1  <= 0.0               ;   
    else
        rxclk_fre_1  <= rxclk_pose_next_1 - rxclk_pose_last_1 ;
end
always@(posedge o_p_clk2core_rx_1 or negedge o_rxlane_done_1)
begin
    if(!o_rxlane_done_1)
        rx_fre_check_1  <= 1'b1                   ;   
    else if ((rxclk_pose_last_1 > 0) && (rxclk_fre_1 != rxclk_pose_last_1))
        if (((rxclk_fre_ui_1 + 0.02) >= rxclk_fre_1) && (rxclk_fre_1 >= (rxclk_fre_ui_1 - 0.02)))
            rx_fre_check_1  <= 1'b1               ;
        else
            rx_fre_check_1  <= 1'b0               ;
    else
        rx_fre_check_1  <= 1'b1                   ;
end
always@(posedge o_p_clk2core_rx_1 or negedge o_rxlane_done_1)
begin
    if(!o_rxlane_done_1)
        rx_fre_check_result_1  <= 1'b1               ;   
    else if (rx_fre_check_1 == 1'b0)
        rx_fre_check_result_1  <= 1'b0               ;
    else
        rx_fre_check_result_1  <= rx_fre_check_result_1 ; 
end
always@(negedge o_p_clk2core_rx_1 or negedge o_rxlane_done_1)
begin
    if(!o_rxlane_done_1)
        rxclk_nege_1      <= 0.0               ;
    else
        rxclk_nege_1      <= $realtime         ;
end        
always@(posedge o_p_clk2core_rx_1 or negedge o_rxlane_done_1)
begin
    if(!o_rxlane_done_1)
        rxclk_fre_1  <= 0.0               ;   
    else if (rxclk_nege_1 > rxclk_pose_next_1)
        rxclk_duty_1 <= rxclk_nege_1 - rxclk_pose_next_1 ;
    else
        rxclk_duty_1 <= rxclk_pose_next_1 - rxclk_nege_1 ;
end    
generate
if (RD_8BIT_ONLY[1] == 1) begin : YES_RD_8BIT_ONLY_1
    always@(posedge o_p_clk2core_rx_1 or negedge o_rxlane_done_1)
    begin
        if(!o_rxlane_done_1)
            rx_duty_check_1  <= 1'b1                   ;   
        else if (rxclk_fre_1 > 0)
        if (((rxclk_fre_ui_1 + 0.02) >= 1.6*rxclk_duty_1) && (1.6*rxclk_duty_1 >= (rxclk_fre_ui_1 - 0.02)))      //37.5% duty
                rx_duty_check_1  <= 1'b1               ;
            else
                rx_duty_check_1  <= 1'b0               ;
        else
            rx_duty_check_1  <= 1'b1                   ;
    end
end
else begin : NOT_RD_8BIT_ONLY_1
    always@(posedge o_p_clk2core_rx_1 or negedge o_rxlane_done_1)
    begin
        if(!o_rxlane_done_1)
            rx_duty_check_1  <= 1'b1                   ;   
        else if (rxclk_fre_1 > 0)
            if (((rxclk_fre_ui_1 + 0.02) >= 2*rxclk_duty_1) && (2*rxclk_duty_1 >= (rxclk_fre_ui_1 - 0.02)))      //50% duty
                rx_duty_check_1  <= 1'b1               ;
            else
                rx_duty_check_1  <= 1'b0               ;
        else
            rx_duty_check_1  <= 1'b1                   ;
    end
end
endgenerate
always@(posedge o_p_clk2core_rx_1 or negedge o_rxlane_done_1)
begin
    if(!o_rxlane_done_1)
        rx_duty_check_result_1  <= 1'b1               ;   
    else if (rx_duty_check_1 == 1'b0)
        rx_duty_check_result_1  <= 1'b0               ;
    else
        rx_duty_check_result_1  <= rx_duty_check_result_1 ; 
end

// *********LANE2 TX
real txclk_pose_last_2,txclk_pose_next_2,txclk_nege_2,txclk_fre_2,txclk_duty_2;
real txclk_fre_ui_2 ;
reg  tx_fre_check_2,tx_duty_check_2;
reg  tx_fre_check_result_2,tx_duty_check_result_2;
initial
begin
    txclk_pose_last_2 = 0.0 ;
    txclk_pose_next_2 = 0.0 ;
    txclk_nege_2      = 0.0 ;
    txclk_fre_2       = 0.0 ;
    txclk_duty_2      = 0.0 ;
    txclk_fre_ui_2    = 1000.0/CH2_TX_FABRIC_FEQ ;
end
always@(posedge o_p_clk2core_tx_2 or negedge o_txlane_done_2)
begin
    if(!o_txlane_done_2)
        txclk_pose_last_2  <= 0.0               ;   
    else
        txclk_pose_last_2  <= txclk_pose_next_2 ;
end
always@(posedge o_p_clk2core_tx_2 or negedge o_txlane_done_2)
begin
    if(!o_txlane_done_2)
        txclk_pose_next_2  <= 0.0               ;   
    else
        txclk_pose_next_2  <= $realtime ;
end
always@(posedge o_p_clk2core_tx_2 or negedge o_txlane_done_2)
begin
    if(!o_txlane_done_2)
        txclk_fre_2  <= 0.0               ;   
    else
        txclk_fre_2  <= txclk_pose_next_2 - txclk_pose_last_2 ;
end
always@(posedge o_p_clk2core_tx_2 or negedge o_txlane_done_2)
begin
    if(!o_txlane_done_2)
        tx_fre_check_2  <= 1'b1                   ;   
    else if ((txclk_pose_last_2 > 0) && (txclk_fre_2 != txclk_pose_last_2))
        if (((txclk_fre_ui_2 + 0.02) > txclk_fre_2) && (txclk_fre_2 > (txclk_fre_ui_2 - 0.02)))
            tx_fre_check_2  <= 1'b1               ;
        else
            tx_fre_check_2  <= 1'b0               ;
    else
        tx_fre_check_2  <= 1'b1                   ;
end
always@(posedge o_p_clk2core_tx_2 or negedge o_txlane_done_2)
begin
    if(!o_txlane_done_2)
        tx_fre_check_result_2  <= 1'b1               ;   
    else if (tx_fre_check_2 == 1'b0)
        tx_fre_check_result_2  <= 1'b0               ;
    else
        tx_fre_check_result_2  <= tx_fre_check_result_2 ; 
end
always@(negedge o_p_clk2core_tx_2 or negedge o_txlane_done_2)
begin
    if(!o_txlane_done_2)
        txclk_nege_2      <= 0.0               ;
    else
        txclk_nege_2      <= $realtime         ;
end        
always@(posedge o_p_clk2core_tx_2 or negedge o_txlane_done_2)
begin
    if(!o_txlane_done_2)
        txclk_fre_2  <= 0.0               ;   
    else if (txclk_nege_2 > txclk_pose_next_2)
        txclk_duty_2 <= txclk_nege_2 - txclk_pose_next_2 ;
    else
        txclk_duty_2 <= txclk_pose_next_2 - txclk_nege_2 ;
end    
always@(posedge o_p_clk2core_tx_2 or negedge o_txlane_done_2)
begin
    if(!o_txlane_done_2)
        tx_duty_check_2  <= 1'b1                   ;   
    else if (txclk_fre_2 > 0)
        if (((txclk_fre_ui_2 + 0.02) > 2*txclk_duty_2) && (2*txclk_duty_2 > (txclk_fre_ui_2 - 0.02)))      //50% duty
            tx_duty_check_2  <= 1'b1               ;
        else
            tx_duty_check_2  <= 1'b0               ;
    else
        tx_duty_check_2  <= 1'b1                   ;
end    
always@(posedge o_p_clk2core_tx_2 or negedge o_txlane_done_2)
begin
    if(!o_txlane_done_2)
        tx_duty_check_result_2  <= 1'b1               ;   
    else if (tx_duty_check_2 == 1'b0)
        tx_duty_check_result_2  <= 1'b0               ;
    else
        tx_duty_check_result_2  <= tx_duty_check_result_2 ; 
end    

// *********LANE2 RX
real rxclk_pose_last_2,rxclk_pose_next_2,rxclk_nege_2,rxclk_fre_2,rxclk_duty_2;
real rxclk_fre_ui_2;
reg  rx_fre_check_2,rx_duty_check_2;
reg  rx_fre_check_result_2,rx_duty_check_result_2;
initial
begin
    rxclk_pose_last_2  = 0.0 ;
    rxclk_pose_next_2  = 0.0 ;
    rxclk_nege_2       = 0.0 ;
    rxclk_fre_2        = 0.0 ;
    rxclk_duty_2       = 0.0 ;
    rxclk_fre_ui_2     = PCIE_DEFAULT[2] ? 500.0/CH2_RX_FABRIC_FEQ : 1000.0/CH2_RX_FABRIC_FEQ ;
end
always@(posedge o_p_clk2core_rx_2 or negedge o_rxlane_done_2)
begin
    if(!o_rxlane_done_2)
        rxclk_pose_last_2  <= 0.0               ;   
    else
        rxclk_pose_last_2  <= rxclk_pose_next_2 ;
end
always@(posedge o_p_clk2core_rx_2 or negedge o_rxlane_done_2)
begin
    if(!o_rxlane_done_2)
        rxclk_pose_next_2  <= 0.0               ;   
    else
        rxclk_pose_next_2  <= $realtime ;
end
always@(posedge o_p_clk2core_rx_2 or negedge o_rxlane_done_2)
begin
    if(!o_rxlane_done_2)
        rxclk_fre_2  <= 0.0               ;   
    else
        rxclk_fre_2  <= rxclk_pose_next_2 - rxclk_pose_last_2 ;
end
always@(posedge o_p_clk2core_rx_2 or negedge o_rxlane_done_2)
begin
    if(!o_rxlane_done_2)
        rx_fre_check_2  <= 1'b1                   ;   
    else if ((rxclk_pose_last_2 > 0) && (rxclk_fre_2 != rxclk_pose_last_2))
        if (((rxclk_fre_ui_2 + 0.02) >= rxclk_fre_2) && (rxclk_fre_2 >= (rxclk_fre_ui_2 - 0.02)))
            rx_fre_check_2  <= 1'b1               ;
        else
            rx_fre_check_2  <= 1'b0               ;
    else
        rx_fre_check_2  <= 1'b1                   ;
end
always@(posedge o_p_clk2core_rx_2 or negedge o_rxlane_done_2)
begin
    if(!o_rxlane_done_2)
        rx_fre_check_result_2  <= 1'b1               ;   
    else if (rx_fre_check_2 == 1'b0)
        rx_fre_check_result_2  <= 1'b0               ;
    else
        rx_fre_check_result_2  <= rx_fre_check_result_2 ; 
end
always@(negedge o_p_clk2core_rx_2 or negedge o_rxlane_done_2)
begin
    if(!o_rxlane_done_2)
        rxclk_nege_2      <= 0.0               ;
    else
        rxclk_nege_2      <= $realtime         ;
end        
always@(posedge o_p_clk2core_rx_2 or negedge o_rxlane_done_2)
begin
    if(!o_rxlane_done_2)
        rxclk_fre_2  <= 0.0               ;   
    else if (rxclk_nege_2 > rxclk_pose_next_2)
        rxclk_duty_2 <= rxclk_nege_2 - rxclk_pose_next_2 ;
    else
        rxclk_duty_2 <= rxclk_pose_next_2 - rxclk_nege_2 ;
end    
generate
if (RD_8BIT_ONLY[2] == 1) begin : YES_RD_8BIT_ONLY_2
    always@(posedge o_p_clk2core_rx_2 or negedge o_rxlane_done_2)
    begin
        if(!o_rxlane_done_2)
            rx_duty_check_2  <= 1'b1                   ;   
        else if (rxclk_fre_2 > 0)
            if (((rxclk_fre_ui_2 + 0.02) >= 1.6*rxclk_duty_2) && (1.6*rxclk_duty_2 >= (rxclk_fre_ui_2 - 0.02)))      //37.5% duty
                rx_duty_check_2  <= 1'b1               ;
            else
                rx_duty_check_2  <= 1'b0               ;
        else
            rx_duty_check_2  <= 1'b1                   ;
    end
end
else begin : NOT_RD_8BIT_ONLY_2
    always@(posedge o_p_clk2core_rx_2 or negedge o_rxlane_done_2)
    begin
        if(!o_rxlane_done_2)
            rx_duty_check_2  <= 1'b1                   ;   
        else if (rxclk_fre_2 > 0)
            if (((rxclk_fre_ui_2 + 0.02) >= 2*rxclk_duty_2) && (2*rxclk_duty_2 >= (rxclk_fre_ui_2 - 0.02)))      //50% duty
                rx_duty_check_2  <= 1'b1               ;
            else
                rx_duty_check_2  <= 1'b0               ;
        else
            rx_duty_check_2  <= 1'b1                   ;
    end
end
endgenerate    
always@(posedge o_p_clk2core_rx_2 or negedge o_rxlane_done_2)
begin
    if(!o_rxlane_done_2)
        rx_duty_check_result_2  <= 1'b1               ;   
    else if (rx_duty_check_2 == 1'b0)
        rx_duty_check_result_2  <= 1'b0               ;
    else
        rx_duty_check_result_2  <= rx_duty_check_result_2 ; 
end

// *********LANE3 TX
real txclk_pose_last_3,txclk_pose_next_3,txclk_nege_3,txclk_fre_3,txclk_duty_3;
real txclk_fre_ui_3 ;
reg  tx_fre_check_3,tx_duty_check_3;
reg  tx_fre_check_result_3,tx_duty_check_result_3;
initial
begin
    txclk_pose_last_3 = 0.0 ;
    txclk_pose_next_3 = 0.0 ;
    txclk_nege_3      = 0.0 ;
    txclk_fre_3       = 0.0 ;
    txclk_duty_3      = 0.0 ;
    txclk_fre_ui_3    = 1000.0/CH3_TX_FABRIC_FEQ ;
end
always@(posedge o_p_clk2core_tx_3 or negedge o_txlane_done_3)
begin
    if(!o_txlane_done_3)
        txclk_pose_last_3  <= 0.0               ;   
    else
        txclk_pose_last_3  <= txclk_pose_next_3 ;
end
always@(posedge o_p_clk2core_tx_3 or negedge o_txlane_done_3)
begin
    if(!o_txlane_done_3)
        txclk_pose_next_3  <= 0.0               ;   
    else
        txclk_pose_next_3  <= $realtime ;
end
always@(posedge o_p_clk2core_tx_3 or negedge o_txlane_done_3)
begin
    if(!o_txlane_done_3)
        txclk_fre_3  <= 0.0               ;   
    else
        txclk_fre_3  <= txclk_pose_next_3 - txclk_pose_last_3 ;
end
always@(posedge o_p_clk2core_tx_3 or negedge o_txlane_done_3)
begin
    if(!o_txlane_done_3)
        tx_fre_check_3  <= 1'b1                   ;   
    else if ((txclk_pose_last_3 > 0) && (txclk_fre_3 != txclk_pose_last_3))
        if (((txclk_fre_ui_3 + 0.02) > txclk_fre_3) && (txclk_fre_3 > (txclk_fre_ui_3 - 0.02)))
            tx_fre_check_3  <= 1'b1               ;
        else
            tx_fre_check_3  <= 1'b0               ;
    else
        tx_fre_check_3  <= 1'b1                   ;
end
always@(posedge o_p_clk2core_tx_3 or negedge o_txlane_done_3)
begin
    if(!o_txlane_done_3)
        tx_fre_check_result_3  <= 1'b1               ;   
    else if (tx_fre_check_3 == 1'b0)
        tx_fre_check_result_3  <= 1'b0               ;
    else
        tx_fre_check_result_3  <= tx_fre_check_result_3 ; 
end
always@(negedge o_p_clk2core_tx_3 or negedge o_txlane_done_3)
begin
    if(!o_txlane_done_3)
        txclk_nege_3      <= 0.0               ;
    else
        txclk_nege_3      <= $realtime         ;
end        
always@(posedge o_p_clk2core_tx_3 or negedge o_txlane_done_3)
begin
    if(!o_txlane_done_3)
        txclk_fre_3  <= 0.0               ;   
    else if (txclk_nege_3 > txclk_pose_next_3)
        txclk_duty_3 <= txclk_nege_3 - txclk_pose_next_3 ;
    else
        txclk_duty_3 <= txclk_pose_next_3 - txclk_nege_3 ;
end    
always@(posedge o_p_clk2core_tx_3 or negedge o_txlane_done_3)
begin
    if(!o_txlane_done_3)
        tx_duty_check_3  <= 1'b1                   ;   
    else if (txclk_fre_3 > 0)
        if (((txclk_fre_ui_3 + 0.02) > 2*txclk_duty_3) && (2*txclk_duty_3 > (txclk_fre_ui_3 - 0.02)))      //50% duty
            tx_duty_check_3  <= 1'b1               ;
        else
            tx_duty_check_3  <= 1'b0               ;
    else
        tx_duty_check_3  <= 1'b1                   ;
end    
always@(posedge o_p_clk2core_tx_3 or negedge o_txlane_done_3)
begin
    if(!o_txlane_done_3)
        tx_duty_check_result_3  <= 1'b1               ;   
    else if (tx_duty_check_3 == 1'b0)
        tx_duty_check_result_3  <= 1'b0               ;
    else
        tx_duty_check_result_3  <= tx_duty_check_result_3 ; 
end    

// *********LANE3 RX
real rxclk_pose_last_3,rxclk_pose_next_3,rxclk_nege_3,rxclk_fre_3,rxclk_duty_3;
real rxclk_fre_ui_3;
reg  rx_fre_check_3,rx_duty_check_3;
reg  rx_fre_check_result_3,rx_duty_check_result_3;
initial
begin
    rxclk_pose_last_3  = 0.0 ;
    rxclk_pose_next_3  = 0.0 ;
    rxclk_nege_3       = 0.0 ;
    rxclk_fre_3        = 0.0 ;
    rxclk_duty_3       = 0.0 ;
    rxclk_fre_ui_3     = PCIE_DEFAULT[3] ? 500.0/CH3_RX_FABRIC_FEQ : 1000.0/CH3_RX_FABRIC_FEQ ;
end
always@(posedge o_p_clk2core_rx_3 or negedge o_rxlane_done_3)
begin
    if(!o_rxlane_done_3)
        rxclk_pose_last_3  <= 0.0               ;   
    else
        rxclk_pose_last_3  <= rxclk_pose_next_3 ;
end
always@(posedge o_p_clk2core_rx_3 or negedge o_rxlane_done_3)
begin
    if(!o_rxlane_done_3)
        rxclk_pose_next_3  <= 0.0               ;   
    else
        rxclk_pose_next_3  <= $realtime ;
end
always@(posedge o_p_clk2core_rx_3 or negedge o_rxlane_done_3)
begin
    if(!o_rxlane_done_3)
        rxclk_fre_3  <= 0.0               ;   
    else
        rxclk_fre_3  <= rxclk_pose_next_3 - rxclk_pose_last_3 ;
end
always@(posedge o_p_clk2core_rx_3 or negedge o_rxlane_done_3)
begin
    if(!o_rxlane_done_3)
        rx_fre_check_3  <= 1'b1                   ;   
    else if ((rxclk_pose_last_3 > 0) && (rxclk_fre_3 != rxclk_pose_last_3))
        if (((rxclk_fre_ui_3 + 0.02) >= rxclk_fre_3) && (rxclk_fre_3 >= (rxclk_fre_ui_3 - 0.02)))
            rx_fre_check_3  <= 1'b1               ;
        else
            rx_fre_check_3  <= 1'b0               ;
    else
        rx_fre_check_3  <= 1'b1                   ;
end
always@(posedge o_p_clk2core_rx_3 or negedge o_rxlane_done_3)
begin
    if(!o_rxlane_done_3)
        rx_fre_check_result_3  <= 1'b1               ;   
    else if (rx_fre_check_3 == 1'b0)
        rx_fre_check_result_3  <= 1'b0               ;
    else
        rx_fre_check_result_3  <= rx_fre_check_result_3 ; 
end
always@(negedge o_p_clk2core_rx_3 or negedge o_rxlane_done_3)
begin
    if(!o_rxlane_done_3)
        rxclk_nege_3      <= 0.0               ;
    else
        rxclk_nege_3      <= $realtime         ;
end        
always@(posedge o_p_clk2core_rx_3 or negedge o_rxlane_done_3)
begin
    if(!o_rxlane_done_3)
        rxclk_fre_3  <= 0.0               ;   
    else if (rxclk_nege_3 > rxclk_pose_next_3)
        rxclk_duty_3 <= rxclk_nege_3 - rxclk_pose_next_3 ;
    else
        rxclk_duty_3 <= rxclk_pose_next_3 - rxclk_nege_3 ;
end    
generate
if (RD_8BIT_ONLY[3] == 1) begin : YES_RD_8BIT_ONLY_3
    always@(posedge o_p_clk2core_rx_3 or negedge o_rxlane_done_3)
    begin
        if(!o_rxlane_done_3)
            rx_duty_check_3  <= 1'b1                   ;   
        else if (rxclk_fre_3 > 0)
            if (((rxclk_fre_ui_3 + 0.02) >= 1.6*rxclk_duty_3) && (1.6*rxclk_duty_3 >= (rxclk_fre_ui_3 - 0.02)))      //37.5% duty
                rx_duty_check_3  <= 1'b1               ;
            else
                rx_duty_check_3  <= 1'b0               ;
        else
            rx_duty_check_3  <= 1'b1                   ;
    end
end
else begin : NOT_RD_8BIT_ONLY_3
    always@(posedge o_p_clk2core_rx_3 or negedge o_rxlane_done_3)
    begin
        if(!o_rxlane_done_3)
            rx_duty_check_3  <= 1'b1                   ;   
        else if (rxclk_fre_3 > 0)
            if (((rxclk_fre_ui_3 + 0.02) >= 2*rxclk_duty_3) && (2*rxclk_duty_3 >= (rxclk_fre_ui_3 - 0.02)))      //50% duty
                rx_duty_check_3  <= 1'b1               ;
            else
                rx_duty_check_3  <= 1'b0               ;
        else
            rx_duty_check_3  <= 1'b1                   ;
    end
end
endgenerate    
always@(posedge o_p_clk2core_rx_3 or negedge o_rxlane_done_3)
begin
    if(!o_rxlane_done_3)
        rx_duty_check_result_3  <= 1'b1               ;   
    else if (rx_duty_check_3 == 1'b0)
        rx_duty_check_result_3  <= 1'b0               ;
    else
        rx_duty_check_result_3  <= rx_duty_check_result_3 ; 
end

wire fre_check_result    ;
wire txduty_check_result ;
wire rxduty_check_result ;
assign fre_check_result  = tx_fre_check_result_0  && tx_fre_check_result_1  && tx_fre_check_result_2  && tx_fre_check_result_3  && rx_fre_check_result_0  && rx_fre_check_result_1  && rx_fre_check_result_2  && rx_fre_check_result_3;
assign txduty_check_result = tx_duty_check_result_0 && tx_duty_check_result_1 && tx_duty_check_result_2 && tx_duty_check_result_3; 
assign rxduty_check_result = rx_duty_check_result_0 && rx_duty_check_result_1 && rx_duty_check_result_2 && rx_duty_check_result_3; 

// ********************* SIMULATION CHECK LOGIC *********************
integer handle;
initial
begin
    #400000 //unit is ns
    handle = $fopen ("vsim_inst_top_tb.log","a");
    if ((dut_result==1'b0)||(if_result==1'b0)||(chk_rst_n==1'b0)||(fre_check_result==1'b0)||(txduty_check_result==1'b0)||(rxduty_check_result==1'b0)) begin
        $fdisplay(handle,"dut_result = %b, if_result = %b , fre_check_result = %b , txduty_check_result = %b , rxduty_check_result = %b . Simulation Failed!",dut_result,if_result,fre_check_result,txduty_check_result,rxduty_check_result );
        $display("Simulation Failed.") ;
    end
    else begin
        $fdisplay(handle,"dut_result = %b, if_result = %b , fre_check_result = %b , txduty_check_result = %b , rxduty_check_result = %b . Simulation Success!",dut_result,if_result,fre_check_result,txduty_check_result,rxduty_check_result );
        $display("Simulation Success.") ;
    end
    $finish;
end

endmodule

