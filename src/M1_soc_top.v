module m1_soc_top #(
	parameter MEM_ROW_ADDR_WIDTH   = 15         ,
	parameter MEM_COL_ADDR_WIDTH   = 10         ,
	parameter MEM_BADDR_WIDTH      = 3          ,
	parameter MEM_DQ_WIDTH         =  16        ,
	parameter MEM_DQS_WIDTH        =  16/8      ,
    parameter CTRL_ADDR_WIDTH = MEM_ROW_ADDR_WIDTH + MEM_BADDR_WIDTH + MEM_COL_ADDR_WIDTH,//28
    parameter TH_1S = 27'd33000000
)(
	input             sys_clk,
	input             rst_key,

    input             gpio_in0,
    input             gpio_in1,
    output  [7:0]     LED,

    output            spi0_clk,
    output            spi0_cs,
    output            spi0_mosi,
    input             spi0_miso,
    inout             i2c0_sck,
    inout             i2c0_sda,

	//DDR
    output                               mem_rst_n                 ,
    output                               mem_ck                    ,
    output                               mem_ck_n                  ,
    output                               mem_cke                   ,
    output                               mem_cs_n                  ,
    output                               mem_ras_n                 ,
    output                               mem_cas_n                 ,
    output                               mem_we_n                  ,
    output                               mem_odt                   ,
    output      [MEM_ROW_ADDR_WIDTH-1:0] mem_a                     ,
    output      [MEM_BADDR_WIDTH-1:0]    mem_ba                    ,
    inout       [MEM_DQ_WIDTH/8-1:0]     mem_dqs                   ,
    inout       [MEM_DQ_WIDTH/8-1:0]     mem_dqs_n                 ,
    inout       [MEM_DQ_WIDTH-1:0]       mem_dq                    ,
    output      [MEM_DQ_WIDTH/8-1:0]     mem_dm                    ,
 

//    
    input             rx_clki,          
    input             phy_rx_dv,        
    input             phy_rxd0,         
    input             phy_rxd1,         
    input             phy_rxd2,         
    input             phy_rxd3,         

    output            l0_sgmii_clk_shft,    //tx_clk
    output            phy_tx_en,        
    output            phy_txd0,         
    output            phy_txd1,         
    output            phy_txd2,         
    output            phy_txd3,

//camera
    //coms1	
    inout                                cmos1_scl            ,//cmos1 i2c 
    inout                                cmos1_sda            ,//cmos1 i2c 
    input                                cmos1_vsync          ,//cmos1 vsync
    input                                cmos1_href           ,//cmos1 hsync refrence,data valid
    input                                cmos1_pclk           ,//cmos1 pxiel clock
    input   [7:0]                        cmos1_data           ,//cmos1 data
    output                               cmos1_reset          ,//cmos1 reset
    //coms2
    inout                                cmos2_scl            ,//cmos2 i2c 
    inout                                cmos2_sda            ,//cmos2 i2c 
    input                                cmos2_vsync          ,//cmos2 vsync
    input                                cmos2_href           ,//cmos2 hsync refrence,data valid
    input                                cmos2_pclk           ,//cmos2 pxiel clock
    input   [7:0]                        cmos2_data           ,//cmos2 data
    output                               cmos2_reset          ,//cmos2 reset

//HDMI_OUT
    output                                rstn_out                  ,

    output                                iic_tx_scl                ,
    inout                                 iic_tx_sda                ,
    output                                pixclk_out                ,
    output                                vs_out                    , 
    output                                hs_out                    , 
    output                                de_out                    ,
    output     [7:0]                      r_out                     , 
    output     [7:0]                      g_out                     , 
    output     [7:0]                      b_out                     ,

//HDMI_IN
    output                                iic_scl,//7200
    inout                                 iic_sda, //7200
    input                                 pixclk_in,                            
    input                                 vs_in, 
    input                                 hs_in, 
    input                                 de_in,
    input      [7:0]                      r_in, 
    input      [7:0]                      g_in, 
    input      [7:0]                      b_in ,

//hsst
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

    output[1:0]    tx_disable                    ,

//UART
    input         uart_rx,
    output        uart_tx

//pcie
   /* input                       perst_n         ,
    input                       ref_clk_n       ,      
    input                       ref_clk_p       , 
    input           [1:0]       rxn             ,
    input           [1:0]       rxp             ,
    output  wire    [1:0]       txn             ,
    output  wire    [1:0]       txp             */


); 

    `ifdef SIMULATION
        `include "../bench/src/m1_core/cm1_option_defs.v"
    `else
        `include "m1_core/cm1_option_defs.v"
    `endif

    wire              HCLK;           // AHB Memory clock
    wire              HREADYOUT;      // AHB Memory ready
    wire              HRESP;          // AHB Memory response
    wire   [31:0]     HRDATA;         // AHB Memory read data bus
    wire              HSEL;           // AHB Memory select
    wire   [1:0]      HTRANS;         // AHB Memory transaction type
    wire   [2:0]      HBURST;         // AHB Memory burst information
    wire   [3:0]      HPROT;          // AHB Memory protection control
    wire   [2:0]      HSIZE;          // AHB Memory transfer size
    wire              HWRITE;         // AHB Memory transfer direction
    wire              HMASTLOCK;      // AHB Memory locked transfer
    wire   [31:0]     HADDR;          // AHB Memory transfer address
    wire   [31:0]     HWDATA;         // AHB Memory write data bus
    wire              HREADY;         // AHB Memory bus ready   
    wire   [31:0]     HRDATAmux;                 

    wire   [11:0]     PADDR;   
    wire              PWRITE;  
    wire   [31:0]     PWDATA;  
    wire              PENABLE; 
    wire              PSEL;    
    wire   [31:0]     PRDATA;  
    wire              PREADY; 
    wire              PSLVERR;

    wire   [15:0]     p0_in;          // GPIO 0 inputs
    wire   [15:0]     p0_out;         // GPIO 0 outputs
    wire   [15:0]     p0_outen;       // GPIO 0 output enables
    wire   [15:0]     p0_altfunc;     // GPIO 0 alternate function (pin mux)
                     
    wire              watchdog_reset;
                     
    wire   [31:0]     wdata;
    wire   [21:0]     waddr;
    wire              w_en;
    wire   [31:0]     rdata;
    wire   [21:0]     raddr;
    wire              r_en;
    wire   [15:0]     mem_cs;
              
    wire   [7:0]      tsmac_tdata;
    wire              tsmac_tstart;
    wire              tsmac_tpnd;
    wire              tsmac_tlast;

    wire   [7:0]      tsmac_rdata;
    wire              tsmac_rvalid;
    wire              tsmac_rlast;
       
    //AXI WRITE
    wire              pll_pclk;
    wire              ddr_pll_lock;
    wire              ddrphy_rst_done;
    wire              ddrc_init_done;
                      
    wire              aclk_mux;
    wire   [31:0]     awaddr_mux;
    wire   [7:0]      awlen_mux;
    wire              awvalid_mux;
    wire              awready_mux;
    wire   [127:0]    wdata_mux;
    wire   [15:0]     wstrb_mux;
    wire              wlast_mux;
    wire              wvalid_mux;
    wire              wready_mux;
                      
    //AXI RAD         
    wire   [31:0]     araddr_mux;
    wire   [7:0]      arlen_mux;
    wire              arvalid_mux;
    wire              arready_mux;
    wire   [127:0]    rdata_mux;
    wire              rlast_mux;
    wire              rvalid_mux;
    wire              rready_mux;

    wire              aclk_1;
    wire   [31:0]     awaddr_1;
    wire              awvalid_1;
    wire              awready_1;
    wire   [63:0]     wdata_1;
    wire              wlast_1;
    wire              wvalid_1;
    wire              wready_1;
                      
    //AXI RAD         
    wire   [31:0]     araddr_1;
    wire              arvalid_1;
    wire              arready_1;
    wire   [63:0]     rdata_1;
    wire              rlast_1;
    wire              rvalid_1;
    wire              rready_1;
   
    wire              tsmac_phy_pselx;
    wire              tsmac_phy_pwrite;
    wire              tsmac_phy_penable;
    wire   [7:0]      tsmac_phy_paddr;
    wire   [31:0]     tsmac_phy_pwdata;
                      
    wire              tsmac_phy_mdo;
    wire              tsmac_phy_mdoen;
    wire              tsmac_phy_mdi;
    wire              tsmac_phy_mdio;
                      
    wire   [3:0]      phy_txd;
    wire   [3:0]      phy_rxd;

    wire   [7:0]      m1_tdata;
    wire              m1_tstart;
    wire              m1_tpnd;
    wire              m1_tlast;

    wire   [9:0]      ethernet_fifo_rd_data;
    wire   [9:0]      tsmac_fifo_wr_data;

    wire              HREADYOUT_udp;
    wire              HRESP_udp;
    wire   [31:0]     HRDATA_udp;
    wire   [7:0]      udp_tdata;
    wire              udp_tstart;
    wire              udp_tpnd;
    wire              udp_tlast;
    wire              udp_cs;

    //axi bus   
    wire [CTRL_ADDR_WIDTH-1:0]  axi_awaddr                 ;
    wire                        axi_awuser_ap              ;
    wire [3:0]                  axi_awuser_id              ;
    wire [3:0]                  axi_awlen                  ;
    wire                        axi_awready                ;/*synthesis PAP_MARK_DEBUG="1"*/
    wire                        axi_awvalid                ;/*synthesis PAP_MARK_DEBUG="1"*/
    wire [MEM_DQ_WIDTH*8-1:0]   axi_wdata                  ;
    wire [MEM_DQ_WIDTH*8/8-1:0] axi_wstrb                  ;
    wire                        axi_wready                 ;/*synthesis PAP_MARK_DEBUG="1"*/
    wire [3:0]                  axi_wusero_id              ;
    wire                        axi_wusero_last            ;
    wire [CTRL_ADDR_WIDTH-1:0]  axi_araddr                 ;
    wire                        axi_aruser_ap              ;
    wire [3:0]                  axi_aruser_id              ;
    wire [3:0]                  axi_arlen                  ;
    wire                        axi_arready                ;/*synthesis PAP_MARK_DEBUG="1"*/
    wire                        axi_arvalid                ;/*synthesis PAP_MARK_DEBUG="1"*/
    wire [MEM_DQ_WIDTH*8-1:0]   axi_rdata                   /* synthesis syn_keep = 1 */;
    wire                        axi_rvalid                  /* synthesis syn_keep = 1 */;
    wire [3:0]                  axi_rid                    ;
    wire                        axi_rlast                  ;
    reg  [26:0]                 cnt                        ;
    reg  [15:0]                 cnt_1                      ;

    wire              ddr_init_done;
    wire              core_clk;

    reg  [15:0]                 rstn_1ms            ;
    wire                        rstn_out            ;    
    wire                        eth_init_done       ;    
    wire [15:0]                 data_565_out        ;                     

//CLK----------------------------------------------------------------

    pll u_pll (
        .clkin1   (  sys_clk    ),//50MHz
        .clkout0  (  HCLK       ),//125M
        .clkout1  (  cfg_clk    ),//10MHz
        .clkout2  (  clk_25M    ),//25M
        .clkout3  (  pix_clk    ),//74.25M 720P60
        .pll_lock (  pll_lock     )
    );


//Soft Reset---------------------------------------------------------  
    wire   DBGRESETn;
    wire   SYSRESETREQ;
    wire   SYSRESETn;

    rst_gen u_rst_gen(
        .HCLK                 (HCLK),           // input
        .pad_nRST             (1'b1),       // input  
        .ddrc_init_done       (ddr_init_done), // input
        .watchdog_reset       (watchdog_reset), // input
        .SYSRESETREQ          (SYSRESETREQ),    // input
    
        .DBGRESETn            (DBGRESETn),      // output
        .SYSRESETn            (SYSRESETn)       // output
    );

//Hard Reset--------------------------------------------------------- 
    always @(posedge cfg_clk)
    begin
    	if(!pll_lock)
    	    rstn_1ms <= 16'd0;
    	else
    	begin
    		if(rstn_1ms == 16'h2710)
    		    rstn_1ms <= rstn_1ms;
    		else
    		    rstn_1ms <= rstn_1ms + 1'b1;
    	end
    end
    
    assign rstn_out = (rstn_1ms == 16'h2710);

//LED------------------------------------------------------------ 
    reg     heart_beat_led;
    wire    [1:0] cmos_init_done;

    assign LED[0]      = heart_beat_led ;    //pcie
    assign LED[1]      = o_rxlane_done_3;    //optical fibal
    assign LED[2]      = ddr_init_done;     //ddr
    //assign LED[3]      = smlh_link_up & rdlh_link_up ;    //pcie
    assign LED[5:4]    = cmos_init_done;    //cmos
    assign LED[6]      = init_over_tx;      //hdmi
    assign LED[7]      = eth_init_done;     //ethernet
    //心跳灯     
    always@(posedge core_clk) begin
        if (!ddr_init_done)
            cnt <= 27'd0;
        else if ( cnt >= TH_1S )
            cnt <= 27'd0;
        else
            cnt <= cnt + 27'd1;
     end

     always @(posedge core_clk)
        begin
        if (!ddr_init_done)
            heart_beat_led <= 1'd1;
        else if ( cnt >= TH_1S )
            heart_beat_led <= ~heart_beat_led;
    end

//M1 CORE------------------------------------------------------------ 
    assign gpio_out = p0_outen[15:8] & p0_out[15:8];

    wire [7:0] spi0_cs_0;
    assign spi0_cs = spi0_cs_0[0];

    wire scl_pad_i;
    wire scl_pad_o;
    wire sda_pad_i;
    wire sda_pad_o;

    assign i2c0_sck  = scl_pad_o ? 1'bz : 1'b0;
    assign i2c0_sda  = sda_pad_o ? 1'bz : 1'b0;
    assign scl_pad_i = i2c0_sck;
    assign sda_pad_i = i2c0_sda;

    assign m1_tpnd = tsmac_tpnd && ~udp_cs;
/*
    //M1 core
    integration_kit_dbg u_integration_kit_dbg(   
		 // Inputs
        .HCLK              (HCLK),           // System Clock
        .SYSRESETn         (SYSRESETn),      // System Reset
        .DBGRESETn         (DBGRESETn),      // Debug Reset
      
        .nTRST             (pad_nTRST),      // JTAG reset
        .SWCLKTCK          (pad_TCK),        // Serial wire and JTAG clock
        .SWDITMS           (pad_TMS),        // SW Data / JTAG Test Mode Select
        .TDI               (pad_TDI),        // JTAG data input
        
        .EDBGRQ            (1'b0),           // Debug request
        .DBGRESTART        (1'b0),           // Restart from halt request

        .SYSRESETREQ       (SYSRESETREQ),    // Cortex-M1 SYSRESET request
        .LOCKUP            (),               // Cortex-M1 lockup
        .HALTED            (),               // Cortex-M1 halted
        .DBGRESTARTED      (),               // Restart from halt acknowledge
        
        .JTAGNSW           (),               // JTAG = 1, serial wire = 0
        .JTAGTOP           (),               // state controller indicator
        .TDO               (pad_TDO),        // JTAG data output
        .nTDOEN            (),               // JTAG data out enable
        .SWDO              (),               // Serial wire data out
        .SWDOEN            (),               // Serial data output enable

        //AHB AHB[31:28] = 4'h7,4'h8,4'h9    AHB[27:0] = 28'h000_0000 ~ 28'hfff_ffff
        .HSEL              (HSEL),           // AHB Memory select
        .HTRANS            (HTRANS),         // AHB Memory transaction type
        .HBURST            (HBURST),         // AHB Memory burst information
        .HPROT             (HPROT),          // AHB Memory protection control
        .HSIZE             (HSIZE),          // AHB Memory transfer size
        .HWRITE            (HWRITE),         // AHB Memory transfer direction
        .HMASTLOCK         (HMASTLOCK),      // AHB Memory locked transfer
        .HADDR             (HADDR),          // AHB Memory transfer address
        .HWDATA            (HWDATA),         // AHB Memory write data bus
        .HREADY            (HREADY),         // AHB Memory bus ready
        .HREADYOUT         (HREADYOUT_udp),  // AHB Memory ready
        .HRESP             (HRESP_udp),      // AHB Memory response
        .HRDATA            (HRDATA_udp),     // AHB Memory read data bus  
        .HRDATAmux         (HRDATAmux),

        //APB AHB[11:0]    AHB[31:0] = 32'h5000c000 ~ 32'h5000cfff
        .PADDR             (PADDR),   
        .PWRITE            (PWRITE),    
        .PWDATA            (PWDATA),    
        .PENABLE           (PENABLE),   
        .PSEL              (PSEL),      
        .PRDATA            (PRDATA),   
        .PREADY            (1'b1),  
        .PSLVERR           (1'b0),   

        //Periphral
        //GPIO
        .p0_out            (p0_out),         // GPIO 0 outputs
        .p0_outen          (p0_outen),       // GPIO 0 output enables
        .p0_altfunc        (),               // GPIO 0 alternate function (pin mux)
        .p0_in             ({{14{1'b0}}, gpio_in1, gpio_in0}),          // GPIO 0 inputs

        //UART0
        .RX0               (RX),
        .TX0               (TX),

        //UART1
        .RX1               (),
        .TX1               (),

        //WATCHDOG
        .watchdog_reset    (watchdog_reset),

        //SPI
        .spi0_clk          (spi0_clk),
        .spi0_cs           (spi0_cs_0),
        .spi0_mosi         (spi0_mosi),
        .spi0_miso         (spi0_miso),

        //I2C 
        .scl_pad_i         (scl_pad_i),
        .scl_pad_o         (scl_pad_o),
        .sda_pad_i         (sda_pad_i),
        .sda_pad_o         (sda_pad_o),

        //MEM        
        .wdata             (wdata),
        .waddr             (waddr),
        .w_en              (w_en),
        .rdata             (rdata),
        .raddr             (raddr),
        .r_en              (r_en),
        .mem_cs            (mem_cs),

        //TSMAC
        .tsmac_tdata       (m1_tdata),
        .tsmac_tstart      (m1_tstart),
        .tsmac_tpnd        (m1_tpnd),
        .tsmac_tlast       (m1_tlast),

        .tsmac_rdata       (ethernet_fifo_rd_data[7:0]),
        .tsmac_rvalid      (ethernet_fifo_rd_data[8]),
        .tsmac_rlast       (ethernet_fifo_rd_data[9]),

        //DDR    
        .aclk_mux          (core_clk),              
        .awaddr_mux        (axi_awaddr),      
        .awlen_mux         (axi_awlen),            
        .awvalid_mux       (axi_awvalid),     
        .awready_mux       (axi_awready),        
        .wdata_mux         (axi_wdata),       
        .wstrb_mux         (axi_wstrb),       
        .wlast_mux         (wlast_mux),       
        .wvalid_mux        (wvalid_mux),      
        .wready_mux        (axi_wready),      
       
        .araddr_mux        (axi_araddr),      
        .arlen_mux         (axi_arlen),           
        .arvalid_mux       (axi_arvalid),     
        .arready_mux       (axi_arready),            
        .rdata_mux         (axi_rdata),            
        .rlast_mux         (axi_rlast),       
        .rvalid_mux        (axi_rvalid),      
        .rready_mux        (rready_mux)      
    );   
*/

//MEM-------------------------------------------------------------------
    wire a_wr_en;
    assign a_wr_en = w_en | ~r_en;

    wire [31:0] rdata0;
    assign rdata = rdata0;

//DDR------------------------------------------------------------------
DDR3_50H u_DDR3_50H (
        .ref_clk                   (sys_clk            ),
        .resetn                    (rstn_out           ),// input
        .ddr_init_done             (ddr_init_done      ),// output
        .ddrphy_clkin              (core_clk           ),// output    100MHZ
        .pll_lock                  (ddrc_pll_lock           ),// output

        .axi_awaddr                (axi_awaddr         ),// input [27:0]
        .axi_awuser_ap             (1'b0               ),// input
        .axi_awuser_id             (axi_awuser_id      ),// input [3:0]
        .axi_awlen                 (axi_awlen          ),// input [3:0]
        .axi_awready               (axi_awready        ),// output
        .axi_awvalid               (axi_awvalid        ),// input
        .axi_wdata                 (axi_wdata          ),
        .axi_wstrb                 (axi_wstrb          ),// input [31:0]
        .axi_wready                (axi_wready         ),// output
        .axi_wusero_id             (                   ),// output [3:0]
        .axi_wusero_last           (axi_wusero_last    ),// output
        .axi_araddr                (axi_araddr         ),// input [27:0]
        .axi_aruser_ap             (1'b0               ),// input
        .axi_aruser_id             (axi_aruser_id      ),// input [3:0]
        .axi_arlen                 (axi_arlen          ),// input [3:0]
        .axi_arready               (axi_arready        ),// output
        .axi_arvalid               (axi_arvalid        ),// input
        .axi_rdata                 (axi_rdata          ),// output [255:0]
        .axi_rid                   (axi_rid            ),// output [3:0]
        .axi_rlast                 (axi_rlast          ),// output
        .axi_rvalid                (axi_rvalid         ),// output

        .apb_clk                   (1'b0               ),// input
        .apb_rst_n                 (1'b1               ),// input
        .apb_sel                   (1'b0               ),// input
        .apb_enable                (1'b0               ),// input
        .apb_addr                  (8'b0               ),// input [7:0]
        .apb_write                 (1'b0               ),// input
        .apb_ready                 (                   ), // output
        .apb_wdata                 (16'b0              ),// input [15:0]
        .apb_rdata                 (                   ),// output [15:0]
        .apb_int                   (                   ),// output

        .mem_rst_n                 (mem_rst_n          ),// output
        .mem_ck                    (mem_ck             ),// output
        .mem_ck_n                  (mem_ck_n           ),// output
        .mem_cke                   (mem_cke            ),// output
        .mem_cs_n                  (mem_cs_n           ),// output
        .mem_ras_n                 (mem_ras_n          ),// output
        .mem_cas_n                 (mem_cas_n          ),// output
        .mem_we_n                  (mem_we_n           ),// output
        .mem_odt                   (mem_odt            ),// output
        .mem_a                     (mem_a              ),// output [14:0]
        .mem_ba                    (mem_ba             ),// output [2:0]
        .mem_dqs                   (mem_dqs            ),// inout [3:0]
        .mem_dqs_n                 (mem_dqs_n          ),// inout [3:0]
        .mem_dq                    (mem_dq             ),// inout [31:0]
        .mem_dm                    (mem_dm             ),// output [3:0]
        //debug
        .debug_data                (                   ),// output [135:0]
        .debug_slice_state         (                   ),// output [51:0]
        .debug_calib_ctrl          (                   ),// output [21:0]
        .ck_dly_set_bin            (                   ),// output [7:0]
        .force_ck_dly_en           (1'b0               ),// input
        .force_ck_dly_set_bin      (8'h05              ),// input [7:0]
        .dll_step                  (                   ),// output [7:0]
        .dll_lock                  (                   ),// output
        .init_read_clk_ctrl        (2'b0               ),// input [1:0]
        .init_slip_step            (4'b0               ),// input [3:0]
        .force_read_clk_ctrl       (1'b0               ),// input
        .ddrphy_gate_update_en     (1'b0               ),// input
        .update_com_val_err_flag   (                   ),// output [3:0]
        .rd_fake_stop              (1'b0               ) // input
);


//camera---------------------------------------------------------------------------
    wire     [15:0] i_rgb565_camera;
    wire            de_in_camera;
    wire            vs_in_camera;
    wire            pixclk_in_camera;
    wire     [15:0] i_rgb565_camera_1;
    wire            de_in_camera_1;
    wire            vs_in_camera_1;
    wire            pixclk_in_camera_1;

ov5640_ddr    ov5640_ddr(
    .sys_clk(sys_clk)              ,//50Mhz
    .clk_25M(clk_25M)              ,
    .cmos_init_done(cmos_init_done)       ,//OV5640寄存器初始化完成

    //coms1	
    .cmos1_scl(cmos1_scl)            ,//cmos1 i2c 
    .cmos1_sda(cmos1_sda)            ,//cmos1 i2c 
    .cmos1_vsync(cmos1_vsync)          ,//cmos1 vsync
    .cmos1_href(cmos1_href)           ,//cmos1 hsync refrence,data valid
    .cmos1_pclk(cmos1_pclk)           ,//cmos1 pxiel clock
    .cmos1_data(cmos1_data)           ,//cmos1 data
    .cmos1_reset(cmos1_reset)          ,//cmos1 reset

    //coms2
    .cmos2_scl(cmos2_scl)           ,//cmos2 i2c 
    .cmos2_sda(cmos2_sda)            ,//cmos2 i2c 
    .cmos2_vsync(cmos2_vsync)          ,//cmos2 vsync
    .cmos2_href(cmos2_href)           ,//cmos2 hsync refrence,data valid
    .cmos2_pclk(cmos2_pclk)           ,//cmos2 pxiel clock
    .cmos2_data(cmos2_data)           ,//cmos2 data
    .cmos2_reset(cmos2_reset)          ,//cmos2 reset

    //rgb接口
    .i_rgb565_camera(i_rgb565_camera)                    , 
    .de_in_camera(de_in_camera)                    , 
    .vs_in_camera(vs_in_camera)                    ,
    .pixclk_in_camera(pixclk_in_camera)            ,

    .i_rgb565_camera_1(i_rgb565_camera_1)                    , 
    .de_in_camera_1(de_in_camera_1)                    , 
    .vs_in_camera_1(vs_in_camera_1)                    ,
    .pixclk_in_camera_1(pixclk_in_camera_1)
);

//HDMI_IN--------------------------------------------------------------------------
    wire     [15:0] i_rgb565_hdmi;
    wire            de_in_hdmi;
    wire            vs_in_hdmi;
    wire            pixclk_in_hdmi;

hdmi_ddr    hdmi_ddr(
    .cfg_clk(cfg_clk)                   ,
    .rstn_out(rstn_out)                  ,  
    .init_over_tx(init_over_tx)              ,//HDMI_OUT初始化完成
    
    //hdmi
    .iic_scl(iic_scl),
    .iic_sda(iic_sda), 
    .iic_tx_scl(iic_tx_scl),
    .iic_tx_sda(iic_tx_sda), 
    .pixclk_in(pixclk_in),                            
    .vs_in(vs_in), 
    .hs_in(hs_in), 
    .de_in(de_in),
    .r_in(r_in), 
    .g_in(g_in), 
    .b_in(b_in), 
 
    //rgb接口
    .i_rgb565_hdmi(i_rgb565_hdmi)                    , 
    .de_in_hdmi(de_in_hdmi)                    , 
    .vs_in_hdmi(vs_in_hdmi)                    ,
    .pixclk_in_hdmi(pixclk_in_hdmi)
);

//hsst_ddr--------------------------------------------------------------------------
    wire     [15:0] i_rgb565_hsst;/*synthesis PAP_MARK_DEBUG="1"*/
    wire            de_in_hsst;/*synthesis PAP_MARK_DEBUG="1"*/
    wire            vs_in_hsst;/*synthesis PAP_MARK_DEBUG="1"*/
    wire            pixclk_in_hsst;/*synthesis PAP_MARK_DEBUG="1"*/

hsst_ddr    u_hsst_ddr(
    
    .i_free_clk                    (sys_clk                    ), // input          
    .rst_n                         (rst_key),         
        
    .o_txlane_done_2               (o_txlane_done_2               ), // output         
    .o_txlane_done_3               (o_txlane_done_3               ), // output         
    .o_rxlane_done_2               (o_rxlane_done_2               ), // output         
    .o_rxlane_done_3               (o_rxlane_done_3               ), // output         
    .i_p_refckn_0                  (i_p_refckn_0                  ), // input          
    .i_p_refckp_0                  (i_p_refckp_0                  ), // input 

  .i_p_l2rxn(i_p_l2rxn),                          // input
  .i_p_l2rxp(i_p_l2rxp),                          // input
  .i_p_l3rxn(i_p_l3rxn),                          // input
  .i_p_l3rxp(i_p_l3rxp),                          // input
  .o_p_l2txn(o_p_l2txn),                          // output
  .o_p_l2txp(o_p_l2txp),                          // output
  .o_p_l3txn(o_p_l3txn),                          // output
  .o_p_l3txp(o_p_l3txp),                          // output

    .tx_disable(tx_disable),


     //发送端
    .i_rgb565_camera_1(i_rgb565_camera_1)                    , 
    .de_in_camera_1(de_in_camera_1)                    , 
    .vs_in_camera_1(vs_in_camera_1)                    ,
    .pixclk_in_camera_1(pixclk_in_camera_1) ,
      //接收端
    .i_rgb565_hsst(i_rgb565_hsst)                    ,
    .de_in_hsst(de_in_hsst)                    ,
    .vs_in_hsst(vs_in_hsst)                    ,
    .pixclk_in_hsst(pixclk_in_hsst)               
);


//HDMI_OUT--------------------------------------------------------------------------
ddr_hdmi    ddr_hdmi(
    .core_clk(core_clk)                  ,
    .ddr_init_done(ddr_init_done)        ,
    .pix_clk(pix_clk)                    ,
    .uart_clk(sys_clk)                    ,

    //ddr接口
    .axi_awaddr(axi_awaddr)                ,
    .axi_awuser_id(axi_awuser_id)             ,
    .axi_awlen(axi_awlen)                 ,
    .axi_awready(axi_awready)               ,
    .axi_awvalid(axi_awvalid)               ,
    .axi_wdata(axi_wdata)                 ,
    .axi_wstrb(axi_wstrb)                 , 
    .axi_wready(axi_wready)                ,
    .axi_wusero_last(axi_wusero_last)           ,
    .axi_araddr(axi_araddr)                ,
    .axi_aruser_id(axi_aruser_id)             ,
    .axi_arlen(axi_arlen)                 ,
    .axi_arready(axi_arready)               ,
    .axi_arvalid(axi_arvalid)               ,
    .axi_rdata(axi_rdata)                 ,
    .axi_rid(axi_rid)                   ,
    .axi_rlast(axi_rlast)                ,
    .axi_rvalid(axi_rvalid)                ,

    //读入接口
    .pclk_in(pixclk_in_hsst)                    ,    //.pclk_in(pixclk_in_hdmi)  
    .vs_in(vs_in_hsst)                        ,      //.vs_in(vs_in_hdmi)  
    .de_in(de_in_hsst)                        ,      //.de_in(de_in_hdmi)  
    .i_rgb565(i_rgb565_hsst)                    ,    //.i_rgb565(i_rgb565_hdmi) 

    .pclk_in_1(pixclk_in_camera_1)                    ,    //.pclk_in(pixclk_in_hdmi)  
    .vs_in_1(vs_in_camera_1)                        ,      //.vs_in(vs_in_hdmi)  
    .de_in_1(de_in_camera_1)                        ,      //.de_in(de_in_hdmi)  
    .i_rgb565_1(i_rgb565_camera_1)                    ,    //.i_rgb565(i_rgb565_hdmi) 

    .pclk_in_2(pixclk_in_hdmi)                    , 
    .vs_in_2(vs_in_hdmi)                    , 
    .de_in_2(de_in_hdmi)                    ,
    .i_rgb565_2(i_rgb565_hdmi)    ,

    .pclk_in_3(pixclk_in_camera)                    , 
    .vs_in_3(vs_in_camera)                    , 
    .de_in_3(de_in_camera)                    ,
    .i_rgb565_3(i_rgb565_camera)    ,

    //读出接口
    .vs_out(vs_out)                     ,
    .hs_out(hs_out)                     ,
    .de_out(de_out)                   ,
    .r_out(r_out)               ,
    .g_out(g_out)               ,
    .b_out(b_out)               ,
    
    //uart
    .rx_data             (  rx_data       ),// output reg [7:0]  rx_data,  
    .rx_en               (  rx_en         ),// output reg        rx_en,                          
    .rx_finish           (  rx_finish     ), // output            rx_finish 
    .clk_div_cnt         (clk_div_cnt     ),
    .led_8wire           (led_8wire       )
);

    assign    pixclk_out = pix_clk;
    assign    data_565_out = {r_out[7:3], g_out[7:2], b_out[7:3]};


//eth_video-----------------------------------------------
    assign {phy_txd3,phy_txd2,phy_txd1,phy_txd0} = phy_txd;
    assign phy_rxd = {phy_rxd3,phy_rxd2,phy_rxd1,phy_rxd0};

video_ethernet    video_ethernet(
    .sys_clk(sys_clk),
    .rst_n(rstn_out),
    .led(eth_init_done),
//COMS1
    .vsync_in(vs_out),        //cmos vsync
    .href_in(de_out),         //cmos hsync refrence,data valid
    .pclk_in(pixclk_out),         //cmos pxiel clock
    .data_in(data_565_out),           //cmos data

/*******************************ethernet***********************/                        
    .rgmii_txd(phy_txd),                  //RGMII 发?数??
    .rgmii_txctl(phy_tx_en),                //RGMII 发?数据有效信??
    .rgmii_txc(l0_sgmii_clk_shft),                  //125Mhz ethernet rgmii tx clock
    .rgmii_rxd(phy_rxd),                  //RGMII 接收数据
    .rgmii_rxctl(phy_rx_dv),                //RGMII 接收数据有效信号
    .rgmii_rxc(rx_clki)               //125Mhz ethernet gmii rx clock
    );

//pcie-------------------------------------------------
/*video_pcie    video_pcie(
    .button_rst_n(rst_key)    ,
    .perst_n(perst_n)         ,
    .free_clk(sys_clk)        ,
    //clk and rst
    .ref_clk_n(ref_clk_n)       ,      
    .ref_clk_p(ref_clk_p)       ,      
    //diff signals
    .rxn(rxn)             ,
    .rxp(rxp)             ,
    .txn(txn)             ,
    .txp(txp)             ,

    //LED signals
    .smlh_link_up(smlh_link_up)    ,
    .rdlh_link_up(rdlh_link_up)    ,

    //video signals
    .vsync_in(vs_out_d2),        //cmos vsync
    .href_in(hs_out_d2),         //cmos hsync refrence
    .de_in(de_out),          //data valid
    .pclk_in(pixclk_out),         //cmos pxiel clock
    .data_in(data_565_out)           //cmos data
);

     reg vs_out_d1, vs_out_d2;
     reg hs_out_d1, hs_out_d2;
    always@(posedge pixclk_out) begin
        vs_out_d1<=vs_out;
        vs_out_d2<=vs_out_d1;
        hs_out_d1<=hs_out;
        hs_out_d2<=hs_out_d1;
     end

*/

//UART---------------------------------------------------------------------

   parameter      BPS_NUM = 16'd434;
   //  设置波特率为4800时，  bit位宽时钟周期个数:50MHz set 10417  40MHz set 8333
   //  设置波特率为9600时，  bit位宽时钟周期个数:50MHz set 5208   40MHz set 4167
   //  设置波特率为115200时，bit位宽时钟周期个数:50MHz set 434    40MHz set 347 12M set 104

    wire           tx_busy;         //transmitter is free.
    wire           rx_finish;       //receiver is free.
    wire    [7:0]  rx_data;         //the data receive from uart_rx.
    wire    [7:0]  tx_data;                                
    wire           tx_en;           //enable transmit.
    wire rx_en;

    wire    [15:0] clk_div_cnt;
    wire     [7:0]      cnt_8wire;

    reg  [7:0] receive_data;
    always @(posedge sys_clk)  receive_data <= rx_data;

    uart_data_gen uart_data_gen(
        .clk                  (  sys_clk      ),//input             clk,
        .read_data            (  receive_data ),//input      [7:0]  read_data,
        .tx_busy              (  tx_busy      ),//input             tx_busy,
        .write_max_num        (  8'h14        ),//input      [7:0]  write_max_num,
        .write_data           (  tx_data      ),//output reg [7:0]  write_data
        .write_en             (  tx_en        ) //output reg        write_en
    );
    
    //uart transmit data module.
    uart_tx #(
         .BPS_NUM            (  BPS_NUM       ) //parameter         BPS_NUM  =    16'd434
     )
     u_uart_tx(
        .clk                 (  sys_clk         ),// input            clk,               
        .tx_data             (  tx_data       ),// input [7:0]      tx_data,           
        .tx_pluse            (  tx_en         ),// input            tx_pluse,          
        .uart_tx             (  uart_tx       ),// output reg       uart_tx,                                  
        .tx_busy             (  tx_busy       ) // output           tx_busy            
    );                                             
                                               
    //Uart receive data module.                
    uart_rx #(
         .BPS_NUM            (  BPS_NUM       ) //parameter          BPS_NUM  =    16'd434
     )
     u_uart_rx (                        
        .clk                 (  sys_clk           ),// input             clk,                              
        .uart_rx             (  uart_rx       ),// input             uart_rx,            
        .rx_data             (  rx_data       ),// output reg [7:0]  rx_data,                                   
        .rx_en               (  rx_en         ),// output reg        rx_en,                          
        .rx_finish           (  rx_finish     ), // output            rx_finish       
        .clk_div_cnt_wire    (clk_div_cnt)
    );                                            

endmodule

