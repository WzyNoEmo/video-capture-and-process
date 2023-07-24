`timescale 1ns / 1ps

`define UD #1


module ddr_hdmi#(
	parameter MEM_ROW_ADDR_WIDTH   = 15         ,
	parameter MEM_COL_ADDR_WIDTH   = 10         ,
	parameter MEM_BADDR_WIDTH      = 3          ,
	parameter MEM_DQ_WIDTH         =  16        ,
	parameter MEM_DQS_WIDTH        =  16/8      ,
    parameter CTRL_ADDR_WIDTH = MEM_ROW_ADDR_WIDTH + MEM_BADDR_WIDTH + MEM_COL_ADDR_WIDTH,//28
    parameter TH_1S = 27'd33000000,

    parameter                     H_NUM                = 12'd1280,//12'd1920,
    parameter                     V_NUM                = 12'd720,//12'd1080,//12'd106,//
    parameter                    BPS_NUM                = 16'd434

)(
    input                                pix_clk                   ,    
    input                                core_clk                  ,
    input                                ddr_init_done             ,
    input                                uart_clk                  ,
//ddr接口
    output       [CTRL_ADDR_WIDTH-1:0]                        axi_awaddr                ,
    output       [3:0]                                        axi_awuser_id             ,
    output       [3:0]                                        axi_awlen                 ,
    input                                                     axi_awready               ,
    output                                                    axi_awvalid               ,
    output       [MEM_DQ_WIDTH*8-1:0]                         axi_wdata                 ,
    output       [MEM_DQ_WIDTH*8/8-1:0]                       axi_wstrb                 , 
    input                                                     axi_wready                ,
    input                                                     axi_wusero_last           ,
    output       [CTRL_ADDR_WIDTH-1:0]                        axi_araddr                ,
    output       [3:0]                                        axi_aruser_id             ,
    output       [3:0]                                        axi_arlen                 ,
    input                                                     axi_arready               ,
    output                                                    axi_arvalid               ,
    input        [MEM_DQ_WIDTH*8-1:0]                         axi_rdata                 ,
    input        [3:0]                                        axi_rid                   ,
    input                                                     axi_rlast                 ,
    input                                                     axi_rvalid                ,

//输入接口
    input               pclk_in,                            
    input               vs_in, 
    input               de_in,
    input       [15:0]  i_rgb565,

    input               pclk_in_1,                            
    input               vs_in_1, 
    input               de_in_1,
    input       [15:0]  i_rgb565_1,

    input               pclk_in_2,                            
    input               vs_in_2, 
    input               de_in_2,
    input       [15:0]  i_rgb565_2,

    input               pclk_in_3,                            
    input               vs_in_3, 
    input               de_in_3,
    input       [15:0]  i_rgb565_3,

//输出接口
    output     reg                       vs_out                    , 
    output     reg                       hs_out                    , 
    output     reg                       de_out                    ,
    output     reg[7:0]                  r_out                     , 
    output     reg[7:0]                  g_out                     , 
    output     reg[7:0]                  b_out                     ,
    
//uart
    input     wire[7:0]                        rx_data              ,// output reg [7:0]  rx_data,  
    input                                      rx_en                ,// output reg        rx_en,                          
    input                                      rx_finish            ,// output            rx_finish      
    input     wire[15:0]                       clk_div_cnt          ,
    output        [7:0]                        led_8wire
);

    wire     [15:0]    o_rgb565;
    reg  [15:0] h_count;
    reg  [15:0] v_count;

reg [4:0] box_cnt;
reg [63:0] boxs [24 - 1:0];//最多24个框

//reg [15:0] rx_data_2;
reg [63:0] rx_data_8;

reg [3:0] cnt_8;

integer i;

assign led_8wire[3:0] = cnt_8;
assign led_8wire[7:4] = box_cnt[3:0];


