//************************************************************************
//Copyright (c) 2015, PANGO MICROSYSTEMS,INC
//All Rights Reserved
//************************************************************************
`timescale 1ns / 1ns

// ***********************************************************************
// --- Module Description
// rgmii and gmii convert mutual
//   
// ***********************************************************************
// --- Module Definition
module pgs_tsmac_rgmii_gmii_convert_v1_0
(
 input        tx_rst   ,
 input        rx_rst   ,
 input        tx_clk   ,
 input        tx_en_gm ,           //transmit enable from gmii 
 input  [7:0] txd_gm   ,           //transmit data from gmii 
 input        tx_er_gm ,           //transmit error from gmii            
                       
 input        rx_clk   ,
 input        rx_ctr   ,           //rx_ctr indicate receive data valid when posedge rx_clk ,or indicate receive error
 input        col_rgm  ,           //collision from rgmii
 input        crs_rgm  ,           //carrier sense from rgmii
 input  [3:0] rxd_rgm  ,           //receive data from rgmii
                       
 output [3:0] txd_rgm  ,           //the input data of rgmii,converted from gmii
 output       tx_ctr   ,           //the input sign of rgmii,converted from gmii.tx_ctr indicate transmit data valid when posedge tx_clk ,or indicate transmit error
 output       col_gm   ,           //collision,the input sign of gmii 
 output       crs_gm   ,           //carrier sense,the input sign of gmii
 output       rx_dv_gm ,           //receive data valid ,the input sign of gmii
 output       rx_er_gm ,           //receive error ,the input sign of gmii  
 output [7:0] rxd_gm               //receive data ,the input sign of gmii
);

// ------------------------------------------------------------------------
// --- Port Declarations
  
wire [7:0] rxd_gm0;
reg  [7:0] rxd_gm1;

pgs_tsmac_gmii_to_rgmii_v1_0  U_pgs_tsmac_gmii_to_rgmii_v1_0
(
 .rst_n   (tx_rst  ) ,
 .tx_clk  (tx_clk  ) ,
 .tx_en_gm(tx_en_gm) ,
 .tx_er_gm(tx_er_gm) ,
 .txd_gm  (txd_gm  ) , 
 
 .txd_rgm (txd_rgm) ,
 .tx_ctr  (tx_ctr  ) 
);
//assign txd_rgm[7:4]=4'h0;
pgs_tsmac_rgmii_to_gmii_v1_0  U_pgs_tsmac_rgmii_to_gmii_v1_0
(
 .rst_n    (rx_rst   ),
 .rx_clk   (rx_clk   ),
 .rx_ctr   (rx_ctr   ),
 .col_rgm  (col_rgm  ) ,
 .crs_rgm  (crs_rgm  ) ,
 .rxd_rgm  (rxd_rgm),
 
 .rx_dv_gm (rx_dv_gm ),
 .rx_er_gm (rx_er_gm ),
 .rxd_gm   (rxd_gm0  ), 
 .col_gm   (col_gm   ),
 .crs_gm   (crs_gm   )   
);

always @ (posedge rx_clk or negedge rx_rst) begin
  if(~rx_rst) rxd_gm1 <= 16'h0;
  else rxd_gm1 <= rxd_gm0;     
end

assign rxd_gm = {rxd_gm0[3:0],rxd_gm1[7:4]};

endmodule