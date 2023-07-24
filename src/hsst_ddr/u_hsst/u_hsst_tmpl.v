// Created by IP Generator (Version 2022.1 build 99559)
// Instantiation Template
//
// Insert the following codes into your Verilog file.
//   * Change the_instance_name to your own instance name.
//   * Change the signal names in the port associations


u_hsst the_instance_name (
  .i_free_clk(i_free_clk),                        // input
  .i_pll_rst_0(i_pll_rst_0),                      // input
  .i_wtchdg_clr_0(i_wtchdg_clr_0),                // input
  .o_wtchdg_st_0(o_wtchdg_st_0),                  // output [1:0]
  .o_pll_done_0(o_pll_done_0),                    // output
  .o_txlane_done_2(o_txlane_done_2),              // output
  .o_txlane_done_3(o_txlane_done_3),              // output
  .o_rxlane_done_2(o_rxlane_done_2),              // output
  .o_rxlane_done_3(o_rxlane_done_3),              // output
  .i_p_refckn_0(i_p_refckn_0),                    // input
  .i_p_refckp_0(i_p_refckp_0),                    // input
  .o_p_clk2core_tx_2(o_p_clk2core_tx_2),          // output
  .i_p_tx2_clk_fr_core(i_p_tx2_clk_fr_core),      // input
  .i_p_tx3_clk_fr_core(i_p_tx3_clk_fr_core),      // input
  .i_p_rx2_clk_fr_core(i_p_rx2_clk_fr_core),      // input
  .i_p_rx3_clk_fr_core(i_p_rx3_clk_fr_core),      // input
  .o_p_pll_lock_0(o_p_pll_lock_0),                // output
  .o_p_rx_sigdet_sta_2(o_p_rx_sigdet_sta_2),      // output
  .o_p_rx_sigdet_sta_3(o_p_rx_sigdet_sta_3),      // output
  .o_p_lx_cdr_align_2(o_p_lx_cdr_align_2),        // output
  .o_p_lx_cdr_align_3(o_p_lx_cdr_align_3),        // output
  .o_p_pcs_lsm_synced_2(o_p_pcs_lsm_synced_2),    // output
  .o_p_pcs_lsm_synced_3(o_p_pcs_lsm_synced_3),    // output
  .i_p_l2rxn(i_p_l2rxn),                          // input
  .i_p_l2rxp(i_p_l2rxp),                          // input
  .i_p_l3rxn(i_p_l3rxn),                          // input
  .i_p_l3rxp(i_p_l3rxp),                          // input
  .o_p_l2txn(o_p_l2txn),                          // output
  .o_p_l2txp(o_p_l2txp),                          // output
  .o_p_l3txn(o_p_l3txn),                          // output
  .o_p_l3txp(o_p_l3txp),                          // output
  .i_txd_2(i_txd_2),                              // input [31:0]
  .i_tdispsel_2(i_tdispsel_2),                    // input [3:0]
  .i_tdispctrl_2(i_tdispctrl_2),                  // input [3:0]
  .i_txk_2(i_txk_2),                              // input [3:0]
  .i_txd_3(i_txd_3),                              // input [31:0]
  .i_tdispsel_3(i_tdispsel_3),                    // input [3:0]
  .i_tdispctrl_3(i_tdispctrl_3),                  // input [3:0]
  .i_txk_3(i_txk_3),                              // input [3:0]
  .o_rxstatus_2(o_rxstatus_2),                    // output [2:0]
  .o_rxd_2(o_rxd_2),                              // output [31:0]
  .o_rdisper_2(o_rdisper_2),                      // output [3:0]
  .o_rdecer_2(o_rdecer_2),                        // output [3:0]
  .o_rxk_2(o_rxk_2),                              // output [3:0]
  .o_rxstatus_3(o_rxstatus_3),                    // output [2:0]
  .o_rxd_3(o_rxd_3),                              // output [31:0]
  .o_rdisper_3(o_rdisper_3),                      // output [3:0]
  .o_rdecer_3(o_rdecer_3),                        // output [3:0]
  .o_rxk_3(o_rxk_3)                               // output [3:0]
);
