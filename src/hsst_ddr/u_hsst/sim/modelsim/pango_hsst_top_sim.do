file delete -force work
vlib  work
vmap  work work
vlog -incr +define+IPML_HSST_SPEEDUP_SIM \
D:/pango/PDS_2022.1/ip/module_ip/ipml_flex_hsst/ipml_hsst_eval/ipml_hsst/../../../../../arch/vendor/pango/verilog/simulation/modelsim10.2c/hsst_e2_source_codes/*.vp\
D:/pango/PDS_2022.1/ip/module_ip/ipml_flex_hsst/ipml_hsst_eval/ipml_hsst/../../../../../arch/vendor/pango/verilog/simulation/GTP_HSST_E2.v \
-f ./pango_hsst_top_filelist.f -l vlog.log
vsim -novopt +define+IPML_HSST_SPEEDUP_SIM work.u_hsst_top_tb -l vsim.log
do pango_hsst_top_wave.do
run -all
