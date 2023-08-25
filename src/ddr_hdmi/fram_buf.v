`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Meyesemi
// Engineer: Nill
// 
// Create Date: 15/03/23 14:17:29
// Design Name: 
// Module Name: fram_buf
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
`define UD #1
module fram_buf #(
    parameter                     MEM_ROW_WIDTH        = 15    ,
    parameter                     MEM_COLUMN_WIDTH     = 10    ,
    parameter                     MEM_BANK_WIDTH       = 3     ,
    parameter                     CTRL_ADDR_WIDTH = MEM_ROW_WIDTH + MEM_BANK_WIDTH + MEM_COLUMN_WIDTH,
    parameter                     MEM_DQ_WIDTH         = 16    ,
    parameter                     H_NUM                = 12'd1280,//12'd1920,
    parameter                     V_NUM                = 12'd720,//12'd1080,//12'd106,//
    parameter                     PIX_WIDTH            = 16//24 
)(
    input                         vin_clk,
    input                         wr_fsync,
    input                         wr_en,
    input  [PIX_WIDTH- 1'b1 : 0]  wr_data,

    input                         vin_clk_1,
    input                         wr_fsync_1,
    input                         wr_en_1,
    input  [PIX_WIDTH- 1'b1 : 0]  wr_data_1,

    input                         vin_clk_2,
    input                         wr_fsync_2,
    input                         wr_en_2,
    input  [PIX_WIDTH- 1'b1 : 0]  wr_data_2,

    input                         vin_clk_3,
    input                         wr_fsync_3,
    input                         wr_en_3,
    input  [PIX_WIDTH- 1'b1 : 0]  wr_data_3,

    output reg                    init_done=0,
    
    input                         ddr_clk,
    input                         ddr_rstn,
    
    input                         vout_clk,
    input                         rd_fsync,
    input                         rd_en,
    output                        vout_de,
    output [PIX_WIDTH- 1'b1 : 0]  vout_data,
    
    output [CTRL_ADDR_WIDTH-1:0]  axi_awaddr     ,
    output [3:0]                  axi_awid       ,
    output [3:0]                  axi_awlen      ,
    output [2:0]                  axi_awsize     ,
    output [1:0]                  axi_awburst    ,
    input                         axi_awready    ,
    output                        axi_awvalid    ,
                                                  
    output [MEM_DQ_WIDTH*8-1:0]   axi_wdata      ,
    output [MEM_DQ_WIDTH -1 :0]   axi_wstrb      ,
    input                         axi_wlast      ,
    output                        axi_wvalid     ,
    input                         axi_wready     ,
    input  [3 : 0]                axi_bid        ,                                      
                                                  
    output [CTRL_ADDR_WIDTH-1:0]  axi_araddr     ,
    output [3:0]                  axi_arid       ,
    output [3:0]                  axi_arlen      ,
    output [2:0]                  axi_arsize     ,
    output [1:0]                  axi_arburst    ,
    output                        axi_arvalid    ,
    input                         axi_arready    ,
                                                  
    output                        axi_rready     ,
    input  [MEM_DQ_WIDTH*8-1:0]   axi_rdata      ,
    input                         axi_rvalid     ,
    input                         axi_rlast      ,
    input  [3:0]                  axi_rid        ,

    input  [4:0]    video_sel    
);
    parameter LEN_WIDTH       = 32;
    parameter LINE_ADDR_WIDTH = 22;//19;//1440 * 1080 = 1 555 200 = 21'h17BB00  //??????
    parameter FRAME_CNT_WIDTH = CTRL_ADDR_WIDTH - LINE_ADDR_WIDTH;              //???????
    
    wire                        ddr_wreq;     
    wire [CTRL_ADDR_WIDTH- 1'b1 : 0] ddr_waddr;    
    wire [LEN_WIDTH- 1'b1 : 0]  ddr_wr_len;   
    wire                        ddr_wrdy;     
    wire                        ddr_wdone;    
    wire [8*MEM_DQ_WIDTH-1 : 0] ddr_wdata;    
    wire                        ddr_wdata_req;
    
    wire                        rd_cmd_en   ;
    wire [CTRL_ADDR_WIDTH-1:0]  rd_cmd_addr ;
    wire [LEN_WIDTH- 1'b1: 0]   rd_cmd_len  ;
    wire                        rd_cmd_ready;
    wire                        rd_cmd_done;
                                
    wire                        read_ready  = 1'b1;
    wire [MEM_DQ_WIDTH*8-1:0]   read_rdata  ;
    wire                        read_en     ;
    wire                        ddr_wr_bac;


reg [11:0] H_NUM_1 = 0;
reg [11:0] V_NUM_1 = 0;
reg [11:0] H_NUM_2 = 0;
reg [11:0] V_NUM_2 = 0;
reg [11:0] H_NUM_3 = 0;
reg [11:0] V_NUM_3 = 0;
reg [11:0] H_NUM_4 = 0;
reg [11:0] V_NUM_4 = 0;

reg [31:0] CHANNEL_OFFSET_1 = 0;
reg [31:0] CHANNEL_OFFSET_2 = 0;
reg [31:0] CHANNEL_OFFSET_3 = 0;
reg [31:0] CHANNEL_OFFSET_4 = 0;

always @(*)
begin
    case(video_sel)
    5'b10000:begin
        H_NUM_1 <= 12'd640;
        V_NUM_1 <= 12'd360;
        H_NUM_2 <= 12'd640;
        V_NUM_2 <= 12'd360;
        H_NUM_3 <= 12'd640;
        V_NUM_3 <= 12'd360;
        H_NUM_4 <= 12'd640;
        V_NUM_4 <= 12'd360;
        CHANNEL_OFFSET_1 <= 32'd0;
        CHANNEL_OFFSET_2 <= 32'd640;
        CHANNEL_OFFSET_3 <= 32'd460800;
        CHANNEL_OFFSET_4 <= 32'd461440;
    end
    5'b01000:begin
        H_NUM_1 <= 12'd1280;
        V_NUM_1 <= 12'd720;
        CHANNEL_OFFSET_1 <= 32'd0;
    end
    5'b00100:begin
        H_NUM_2 <= 12'd1280;
        V_NUM_2 <= 12'd720;
        CHANNEL_OFFSET_2 <= 32'd0;
    end
    5'b00010:begin
        H_NUM_3 <= 12'd1280;
        V_NUM_3 <= 12'd720;
        CHANNEL_OFFSET_3 <= 32'd0;
    end
    5'b00001:begin
        H_NUM_4 <= 12'd1280;
        V_NUM_4 <= 12'd720;
        CHANNEL_OFFSET_4 <= 32'd0;
    end
    endcase
end



    wr_buf_1 #(
        .ADDR_WIDTH       (  CTRL_ADDR_WIDTH  ),//parameter                     ADDR_WIDTH      = 6'd27,
        .ADDR_OFFSET      (  32'd0            ),//parameter                     ADDR_OFFSET     = 32'h0000_0000,
        //.H_NUM            (  12'd640            ),//parameter                     H_NUM           = 12'd1920,
        //.V_NUM            (  12'd360            ),//parameter                     V_NUM           = 12'd1080,
        .DQ_WIDTH         (  MEM_DQ_WIDTH     ),//parameter                     DQ_WIDTH        = 7'd32,
        .LEN_WIDTH        (  LEN_WIDTH        ),//parameter                     LEN_WIDTH       = 6'd16,
        .PIX_WIDTH        (  PIX_WIDTH        ),//parameter                     PIX_WIDTH       = 6'd24,
        .LINE_ADDR_WIDTH  (  LINE_ADDR_WIDTH  ),//parameter                     LINE_ADDR_WIDTH = 4'd19,
        .FRAME_CNT_WIDTH  (  FRAME_CNT_WIDTH  ) //parameter                     FRAME_CNT_WIDTH = 4'd8
    ) wr_buf_1 (    
        .CHANNEL_OFFSET   (  CHANNEL_OFFSET_1            ),                                
        .ddr_clk          (  ddr_clk          ),//input                         ddr_clk,
        .ddr_rstn         (  ddr_rstn         ),//input                         ddr_rstn,
                                              
        .wr_clk           (  vin_clk          ),//input                         wr_clk,
        .wr_fsync         (  wr_fsync         ),//input                         wr_fsync,
        .wr_en            (  wr_en            ),//input                         wr_en,
        .wr_data          (  wr_data          ),//input  [PIX_WIDTH- 1'b1 : 0]  wr_data,
        
        .rd_bac           (  ddr_wr_bac       ),//input                         rd_bac,                                      
        .ddr_wreq         (  ddr_wreq_1         ),//output                        ddr_wreq,
        .ddr_waddr        (  ddr_waddr_1        ),//output [ADDR_WIDTH- 1'b1 : 0] ddr_waddr,
        .ddr_wr_len       (  ddr_wr_len_1       ),//output [LEN_WIDTH- 1'b1 : 0]  ddr_wr_len, //?????????????
        .ddr_wrdy         (  ddr_wrdy         ),//input                         ddr_wrdy,
        .ddr_wdone        (  ddr_wdone_1        ),//input                         ddr_wdone,
        .ddr_wdata        (  ddr_wdata_1        ),//output [8*DQ_WIDTH- 1'b1 : 0] ddr_wdata,
        .ddr_wdata_req    (  ddr_wdata_req_1    ),//input                         ddr_wdata_req,
                                              
        .frame_wcnt       (                   ),//output [FRAME_CNT_WIDTH-1 :0] frame_wcnt,
        .frame_wirq       (  frame_wirq_1       ), //output                        frame_wirq
        
        .H_NUM            (  H_NUM_1            ),//parameter                     H_NUM           = 12'd1920,
        .V_NUM            (  V_NUM_1            ),//parameter                     V_NUM           = 12'd1080,
        .sel_en           (  video_sel[4] | video_sel[3]    ),
        .scal_en          (  video_sel[4]                   )
    );

    wr_buf_2 #(
        .ADDR_WIDTH       (  CTRL_ADDR_WIDTH  ),//parameter                     ADDR_WIDTH      = 6'd27,
        .ADDR_OFFSET      (  32'd0            ),//parameter                     ADDR_OFFSET     = 32'h0000_0000,
        //.H_NUM            (  12'd640            ),//parameter                     H_NUM           = 12'd1920,
        //.V_NUM            (  12'd360            ),//parameter                     V_NUM           = 12'd1080,
        .DQ_WIDTH         (  MEM_DQ_WIDTH     ),//parameter                     DQ_WIDTH        = 7'd32,
        .LEN_WIDTH        (  LEN_WIDTH        ),//parameter                     LEN_WIDTH       = 6'd16,
        .PIX_WIDTH        (  PIX_WIDTH        ),//parameter                     PIX_WIDTH       = 6'd24,
        .LINE_ADDR_WIDTH  (  LINE_ADDR_WIDTH  ),//parameter                     LINE_ADDR_WIDTH = 4'd19,
        .FRAME_CNT_WIDTH  (  FRAME_CNT_WIDTH  ) //parameter                     FRAME_CNT_WIDTH = 4'd8
    ) wr_buf_2 (          
        .CHANNEL_OFFSET   (  CHANNEL_OFFSET_2         ),             
        .ddr_clk          (  ddr_clk          ),//input                         ddr_clk,
        .ddr_rstn         (  ddr_rstn         ),//input                         ddr_rstn,
                                              
        .wr_clk           (  vin_clk_1          ),//input                         wr_clk,
        .wr_fsync         (  wr_fsync_1         ),//input                         wr_fsync,
        .wr_en            (  wr_en_1            ),//input                         wr_en,
        .wr_data          (  wr_data_1          ),//input  [PIX_WIDTH- 1'b1 : 0]  wr_data,
        
        .rd_bac           (  ddr_wr_bac       ),//input                         rd_bac,                                      
        .ddr_wreq         (  ddr_wreq_2         ),//output                        ddr_wreq,
        .ddr_waddr        (  ddr_waddr_2        ),//output [ADDR_WIDTH- 1'b1 : 0] ddr_waddr,
        .ddr_wr_len       (  ddr_wr_len_2       ),//output [LEN_WIDTH- 1'b1 : 0]  ddr_wr_len, //?????????????
        .ddr_wrdy         (  ddr_wrdy         ),//input                         ddr_wrdy,
        .ddr_wdone        (  ddr_wdone_2        ),//input                         ddr_wdone,
        .ddr_wdata        (  ddr_wdata_2        ),//output [8*DQ_WIDTH- 1'b1 : 0] ddr_wdata,
        .ddr_wdata_req    (  ddr_wdata_req_2    ),//input                         ddr_wdata_req,
                                              
        .frame_wcnt       (                   ),//output [FRAME_CNT_WIDTH-1 :0] frame_wcnt,
        .frame_wirq       (  frame_wirq_2       ), //output                        frame_wirq

        .H_NUM            (  H_NUM_2            ),//parameter                     H_NUM           = 12'd1920,
        .V_NUM            (  V_NUM_2            ),//parameter                     V_NUM           = 12'd1080,
        .sel_en           (  video_sel[4] | video_sel[2]    ),
        .scal_en          (  video_sel[4]                   )
    );

    wr_buf_3 #(
        .ADDR_WIDTH       (  CTRL_ADDR_WIDTH  ),//parameter                     ADDR_WIDTH      = 6'd27,
        .ADDR_OFFSET      (  32'd0            ),//parameter                     ADDR_OFFSET     = 32'h0000_0000,
        //.H_NUM            (  12'd640            ),//parameter                     H_NUM           = 12'd1920,
        //.V_NUM            (  12'd360            ),//parameter                     V_NUM           = 12'd1080,
        .DQ_WIDTH         (  MEM_DQ_WIDTH     ),//parameter                     DQ_WIDTH        = 7'd32,
        .LEN_WIDTH        (  LEN_WIDTH        ),//parameter                     LEN_WIDTH       = 6'd16,
        .PIX_WIDTH        (  PIX_WIDTH        ),//parameter                     PIX_WIDTH       = 6'd24,
        .LINE_ADDR_WIDTH  (  LINE_ADDR_WIDTH  ),//parameter                     LINE_ADDR_WIDTH = 4'd19,
        .FRAME_CNT_WIDTH  (  FRAME_CNT_WIDTH  ) //parameter                     FRAME_CNT_WIDTH = 4'd8
    ) wr_buf_3 (                  
        .CHANNEL_OFFSET   (  CHANNEL_OFFSET_3       ),    
        .ddr_clk          (  ddr_clk          ),//input                         ddr_clk,
        .ddr_rstn         (  ddr_rstn         ),//input                         ddr_rstn,
                                              
        .wr_clk           (  vin_clk_2          ),//input                         wr_clk,
        .wr_fsync         (  wr_fsync_2         ),//input                         wr_fsync,
        .wr_en            (  wr_en_2            ),//input                         wr_en,
        .wr_data          (  wr_data_2          ),//input  [PIX_WIDTH- 1'b1 : 0]  wr_data,
        
        .rd_bac           (  ddr_wr_bac       ),//input                         rd_bac,                                      
        .ddr_wreq         (  ddr_wreq_3         ),//output                        ddr_wreq,
        .ddr_waddr        (  ddr_waddr_3        ),//output [ADDR_WIDTH- 1'b1 : 0] ddr_waddr,
        .ddr_wr_len       (  ddr_wr_len_3       ),//output [LEN_WIDTH- 1'b1 : 0]  ddr_wr_len, //?????????????
        .ddr_wrdy         (  ddr_wrdy         ),//input                         ddr_wrdy,
        .ddr_wdone        (  ddr_wdone_3        ),//input                         ddr_wdone,
        .ddr_wdata        (  ddr_wdata_3        ),//output [8*DQ_WIDTH- 1'b1 : 0] ddr_wdata,
        .ddr_wdata_req    (  ddr_wdata_req_3    ),//input                         ddr_wdata_req,
                                              
        .frame_wcnt       (                   ),//output [FRAME_CNT_WIDTH-1 :0] frame_wcnt,
        .frame_wirq       (  frame_wirq_3       ), //output                        frame_wirq

        .H_NUM            (  H_NUM_3            ),//parameter                     H_NUM           = 12'd1920,
        .V_NUM            (  V_NUM_3            ),//parameter                     V_NUM           = 12'd1080,
        .sel_en           (  video_sel[4] | video_sel[1]    ),
        .scal_en          (  video_sel[4]                   )
    );

    wr_buf_4 #(
        .ADDR_WIDTH       (  CTRL_ADDR_WIDTH  ),//parameter                     ADDR_WIDTH      = 6'd27,
        .ADDR_OFFSET      (  32'd0            ),//parameter                     ADDR_OFFSET     = 32'h0000_0000,
        //.H_NUM            (  12'd640            ),//parameter                     H_NUM           = 12'd1920,
        //.V_NUM            (  12'd360            ),//parameter                     V_NUM           = 12'd1080,
        .DQ_WIDTH         (  MEM_DQ_WIDTH     ),//parameter                     DQ_WIDTH        = 7'd32,
        .LEN_WIDTH        (  LEN_WIDTH        ),//parameter                     LEN_WIDTH       = 6'd16,
        .PIX_WIDTH        (  PIX_WIDTH        ),//parameter                     PIX_WIDTH       = 6'd24,
        .LINE_ADDR_WIDTH  (  LINE_ADDR_WIDTH  ),//parameter                     LINE_ADDR_WIDTH = 4'd19,
        .FRAME_CNT_WIDTH  (  FRAME_CNT_WIDTH  ) //parameter                     FRAME_CNT_WIDTH = 4'd8
    ) wr_buf_4 (                                       
        .CHANNEL_OFFSET   (  CHANNEL_OFFSET_4       ),
        .ddr_clk          (  ddr_clk          ),//input                         ddr_clk,
        .ddr_rstn         (  ddr_rstn         ),//input                         ddr_rstn,
                                              
        .wr_clk           (  vin_clk_3          ),//input                         wr_clk,
        .wr_fsync         (  wr_fsync_3         ),//input                         wr_fsync,
        .wr_en            (  wr_en_3            ),//input                         wr_en,
        .wr_data          (  wr_data_3          ),//input  [PIX_WIDTH- 1'b1 : 0]  wr_data,
        
        .rd_bac           (  ddr_wr_bac       ),//input                         rd_bac,                                      
        .ddr_wreq         (  ddr_wreq_4         ),//output                        ddr_wreq,
        .ddr_waddr        (  ddr_waddr_4        ),//output [ADDR_WIDTH- 1'b1 : 0] ddr_waddr,
        .ddr_wr_len       (  ddr_wr_len_4       ),//output [LEN_WIDTH- 1'b1 : 0]  ddr_wr_len, //?????????????
        .ddr_wrdy         (  ddr_wrdy         ),//input                         ddr_wrdy,
        .ddr_wdone        (  ddr_wdone_4        ),//input                         ddr_wdone,
        .ddr_wdata        (  ddr_wdata_4        ),//output [8*DQ_WIDTH- 1'b1 : 0] ddr_wdata,
        .ddr_wdata_req    (  ddr_wdata_req_4    ),//input                         ddr_wdata_req,
                                              
        .frame_wcnt       (                   ),//output [FRAME_CNT_WIDTH-1 :0] frame_wcnt,
        .frame_wirq       (  frame_wirq_4       ), //output                        frame_wirq

        .H_NUM            (  H_NUM_4            ),//parameter                     H_NUM           = 12'd1920,
        .V_NUM            (  V_NUM_4            ),//parameter                     V_NUM           = 12'd1080,
        .sel_en           (  video_sel[4] | video_sel[0]    ),
        .scal_en          (  video_sel[4]                   )
    );

//******************arb*************************

    wire                       ddr_wreq_pre;

    reg                        ddr_wreq; 
    wire                       ddr_wreq_1;    
    wire                       ddr_wreq_2; 
    wire                       ddr_wreq_3; 
    wire                       ddr_wreq_4; 

    reg  [CTRL_ADDR_WIDTH- 1'b1 : 0] ddr_waddr;  
    wire [CTRL_ADDR_WIDTH- 1'b1 : 0] ddr_waddr_1;
    wire [CTRL_ADDR_WIDTH- 1'b1 : 0] ddr_waddr_2;
    wire [CTRL_ADDR_WIDTH- 1'b1 : 0] ddr_waddr_3;
    wire [CTRL_ADDR_WIDTH- 1'b1 : 0] ddr_waddr_4;
  
    reg  [LEN_WIDTH- 1'b1 : 0] ddr_wr_len;
    wire [LEN_WIDTH- 1'b1 : 0] ddr_wr_len_1;
    wire [LEN_WIDTH- 1'b1 : 0] ddr_wr_len_2;
    wire [LEN_WIDTH- 1'b1 : 0] ddr_wr_len_3;
    wire [LEN_WIDTH- 1'b1 : 0] ddr_wr_len_4; 
  
    reg  [8*MEM_DQ_WIDTH-1 : 0] ddr_wdata;
    wire [8*MEM_DQ_WIDTH-1 : 0] ddr_wdata_1;
    wire [8*MEM_DQ_WIDTH-1 : 0] ddr_wdata_2;
    wire [8*MEM_DQ_WIDTH-1 : 0] ddr_wdata_3;
    wire [8*MEM_DQ_WIDTH-1 : 0] ddr_wdata_4;
   
    wire                       ddr_wdata_req;
    reg                        ddr_wdata_req_1;
    reg                        ddr_wdata_req_2;
    reg                        ddr_wdata_req_3;
    reg                        ddr_wdata_req_4;

    wire                       ddr_wdone; 
    reg                        ddr_wdone_1;
    reg                        ddr_wdone_2;
    reg                        ddr_wdone_3;
    reg                        ddr_wdone_4;

localparam idle = 2'd0;
localparam busy = 2'd1;

reg [1:0] state;
reg [1:0] next_state;

assign ddr_wreq_pre = ddr_wreq_1 | ddr_wreq_2 | ddr_wreq_3 | ddr_wreq_4 ;

always @(posedge ddr_clk) begin
    if (~ddr_rstn) state <= idle;
    else state <= next_state;
end

always @(*) begin
    case (state)
        idle: begin
            if (ddr_wreq_pre) next_state = busy;
            else next_state = idle;
        end
        busy: begin
            if (ddr_wdone) next_state = idle;
            else next_state = busy;
        end
        default: next_state = idle;
    endcase
end

    reg [3:0] rsp_table;  

always @(posedge ddr_clk) begin
    if (~ddr_rstn) begin
        rsp_table <= 4'b0000;
    end
    else if (state == idle) begin
        if(ddr_wreq_1) begin
            rsp_table <= 4'b0001;
        end
        else if(ddr_wreq_2) begin
            rsp_table <= 4'b0010;
        end
        else if(ddr_wreq_3) begin
            rsp_table <= 4'b0100;
        end
        else if(ddr_wreq_4) begin
            rsp_table <= 4'b1000;
        end
        else begin
            rsp_table <= 4'd0;
        end
    end
    else if (ddr_wdone) rsp_table <= 4'd0;    //busy状态下，rsp_finish为1时，说明响应完成，将rsp_table清零
    else begin 
        rsp_table <= rsp_table;
    end
end

always @(*) begin
    case (rsp_table)
        4'b0001 :begin
            ddr_wreq =  ddr_wreq_1;
            ddr_waddr = ddr_waddr_1;
            ddr_wr_len = ddr_wr_len_1;
            ddr_wdata = ddr_wdata_1;

            ddr_wdata_req_1 = ddr_wdata_req;
            ddr_wdata_req_2 = 1'b0;
            ddr_wdata_req_3 = 1'b0;
            ddr_wdata_req_4 = 1'b0;

            ddr_wdone_1 = ddr_wdone;
            ddr_wdone_2 = 1'b0 ;
            ddr_wdone_3 = 1'b0 ;
            ddr_wdone_4 = 1'b0 ;
        end
        4'b0010 :begin
            ddr_wreq =  ddr_wreq_2;
            ddr_waddr = ddr_waddr_2;
            ddr_wr_len = ddr_wr_len_2;
            ddr_wdata = ddr_wdata_2;

            ddr_wdata_req_1 = 1'b0;
            ddr_wdata_req_2 = ddr_wdata_req;
            ddr_wdata_req_3 = 1'b0;
            ddr_wdata_req_4 = 1'b0;

            ddr_wdone_1 = 1'b0;
            ddr_wdone_2 = ddr_wdone ;
            ddr_wdone_3 = 1'b0 ;
            ddr_wdone_4 = 1'b0 ;
        end
        4'b0100 :begin
            ddr_wreq =  ddr_wreq_3;
            ddr_waddr = ddr_waddr_3;
            ddr_wr_len = ddr_wr_len_3;
            ddr_wdata = ddr_wdata_3;

            ddr_wdata_req_1 = 1'b0;
            ddr_wdata_req_2 = 1'b0;
            ddr_wdata_req_3 = ddr_wdata_req;
            ddr_wdata_req_4 = 1'b0;

            ddr_wdone_1 = 1'b0;
            ddr_wdone_2 = 1'b0 ;
            ddr_wdone_3 = ddr_wdone ;
            ddr_wdone_4 = 1'b0 ;
        end
        4'b1000 :begin
            ddr_wreq =  ddr_wreq_4;
            ddr_waddr = ddr_waddr_4;
            ddr_wr_len = ddr_wr_len_4;
            ddr_wdata = ddr_wdata_4;

            ddr_wdata_req_1 = 1'b0;
            ddr_wdata_req_2 = 1'b0;
            ddr_wdata_req_3 = 1'b0;
            ddr_wdata_req_4 = ddr_wdata_req;
 
            ddr_wdone_1 = 1'b0;
            ddr_wdone_2 = 1'b0 ;
            ddr_wdone_3 = 1'b0 ;
            ddr_wdone_4 = ddr_wdone ;
        end
        default :begin
            ddr_wreq =  1'b0;
            ddr_waddr = 'd0;
            ddr_wr_len ='d0;
            ddr_wdata = 'd0;

            ddr_wdata_req_1 = 1'b0;
            ddr_wdata_req_2 = 1'b0;
            ddr_wdata_req_3 = 1'b0;
            ddr_wdata_req_4 = 1'b0;
 
            ddr_wdone_1 = 1'b0;
            ddr_wdone_2 = 1'b0 ;
            ddr_wdone_3 = 1'b0 ;
            ddr_wdone_4 = 1'b0 ;
        end
    endcase
end


//*******************************************************
    
    always @(posedge ddr_clk)
    begin
        if(1'b1)
            init_done <= 1'b1;
        else
            init_done <= init_done;
    end 
    
    rd_buf #(
        .ADDR_WIDTH       (  CTRL_ADDR_WIDTH  ),//parameter                     ADDR_WIDTH      = 6'd27,
        .ADDR_OFFSET      (  32'h0000_0000    ),//parameter                     ADDR_OFFSET     = 32'h0000_0000,
        .H_NUM            (  H_NUM            ),//parameter                     H_NUM           = 12'd1920,
        .V_NUM            (  V_NUM            ),//parameter                     V_NUM           = 12'd1080,
        .DQ_WIDTH         (  MEM_DQ_WIDTH     ),//parameter                     DQ_WIDTH        = 7'd32,
        .LEN_WIDTH        (  LEN_WIDTH        ),//parameter                     LEN_WIDTH       = 6'd16,
        .PIX_WIDTH        (  PIX_WIDTH        ),//parameter                     PIX_WIDTH       = 6'd24,
        .LINE_ADDR_WIDTH  (  LINE_ADDR_WIDTH  ),//parameter                     LINE_ADDR_WIDTH = 4'd19,
        .FRAME_CNT_WIDTH  (  FRAME_CNT_WIDTH  ) //parameter                     FRAME_CNT_WIDTH = 4'd8
    ) rd_buf (
        .ddr_clk         (  ddr_clk           ),//input                         ddr_clk,
        .ddr_rstn        (  ddr_rstn          ),//input                         ddr_rstn,

        .vout_clk        (  vout_clk          ),//input                         vout_clk,
        .rd_fsync        (  rd_fsync          ),//input                         rd_fsync,
        .rd_en           (  rd_en             ),//input                         rd_en,
        .vout_de         (  vout_de           ),//output                        vout_de,
        .vout_data       (  vout_data         ),//output [PIX_WIDTH- 1'b1 : 0]  vout_data,
        
        .init_done       (  init_done         ),//input                         init_done,
      
        .ddr_rreq        (  rd_cmd_en         ),//output                        ddr_rreq,
        .ddr_raddr       (  rd_cmd_addr       ),//output [ADDR_WIDTH- 1'b1 : 0] ddr_raddr,
        .ddr_rd_len      (  rd_cmd_len        ),//output [LEN_WIDTH- 1'b1 : 0]  ddr_rd_len,
        .ddr_rrdy        (  rd_cmd_ready      ),//input                         ddr_rrdy,
        .ddr_rdone       (  rd_cmd_done       ),//input                         ddr_rdone,
                                              
        .ddr_rdata       (  read_rdata        ),//input [8*DQ_WIDTH- 1'b1 : 0]  ddr_rdata,
        .ddr_rdata_en    (  read_en           ) //input                         ddr_rdata_en,
    );
    
    wr_rd_ctrl_top#(
        .CTRL_ADDR_WIDTH  (  CTRL_ADDR_WIDTH  ),//parameter                    CTRL_ADDR_WIDTH      = 28,
        .MEM_DQ_WIDTH     (  MEM_DQ_WIDTH     ) //parameter                    MEM_DQ_WIDTH         = 16
    )wr_rd_ctrl_top (                         
        .clk              (  ddr_clk          ),//input                        clk            ,            
        .rstn             (  ddr_rstn         ),//input                        rstn           ,            
                                              
        .wr_cmd_en        (  ddr_wreq         ),//input                        wr_cmd_en   ,
        .wr_cmd_addr      (  ddr_waddr        ),//input  [CTRL_ADDR_WIDTH-1:0] wr_cmd_addr ,
        .wr_cmd_len       (  ddr_wr_len       ),//input  [31：0]               wr_cmd_len  ,
        .wr_cmd_ready     (  ddr_wrdy         ),//output                       wr_cmd_ready,
        .wr_cmd_done      (  ddr_wdone        ),//output                       wr_cmd_done,
        .wr_bac           (  ddr_wr_bac       ),//output                       wr_bac,                                     
        .wr_ctrl_data     (  ddr_wdata        ),//input  [MEM_DQ_WIDTH*8-1:0]  wr_ctrl_data,
        .wr_data_re       (  ddr_wdata_req    ),//output                       wr_data_re  ,
                                              
        .rd_cmd_en        (  rd_cmd_en        ),//input                        rd_cmd_en   ,
        .rd_cmd_addr      (  rd_cmd_addr      ),//input  [CTRL_ADDR_WIDTH-1:0] rd_cmd_addr ,
        .rd_cmd_len       (  rd_cmd_len       ),//input  [31：0]               rd_cmd_len  ,
        .rd_cmd_ready     (  rd_cmd_ready     ),//output                       rd_cmd_ready, 
        .rd_cmd_done      (  rd_cmd_done      ),//output                       rd_cmd_done,
                                              
        .read_ready       (  read_ready       ),//input                        read_ready  ,    
        .read_rdata       (  read_rdata       ),//output [MEM_DQ_WIDTH*8-1:0]  read_rdata  ,    
        .read_en          (  read_en          ),//output                       read_en     ,                                          
        // write channel                        
        .axi_awaddr       (  axi_awaddr       ),//output [CTRL_ADDR_WIDTH-1:0] axi_awaddr     ,  
        .axi_awid         (  axi_awid         ),//output [3:0]                 axi_awid       ,
        .axi_awlen        (  axi_awlen        ),//output [3:0]                 axi_awlen      ,
        .axi_awsize       (  axi_awsize       ),//output [2:0]                 axi_awsize     ,
        .axi_awburst      (  axi_awburst      ),//output [1:0]                 axi_awburst    , //only support 2'b01: INCR
        .axi_awready      (  axi_awready      ),//input                        axi_awready    ,
        .axi_awvalid      (  axi_awvalid      ),//output                       axi_awvalid    ,
                                              
        .axi_wdata        (  axi_wdata        ),//output [MEM_DQ_WIDTH*8-1:0]  axi_wdata      ,
        .axi_wstrb        (  axi_wstrb        ),//output [MEM_DQ_WIDTH -1 :0]  axi_wstrb      ,
        .axi_wlast        (  axi_wlast        ),//output                       axi_wlast      ,
        .axi_wvalid       (  axi_wvalid       ),//output                       axi_wvalid     ,
        .axi_wready       (  axi_wready       ),//input                        axi_wready     ,
        .axi_bid          (  4'd0             ),//input  [3 : 0]               axi_bid        , // Master Interface Write Response.
        .axi_bresp        (  2'd0             ),//input  [1 : 0]               axi_bresp      , // Write response. This signal indicates the status of the write transaction.
        .axi_bvalid       (  1'b0             ),//input                        axi_bvalid     , // Write response valid. This signal indicates that the channel is signaling a valid write response.
        .axi_bready       (                   ),//output                       axi_bready     ,
                                              
        // read channel                          
        .axi_araddr       (  axi_araddr       ),//output [CTRL_ADDR_WIDTH-1:0] axi_araddr     ,    
        .axi_arid         (  axi_arid         ),//output [3:0]                 axi_arid       ,
        .axi_arlen        (  axi_arlen        ),//output [3:0]                 axi_arlen      ,
        .axi_arsize       (  axi_arsize       ),//output [2:0]                 axi_arsize     ,
        .axi_arburst      (  axi_arburst      ),//output [1:0]                 axi_arburst    ,
        .axi_arvalid      (  axi_arvalid      ),//output                       axi_arvalid    , 
        .axi_arready      (  axi_arready      ),//input                        axi_arready    , //only support 2'b01: INCR
                                              
        .axi_rready       (  axi_rready       ),//output                       axi_rready     ,
        .axi_rdata        (  axi_rdata        ),//input  [MEM_DQ_WIDTH*8-1:0]  axi_rdata      ,
        .axi_rvalid       (  axi_rvalid       ),//input                        axi_rvalid     ,
        .axi_rlast        (  axi_rlast        ),//input                        axi_rlast      ,
        .axi_rid          (  axi_rid          ),//input  [3:0]                 axi_rid        ,
        .axi_rresp        (  2'd0             ) //input  [1:0]                 axi_rresp      
    );


endmodule
