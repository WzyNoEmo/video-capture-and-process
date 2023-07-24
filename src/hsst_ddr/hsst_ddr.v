module hsst_ddr(
    
    
    input          i_free_clk                    ,
    input          rst_n                         ,

    output         o_txlane_done_2               ,
    output         o_txlane_done_3               ,
    output         o_rxlane_done_2               ,
    output         o_rxlane_done_3               ,
    input          i_p_refckn_0                  ,
    input          i_p_refckp_0                  ,

    input          i_p_l2rxn                     ,
    input          i_p_l2rxp                     ,
    input          i_p_l3rxn                     ,
    input          i_p_l3rxp                     ,
    output         o_p_l2txn                     ,
    output         o_p_l2txp                     ,
    output         o_p_l3txn                     ,
    output         o_p_l3txp                     ,

    output[1:0]    tx_disable        ,

    //???
    input   [15:0] i_rgb565_camera_1                    , 
    input   de_in_camera_1                    , 
    input   vs_in_camera_1                    ,
    input   pixclk_in_camera_1 ,
    
    //???
    output  [15:0] i_rgb565_hsst                    ,
    output  de_in_hsst                    ,
    output  vs_in_hsst                    ,
    output  pixclk_in_hsst       
);



assign        tx_disable           = 2'b0 ; 

wire          i_wtchdg_clr_0 ;
wire          src_rst             /* synthesis PAP_MARK_DEBUG="true" */ ; //no use          
wire          chk_rst             /* synthesis PAP_MARK_DEBUG="true" */ ; //no used
wire          pll_rst_d;
wire          i_pll_rst_0;
wire          i_p_cfg_rst;
wire          rst_n_dly_d0;
assign        i_p_cfg_rst=~rst_n;
assign        i_pll_rst_0= pll_rst_d;
assign        pll_rst_d=i_p_cfg_rst;
assign        i_wtchdg_clr_0=pll_rst_d;
assign        src_rst=pll_rst_d;
assign        chk_rst=pll_rst_d;


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
wire           i_p_tx2_clk_fr_core           /*synthesis PAP_MARK_DEBUG="1"*/;
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

wire   [31:0]  i_txd_2                       ; /*synthesis PAP_MARK_DEBUG="1"*/
wire   [3:0]   i_tdispsel_2                  ;
wire   [3:0]   i_tdispctrl_2                 ;
wire   [3:0]   i_txk_2                       ; /*synthesis PAP_MARK_DEBUG="1"*/
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
wire  [39:0] o_rxd_3                       ; /*synthesis PAP_MARK_DEBUG="1"*/
wire  [3:0]  o_rxk_3                       ; /*synthesis PAP_MARK_DEBUG="1"*/
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
    .o_rxstatus_2                  (             ), // output [2:0]   
    .o_rxd_2                       (o_rxd_2[31:0]                 ), // output [31:0]  
    .o_rdisper_2                   (              ), // output [3:0]   
    .o_rdecer_2                    (               ), // output [3:0]   
    .o_rxk_2                       (o_rxk_2[3:0]                  ), // output [3:0]   
    .o_rxstatus_3                  (             ), // output [2:0]   
    .o_rxd_3                       (o_rxd_3[31:0]                 ), // output [31:0]  
    .o_rdisper_3                   (              ), // output [3:0]   
    .o_rdecer_3                    (               ), // output [3:0]   
    .o_rxk_3                       (o_rxk_3[3:0]                  ), // output [3:0]   
    .i_pll_rst_0                   (i_pll_rst_0                   )  // input  
);


// ********************* Source of DUT *********************
/*

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
assign i_src_clk3 = i_p_tx3_clk_fr_core        ; 
u_hsst_src #(
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
    .o_txh_3                       (o_txh_3                       )
);


assign i_txd_2                       = {K28_5,8'b0,K28_5,8'b0};
assign i_tdispsel_2                  = 4'b0;
assign i_tdispctrl_2                 = 4'b0;
assign i_txk_2                       = 4'b1010 ;
assign i_txd_3                       = {K28_5,8'b0,K28_5,8'b0};
assign i_tdispsel_3                  = 4'b0;
assign i_tdispctrl_3                 = 4'b0;
assign i_txk_3                       = 4'b1010 ;
*/


