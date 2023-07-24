`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/07/03 09:20:29
// Design Name: 
// Module Name: video_ethernet
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module video_ethernet(
input                       sys_clk,
input                       rst_n,
output                      led,

//*************************data_in*******************************/
input                       vsync_in,        //cmos vsync
input                       href_in,         //cmos hsync refrence,data valid
input                       pclk_in,         //cmos pxiel clock
input   [15:0]              data_in,           //cmos data

/*******************************ethernet***********************/  
output   [3:0]              rgmii_txd,                  //RGMII 发?数??
output                      rgmii_txctl,                //RGMII 发?数据有效信??
output                      rgmii_txc,                  //125Mhz ethernet rgmii tx clock
input    [3:0]              rgmii_rxd,                  //RGMII 接收数据
input                       rgmii_rxctl,                //RGMII 接收数据有效信号
input                       rgmii_rxc               //125Mhz ethernet gmii rx clock

);


wire                        clk_50m;
wire[9:0]                   cmos1_lut_index;
wire[31:0]                  cmos1_lut_data;
    
wire   [ 7:0]   gmii_txd;
wire            gmii_tx_en;
wire            gmii_tx_er;
wire            gmii_tx_clk;
wire            gmii_crs;
wire            gmii_col;
wire   [ 7:0]   gmii_rxd;
wire            gmii_rx_dv;
wire            gmii_rx_er;
wire            gmii_rx_clk;
wire  [ 1:0]    speed_selection; // 1x gigabit, 01 100Mbps, 00 10mbps
wire            duplex_mode;     // 1 full, 0 half


//data_preprocess
wire    cmos_pclk;
wire    cmos_vsync;/* synthesis PAP_MARK_DEBUG="true" */
wire    cmos_href;
wire    [15:0] cmos_db;

assign cmos_pclk = pclk_in;
assign cmos_vsync = vsync_in;
assign cmos_href = href_in;    //data_valid
assign cmos_db = data_in;

wire       cmos_vsync_delay;/* synthesis PAP_MARK_DEBUG="true" */
wire       cmos_href_delay;/* synthesis PAP_MARK_DEBUG="true" */
wire [15:0] cmos_data_delay;/* synthesis PAP_MARK_DEBUG="true" */


camera_delay camera_delay_inst
(
   .cmos_pclk          (cmos_pclk),              //cmos pxiel clock
   .cmos_href          (cmos_href),              //cmos hsync refrence
   .cmos_vsync         (cmos_vsync),             //cmos vsync
   .cmos_data          (cmos_db),              //cmos data

   .cmos_href_delay    (cmos_href_delay),              //cmos hsync refrence
   .cmos_vsync_delay   (cmos_vsync_delay),             //cmos vsync
   .cmos_data_delay    (cmos_data_delay)             //cmos data
) ;

wire [12 : 0] fifo_data_count;/* synthesis PAP_MARK_DEBUG="true" */
wire [7:0] fifo_data;/* synthesis PAP_MARK_DEBUG="true" */
wire fifo_rd_en;/* synthesis PAP_MARK_DEBUG="true" */

//----------------------insert_vs_to_dataflow-----------------------
wire wr_en;/* synthesis PAP_MARK_DEBUG="true" */
wire [15:0] wr_data;/* synthesis PAP_MARK_DEBUG="true" */

wire pix_wr_en_d0 = cmos_href_delay ;
wire [15:0] pix_wr_data_d0 = cmos_data_delay;

reg pix_wr_en_d1;
reg pix_wr_en_d2;
reg pix_wr_en_d3;
reg pix_wr_en_d4;
reg [15:0] pix_wr_data_d1;
reg [15:0] pix_wr_data_d2;
reg [15:0] pix_wr_data_d3;
reg [15:0] pix_wr_data_d4;

always @(posedge cmos_pclk) begin
    pix_wr_en_d1 <= pix_wr_en_d0;
    pix_wr_en_d2 <= pix_wr_en_d1;
    pix_wr_en_d3 <= pix_wr_en_d2;
    pix_wr_en_d4 <= pix_wr_en_d3;
    pix_wr_data_d1 <= pix_wr_data_d0;
    pix_wr_data_d2 <= pix_wr_data_d1;
    pix_wr_data_d3 <= pix_wr_data_d2;
    pix_wr_data_d4 <= pix_wr_data_d3;
end

//vs_code : a5 5a a5 5a
reg vs_hold;
wire prim_wr_en;
wire [15:0] prim_wr_data;

reg [12:0] wr_cnt;
always@(posedge cmos_pclk) begin
    if(~rst_n) wr_cnt <= 10'b0;
    else if(pix_wr_en_d2) wr_cnt <= wr_cnt + 1;
    else wr_cnt <= 10'b0;
end

reg sec_bag_flag;
always@(posedge cmos_pclk)begin
    if(~rst_n) sec_bag_flag <= 1'b0;
    else if(wr_cnt >= 640) sec_bag_flag <= 1'b1;
    else if(pix_wr_en_d4 == 1'b0) sec_bag_flag <= 1'b0; 
    else sec_bag_flag <= sec_bag_flag;
end

assign prim_wr_en =(( pix_wr_en_d2 == 1'b0 ) && (pix_wr_en_d0 == 1'b1 )) |( wr_cnt == 13'd640) |( wr_cnt == 13'd641);
assign prim_wr_data = vs_hold ? 16'ha55a : bag_cnt;

reg prim_wr_en_d;
always@(posedge cmos_pclk) begin
    prim_wr_en_d <= prim_wr_en;
end

assign prim_wr_pulse = prim_wr_en & (~prim_wr_en_d);

reg [15:0] bag_cnt;
always @(posedge cmos_pclk) begin
    if(~rst_n) bag_cnt <= 13'b0;
    else if(cmos_vsync) bag_cnt <= 13'b0;
    else if(prim_wr_pulse) bag_cnt <= bag_cnt + 1;
    else bag_cnt <= bag_cnt;
end

always @(posedge cmos_pclk) begin
    if(~rst_n) begin
        vs_hold <= 1'b0;
    end
    else if(cmos_vsync_delay) begin
        vs_hold <= 1'b1;
    end
    else if(pix_wr_en_d2) begin
        vs_hold <= 1'b0;
    end
    else begin
        vs_hold <= vs_hold;
    end
end


assign wr_en =  prim_wr_en | pix_wr_en_d2 | pix_wr_en_d4 ;
assign wr_data = prim_wr_en ? prim_wr_data : (sec_bag_flag ? pix_wr_data_d4 : pix_wr_data_d2 );

//------------------------------------------------------------------


camera_fifo camera_fifo_inst(
    .wr_clk(cmos_pclk),
    .wr_rst(cmos_vsync),
    .wr_en(wr_en),        //data_valid
    .wr_data(wr_data),
    .wr_full(),
    .wr_water_level(),
    .almost_full(),
    .rd_clk(gmii_rx_clk),
    .rd_rst(cmos_vsync),
    .rd_en(fifo_rd_en),
    .rd_data(fifo_data),
    .rd_empty(),
    .rd_water_level(fifo_data_count),
    .almost_empty()
);


//************************mac*******************************/
mac_test mac_test0
(
 .gmii_tx_clk            (gmii_tx_clk        ),
 .gmii_rx_clk            (gmii_rx_clk        ) ,
 .rst_n                  (rst_n              ),
 
 .cmos_vsync              (cmos_vsync        ),
 .cmos_href               (cmos_href         ),
 .reg_conf_done           (reg_conf_done     ),
 .fifo_data               (fifo_data         ),           //FIFO璇诲?虹??8bit?版??
 .fifo_data_count         (fifo_data_count   ),     //(fifo_rdusedw),     //FIFO涓?????版????伴??
 .fifo_rd_en              (fifo_rd_en        ),          //FIFO璇讳娇?? 
 
 
 .udp_send_data_length   (16'd1284          ), 
 .gmii_rx_dv             (gmii_rx_dv         ),
 .gmii_rxd               (gmii_rxd           ),
 .gmii_tx_en             (gmii_tx_en         ),
 .gmii_txd               (gmii_txd           )
 
);	

//MDIO config
assign speed_selection = 2'b10;
assign duplex_mode = 1'b1;


util_gmii_to_rgmii util_gmii_to_rgmii_m0(
	.reset(1'b0),
	
	.rgmii_td(rgmii_txd),
	.rgmii_tx_ctl(rgmii_txctl),
	.rgmii_txc(rgmii_txc),
	.rgmii_rd(rgmii_rxd),
	.rgmii_rx_ctl(rgmii_rxctl),
	.gmii_rx_clk(gmii_rx_clk),
	.gmii_txd(gmii_txd),
	.gmii_tx_en(gmii_tx_en),
	.gmii_tx_er(1'b0),
	.gmii_tx_clk(gmii_tx_clk),
	.gmii_crs(gmii_crs),
	.gmii_col(gmii_col),
	.gmii_rxd(gmii_rxd),
    .rgmii_rxc(rgmii_rxc),//add
	.gmii_rx_dv(gmii_rx_dv),
	.gmii_rx_er(gmii_rx_er),
	.speed_selection(speed_selection),
	.duplex_mode(duplex_mode),
    .led(led),
    .pll_phase_shft_lock(),
    .clk(),
    .sys_clk(sys_clk)
	);

endmodule
