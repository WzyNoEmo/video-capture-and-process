`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Meyesemi
// Engineer: Nill
// 
// Create Date: 07/03/23 19:13:35
// Design Name: 
// Module Name: wr_buf
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
module wr_buf_4 #(
    parameter                     ADDR_WIDTH      = 6'd27,
    parameter                     ADDR_OFFSET     = 32'h0000_0000,
    parameter                     H_NUM           = 12'd1920,
    parameter                     V_NUM           = 12'd1080,
    parameter                     DQ_WIDTH        = 12'd16,
    parameter                     LEN_WIDTH       = 12'd16,
    parameter                     PIX_WIDTH       = 12'd24,
    parameter                     LINE_ADDR_WIDTH = 16'd19,
    parameter                     FRAME_CNT_WIDTH = 16'd8
) (     
    input  [31:0]                 CHANNEL_OFFSET,                          
    input                         ddr_clk,
    input                         ddr_rstn,
                                  
    input                         wr_clk,
    input                         wr_fsync,    //场同步信号
    input                         wr_en,    //de_in
    input  [PIX_WIDTH- 1'b1 : 0]  wr_data,
    
    input                         rd_bac,
    output                        ddr_wreq,
    output [ADDR_WIDTH- 1'b1 : 0] ddr_waddr,
    output [LEN_WIDTH- 1'b1 : 0]  ddr_wr_len,
    input                         ddr_wrdy,
    input                         ddr_wdone,
    output [8*DQ_WIDTH- 1'b1 : 0] ddr_wdata,
    input                         ddr_wdata_req,
    
    output [FRAME_CNT_WIDTH-1 :0] frame_wcnt,
    output                        frame_wirq
);
    localparam RAM_WIDTH      = 16'd32;
    localparam DDR_DATA_WIDTH = DQ_WIDTH * 8;
    localparam WR_LINE_NUM    = H_NUM*PIX_WIDTH/RAM_WIDTH;              //一行图像数据需要写几个BUFF的RAM（几次写）1280*16/32=640
    localparam RD_LINE_NUM    = WR_LINE_NUM*RAM_WIDTH/DDR_DATA_WIDTH;   //DDR一次突发读的长度（几次读）可以读完一行图像数据  640*32/128=160
    localparam DDR_ADDR_OFFSET= RD_LINE_NUM*DDR_DATA_WIDTH/DQ_WIDTH;    //一行到下一行数据在DDR的地址偏移    160*128/16=1280
    
    //===========================================================================
    reg       wr_fsync_1d;
    reg       wr_en_1d;
    wire      wr_rst;
    reg       wr_enable=0;
    
    reg       ddr_rstn_1d,ddr_rstn_2d;
    
    always @(posedge wr_clk)
    begin
        wr_fsync_1d <= wr_fsync;
        wr_en_1d <= wr_en;
        ddr_rstn_1d <= ddr_rstn;
        ddr_rstn_2d <= ddr_rstn_1d;
        
        if(~wr_fsync_1d & wr_fsync && ddr_rstn_2d)     
            wr_enable <= 1'b1;                    //wr_enable在ddr复位完成后且第一次场信号来的时候保持一直拉高
        else 
            wr_enable <= wr_enable;                               
    end 
    
    assign wr_rst = (~wr_fsync_1d & wr_fsync) | (~ddr_rstn_2d);    //一帧写之前，wr_rst拉高
    
    //===========================================================================
    reg      rd_fsync_1d,rd_fsync_2d,rd_fsync_3d;
    wire     rd_rst;
    always @(posedge ddr_clk)
    begin
        rd_fsync_1d <= wr_fsync;
        rd_fsync_2d <= rd_fsync_1d;
        rd_fsync_3d <= rd_fsync_2d;
    end 
    
    assign rd_rst = (~rd_fsync_3d && rd_fsync_2d) | (~ddr_rstn);    ////一帧写之前，rd_rst拉高，rd_fsync拉高

    //===========================================================================
    // wr_addr control

    //wr_enable持续高，wr_en一个像素点一次，write_en一次写（两个像素点）一次
    //写是pixclk，读是ddr_clk
    
    reg [14:0]                 x_cnt;
    reg [14:0]                 y_cnt;
    reg [31 : 0]  write_data;
    reg [PIX_WIDTH- 1'b1 : 0]  wr_data_1d;
    reg [PIX_WIDTH- 1'b1 : 0]  wr_data_2d;
    reg                        write_en;    //一个32bit数据形成，write_en拉高
    reg [11:0]                 wr_addr=0;
    

        always @(posedge wr_clk)
        begin
            wr_data_1d <= wr_data;
            wr_data_2d <= wr_data_1d;
            write_en <= (x_cnt[1:0]==2'b11&&y_cnt[0])?1'b1:1'b0;
            if(x_cnt[1:0]==2'b11&&y_cnt[0])
                write_data <= {wr_data,wr_data_2d};
            else
                write_data <= write_data;
        end 


    always @(posedge wr_clk)
    begin
        if(wr_rst)
            wr_addr <= 12'd0;
        else
        begin
            if(write_en & wr_enable)            //一次写，addr+1
                wr_addr <= wr_addr + 12'd1;
            else
                wr_addr <= wr_addr;
        end 
    end

    always @(posedge wr_clk)
    begin 
        if(wr_rst)
            y_cnt <= 12'd0;
        else if(~wr_en_1d & wr_en & wr_enable)
            y_cnt <= y_cnt + 1'b1;
        else
            y_cnt <= y_cnt;
    end 

    always @(posedge wr_clk)
    begin 
        if(wr_rst)
            x_cnt <= 12'd0;
        else if(wr_en & wr_enable)        //一个像素点,x_cnt+1
            x_cnt <= x_cnt + 1'b1;
        else
            x_cnt <= 12'd0;
    end 
        
    reg  [9:0] rd_addr=0;
    wire [127:0] rd_wdata;
    reg  [127:0] rd_wdata_1d=0;
    wr_fram_buf wr_fram_buf4 (
        .wr_data            (  write_data     ),// input [31:0]               
        .wr_addr            (  wr_addr        ),// input [11:0]               
        .wr_en              (  write_en       ),// input                      
        .wr_clk             (  wr_clk         ),// input                      
        .wr_rst             (  ~ddr_rstn_2d   ),// input    
                          
        .rd_addr            (  rd_addr        ),// input [9:0]                
        .rd_data            (  rd_wdata       ),// output [127:0]             
        .rd_clk             (  ddr_clk        ),// input                      
        .rd_rst             (  ~ddr_rstn      ) // input                      
    );
    
    reg rd_pulse;   //让DDR读取数据的脉冲信号
    always @(posedge wr_clk)
    begin
        if(x_cnt > 12'd1260  & y_cnt[0] & wr_enable)    //此处减去H_NUM中的5个像素，是为了预留一些保护时间，避免出现数据读取不完整的问题
            rd_pulse <= 1'b1;
        else
            rd_pulse <= 1'b0; 
    end 

    reg rd_pulse_1d,rd_pulse_2d,rd_pulse_3d;
    always @(posedge ddr_clk)
    begin 
        rd_pulse_1d <= rd_pulse;
        rd_pulse_2d <= rd_pulse_1d;
        rd_pulse_3d <= rd_pulse_2d;
    end 
    
    wire rd_trig;
    assign rd_trig = ~rd_pulse_3d && rd_pulse_2d;    //rd_pulse边沿触发rd_trig
    
    reg ddr_wr_req=0;
    reg ddr_wr_req_1d;
    assign ddr_wreq =ddr_wr_req;
    
    //ddr_wr_req 表示写通道请求信号（输出）用于向DDR芯片发送写请求， ddr_wdata_req 表示写数据请求信号（输入）告诉DDR控制器下一次写操作的数据准备已经完成
    //如果读触发信号 rd_trig 为1，将写通道请求信号设为1，表示需要启动写操作；如果写数据请求信号 ddr_wdata_req 为1，则将写通道请求信号设为0，以结束写操作
    always @(posedge ddr_clk)
    begin 
        ddr_wr_req_1d <= ddr_wr_req;
        
        if(rd_trig)
            ddr_wr_req <= 1'b1;    //
        else if(ddr_wdata_req)
            ddr_wr_req <= 1'b0;
        else
            ddr_wr_req <= ddr_wr_req;
    end 

  //ddr_wr_req 边沿触发 rd_en_1d  
    reg  rd_en_1d;    
    reg  ddr_wdata_req_1d;
    always @(posedge ddr_clk)
    begin
        ddr_wdata_req_1d <= ddr_wdata_req;
        rd_en_1d <= ~ddr_wr_req_1d & ddr_wr_req;
    end 
    
    always @(posedge ddr_clk)
    begin
        if(ddr_wdata_req_1d | rd_en_1d)
            rd_wdata_1d <= rd_wdata;
        else 
            rd_wdata_1d <= rd_wdata_1d;
    end 
    
//rd_trig 触发 line_flag
    reg line_flag=0;
    always@(posedge ddr_clk)
    begin
        if(rd_rst)
            line_flag <= 1'b0;
        else if(rd_trig)
            line_flag <= 1'b1;
        else
            line_flag <= line_flag;
    end 
    
    always @(posedge ddr_clk)
    begin 
        if(rd_rst)
            rd_addr <= 1'b0;
        else if(~ddr_wr_req_1d & ddr_wr_req)
            rd_addr <= rd_addr + 1'b1;
        else if(ddr_wdata_req)
            rd_addr <= rd_addr + 1'b1;
        else if(rd_trig & line_flag)
            rd_addr <= rd_addr - 1'b1;
        else
            rd_addr <= rd_addr;
    end 
    
    reg [FRAME_CNT_WIDTH - 1'b1 :0] rd_frame_cnt=1;
    always @(posedge ddr_clk)
    begin 
        if(~ddr_rstn)
            rd_frame_cnt <= 'd0;
        else if(~rd_fsync_3d && rd_fsync_2d)    //rd_rst
            rd_frame_cnt <= rd_frame_cnt + 1'b1;
        else
            rd_frame_cnt <= rd_frame_cnt;
    end 

    reg [LINE_ADDR_WIDTH - 1'b1 :0] rd_cnt;    //行计数
    always @(posedge ddr_clk)
    begin 
        if(rd_rst)
            rd_cnt <= 9'd0;
        else if(ddr_wdone)
            rd_cnt <= rd_cnt + 'd1280;
        else
            rd_cnt <= rd_cnt;
    end 
    
    reg wirq_en=0;
    always @(posedge ddr_clk)
    begin
        if (~rd_fsync_2d && rd_fsync_3d)
            wirq_en <= 1'b1;
        else
            wirq_en <= wirq_en;
    end 

    assign ddr_wdata = (~ddr_wdata_req_1d & ddr_wdata_req) ? rd_wdata_1d : rd_wdata;
    assign ddr_waddr = {rd_frame_cnt[0],rd_cnt} + ADDR_OFFSET + CHANNEL_OFFSET;
    assign ddr_wr_len = RD_LINE_NUM;    //DDR需要160次写
    assign frame_wcnt = rd_frame_cnt;
    assign frame_wirq = wirq_en && rd_fsync_3d;
    
endmodule
