onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider -height 25 {HSST Configure and Status}
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/i_p_refckp_0
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/i_p_refckn_0
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/i_p_refckp_1
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/i_p_refckn_1
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/P_RX_SIGDET_STATUS_0
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/P_RX_SIGDET_STATUS_1
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/P_RX_SIGDET_STATUS_2
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/P_RX_SIGDET_STATUS_3
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/P_LX_CDR_ALIGN_0
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/P_LX_CDR_ALIGN_1
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/P_LX_CDR_ALIGN_2
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/P_LX_CDR_ALIGN_3
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/P_PCS_LSM_SYNCED
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/P_PCS_RX_MCB_STATUS
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_GTP_HSST_WRAPPER/P_RX_SDN0
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_GTP_HSST_WRAPPER/P_RX_SDP0
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_GTP_HSST_WRAPPER/P_RX_SDN1
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_GTP_HSST_WRAPPER/P_RX_SDP1
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_GTP_HSST_WRAPPER/P_RX_SDN2
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_GTP_HSST_WRAPPER/P_RX_SDP2
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_GTP_HSST_WRAPPER/P_RX_SDN3
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_GTP_HSST_WRAPPER/P_RX_SDP3
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_GTP_HSST_WRAPPER/P_TX_SDN0
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_GTP_HSST_WRAPPER/P_TX_SDP0
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_GTP_HSST_WRAPPER/P_TX_SDN1
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_GTP_HSST_WRAPPER/P_TX_SDP1
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_GTP_HSST_WRAPPER/P_TX_SDN2
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_GTP_HSST_WRAPPER/P_TX_SDP2
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_GTP_HSST_WRAPPER/P_TX_SDN3
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_GTP_HSST_WRAPPER/P_TX_SDP3
add wave -noupdate -divider -height 25 {HSST Reset Sequence}
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/i_free_clk
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/i_pll_rst_0
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/i_pll_rst_1
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/o_pll_done_0
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/o_pll_done_1
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/i_tx_rate_chng_0
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/i_tx_rate_chng_1
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/i_tx_rate_chng_2
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/i_tx_rate_chng_3
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/o_txlane_done_0
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/o_txlane_done_1
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/o_txlane_done_2
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/o_txlane_done_3
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/o_tx_ckdiv_done_0
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/o_tx_ckdiv_done_1
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/o_tx_ckdiv_done_2
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/o_tx_ckdiv_done_3
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/i_rx_rate_chng_0
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/i_rx_rate_chng_1
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/i_rx_rate_chng_2
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/i_rx_rate_chng_3
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/o_rxlane_done_0
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/o_rxlane_done_1
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/o_rxlane_done_2
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/o_rxlane_done_3
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/o_rx_ckdiv_done_0
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/o_rx_ckdiv_done_1
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/o_rx_ckdiv_done_2
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST/U_IPML_HSST_RST/o_rx_ckdiv_done_3
add wave -noupdate -divider -height 25 {TX Packet Generation}
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_SRC/i_src_rstn
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_SRC/i_src_clk0
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_SRC/o_txd_0
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_SRC/o_txk_0
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_SRC/i_src_clk1
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_SRC/o_txd_1
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_SRC/o_txk_1
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_SRC/i_src_clk2
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_SRC/o_txd_2
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_SRC/o_txk_2
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_SRC/i_src_clk3
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_SRC/o_txd_3
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_SRC/o_txk_3
add wave -noupdate -divider -height 25 {RX Packet Check}
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_chk_rstn
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_chk_clk0
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rxd_0
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rxk_0
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rdisper_0
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rdecer_0
add wave -noupdate  -radix binary      /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rxd_vld_0
add wave -noupdate  -radix binary      /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rxh_0
add wave -noupdate  -radix binary      /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rxh_vld_0
add wave -noupdate  -radix binary      /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rxq_start_0
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_chk_clk1
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rxd_1
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rxk_1
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rdisper_1
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rdecer_1
add wave -noupdate  -radix binary      /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rxd_vld_1
add wave -noupdate  -radix binary      /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rxh_1
add wave -noupdate  -radix binary      /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rxh_vld_1
add wave -noupdate  -radix binary      /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rxq_start_1
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_chk_clk2
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rxd_2
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rxk_2
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rdisper_2
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rdecer_2
add wave -noupdate  -radix binary      /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rxd_vld_2
add wave -noupdate  -radix binary      /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rxh_2
add wave -noupdate  -radix binary      /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rxh_vld_2
add wave -noupdate  -radix binary      /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rxq_start_2
add wave -noupdate                     /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_chk_clk3
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rxd_3
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rxk_3
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rdisper_3
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rdecer_3
add wave -noupdate  -radix binary      /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rxd_vld_3
add wave -noupdate  -radix binary      /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rxh_3
add wave -noupdate  -radix binary      /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rxh_vld_3
add wave -noupdate  -radix binary      /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/i_rxq_start_3
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/slip_finish
add wave -noupdate  -radix hexadecimal /u_hsst_top_tb/U_INST_TB/U_DUT_TOP/U_INST_CHK/o_pl_err
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 10} {15338254000 fs} 0}
configure wave -namecolwidth 191
configure wave -valuecolwidth 156
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {39132939320 fs}  {125038398550 fs}
