`timescale 1 ps / 1 ps 

module m1_test;
    parameter real CLKIN_FREQ  = 50;
    parameter DDR_TYPE   = "DDR3";        
    parameter DATA_WIDTH = "16BIT";

    parameter PLL_REFCLK_IN_PERIOD = 1000000 / CLKIN_FREQ;

    reg ex_clk_50m;
    reg rst_key;
    reg gpio_in0;
    reg gpio_in1;
    
//    reg pad_nTRST;
//    reg pad_nRST;    
//    reg pad_TCK;
//    reg pad_TMS;  
//    reg pad_TDI; 
    
    reg RX;
    
    reg spi0_miso;
    
    wire i2c0_sck;
    wire i2c0_sda;

    wire                               pad_loop_in    ;
    wire                               pad_loop_in_h  ;
    wire                               pad_rstn_ch0   ;
    wire                               pad_ddr_clk_w  ;
    wire                               pad_ddr_clkn_w ;
    wire                               pad_csn_ch0    ;
    wire [15:0]                        pad_addr_ch0   ;
    wire [16-1:0]                      pad_dq_ch0     ;
    wire [16/8-1:0]                    pad_dqs_ch0    ;
    wire [16/8-1:0]                    pad_dqsn_ch0   ;
    wire [16/8-1:0]                    pad_dm_rdqs_ch0;
    wire                               pad_cke_ch0    ;
    wire                               pad_odt_ch0    ;
    wire                               pad_rasn_ch0   ;
    wire                               pad_casn_ch0   ;
    wire                               pad_wen_ch0    ;
    wire [2:0]                         pad_ba_ch0     ;

    wire                               u1_rx_clki         ;
    wire                               u1_phy_rx_dv       ;
    wire                               u1_phy_rxd3        ;
    wire                               u1_phy_rxd2        ;
    wire                               u1_phy_rxd1        ;
    wire                               u1_phy_rxd0        ;
    wire                               u1_phy_tx_en       ;
    wire                               u1_phy_txd3        ;
    wire                               u1_phy_txd2        ;
    wire                               u1_phy_txd1        ;
    wire                               u1_phy_txd0        ;
	
    initial begin
      ex_clk_50m = 0;
      rst_key = 0;  
      #100
      rst_key = 1;       
    end
    
    always #(PLL_REFCLK_IN_PERIOD / 2) ex_clk_50m = ~ex_clk_50m;
    
//    pullup (i2c0_sck);
//    pullup (i2c0_sda);
    
    m1_soc_top uut(
    .ex_clk_50m(ex_clk_50m),
    .rst_key(rst_key),
    .gpio_in0(1),
    .gpio_in1(1),
    
//    .pad_nTRST(1),
//    .pad_nRST(1),    
//    .pad_TCK(1),
//    .pad_TMS(1),  
//    .pad_TDI(1),
    .RX(1),
    .spi0_miso(1),
//    .i2c0_sck(i2c0_sck),
//    .i2c0_sda(i2c0_sda),
    
    .pad_loop_in                            (pad_loop_in  ),
    .pad_loop_in_h                          (pad_loop_in_h  ),
    .pad_rstn_ch0                           (pad_rstn_ch0  ),
    .pad_ddr_clk_w                          (pad_ddr_clk_w  ),
    .pad_ddr_clkn_w                         (pad_ddr_clkn_w  ),
    .pad_csn_ch0                            (pad_csn_ch0  ),
    .pad_addr_ch0                           (pad_addr_ch0  ),
    .pad_dq_ch0                             (pad_dq_ch0  ),
    .pad_dqs_ch0                            (pad_dqs_ch0  ),
    .pad_dqsn_ch0                           (pad_dqsn_ch0  ),
    .pad_dm_rdqs_ch0                        (pad_dm_rdqs_ch0  ),
    .pad_cke_ch0                            (pad_cke_ch0  ),
    .pad_odt_ch0                            (pad_odt_ch0  ),
    .pad_rasn_ch0                           (pad_rasn_ch0  ),
    .pad_casn_ch0                           (pad_casn_ch0  ),
    .pad_wen_ch0                            (pad_wen_ch0  ),
    .pad_ba_ch0                             (pad_ba_ch0  ),
    .pad_loop_out                           (pad_loop_in  ),
    .pad_loop_out_h                         (pad_loop_in_h  ),
	
	.phy_rst_n                              (),//B50610 RST AK20
    .rx_clki                                (~u1_rx_clki),//PHY AL19
    .phy_rx_dv                              (u1_phy_rx_dv),//PHY AC21
    .phy_rxd0                               (u1_phy_rxd0),//    AC20
    .phy_rxd1                               (u1_phy_rxd1),//    AF22
    .phy_rxd2                               (u1_phy_rxd2),//    AE22
    .phy_rxd3                               (u1_phy_rxd3),//    AD21
                                            
    .l0_sgmii_clk_shft                      (u1_rx_clki),//PHY   AG19
    .phy_tx_en                              (u1_phy_rx_dv),//PHY AE20
    .phy_txd0                               (u1_phy_rxd0),//    AJ20
    .phy_txd1                               (u1_phy_rxd1),//    AH20
    .phy_txd2                               (u1_phy_rxd2),//    AG20
    .phy_txd3                               (u1_phy_rxd3) //    AD20
	
    );
  


    reg pad_ddr_clk_w_dly, pad_ddr_clkn_w_dly;
    
    always @ (*) begin
        pad_ddr_clk_w_dly <= #50 pad_ddr_clk_w;
        pad_ddr_clkn_w_dly <= #50 pad_ddr_clkn_w;
    end

    generate
    if ((DDR_TYPE == "DDR3")&&(DATA_WIDTH == "16BIT")) begin
    ddr3     mem_core (
    
        .rst_n                           (pad_rstn_ch0  ),
        .ck                              (pad_ddr_clk_w_dly  ),
        .ck_n                            (pad_ddr_clkn_w_dly  ),
        .cs_n                            (pad_csn_ch0  ),
    //    .addr                            (pad_addr_ch0[ADDR_BITS-1:0]  ),
        .addr                            (pad_addr_ch0  ),
        .dq                              (pad_dq_ch0  ),
        .dqs                             (pad_dqs_ch0  ),
        .dqs_n                           (pad_dqsn_ch0  ),
        .dm_tdqs                         (pad_dm_rdqs_ch0  ),
        .tdqs_n                          (  ),
        .cke                             (pad_cke_ch0  ),
        .odt                             (pad_odt_ch0  ),
        .ras_n                           (pad_rasn_ch0  ),
        .cas_n                           (pad_casn_ch0  ),
        .we_n                            (pad_wen_ch0  ),
        .ba                              (pad_ba_ch0  )
    
    );
    end
    endgenerate 

//    N25Qxxx DUT (S, C, HOLD_DQ3, DQ0, DQ1, Vcc, Vpp_W_DQ2);

    GTP_GRS GRS_INST(
        .GRS_N(1'b1)
    );

endmodule