// ********************* Source of DUT *********************
localparam    [7:0] K28_5          = 8'hBC;

//**********************  TX  ***************************
//?????? txk ???00?????11 , 11????? txd FFFF ???
    wire    txclk2;/*synthesis PAP_MARK_DEBUG="1"*/
    wire    txclk3;/*synthesis PAP_MARK_DEBUG="1"*/
    wire    rxclk2;/*synthesis PAP_MARK_DEBUG="1"*/
    wire    rxclk3;/*synthesis PAP_MARK_DEBUG="1"*/
    assign        txclk2 = i_p_tx2_clk_fr_core        ; 
    assign        rxclk2 = i_p_rx2_clk_fr_core        ;
    assign        txclk3 = i_p_tx3_clk_fr_core        ; 
    assign        rxclk3 = i_p_rx3_clk_fr_core        ;
    wire      wr_fsync = vs_in_camera_1;
    wire      wr_en = de_in_camera_1;
    wire      wr_clk = pixclk_in_camera_1;
    wire      [15:0] wr_data = i_rgb565_camera_1;
    wire      rd_clk = txclk2;
    wire    hsst_rstn = o_txlane_done_2;
/*
    reg       wr_fsync_1d;
    reg       wr_en_1d;
    wire      wr_rst;
    reg       wr_enable=0;
    reg       hsst_rstn_1d;
    reg       hsst_rstn_2d;
    
    always @(posedge wr_clk)
    begin
        wr_fsync_1d <= wr_fsync;
        wr_en_1d <= wr_en;
        hsst_rstn_1d <= hsst_rstn;
        hsst_rstn_2d <= hsst_rstn_1d;
        
        if(~wr_fsync_1d & wr_fsync && hsst_rstn_2d)     
            wr_enable <= 1'b1;                    //wr_enable在hsst复位完成后且第一次场信号来的时候保持一直拉高
        else 
            wr_enable <= wr_enable;                               
    end 
    
    assign wr_rst = (~wr_fsync_1d & wr_fsync) | (~hsst_rstn_2d);    //一帧写之前，wr_rst拉高

    reg [11:0] x_cnt;

    always @(posedge wr_clk)
    begin 
        if(wr_rst)
            x_cnt <= 12'd0;
        else if(wr_en & wr_enable)        //一个像素点,x_cnt+1
            x_cnt <= x_cnt + 1'b1;
        else
            x_cnt <= 12'd0;
    end 

    wire [15:0] rd_data;

hsst_fifo tx_fifo (
  .wr_clk(wr_clk),                // input
  .wr_rst(wr_rst),                // input
  .wr_en(wr_en),                  // input
  .wr_data(wr_data),              // input [15:0]
  .wr_full(),              // output
  .almost_full(),      // output
  .rd_clk(rd_clk),                // input
  .rd_rst(rd_rst),                // input
  .rd_en(rd_en),                  // input
  .rd_data(rd_data),              // output [15:0]
  .rd_empty(),            // output
  .almost_empty()     // output
);

    reg      rd_fsync_1d,rd_fsync_2d,rd_fsync_3d;
    wire     rd_rst;
    always @(posedge rd_clk)
    begin
        rd_fsync_1d <= wr_fsync;
        rd_fsync_2d <= rd_fsync_1d;
        rd_fsync_3d <= rd_fsync_2d;
    end 
    
    assign rd_rst = (~rd_fsync_3d && rd_fsync_2d) | (~hsst_rstn);    ////一帧写之前，rd_rst拉高，rd_fsync拉高

    reg rd_pulse;
    always @(posedge wr_clk)
    begin
        if(x_cnt > 12'd1260  & wr_enable)    //此处减去H_NUM中的5个像素，是为了预留一些保护时间，避免出现数据读取不完整的问题
            rd_pulse <= 1'b1;
        else
            rd_pulse <= 1'b0; 
    end 

    reg rd_pulse_1d,rd_pulse_2d,rd_pulse_3d;
    always @(posedge rd_clk)
    begin 
        rd_pulse_1d <= rd_pulse;
        rd_pulse_2d <= rd_pulse_1d;
        rd_pulse_3d <= rd_pulse_2d;
    end 
    
    wire rd_trig; //1280像素读取请求
    assign rd_trig = ~rd_pulse_3d && rd_pulse_2d;    //rd_pulse边沿触发rd_trig


    reg [11:0] tx_pix_cnt = 0 ; 
    always @(posedge rd_clk)  begin
        if(rd_trig) 
            tx_pix_cnt <= 12'd0;
        else if(rd_en)
            tx_pix_cnt <= tx_pix_cnt + 1'b1;
        else
            tx_pix_cnt <= tx_pix_cnt;
    end

    reg rd_en = 0;
    reg rd_en_1d;
    always @(posedge rd_clk)  begin
        if(rd_trig)
            rd_en <= 1'b1;
        else if(tx_pix_cnt == 12'd1280)
            rd_en <= 1'b0;
        else
            rd_en <= rd_en;
    end

    always @(posedge rd_clk)  begin
        rd_en_1d <= rd_en;
    end

    assign i_txd_2 =  vs_in_camera_1 ? {K28_5,K28_5,K28_5,K28_5} : (rd_en_1d ? {K28_5,rd_data[15:8],K28_5,rd_data[7:0]} : {K28_5,K28_5,K28_5,K28_5});
    assign i_txk_2 =  vs_in_camera_1 ? 4'b0000 : (rd_en_1d ? 4'b1010 : 4'b1111);
    assign i_tdispsel_2                  = 4'b0;
    assign i_tdispctrl_2                 = 4'b0;
*/
//**********************  RX  ***************************
reg [15:0]  i_rgb565_hsst ;
reg de_in_hsst = 0;
reg    [31:0] o_rxd_3_d;
always @(posedge rxclk3) begin 
    o_rxd_3_d <= o_rxd_3;
