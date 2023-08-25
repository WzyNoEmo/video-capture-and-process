module sobel_top (
	input                       pix_clk,
	input                       rst,	
	input[7:0]                  i_r,
	input[7:0]                  i_g,
	input[7:0]                  i_b,
	input                       i_hs,
	input                       i_vs,
	input                       i_de,
    output[7:0]                 o_r,
    output[7:0]                 o_g,
    output[7:0]                 o_b,
    output                      o_hs,
    output                      o_vs,
    output                      o_de
);

wire [7:0]  ycbcr_y;

rgb_to_ycbcr rgb_to_ycbcr_inst (
	.clk(pix_clk),
	.rst(rst),	
	.rgb_r(i_r),
	.rgb_g(i_g),
	.rgb_b(i_b),
	.rgb_hs(i_hs),
	.rgb_vs(i_vs),
	.rgb_de(i_de),
	.ycbcr_y(ycbcr_y),
	.ycbcr_cb(),
	.ycbcr_cr(),
	.ycbcr_hs(ycbcr_hs),
	.ycbcr_vs(ycbcr_vs),
	.ycbcr_de(ycbcr_de)
);

//sobel-core-------------------------------------------------------

parameter VEDIO_X_LENTH=16'd1280;
parameter VEDIO_Y_LENTH=16'd720;
reg [23:0]pix_cnt_reg;        
wire [7:0]pix_data_line1;
wire [7:0]pix_data_line2;
wire [7:0]pix_data_line3;
wire fifo_rd_en1;
wire fifo_rd_en2;
wire fifo_wr_en1;
wire fifo_wr_en2;
wire[7:0]fifo1_data_read;
wire[7:0]fifo2_data_read;

assign  pix_data_line1=fifo2_data_read;
assign  pix_data_line2=fifo1_data_read;
assign  pix_data_line3=ycbcr_y;

always@(posedge pix_clk)begin
    if(rst)	pix_cnt_reg<='b0;
	else if(ycbcr_vs) pix_cnt_reg<='b0;
    else if(ycbcr_de) pix_cnt_reg<=pix_cnt_reg+'d1;
	else pix_cnt_reg<=pix_cnt_reg;
end

assign fifo_rd_en1=ycbcr_de&((pix_cnt_reg>=VEDIO_X_LENTH)?'b1:'b0);
assign fifo_rd_en2=ycbcr_de&((pix_cnt_reg>=VEDIO_X_LENTH*2)?'b1:'b0);
assign fifo_wr_en1=ycbcr_de;
assign fifo_wr_en2=ycbcr_de&((pix_cnt_reg>=VEDIO_X_LENTH)?'b1:'b0);

parameter KYR=306;
parameter KYG=601;
parameter KYB=116;
parameter OFFSET_Y=0;

reg[7:0]pix_reg11;
reg[7:0]pix_reg12;
reg[7:0]pix_reg13;
reg[7:0]pix_reg21;
reg[7:0]pix_reg22;
reg[7:0]pix_reg23;
reg[7:0]pix_reg31;
reg[7:0]pix_reg32;
reg[7:0]pix_reg33;

wire [12:0]gx_tmp;
wire [12:0]gy_tmp;
reg [12:0]gx_reg;
reg [12:0]gy_reg;

assign gx_tmp=gx_reg[12]?('d8192-gx_reg):gx_reg;//求绝对值
assign gy_tmp=gy_reg[12]?('d8192-gy_reg):gy_reg;//求绝对值

always@(posedge pix_clk)begin
    if(rst)begin
        gx_reg<='d0;
        gy_reg<='d0;
        pix_reg11<='d0; pix_reg12<='d0; pix_reg13<='d0;
        pix_reg21<='d0; pix_reg22<='d0; pix_reg23<='d0;
        pix_reg31<='d0; pix_reg32<='d0; pix_reg33<='d0;    
    end
    else begin
        pix_reg13<=pix_reg12; pix_reg12<=pix_reg11;pix_reg11<=pix_data_line1;
        pix_reg23<=pix_reg22; pix_reg22<=pix_reg21;pix_reg21<=pix_data_line2;
        pix_reg33<=pix_reg32; pix_reg32<=pix_reg31;pix_reg31<=pix_data_line3;
        gx_reg<=(pix_reg33+(pix_reg23+pix_reg23)+pix_reg13)-(pix_reg11+(pix_reg21+pix_reg21)+pix_reg31);
        gy_reg<=(pix_reg11+(pix_reg12+pix_reg12)+pix_reg13)-(pix_reg31+(pix_reg32+pix_reg32)+pix_reg33);
    end
end

sobel_fifo f1(
  .clk(pix_clk),                      // input
  .rst(ycbcr_vs),                      // input
  .wr_en(fifo_wr_en1),                  // input
  .wr_data(pix_data_line3),              // input [7:0]
  .wr_full(),              // output
  .almost_full(),      // output
  .rd_en(fifo_rd_en1),                  // input
  .rd_data(fifo1_data_read),              // output [7:0]
  .rd_empty(),            // output
  .almost_empty()     // output
);

sobel_fifo f2(
  .clk(pix_clk),                      // input
  .rst(ycbcr_vs),                      // input
  .wr_en(fifo_wr_en2),                  // input
  .wr_data(pix_data_line2),              // input [7:0]
  .wr_full(),              // output
  .almost_full(),      // output
  .rd_en(fifo_rd_en2),                  // input
  .rd_data(fifo2_data_read),              // output [7:0]
  .rd_empty(),            // output
  .almost_empty()     // output
);

assign sobel_out= (pix_cnt_reg>=VEDIO_X_LENTH*2) ? 255-(gx_tmp[6:0]+gy_tmp[6:0]) : 8'd0;

//-----------------------------------------------------------------
wire[7:0]                       sobel_out;
assign o_hs = ycbcr_hs;
assign o_vs = ycbcr_vs;
assign o_de = ycbcr_de;
assign o_r  = sobel_out[7:0];
assign o_g  = sobel_out[7:0];
assign o_b  = sobel_out[7:0];

endmodule