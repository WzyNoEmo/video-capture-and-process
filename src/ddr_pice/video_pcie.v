module video_pcie(
    input                       button_rst_n    ,
    input                       perst_n         ,
    input                       free_clk        ,
    //clk and rst
    input                       ref_clk_n       ,      
    input                       ref_clk_p       ,      
    //diff signals
    input           [1:0]       rxn             ,
    input           [1:0]       rxp             ,
    output  wire    [1:0]       txn             ,
    output  wire    [1:0]       txp             ,

    //LED signals
    output  wire                smlh_link_up    ,
    output  wire                rdlh_link_up    ,

    //video signals
    input                       vsync_in,        //cmos vsync
    input                       href_in,         //cmos hsync refrence
    input                       de_in,          //data valid
    input                       pclk_in,         //cmos pxiel clock
    input   [15:0]              data_in           //cmos data

);

wire hdmi_vsync = vsync_in;
wire hdmi_hsync = href_in;
wire hdmi_en = de_in;/*synthesis PAP_MARK_DEBUG="1"*/
wire [15:0] hdmi_565 = data_in;
wire hdmi_clk = pclk_in;

//fifo-----------------------------
reg hdmi_vsync_d1 = 0;
always @(posedge hdmi_clk)
begin
    hdmi_vsync_d1 <= hdmi_vsync;
end 
wire  wr_rst = (~hdmi_vsync_d1 & hdmi_vsync);

reg hdmi_en_d1 ;
reg hdmi_en_d2 ;
reg hdmi_en_d3 ;
reg hdmi_en_d4 ;
reg hdmi_en_d5 ;
reg hdmi_en_d6 ;
reg hdmi_en_d7 ;
reg hdmi_en_d8 ;
reg [15:0] hdmi_565_d1 ;
reg [15:0] hdmi_565_d2 ;
reg [15:0] hdmi_565_d3 ;
reg [15:0] hdmi_565_d4 ;
reg [15:0] hdmi_565_d5 ;
reg [15:0] hdmi_565_d6 ;
reg [15:0] hdmi_565_d7 ;
reg [15:0] hdmi_565_d8 ;

always @(posedge hdmi_clk)
begin
    hdmi_en_d1 <= hdmi_en;
    hdmi_en_d2 <= hdmi_en_d1;
    hdmi_en_d3 <= hdmi_en_d2;
    hdmi_en_d4 <= hdmi_en_d3;
    hdmi_en_d5 <= hdmi_en_d4;
    hdmi_en_d6 <= hdmi_en_d5;
    hdmi_en_d7 <= hdmi_en_d6;
    hdmi_en_d8 <= hdmi_en_d7;
    hdmi_565_d1 <= hdmi_565;
    hdmi_565_d2 <= hdmi_565_d1;
    hdmi_565_d3 <= hdmi_565_d2;
    hdmi_565_d4 <= hdmi_565_d3;
    hdmi_565_d5 <= hdmi_565_d4;
    hdmi_565_d6 <= hdmi_565_d5;
    hdmi_565_d7 <= hdmi_565_d6;
    hdmi_565_d8 <= hdmi_565_d7;
end 

wire [12:0]wr_water_level;/*synthesis PAP_MARK_DEBUG="1"*/
wire [9:0]rd_water_level;/*synthesis PAP_MARK_DEBUG="1"*/

wire [127:0] rd_data;/*synthesis PAP_MARK_DEBUG="1"*/
wire rd_en ;/*synthesis PAP_MARK_DEBUG="1"*/
wire cpu_rd_en;/*synthesis PAP_MARK_DEBUG="1"*/

//写状态机
wire prim_wr_en = (~hdmi_en_d8) && hdmi_en;
reg prim_wr_en_d;
always@(posedge hdmi_clk)   begin
    prim_wr_en_d <= prim_wr_en;
end
wire wr_en = prim_wr_en | hdmi_en_d8;
wire [15:0] wr_data = prim_wr_en ? bag_cnt : hdmi_565_d8;

reg [15:0] bag_cnt = 0;
always @(posedge hdmi_clk) begin
    if(wr_rst) bag_cnt <= 16'b0;
    else if( (~prim_wr_en) && prim_wr_en_d ) bag_cnt <= bag_cnt + 1'b1;
    else bag_cnt <= bag_cnt;
end

//读状态机
//644 DW = 644 * 32 = 128 * 161
reg [15:0] cpu_rd_cnt = 0;/*synthesis PAP_MARK_DEBUG="1"*/

always@(posedge pclk_div2)   begin
    if(cpu_rd_en && (cpu_rd_cnt == 160)) cpu_rd_cnt <= 10'd0;
    else if(cpu_rd_en) cpu_rd_cnt <= cpu_rd_cnt + 1'b1;
    else cpu_rd_cnt <= cpu_rd_cnt;