//修改ddr读写模块v1
    fram_buf fram_buf_hdmi(
        .ddr_clk        (  core_clk             ),//input                         ddr_clk,
        .ddr_rstn       (  ddr_init_done        ),//input                         ddr_rstn,
        //data_in                                  
        .vin_clk        (  pclk_in         ),//input                         vin_clk,
        .wr_fsync       (  vs_in           ),//input                         wr_fsync,  //场同步信号
        .wr_en          (  de_in           ),//input                         wr_en,
        .wr_data        (  i_rgb565             ),//input  [15 : 0]  wr_data,

        .vin_clk_1        (  pclk_in_1         ),//input                         vin_clk,
        .wr_fsync_1       (  vs_in_1           ),//input                         wr_fsync,  //场同步信号
        .wr_en_1          (  de_in_1           ),//input                         wr_en,
        .wr_data_1        (  i_rgb565_1             ),//input  [15 : 0]  wr_data,

        .vin_clk_2        (  pclk_in_2         ),//input                         vin_clk,
        .wr_fsync_2       (  vs_in_2           ),//input                         wr_fsync,  //场同步信号
        .wr_en_2          (  de_in_2           ),//input                         wr_en,
        .wr_data_2        (  i_rgb565_2             ),//input  [15 : 0]  wr_data,

        .vin_clk_3        (  pclk_in_3         ),//input                         vin_clk,
        .wr_fsync_3       (  vs_in_3           ),//input                         wr_fsync,  //场同步信号
        .wr_en_3          (  de_in_3           ),//input                         wr_en,
        .wr_data_3        (  i_rgb565_3             ),//input  [15 : 0]  wr_data,

        //data_out
        .vout_clk       (  pix_clk           ),//input                         vout_clk,
        .rd_fsync       (  vs_o               ),//input                         rd_fsync,
        .rd_en          (  de_re                ),//input                         rd_en,
        .vout_de        (  de_o               ),//output                        vout_de,
        .vout_data      (  o_rgb565             ),//output [PIX_WIDTH- 1'b1 : 0]  vout_data,
        .init_done      (  init_done            ),//output reg                    init_done,
        //axi bus
        .axi_awaddr     (  axi_awaddr           ),// output[27:0]
        .axi_awid       (  axi_awuser_id        ),// output[3:0]
        .axi_awlen      (  axi_awlen            ),// output[3:0]
        .axi_awsize     (                       ),// output[2:0]
        .axi_awburst    (                       ),// output[1:0]
        .axi_awready    (  axi_awready          ),// input
        .axi_awvalid    (  axi_awvalid          ),// output               
        .axi_wdata      (  axi_wdata            ),// output[255:0]
        .axi_wstrb      (  axi_wstrb            ),// output[31:0]
        .axi_wlast      (  axi_wusero_last      ),// input
        .axi_wvalid     (                       ),// output
        .axi_wready     (  axi_wready           ),// input
        .axi_bid        (  4'd0                 ),// input[3:0]
        .axi_araddr     (  axi_araddr           ),// output[27:0]
        .axi_arid       (  axi_aruser_id        ),// output[3:0]
        .axi_arlen      (  axi_arlen            ),// output[3:0]
        .axi_arsize     (                       ),// output[2:0]
        .axi_arburst    (                       ),// output[1:0]
        .axi_arvalid    (  axi_arvalid          ),// output
        .axi_arready    (  axi_arready          ),// input
        .axi_rready     (                       ),// output
        .axi_rdata      (  axi_rdata            ),// input[255:0]
        .axi_rvalid     (  axi_rvalid           ),// input
        .axi_rlast      (  axi_rlast            ),// input
        .axi_rid        (  axi_rid              ) // input[3:0]         
    );


always@(posedge pix_clk) begin
    if ((h_count > boxs[0][63:48]-2) && (h_count < boxs[0][31:16]+2) && (v_count > boxs[0][47:32]-2) && (v_count < boxs[0][47:32]+2) ||
        (h_count > boxs[0][31:16]-2) && (h_count < boxs[0][31:16]+2) && (v_count > boxs[0][47:32]-2) && (v_count < boxs[0][15:0]+2) ||
        (h_count > boxs[0][63:48]-2) && (h_count < boxs[0][31:16]+2) && (v_count > boxs[0][15:0]-2) && (v_count < boxs[0][15:0]+2) ||
        (h_count > boxs[0][63:48]-2) && (h_count < boxs[0][63:48]+2) && (v_count > boxs[0][47:32]-2) && (v_count < boxs[0][15:0]+2) )
    begin
        r_out<=255;
        g_out<=0;
        b_out<=0; 
        vs_out<=vs_o;
        hs_out<=hs_o;
        de_out<=de_o;
    end
    else if ((h_count > boxs[1][63:48]-2) && (h_count < boxs[1][31:16]+2) && (v_count > boxs[1][47:32]-2) && (v_count < boxs[1][47:32]+2) ||
        (h_count > boxs[1][31:16]-2) && (h_count < boxs[1][31:16]+2) && (v_count > boxs[1][47:32]-2) && (v_count < boxs[1][15:0]+2) ||
        (h_count > boxs[1][63:48]-2) && (h_count < boxs[1][31:16]+2) && (v_count > boxs[1][15:0]-2) && (v_count < boxs[1][15:0]+2) ||
        (h_count > boxs[1][63:48]-2) && (h_count < boxs[1][63:48]+2) && (v_count > boxs[1][47:32]-2) && (v_count < boxs[1][15:0]+2) )
    begin
        r_out<=255;
        g_out<=0;
        b_out<=0; 
        vs_out<=vs_o;
        hs_out<=hs_o;
        de_out<=de_o;
    end
    else if ((h_count > boxs[2][63:48]-2) && (h_count < boxs[2][31:16]+2) && (v_count > boxs[2][47:32]-2) && (v_count < boxs[2][47:32]+2) ||
        (h_count > boxs[2][31:16]-2) && (h_count < boxs[2][31:16]+2) && (v_count > boxs[2][47:32]-2) && (v_count < boxs[2][15:0]+2) ||
        (h_count > boxs[2][63:48]-2) && (h_count < boxs[2][31:16]+2) && (v_count > boxs[2][15:0]-2) && (v_count < boxs[2][15:0]+2) ||
        (h_count > boxs[2][63:48]-2) && (h_count < boxs[2][63:48]+2) && (v_count > boxs[2][47:32]-2) && (v_count < boxs[2][15:0]+2) )
    begin
        r_out<=255;
        g_out<=0;
        b_out<=0; 
        vs_out<=vs_o;
        hs_out<=hs_o;
        de_out<=de_o;
    end
    else if ((h_count > boxs[3][63:48]-2) && (h_count < boxs[3][31:16]+2) && (v_count > boxs[3][47:32]-2) && (v_count < boxs[3][47:32]+2) ||
        (h_count > boxs[3][31:16]-2) && (h_count < boxs[3][31:16]+2) && (v_count > boxs[3][47:32]-2) && (v_count < boxs[3][15:0]+2) ||
        (h_count > boxs[3][63:48]-2) && (h_count < boxs[3][31:16]+2) && (v_count > boxs[3][15:0]-2) && (v_count < boxs[3][15:0]+2) ||
        (h_count > boxs[3][63:48]-2) && (h_count < boxs[3][63:48]+2) && (v_count > boxs[3][47:32]-2) && (v_count < boxs[3][15:0]+2) )
    begin
        r_out<=255;
        g_out<=0;
        b_out<=0; 
        vs_out<=vs_o;
        hs_out<=hs_o;
        de_out<=de_o;
    end
    else if ((h_count > boxs[4][63:48]-2) && (h_count < boxs[4][31:16]+2) && (v_count > boxs[4][47:32]-2) && (v_count < boxs[4][47:32]+2) ||
        (h_count > boxs[4][31:16]-2) && (h_count < boxs[4][31:16]+2) && (v_count > boxs[4][47:32]-2) && (v_count < boxs[4][15:0]+2) ||
        (h_count > boxs[4][63:48]-2) && (h_count < boxs[4][31:16]+2) && (v_count > boxs[4][15:0]-2) && (v_count < boxs[4][15:0]+2) ||
        (h_count > boxs[4][63:48]-2) && (h_count < boxs[4][63:48]+2) && (v_count > boxs[4][47:32]-2) && (v_count < boxs[4][15:0]+2) )
    begin
        r_out<=255;
        g_out<=0;
        b_out<=0;
        vs_out<=vs_o;
        hs_out<=hs_o;
        de_out<=de_o;
    end
    else if ((h_count > boxs[5][63:48]-2) && (h_count < boxs[5][31:16]+2) && (v_count > boxs[5][47:32]-2) && (v_count < boxs[5][47:32]+2) ||
        (h_count > boxs[5][31:16]-2) && (h_count < boxs[5][31:16]+2) && (v_count > boxs[5][47:32]-2) && (v_count < boxs[5][15:0]+2) ||
        (h_count > boxs[5][63:48]-2) && (h_count < boxs[5][31:16]+2) && (v_count > boxs[5][15:0]-2) && (v_count < boxs[5][15:0]+2) ||
        (h_count > boxs[5][63:48]-2) && (h_count < boxs[5][63:48]+2) && (v_count > boxs[5][47:32]-2) && (v_count < boxs[5][15:0]+2) )
    begin
        r_out<=255;
        g_out<=0;
        b_out<=0;
        vs_out<=vs_o;
        hs_out<=hs_o;
        de_out<=de_o;
    end
    else if ((h_count > boxs[6][63:48]-2) && (h_count < boxs[6][31:16]+2) && (v_count > boxs[6][47:32]-2) && (v_count < boxs[6][47:32]+2) ||
        (h_count > boxs[6][31:16]-2) && (h_count < boxs[6][31:16]+2) && (v_count > boxs[6][47:32]-2) && (v_count < boxs[6][15:0]+2) ||
        (h_count > boxs[6][63:48]-2) && (h_count < boxs[6][31:16]+2) && (v_count > boxs[6][15:0]-2) && (v_count < boxs[6][15:0]+2) ||
        (h_count > boxs[6][63:48]-2) && (h_count < boxs[6][63:48]+2) && (v_count > boxs[6][47:32]-2) && (v_count < boxs[6][15:0]+2) )
    begin
        r_out<=255;
        g_out<=0;
        b_out<=0;
        vs_out<=vs_o;
        hs_out<=hs_o;
        de_out<=de_o;
    end
    else if ((h_count > boxs[7][63:48]-2) && (h_count < boxs[7][31:16]+2) && (v_count > boxs[7][47:32]-2) && (v_count < boxs[7][47:32]+2) ||
        (h_count > boxs[7][31:16]-2) && (h_count < boxs[7][31:16]+2) && (v_count > boxs[7][47:32]-2) && (v_count < boxs[7][15:0]+2) ||
        (h_count > boxs[7][63:48]-2) && (h_count < boxs[7][31:16]+2) && (v_count > boxs[7][15:0]-2) && (v_count < boxs[7][15:0]+2) ||
        (h_count > boxs[7][63:48]-2) && (h_count < boxs[7][63:48]+2) && (v_count > boxs[7][47:32]-2) && (v_count < boxs[7][15:0]+2) )
    begin
        r_out<=255;
        g_out<=0;
        b_out<=0;
        vs_out<=vs_o;
        hs_out<=hs_o;
        de_out<=de_o;
    end
    else if ((h_count > boxs[8][63:48]-2) && (h_count < boxs[8][31:16]+2) && (v_count > boxs[8][47:32]-2) && (v_count < boxs[8][47:32]+2) ||
        (h_count > boxs[8][31:16]-2) && (h_count < boxs[8][31:16]+2) && (v_count > boxs[8][47:32]-2) && (v_count < boxs[8][15:0]+2) ||
        (h_count > boxs[8][63:48]-2) && (h_count < boxs[8][31:16]+2) && (v_count > boxs[8][15:0]-2) && (v_count < boxs[8][15:0]+2) ||
        (h_count > boxs[8][63:48]-2) && (h_count < boxs[8][63:48]+2) && (v_count > boxs[8][47:32]-2) && (v_count < boxs[8][15:0]+2) )
    begin
        r_out<=255;
        g_out<=0;
        b_out<=0;
        vs_out<=vs_o;
        hs_out<=hs_o;
        de_out<=de_o;
    end
    else if ((h_count > boxs[9][63:48]-2) && (h_count < boxs[9][31:16]+2) && (v_count > boxs[9][47:32]-2) && (v_count < boxs[9][47:32]+2) ||
        (h_count > boxs[9][31:16]-2) && (h_count < boxs[9][31:16]+2) && (v_count > boxs[9][47:32]-2) && (v_count < boxs[9][15:0]+2) ||
        (h_count > boxs[9][63:48]-2) && (h_count < boxs[9][31:16]+2) && (v_count > boxs[9][15:0]-2) && (v_count < boxs[9][15:0]+2) ||
        (h_count > boxs[9][63:48]-2) && (h_count < boxs[9][63:48]+2) && (v_count > boxs[9][47:32]-2) && (v_count < boxs[9][15:0]+2) )
    begin
        r_out<=255;
        g_out<=0;
        b_out<=0;
        vs_out<=vs_o;
        hs_out<=hs_o;
        de_out<=de_o;
    end
    else if ((h_count > boxs[10][63:48]-2) && (h_count < boxs[10][31:16]+2) && (v_count > boxs[10][47:32]-2) && (v_count < boxs[10][47:32]+2) ||
        (h_count > boxs[10][31:16]-2) && (h_count < boxs[10][31:16]+2) && (v_count > boxs[10][47:32]-2) && (v_count < boxs[10][15:0]+2) ||
        (h_count > boxs[10][63:48]-2) && (h_count < boxs[10][31:16]+2) && (v_count > boxs[10][15:0]-2) && (v_count < boxs[10][15:0]+2) ||
        (h_count > boxs[10][63:48]-2) && (h_count < boxs[10][63:48]+2) && (v_count > boxs[10][47:32]-2) && (v_count < boxs[10][15:0]+2) )
    begin
        r_out<=255;
        g_out<=0;
        b_out<=0;
        vs_out<=vs_o;
        hs_out<=hs_o;
        de_out<=de_o;
    end
    else if ((h_count > boxs[11][63:48]-2) && (h_count < boxs[11][31:16]+2) && (v_count > boxs[11][47:32]-2) && (v_count < boxs[11][47:32]+2) ||
        (h_count > boxs[11][31:16]-2) && (h_count < boxs[11][31:16]+2) && (v_count > boxs[11][47:32]-2) && (v_count < boxs[11][15:0]+2) ||
        (h_count > boxs[11][63:48]-2) && (h_count < boxs[11][31:16]+2) && (v_count > boxs[11][15:0]-2) && (v_count < boxs[11][15:0]+2) ||
        (h_count > boxs[11][63:48]-2) && (h_count < boxs[11][63:48]+2) && (v_count > boxs[11][47:32]-2) && (v_count < boxs[11][15:0]+2) )
    begin
        r_out<=255;
        g_out<=0;
        b_out<=0;
        vs_out<=vs_o;
        hs_out<=hs_o;
        de_out<=de_o;
    end
    else if ((h_count > boxs[12][63:48]-2) && (h_count < boxs[12][31:16]+2) && (v_count > boxs[12][47:32]-2) && (v_count < boxs[12][47:32]+2) ||
        (h_count > boxs[12][31:16]-2) && (h_count < boxs[12][31:16]+2) && (v_count > boxs[12][47:32]-2) && (v_count < boxs[12][15:0]+2) ||
        (h_count > boxs[12][63:48]-2) && (h_count < boxs[12][31:16]+2) && (v_count > boxs[12][15:0]-2) && (v_count < boxs[12][15:0]+2) ||
        (h_count > boxs[12][63:48]-2) && (h_count < boxs[12][63:48]+2) && (v_count > boxs[12][47:32]-2) && (v_count < boxs[12][15:0]+2) )
    begin
        r_out<=255;
        g_out<=0;
        b_out<=0;
        vs_out<=vs_o;
        hs_out<=hs_o;
        de_out<=de_o;
    end
    else if ((h_count > boxs[13][63:48]-2) && (h_count < boxs[13][31:16]+2) && (v_count > boxs[13][47:32]-2) && (v_count < boxs[13][47:32]+2) ||
        (h_count > boxs[13][31:16]-2) && (h_count < boxs[13][31:16]+2) && (v_count > boxs[13][47:32]-2) && (v_count < boxs[13][15:0]+2) ||
        (h_count > boxs[13][63:48]-2) && (h_count < boxs[13][31:16]+2) && (v_count > boxs[13][15:0]-2) && (v_count < boxs[13][15:0]+2) ||
        (h_count > boxs[13][63:48]-2) && (h_count < boxs[13][63:48]+2) && (v_count > boxs[13][47:32]-2) && (v_count < boxs[13][15:0]+2) )
    begin
        r_out<=255;
        g_out<=0;
        b_out<=0;
        vs_out<=vs_o;
        hs_out<=hs_o;
        de_out<=de_o; 
    end
    else if ((h_count > boxs[14][63:48]-2) && (h_count < boxs[14][31:16]+2) && (v_count > boxs[14][47:32]-2) && (v_count < boxs[14][47:32]+2) ||
        (h_count > boxs[14][31:16]-2) && (h_count < boxs[14][31:16]+2) && (v_count > boxs[14][47:32]-2) && (v_count < boxs[14][15:0]+2) ||
        (h_count > boxs[14][63:48]-2) && (h_count < boxs[14][31:16]+2) && (v_count > boxs[14][15:0]-2) && (v_count < boxs[14][15:0]+2) ||
        (h_count > boxs[14][63:48]-2) && (h_count < boxs[14][63:48]+2) && (v_count > boxs[14][47:32]-2) && (v_count < boxs[14][15:0]+2) )
    begin
        r_out<=255;
        g_out<=0;
        b_out<=0; 
        vs_out<=vs_o;
        hs_out<=hs_o;
        de_out<=de_o;
    end
    else if ((h_count > boxs[15][63:48]-2) && (h_count < boxs[15][31:16]+2) && (v_count > boxs[15][47:32]-2) && (v_count < boxs[15][47:32]+2) ||
        (h_count > boxs[15][31:16]-2) && (h_count < boxs[15][31:16]+2) && (v_count > boxs[15][47:32]-2) && (v_count < boxs[15][15:0]+2) ||
        (h_count > boxs[15][63:48]-2) && (h_count < boxs[15][31:16]+2) && (v_count > boxs[15][15:0]-2) && (v_count < boxs[15][15:0]+2) ||
        (h_count > boxs[15][63:48]-2) && (h_count < boxs[15][63:48]+2) && (v_count > boxs[15][47:32]-2) && (v_count < boxs[15][15:0]+2) )
    begin
        r_out<=255;
        g_out<=0;
        b_out<=0; 
        vs_out<=vs_o;
        hs_out<=hs_o;
        de_out<=de_o;
    end
    else if ((h_count > boxs[16][63:48]-2) && (h_count < boxs[16][31:16]+2) && (v_count > boxs[16][47:32]-2) && (v_count < boxs[16][47:32]+2) ||
        (h_count > boxs[16][31:16]-2) && (h_count < boxs[16][31:16]+2) && (v_count > boxs[16][47:32]-2) && (v_count < boxs[16][15:0]+2) ||
        (h_count > boxs[16][63:48]-2) && (h_count < boxs[16][31:16]+2) && (v_count > boxs[16][15:0]-2) && (v_count < boxs[16][15:0]+2) ||
        (h_count > boxs[16][63:48]-2) && (h_count < boxs[16][63:48]+2) && (v_count > boxs[16][47:32]-2) && (v_count < boxs[16][15:0]+2) )
    begin
        r_out<=255;
        g_out<=0;
        b_out<=0; 
        vs_out<=vs_o;
        hs_out<=hs_o;
        de_out<=de_o;
    end
    else if ((h_count > boxs[17][63:48]-2) && (h_count < boxs[17][31:16]+2) && (v_count > boxs[17][47:32]-2) && (v_count < boxs[17][47:32]+2) ||
        (h_count > boxs[17][31:16]-2) && (h_count < boxs[17][31:16]+2) && (v_count > boxs[17][47:32]-2) && (v_count < boxs[17][15:0]+2) ||
        (h_count > boxs[17][63:48]-2) && (h_count < boxs[17][31:16]+2) && (v_count > boxs[17][15:0]-2) && (v_count < boxs[17][15:0]+2) ||
        (h_count > boxs[17][63:48]-2) && (h_count < boxs[17][63:48]+2) && (v_count > boxs[17][47:32]-2) && (v_count < boxs[17][15:0]+2) )
    begin
        r_out<=255;
        g_out<=0;
        b_out<=0; 
        vs_out<=vs_o;
        hs_out<=hs_o;
        de_out<=de_o;
    end
    else if ((h_count > boxs[18][63:48]-2) && (h_count < boxs[18][31:16]+2) && (v_count > boxs[18][47:32]-2) && (v_count < boxs[18][47:32]+2) ||
        (h_count > boxs[18][31:16]-2) && (h_count < boxs[18][31:16]+2) && (v_count > boxs[18][47:32]-2) && (v_count < boxs[18][15:0]+2) ||
        (h_count > boxs[18][63:48]-2) && (h_count < boxs[18][31:16]+2) && (v_count > boxs[18][15:0]-2) && (v_count < boxs[18][15:0]+2) ||
        (h_count > boxs[18][63:48]-2) && (h_count < boxs[18][63:48]+2) && (v_count > boxs[18][47:32]-2) && (v_count < boxs[18][15:0]+2) )
    begin
        r_out<=255;
        g_out<=0;
        b_out<=0; 
        vs_out<=vs_o;
        hs_out<=hs_o;
        de_out<=de_o;
    end
    else if ((h_count > boxs[19][63:48]-2) && (h_count < boxs[19][31:16]+2) && (v_count > boxs[19][47:32]-2) && (v_count < boxs[19][47:32]+2) ||
        (h_count > boxs[19][31:16]-2) && (h_count < boxs[19][31:16]+2) && (v_count > boxs[19][47:32]-2) && (v_count < boxs[19][15:0]+2) ||
        (h_count > boxs[19][63:48]-2) && (h_count < boxs[19][31:16]+2) && (v_count > boxs[19][15:0]-2) && (v_count < boxs[19][15:0]+2) ||
        (h_count > boxs[19][63:48]-2) && (h_count < boxs[19][63:48]+2) && (v_count > boxs[19][47:32]-2) && (v_count < boxs[19][15:0]+2) )
    begin
        r_out<=255;
        g_out<=0;
        b_out<=0; 
        vs_out<=vs_o;
        hs_out<=hs_o;
        de_out<=de_o;
    end
    else if ((h_count > boxs[20][63:48]-2) && (h_count < boxs[20][31:16]+2) && (v_count > boxs[20][47:32]-2) && (v_count < boxs[20][47:32]+2) ||
        (h_count > boxs[20][31:16]-2) && (h_count < boxs[20][31:16]+2) && (v_count > boxs[20][47:32]-2) && (v_count < boxs[20][15:0]+2) ||
        (h_count > boxs[20][63:48]-2) && (h_count < boxs[20][31:16]+2) && (v_count > boxs[20][15:0]-2) && (v_count < boxs[20][15:0]+2) ||
        (h_count > boxs[20][63:48]-2) && (h_count < boxs[20][63:48]+2) && (v_count > boxs[20][47:32]-2) && (v_count < boxs[20][15:0]+2) )
    begin
        r_out<=255;
        g_out<=0;
        b_out<=0;
        vs_out<=vs_o;
        hs_out<=hs_o;
        de_out<=de_o; 
    end
    else if ((h_count > boxs[21][63:48]-2) && (h_count < boxs[21][31:16]+2) && (v_count > boxs[21][47:32]-2) && (v_count < boxs[21][47:32]+2) ||
        (h_count > boxs[21][31:16]-2) && (h_count < boxs[21][31:16]+2) && (v_count > boxs[21][47:32]-2) && (v_count < boxs[21][15:0]+2) ||
        (h_count > boxs[21][63:48]-2) && (h_count < boxs[21][31:16]+2) && (v_count > boxs[21][15:0]-2) && (v_count < boxs[21][15:0]+2) ||
        (h_count > boxs[21][63:48]-2) && (h_count < boxs[21][63:48]+2) && (v_count > boxs[21][47:32]-2) && (v_count < boxs[21][15:0]+2) )
    begin
        r_out<=255;
        g_out<=0;
        b_out<=0;
        vs_out<=vs_o;
        hs_out<=hs_o;
        de_out<=de_o; 
    end
    else if ((h_count > boxs[22][63:48]-2) && (h_count < boxs[22][31:16]+2) && (v_count > boxs[22][47:32]-2) && (v_count < boxs[22][47:32]+2) ||
        (h_count > boxs[22][31:16]-2) && (h_count < boxs[22][31:16]+2) && (v_count > boxs[22][47:32]-2) && (v_count < boxs[22][15:0]+2) ||
        (h_count > boxs[22][63:48]-2) && (h_count < boxs[22][31:16]+2) && (v_count > boxs[22][15:0]-2) && (v_count < boxs[22][15:0]+2) ||
        (h_count > boxs[22][63:48]-2) && (h_count < boxs[22][63:48]+2) && (v_count > boxs[22][47:32]-2) && (v_count < boxs[22][15:0]+2) )
    begin
        r_out<=255;
        g_out<=0;
        b_out<=0;
        vs_out<=vs_o;
        hs_out<=hs_o;
        de_out<=de_o; 
    end
    else if ((h_count > boxs[23][63:48]-2) && (h_count < boxs[23][31:16]+2) && (v_count > boxs[23][47:32]-2) && (v_count < boxs[23][47:32]+2) ||
        (h_count > boxs[23][31:16]-2) && (h_count < boxs[23][31:16]+2) && (v_count > boxs[23][47:32]-2) && (v_count < boxs[23][15:0]+2) ||
        (h_count > boxs[23][63:48]-2) && (h_count < boxs[23][31:16]+2) && (v_count > boxs[23][15:0]-2) && (v_count < boxs[23][15:0]+2) ||
        (h_count > boxs[23][63:48]-2) && (h_count < boxs[23][63:48]+2) && (v_count > boxs[23][47:32]-2) && (v_count < boxs[23][15:0]+2) )
    begin
        r_out<=255;
        g_out<=0;
        b_out<=0;
        vs_out<=vs_o;
        hs_out<=hs_o;
        de_out<=de_o; 
    end
    else begin
        r_out<={o_rgb565[15:11],3'b0   };
        g_out<={o_rgb565[10:5],2'b0    };
        b_out<={o_rgb565[4:0],3'b0     }; 
        vs_out<=vs_o;
        hs_out<=hs_o;
        de_out<=de_o;
    end
end



// //test
// always@(posedge pix_clk) begin
//     if ((h_count > boxs[0]-2) && (h_count < boxs[0]+2) && (v_count > boxs[0]-2) && (v_count < boxs[0]+2) )
//         begin
//         r_out<=255;
//         g_out<=0;
//         b_out<=0; 
//         vs_out<=vs_o;
//         hs_out<=hs_o;
//         de_out<=de_o;
//         end
//     else begin
//         r_out<={o_rgb565[15:11],3'b0   };
//         g_out<={o_rgb565[10:5],2'b0    };
//         b_out<={o_rgb565[4:0],3'b0     }; 
//         vs_out<=vs_o;
//         hs_out<=hs_o;
//         de_out<=de_o;
//     end
// end


//计数坐标
always @ (posedge pix_clk)
begin
    if (!init_done) begin
        h_count <= 0;
    end
    else if (de_re) begin
        if (h_count == H_NUM-1)
            h_count <= 0;
        else h_count <= h_count + 1;
    end
        
end

always @ (posedge pix_clk)
begin
    if (!init_done) begin
        v_count <= 0;
    end
    else if (de_re && h_count == H_NUM-1) begin
        if ( v_count == V_NUM-1)
            v_count <= 0;
        else v_count <= v_count + 1;
    end
        
end
////////////////////////////////////////////////////

//box_cnt
always @ (posedge uart_clk)//uart_clk
begin
    if (!init_done)
        box_cnt <= 0;
    else if (cnt_8 == 8 && box_cnt!=24-1 && rx_en && (clk_div_cnt == BPS_NUM))
        box_cnt <= box_cnt+1;
    else if (cnt_8 == 8 && box_cnt==24-1 && rx_en && (clk_div_cnt == BPS_NUM))
        box_cnt <= 0;
end

//boxs
always @ (posedge uart_clk)//uart_clk
begin
    if (!init_done)
        for ( i=0; i<24; i=i+1)
        boxs[i] <= 64'd0;
    else if (cnt_8 == 8 && rx_en && (clk_div_cnt == BPS_NUM))
        boxs[box_cnt] <= rx_data_8;
    else boxs[box_cnt] <= boxs[box_cnt];
end


//rx_data_8 
always @ (posedge uart_clk)
begin
    if (!init_done)
        rx_data_8 <= 0;
    else if(rx_en && (clk_div_cnt == BPS_NUM))
        rx_data_8 <= {rx_data_8[55:0], rx_data};
end

//cnt_8
always @ (posedge uart_clk)
begin
    if (!init_done)
        cnt_8 <= 0;
    else if (cnt_8 == 8  && rx_en && (clk_div_cnt == BPS_NUM))
        cnt_8 <= 1;
    else if (rx_en && (clk_div_cnt == BPS_NUM))
        cnt_8 <= cnt_8+1;
    else cnt_8 <= cnt_8;
end


//存放框选坐标


/////////////////////////////////////////////////////////////////////////////////////
//产生visa时序 
     sync_vg sync_vg(                            
        .clk            (  pix_clk              ),//input                   clk,                                 
        .rstn           (  init_done            ),//input                   rstn,                            
        .vs_out         (  vs_o                 ),//output reg              vs_out,                                                                                                                                      
        .hs_out         (  hs_o                 ),//output reg              hs_out,            
        .de_out         (                       ),//output reg              de_out, 
        .de_re          (  de_re                )
    );                 
/////////////////////////////////////////////////////////////////////////////////////

endmodule