-- Created by IP Generator (Version 2022.1 build 99559)
-- Instantiation Template
--
-- Insert the following codes into your VHDL file.
--   * Change the_instance_name to your own instance name.
--   * Change the net names in the port map.


COMPONENT u_pcie
  PORT (
    free_clk : IN STD_LOGIC;
    pclk : OUT STD_LOGIC;
    pclk_div2 : OUT STD_LOGIC;
    ref_clk : OUT STD_LOGIC;
    ref_clk_n : IN STD_LOGIC;
    ref_clk_p : IN STD_LOGIC;
    button_rst_n : IN STD_LOGIC;
    power_up_rst_n : IN STD_LOGIC;
    perst_n : IN STD_LOGIC;
    core_rst_n : OUT STD_LOGIC;
    smlh_link_up : OUT STD_LOGIC;
    rdlh_link_up : OUT STD_LOGIC;
    smlh_ltssm_state : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    rxn : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    rxp : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    txn : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    txp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    pcs_nearend_loop : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    pma_nearend_ploop : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    pma_nearend_sloop : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    axis_master_tvalid : OUT STD_LOGIC;
    axis_master_tready : IN STD_LOGIC;
    axis_master_tdata : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    axis_master_tkeep : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    axis_master_tlast : OUT STD_LOGIC;
    axis_master_tuser : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    axis_slave0_tready : OUT STD_LOGIC;
    axis_slave0_tvalid : IN STD_LOGIC;
    axis_slave0_tdata : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    axis_slave0_tlast : IN STD_LOGIC;
    axis_slave0_tuser : IN STD_LOGIC;
    axis_slave1_tready : OUT STD_LOGIC;
    axis_slave1_tvalid : IN STD_LOGIC;
    axis_slave1_tdata : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    axis_slave1_tlast : IN STD_LOGIC;
    axis_slave1_tuser : IN STD_LOGIC;
    axis_slave2_tready : OUT STD_LOGIC;
    axis_slave2_tvalid : IN STD_LOGIC;
    axis_slave2_tdata : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    axis_slave2_tlast : IN STD_LOGIC;
    axis_slave2_tuser : IN STD_LOGIC;
    pm_xtlh_block_tlp : OUT STD_LOGIC;
    cfg_send_cor_err_mux : OUT STD_LOGIC;
    cfg_send_nf_err_mux : OUT STD_LOGIC;
    cfg_send_f_err_mux : OUT STD_LOGIC;
    cfg_sys_err_rc : OUT STD_LOGIC;
    cfg_aer_rc_err_mux : OUT STD_LOGIC;
    radm_cpl_timeout : OUT STD_LOGIC;
    cfg_pbus_num : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    cfg_pbus_dev_num : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
  );
END COMPONENT;


the_instance_name : u_pcie
  PORT MAP (
    free_clk => free_clk,
    pclk => pclk,
    pclk_div2 => pclk_div2,
    ref_clk => ref_clk,
    ref_clk_n => ref_clk_n,
    ref_clk_p => ref_clk_p,
    button_rst_n => button_rst_n,
    power_up_rst_n => power_up_rst_n,
    perst_n => perst_n,
    core_rst_n => core_rst_n,
    smlh_link_up => smlh_link_up,
    rdlh_link_up => rdlh_link_up,
    smlh_ltssm_state => smlh_ltssm_state,
    rxn => rxn,
    rxp => rxp,
    txn => txn,
    txp => txp,
    pcs_nearend_loop => pcs_nearend_loop,
    pma_nearend_ploop => pma_nearend_ploop,
    pma_nearend_sloop => pma_nearend_sloop,
    axis_master_tvalid => axis_master_tvalid,
    axis_master_tready => axis_master_tready,
    axis_master_tdata => axis_master_tdata,
    axis_master_tkeep => axis_master_tkeep,
    axis_master_tlast => axis_master_tlast,
    axis_master_tuser => axis_master_tuser,
    axis_slave0_tready => axis_slave0_tready,
    axis_slave0_tvalid => axis_slave0_tvalid,
    axis_slave0_tdata => axis_slave0_tdata,
    axis_slave0_tlast => axis_slave0_tlast,
    axis_slave0_tuser => axis_slave0_tuser,
    axis_slave1_tready => axis_slave1_tready,
    axis_slave1_tvalid => axis_slave1_tvalid,
    axis_slave1_tdata => axis_slave1_tdata,
    axis_slave1_tlast => axis_slave1_tlast,
    axis_slave1_tuser => axis_slave1_tuser,
    axis_slave2_tready => axis_slave2_tready,
    axis_slave2_tvalid => axis_slave2_tvalid,
    axis_slave2_tdata => axis_slave2_tdata,
    axis_slave2_tlast => axis_slave2_tlast,
    axis_slave2_tuser => axis_slave2_tuser,
    pm_xtlh_block_tlp => pm_xtlh_block_tlp,
    cfg_send_cor_err_mux => cfg_send_cor_err_mux,
    cfg_send_nf_err_mux => cfg_send_nf_err_mux,
    cfg_send_f_err_mux => cfg_send_f_err_mux,
    cfg_sys_err_rc => cfg_sys_err_rc,
    cfg_aer_rc_err_mux => cfg_aer_rc_err_mux,
    radm_cpl_timeout => radm_cpl_timeout,
    cfg_pbus_num => cfg_pbus_num,
    cfg_pbus_dev_num => cfg_pbus_dev_num
  );