end

reg state = 0;/*synthesis PAP_MARK_DEBUG="1"*///0:无效包，1:有效包

always@(posedge pclk_div2)   begin
    if(cpu_rd_en) begin
        if(cpu_rd_cnt == 0) begin
            if(rd_water_level < 160) state <= 0;
            else state <= 1;
        end
        else if(cpu_rd_cnt < 160) state <= state;
        else if(cpu_rd_cnt == 160) state <= 0;
    end
    else begin
        state <= state;
    end
end

assign rd_en = (cpu_rd_en && ( state || (cpu_rd_cnt == 0 && rd_water_level >= 160 ) ) );

reg rd_en_d;   //rd_data_valid
always@(posedge pclk_div2)   begin
    rd_en_d <= rd_en;
end

wire [127:0] cpu_rd_data;/*synthesis PAP_MARK_DEBUG="1"*/
wire [127:0] rd_data;
assign cpu_rd_data =  rd_en_d ? rd_data : {8{16'hffff}};

pcie_fifo u_pcie_fifo (
// 16 pix
  .wr_clk            (hdmi_clk),             // input           34Mhz 
  .wr_rst            (wr_rst),               // input           
  .wr_en             (wr_en),             // input           
  .wr_data           (wr_data),            // input [15:0]    
  .wr_full           (),         // output          
  .almost_full       (),     // output [12:0]   
  .wr_water_level    (wr_water_level),       // output   
       
// 1CLK 128wei    16pix     640DW 
  .rd_clk            (pclk_div2),             // input           100Mhz
  .rd_rst            (wr_rst),      // input           
  .rd_en             (rd_en),            // input           
  .rd_data           (rd_data),         // output [127:0]  
  .rd_empty          (),        // output          
  .almost_empty      (),    // output [9:0]    
  .rd_water_level    (rd_water_level)        // output          
);

//pcie-----------------------------------

localparam  DEVICE_TYPE   = 3'b000;//@IPC enum 3'b000,3'b001,3'b100

localparam AXIS_SLAVE_NUM = 3      ;  //@IPC enum 1 2 3


//TEST UNIT MODE SIGNALS
wire            pcie_cfg_ctrl_en        ;
wire            axis_master_tready_cfg  ;

wire            cfg_axis_slave0_tvalid  ;
wire    [127:0] cfg_axis_slave0_tdata   ;
wire            cfg_axis_slave0_tlast   ;
wire            cfg_axis_slave0_tuser   ;

//for mux
wire            axis_master_tready_mem  ;
wire            axis_master_tvalid_mem  ;
wire    [127:0] axis_master_tdata_mem   ;
wire    [3:0]   axis_master_tkeep_mem   ;
wire            axis_master_tlast_mem   ;
wire    [7:0]   axis_master_tuser_mem   ;

wire            cross_4kb_boundary      ;

wire            dma_axis_slave0_tvalid  ;
wire    [127:0] dma_axis_slave0_tdata   ;
wire            dma_axis_slave0_tlast   ;
wire            dma_axis_slave0_tuser   ;

//RESET DEBOUNCE and SYNC
wire            sync_button_rst_n       ;
wire            s_pclk_rstn             ;
wire            s_pclk_div2_rstn        ;

//********************** internal signal
//clk and rst
wire            pclk_div2               ;
wire            pclk                    ;
wire            ref_clk                 ;
wire            core_rst_n              ;
//AXIS master interface
wire            axis_master_tvalid      ;
wire            axis_master_tready      ;
wire    [127:0] axis_master_tdata       ;
wire    [3:0]   axis_master_tkeep       ;
wire            axis_master_tlast       ;
wire    [7:0]   axis_master_tuser       ;

//axis slave 0 interface
wire            axis_slave0_tready      ;
wire            axis_slave0_tvalid      ;
wire    [127:0] axis_slave0_tdata       ;
wire            axis_slave0_tlast       ;
wire            axis_slave0_tuser       ;

//axis slave 1 interface
wire            axis_slave1_tready      ;
wire            axis_slave1_tvalid      ;
wire    [127:0] axis_slave1_tdata       ;
wire            axis_slave1_tlast       ;
wire            axis_slave1_tuser       ;

//axis slave 2 interface
wire            axis_slave2_tready      ;
wire            axis_slave2_tvalid      ;
wire    [127:0] axis_slave2_tdata       ;
wire            axis_slave2_tlast       ;
wire            axis_slave2_tuser       ;

wire    [7:0]   cfg_pbus_num            ;
wire    [4:0]   cfg_pbus_dev_num        ;
wire    [2:0]   cfg_max_rd_req_size     ;
wire    [2:0]   cfg_max_payload_size    ;
wire            cfg_rcb                 ;

wire            cfg_ido_req_en          ;
wire            cfg_ido_cpl_en          ;
wire    [7:0]   xadm_ph_cdts            ;
wire    [11:0]  xadm_pd_cdts            ;
wire    [7:0]   xadm_nph_cdts           ;
wire    [11:0]  xadm_npd_cdts           ;
wire    [7:0]   xadm_cplh_cdts          ;
wire    [11:0]  xadm_cpld_cdts          ;


assign cfg_ido_req_en   =   1'b0;
assign cfg_ido_cpl_en   =   1'b0;
assign xadm_ph_cdts     =   8'b0;
assign xadm_pd_cdts     =   12'b0;
assign xadm_nph_cdts    =   8'b0;
assign xadm_npd_cdts    =   12'b0;
assign xadm_cplh_cdts   =   8'b0;
assign xadm_cpld_cdts   =   12'b0;

assign cfg_max_rd_req_size  = 3'b0;
assign cfg_max_payload_size = 3'b0;

//----------------------------------------------------------rst debounce ----------------------------------------------------------
//ASYNC RST  define IPSL_PCIE_SPEEDUP_SIM when simulation
hsst_rst_cross_sync_v1_0 #(
    `ifdef IPSL_PCIE_SPEEDUP_SIM
    .RST_CNTR_VALUE     (16'h10             )
    `else
    .RST_CNTR_VALUE     (16'hC000           )
    `endif
)
u_refclk_buttonrstn_debounce(
    .clk                (ref_clk            ),
    .rstn_in            (button_rst_n       ),
    .rstn_out           (sync_button_rst_n  )
);

hsst_rst_cross_sync_v1_0 #(
    `ifdef IPSL_PCIE_SPEEDUP_SIM
    .RST_CNTR_VALUE     (16'h10             )
    `else
    .RST_CNTR_VALUE     (16'hC000           )
    `endif
)
u_refclk_perstn_debounce(
    .clk                (ref_clk            ),
    .rstn_in            (perst_n            ),
    .rstn_out           (sync_perst_n       )
);


//----------------------------------------------------------   dma  ----------------------------------------------------------
// DMA CTRL      BASE ADDR = 0x8000
ipsl_pcie_dma #(
    .DEVICE_TYPE            (DEVICE_TYPE            ),
    .AXIS_SLAVE_NUM         (AXIS_SLAVE_NUM         )
)
u_ipsl_pcie_dma
(
    .clk                    (pclk_div2              ),  //gen1:62.5MHz,gen2:125MHz
    .rst_n                  (core_rst_n             ),
    //num
    .i_cfg_pbus_num         (cfg_pbus_num           ),  //input [7:0]
    .i_cfg_pbus_dev_num     (cfg_pbus_dev_num       ),  //input [4:0]
    .i_cfg_max_rd_req_size  (cfg_max_rd_req_size    ),  //input [2:0]
    .i_cfg_max_payload_size (cfg_max_payload_size   ),  //input [2:0]
    //**********************************************************************
    //axis master interface
    .i_axis_master_tvld     (axis_master_tvalid_mem ),
    .o_axis_master_trdy     (axis_master_tready_mem ),
    .i_axis_master_tdata    (axis_master_tdata_mem  ),
    .i_axis_master_tkeep    (axis_master_tkeep_mem  ),
    .i_axis_master_tlast    (axis_master_tlast_mem  ),
    .i_axis_master_tuser    (axis_master_tuser_mem  ),

    //**********************************************************************
    //axis_slave0 interface
    .i_axis_slave0_trdy     (axis_slave0_tready     ),
    .o_axis_slave0_tvld     (dma_axis_slave0_tvalid ),
    .o_axis_slave0_tdata    (dma_axis_slave0_tdata  ),
    .o_axis_slave0_tlast    (dma_axis_slave0_tlast  ),
    .o_axis_slave0_tuser    (dma_axis_slave0_tuser  ),
    //axis_slave1 interface
    .i_axis_slave1_trdy     (axis_slave1_tready     ),
    .o_axis_slave1_tvld     (axis_slave1_tvalid     ),
    .o_axis_slave1_tdata    (axis_slave1_tdata      ),
    .o_axis_slave1_tlast    (axis_slave1_tlast      ),
    .o_axis_slave1_tuser    (axis_slave1_tuser      ),
    //axis_slave2 interface
    .i_axis_slave2_trdy     (axis_slave2_tready     ),
    .o_axis_slave2_tvld     (axis_slave2_tvalid     ),
    .o_axis_slave2_tdata    (axis_slave2_tdata      ),
    .o_axis_slave2_tlast    (axis_slave2_tlast      ),
    .o_axis_slave2_tuser    (axis_slave2_tuser      ),
    //from pcie
    .i_cfg_ido_req_en       (cfg_ido_req_en         ),
    .i_cfg_ido_cpl_en       (cfg_ido_cpl_en         ),
    .i_xadm_ph_cdts         (xadm_ph_cdts           ),
    .i_xadm_pd_cdts         (xadm_pd_cdts           ),
    .i_xadm_nph_cdts        (xadm_nph_cdts          ),
    .i_xadm_npd_cdts        (xadm_npd_cdts          ),
    .i_xadm_cplh_cdts       (xadm_cplh_cdts         ),
    .i_xadm_cpld_cdts       (xadm_cpld_cdts         ),

    .cpu_rd_data(cpu_rd_data),
    .cpu_rd_en(cpu_rd_en)
);


        assign axis_slave0_tvalid      = dma_axis_slave0_tvalid;
        assign axis_slave0_tlast       = dma_axis_slave0_tlast;
        assign axis_slave0_tuser       = dma_axis_slave0_tuser;
        assign axis_slave0_tdata       = dma_axis_slave0_tdata;

        assign axis_master_tvalid_mem  = axis_master_tvalid;
        assign axis_master_tdata_mem   = axis_master_tdata;
        assign axis_master_tkeep_mem   = axis_master_tkeep;
        assign axis_master_tlast_mem   = axis_master_tlast;
        assign axis_master_tuser_mem   = axis_master_tuser;
        
        assign axis_master_tready      = axis_master_tready_mem;

//----------------------------------------------------------   pcie wrap  ----------------------------------------------------------
u_pcie u_pcie (

  .free_clk(free_clk),                            // input
  .pclk(),                                    // output
  .pclk_div2(pclk_div2),                          // output
  .ref_clk(ref_clk),                              // output
  .ref_clk_n(ref_clk_n),                          // input
  .ref_clk_p(ref_clk_p),                          // input

  .button_rst_n(sync_button_rst_n),                    // input
  .power_up_rst_n(sync_perst_n),                // input
  .perst_n(sync_perst_n),                              // input
  .core_rst_n(core_rst_n),                        // output

  .smlh_link_up(smlh_link_up),                    // output
  .rdlh_link_up(rdlh_link_up),                    // output
  .smlh_ltssm_state(),            // output [4:0]

  .rxn(rxn),                                      // input [1:0]
  .rxp(rxp),                                      // input [1:0]
  .txn(txn),                                      // output [1:0]
  .txp(txp),                                      // output [1:0]

  .pcs_nearend_loop({2{1'b0}}),            // input [1:0]
  .pma_nearend_ploop({2{1'b0}}),          // input [1:0]
  .pma_nearend_sloop({2{1'b0}}),          // input [1:0]

  .axis_master_tvalid(axis_master_tvalid),        // output
  .axis_master_tready(axis_master_tready),        // input
  .axis_master_tdata(axis_master_tdata),          // output [127:0]
  .axis_master_tkeep(axis_master_tkeep),          // output [3:0]
  .axis_master_tlast(axis_master_tlast),          // output
  .axis_master_tuser(axis_master_tuser),          // output [7:0]

  .axis_slave0_tready(axis_slave0_tready),        // output
  .axis_slave0_tvalid(axis_slave0_tvalid),        // input
  .axis_slave0_tdata(axis_slave0_tdata),          // input [127:0]
  .axis_slave0_tlast(axis_slave0_tlast),          // input
  .axis_slave0_tuser(axis_slave0_tuser),          // input

  .axis_slave1_tready(axis_slave1_tready),        // output
  .axis_slave1_tvalid(axis_slave1_tvalid),        // input
  .axis_slave1_tdata(axis_slave1_tdata),          // input [127:0]
  .axis_slave1_tlast(axis_slave1_tlast),          // input
  .axis_slave1_tuser(axis_slave1_tuser),          // input

  .axis_slave2_tready(axis_slave2_tready),        // output
  .axis_slave2_tvalid(axis_slave2_tvalid),        // input
  .axis_slave2_tdata(axis_slave2_tdata),          // input [127:0]
  .axis_slave2_tlast(axis_slave2_tlast),          // input
  .axis_slave2_tuser(axis_slave2_tuser),          // input

  .pm_xtlh_block_tlp(),          // output
  .cfg_send_cor_err_mux(),    // output
  .cfg_send_nf_err_mux(),      // output
  .cfg_send_f_err_mux(),        // output
  .cfg_sys_err_rc(),                // output
  .cfg_aer_rc_err_mux(),        // output
  .radm_cpl_timeout(),            // output

  .cfg_pbus_num(cfg_pbus_num),                    // output [7:0]
  .cfg_pbus_dev_num(cfg_pbus_dev_num)             // output [4:0] 
);

endmodule