end 

reg [3:0] o_rxk_3_d;
always @(posedge rxclk3) begin 
    o_rxk_3_d <= o_rxk_3;
end 


always@(posedge rxclk3)begin
    case(o_rxk_3[3:0])
        4'b1010:   i_rgb565_hsst =  {o_rxd_3_d[7:0],o_rxd_3_d[23:16]};
        4'b0101:   i_rgb565_hsst =  {o_rxd_3_d[15:8],o_rxd_3_d[31:24]};
        default:    i_rgb565_hsst = 16'hffff;
    endcase
end

always@(posedge rxclk3)begin
    if(~hsst_rstn) de_in_hsst <= 0;
    else if(((o_rxk_3 ==4'b1010)||(o_rxk_3 ==4'b0101))) de_in_hsst <= 1;
    else if( rx_line_cnt == 1279 ) de_in_hsst <= 0;
    else de_in_hsst <= de_in_hsst;
end

reg [12:0] rx_line_cnt = 0;

always@(posedge rxclk3) begin
    if(de_in_hsst) rx_line_cnt <= rx_line_cnt+1;
    else if( rx_line_cnt == 1280 ) rx_line_cnt <= 0;
    else rx_line_cnt<=rx_line_cnt;
end

reg vs_in_hsst = 1;


always @(posedge rxclk3) begin 
    vs_in_hsst <= (o_rxk_3 ==4'b0000)&& (o_rxd_3 =={K28_5,K28_5,K28_5,K28_5})&&(o_rxk_3_d ==4'b0000)&& (o_rxd_3_d =={K28_5,K28_5,K28_5,K28_5});
end 

assign pixclk_in_hsst = rxclk3;

endmodule