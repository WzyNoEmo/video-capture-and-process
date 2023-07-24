vlib  work
vmap  work
vlog  C:/pango/PDS_2016.4B2-patch1/ip/system_ip/pgs_tsmac/pgs_tsmac_eval/pgs_tsmac/../../../../../arch/vendor/pango/verilog/simulation/GTP_DRM18K.v
vlog  C:/pango/PDS_2016.4B2-patch1/ip/system_ip/pgs_tsmac/pgs_tsmac_eval/pgs_tsmac/../../../../../arch/vendor/pango/verilog/simulation/GTP_GRS.v
vlog  C:/pango/PDS_2016.4B2-patch1/ip/system_ip/pgs_tsmac/pgs_tsmac_eval/pgs_tsmac/../../../../../arch/vendor/pango/verilog/simulation/GTP_OGDDR.v
vlog  C:/pango/PDS_2016.4B2-patch1/ip/system_ip/pgs_tsmac/pgs_tsmac_eval/pgs_tsmac/../../../../../arch/vendor/pango/verilog/simulation/GTP_IGDDR.v
vlog  C:/pango/PDS_2016.4B2-patch1/ip/system_ip/pgs_tsmac/pgs_tsmac_eval/pgs_tsmac/../../../../../arch/vendor/pango/verilog/simulation/GTP_OUTBUFT.v
vlog  C:/pango/PDS_2016.4B2-patch1/ip/system_ip/pgs_tsmac/pgs_tsmac_eval/pgs_tsmac/../../../../../arch/vendor/pango/verilog/simulation/GTP_PLL.v
vlog  C:/pango/PDS_2016.4B2-patch1/ip/system_ip/pgs_tsmac/pgs_tsmac_eval/pgs_tsmac/../../../../../arch/vendor/pango/verilog/simulation/GTP_RAM16X4DP.v
vlog  -f tsmac_exam_top_sim.dgn
vlog  ../../tsmac_phy.v
vlog  ../../example_design/config_reg.v
vlog  ../../example_design/gtp_pll_wrapper.v
vlog  ../../example_design/pgm_fifo_ctrl_v1_0.v
vlog  ../../example_design/pgm_fifo_v1_1.v
vlog  ../../example_design/prefetch_fifo.v
vlog  ../../example_design/reg_fifo2.v
vlog  ../../example_design/pll_125.v
vlog  ../../example_design/tsmac_exam_top.v
vlog  ../../example_design/tsmac_exam_top_tb.v
vlog  ../../example_design/tx_sm.v
vsim -voptargs=+acc  tsmac_exam_top_tb -l vsim.log
add wave -noupdate -divider APB
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/SW1
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/pclk
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/presetn
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/pselx
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/pwrite
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/penable
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/paddr
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/pwdata
add wave -noupdate -divider RX
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/rx_clki
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/rx_dv
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/rxd
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/tsmac_rdata
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/tsmac_rvalid
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/tsmac_rlast
add wave -noupdate -divider prefetch_fifo
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/tx_clk
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/wr_en
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/data_in
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/rx_clki
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/data_out_valid
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/rd_data
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/data_out_ready
add wave -noupdate -divider TX
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/tsmac_tdata
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/tsmac_tstart
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/tsmac_tlast
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/tsmac_tpnd
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/tx_clki
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/tx_en
add wave -noupdate -radix hexadecimal /tsmac_exam_top_tb/U_tsmac_exam_top/txd
run -all
