//************************************************************************
//Copyright (c) 2015, PANGO MICROSYSTEMS,INC
//All Rights Reserved
//************************************************************************
`timescale 1ns / 1ns

// ***********************************************************************
// --- Module Description
// convert rgmii  to gmii 
// ***********************************************************************
// --- Module Definition
module pgs_tsmac_rgmii_to_gmii_v1_0  
(
 input        rst_n    ,
 input        rx_clk   ,
 input        rx_ctr   ,
 input        col_rgm  ,
 input        crs_rgm  ,
 input  [3:0] rxd_rgm  ,
 
 output       rx_dv_gm ,
 output       rx_er_gm ,
 output       col_gm   ,
 output       crs_gm   ,
 output [7:0] rxd_gm      
);

// ------------------------------------------------------------------------
// --- Port Declarations 
wire         rst            ;
wire         col_gm1        ;
wire         crs_gm1        ;
wire[1:0]    dpi_sts1       ;
wire[1:0]    dpi_sts2       ;
wire[1:0]    dpi_sts3       ;
wire[1:0]    dpi_sts4       ;
wire[1:0]    dpi_sts5       ;
wire[1:0]    dpi_sts6       ;
wire[1:0]    dpi_sts7       ;
wire         rx_er_gm_xor_rx_dv_gm;
assign       rx_er_gm = rx_er_gm_xor_rx_dv_gm ^ rx_dv_gm;

// ------------------------------------------------------------------------
// --- Parameter Declarations
parameter TP = 1;      
assign  rst=~rst_n;
  
wire [5:0] nc1;
GTP_ISERDES #(
 .ISERDES_MODE("IDDR"),   //"IDDR","IMDDR","IGDES4","IMDES4","IGDES7","IGDES8","IMDES8"
 .GRS_EN      ("TRUE"),          //"TRUE"; "FALSE"
 .LRS_EN      ("TRUE")           //"TRUE"; "FALSE"
) igddr1(
  .DI    (rxd_rgm[0]),
  .ICLK  (1'd0      ),
  .DESCLK(rx_clk    ),
  .RCLK  (rx_clk    ),
  .WADDR (3'd0),
  .RADDR (3'd0),
  .RST   (rst),
  .DO    ({rxd_gm[4],rxd_gm[0],nc1})
);

wire [5:0] nc2;
GTP_ISERDES #(
 .ISERDES_MODE("IDDR"),   //"IDDR","IMDDR","IGDES4","IMDES4","IGDES7","IGDES8","IMDES8"
 .GRS_EN      ("TRUE"),          //"TRUE"; "FALSE"
 .LRS_EN      ("TRUE")           //"TRUE"; "FALSE"
) igddr2(
  .DI    (rxd_rgm[1]),
  .ICLK  (1'd0      ),
  .DESCLK(rx_clk    ),
  .RCLK  (rx_clk    ),
  .WADDR (3'd0),
  .RADDR (3'd0),
  .RST   (rst),
  .DO    ({rxd_gm[5],rxd_gm[1],nc2})
);

wire [5:0] nc3;
GTP_ISERDES #(
 .ISERDES_MODE("IDDR"),   //"IDDR","IMDDR","IGDES4","IMDES4","IGDES7","IGDES8","IMDES8"
 .GRS_EN      ("TRUE"),          //"TRUE"; "FALSE"
 .LRS_EN      ("TRUE")           //"TRUE"; "FALSE"
) igddr3(
  .DI    (rxd_rgm[2]),
  .ICLK  (1'd0      ),
  .DESCLK(rx_clk    ),
  .RCLK  (rx_clk    ),
  .WADDR (3'd0),
  .RADDR (3'd0),
  .RST   (rst),
  .DO    ({rxd_gm[6],rxd_gm[2],nc3})
);

wire [5:0] nc4;
GTP_ISERDES #(
 .ISERDES_MODE("IDDR"),   //"IDDR","IMDDR","IGDES4","IMDES4","IGDES7","IGDES8","IMDES8"
 .GRS_EN      ("TRUE"),          //"TRUE"; "FALSE"
 .LRS_EN      ("TRUE")           //"TRUE"; "FALSE"
) igddr4(
  .DI    (rxd_rgm[3]),
  .ICLK  (1'd0      ),
  .DESCLK(rx_clk    ),
  .RCLK  (rx_clk    ),
  .WADDR (3'd0),
  .RADDR (3'd0),
  .RST   (rst),
  .DO    ({rxd_gm[7],rxd_gm[3],nc4})
);

wire [5:0] nc5;
GTP_ISERDES #(
 .ISERDES_MODE("IDDR"),   //"IDDR","IMDDR","IGDES4","IMDES4","IGDES7","IGDES8","IMDES8"
 .GRS_EN      ("TRUE"),          //"TRUE"; "FALSE"
 .LRS_EN      ("TRUE")           //"TRUE"; "FALSE"
) igddr5(
  .DI    (rx_ctr    ),
  .ICLK  (1'd0      ),
  .DESCLK(rx_clk    ),
  .RCLK  (rx_clk    ),
  .WADDR (3'd0),
  .RADDR (3'd0),
  .RST   (rst),
  .DO    ({rx_er_gm_xor_rx_dv_gm,rx_dv_gm,nc5})
);

wire [5:0] nc6;
GTP_ISERDES #(
 .ISERDES_MODE("IDDR"),   //"IDDR","IMDDR","IGDES4","IMDES4","IGDES7","IGDES8","IMDES8"
 .GRS_EN      ("TRUE"),          //"TRUE"; "FALSE"
 .LRS_EN      ("TRUE")           //"TRUE"; "FALSE"
) igddr6(
  .DI    (col_rgm    ),
  .ICLK  (1'd0      ),
  .DESCLK(rx_clk    ),
  .RCLK  (rx_clk    ),
  .WADDR (3'd0),
  .RADDR (3'd0),
  .RST   (rst),
  .DO    ({col_gm,col_gm1,nc6})
);

wire [5:0] nc7;
GTP_ISERDES #(
 .ISERDES_MODE("IDDR"),   //"IDDR","IMDDR","IGDES4","IMDES4","IGDES7","IGDES8","IMDES8"
 .GRS_EN      ("TRUE"),          //"TRUE"; "FALSE"
 .LRS_EN      ("TRUE")           //"TRUE"; "FALSE"
) igddr7(
  .DI    (crs_rgm   ),
  .ICLK  (1'd0      ),
  .DESCLK(rx_clk    ),
  .RCLK  (rx_clk    ),
  .WADDR (3'd0),
  .RADDR (3'd0),
  .RST   (rst),
  .DO    ({crs_gm,crs_gm1,nc7})
);

endmodule                         