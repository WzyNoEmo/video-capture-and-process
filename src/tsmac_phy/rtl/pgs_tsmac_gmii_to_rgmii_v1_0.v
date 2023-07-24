//************************************************************************
//Copyright (c) 2015, PANGO MICROSYSTEMS,INC
//All Rights Reserved
//************************************************************************
`timescale 1ns / 1ns

// ***********************************************************************
// --- Module Description
// convert gmii to rgmii 
// ***********************************************************************
// --- Module Definition
module pgs_tsmac_gmii_to_rgmii_v1_0  
(
 input           rst_n   ,  
 input           tx_clk  ,
 input           tx_en_gm, 
 input           tx_er_gm,
 input     [7:0] txd_gm  , 
  
 output       tx_ctr  ,
 output  [3:0]txd_rgm   
);

// ------------------------------------------------------------------------

//register
reg          rtx_en_gm ;
reg          rtx_er_gm ;
reg [7:0]    rtxd_gm   ;            

wire         padt1     ;
wire         padt2     ;
wire         padt3     ;
wire         padt4     ;
wire         padt5     ;

wire         stx_ctr   ;
wire  [3:0]  stxd_rgm  ;
// ------------------------------------------------------------------------
// --- Parameter Declarations
parameter TP = 1;
   
//---------------------------------------------------------
//always @(negedge tx_clk or negedge rst_n)
always @(posedge tx_clk or negedge rst_n)
begin
if(!rst_n)
    begin
    rtx_en_gm <= 1'b0;
    rtx_er_gm <= 1'b0;
    rtxd_gm   <= 8'h00;   
    end
else 
    begin
    rtx_en_gm <= tx_en_gm;
    rtx_er_gm <= tx_er_gm^tx_en_gm;
    rtxd_gm   <= txd_gm  ;     
    end    
end


//always @(posedge tx_clk or negedge rst_n)
//begin
//if(!rst_n)
//    begin
//    txd_rgm_dly1  <= #TP 4'b0;
////    tx_ctr_dly1   <= #TP 1'b0;
//    end
//else if(rtx_en_gm)
//    begin
//    txd_rgm_dly1  <= #TP rtxd_gm[3:0];
////    tx_ctr_dly1   <= #TP rtx_en_gm   ;
//    end    
//end
//
//always @(negedge tx_clk )
//begin
//if(rtx_en_gm)
//    begin
//    txd_rgm_dly1  <= #TP rtxd_gm[7:4];
////    tx_ctr_dly1   <= #TP rtx_er_gm   ;
//    end    
//end
wire rst;
assign rst=~rst_n;
//----------------------------------------
GTP_OSERDES #(
 .OSERDES_MODE("ODDR"),  //"ODDR","OMDDR","OGSER4","OMSER4","OGSER7","OGSER8",OMSER8"
 .WL_EXTEND   ("FALSE"),     //"TRUE"; "FALSE"
 .GRS_EN      ("TRUE"),         //"TRUE"; "FALSE"
 .LRS_EN      ("TRUE"),          //"TRUE"; "FALSE"
 .TSDDR_INIT  (1'b0)         //1'b0;1'b1
) gtp_ogddr1(
   .DO    (stx_ctr),
   .TQ    (padt1),
   .DI    ({6'd0,rtx_er_gm,rtx_en_gm}),
   .TI    (4'd0),
   .RCLK  (tx_clk),
   .SERCLK(tx_clk),
   .OCLK  (1'd0),
   .RST   (rst)
); 

GTP_OUTBUFT  gtp_outbuft1
(
    
    .I(stx_ctr),     
    .T(padt1)  ,
    .O(tx_ctr)        
);
//----------------------------------------

GTP_OSERDES #(
 .OSERDES_MODE("ODDR"),  //"ODDR","OMDDR","OGSER4","OMSER4","OGSER7","OGSER8",OMSER8"
 .WL_EXTEND   ("FALSE"),     //"TRUE"; "FALSE"
 .GRS_EN      ("TRUE"),         //"TRUE"; "FALSE"
 .LRS_EN      ("TRUE"),          //"TRUE"; "FALSE"
 .TSDDR_INIT  (1'b0)         //1'b0;1'b1
) gtp_ogddr2(
   .DO    (stxd_rgm[3]),
   .TQ    (padt2),
   .DI    ({6'd0,rtxd_gm[7],rtxd_gm[3]}),
   .TI    (4'd0),
   .RCLK  (tx_clk),
   .SERCLK(tx_clk),
   .OCLK  (1'd0),
   .RST   (rst)
); 

GTP_OUTBUFT  gtp_outbuft2
(
    
    .I(stxd_rgm[3]),     
    .T(padt2)  ,
    .O(txd_rgm[3])        
);
//---------------------------------------

GTP_OSERDES #(
 .OSERDES_MODE("ODDR"),  //"ODDR","OMDDR","OGSER4","OMSER4","OGSER7","OGSER8",OMSER8"
 .WL_EXTEND   ("FALSE"),     //"TRUE"; "FALSE"
 .GRS_EN      ("TRUE"),         //"TRUE"; "FALSE"
 .LRS_EN      ("TRUE"),          //"TRUE"; "FALSE"
 .TSDDR_INIT  (1'b0)         //1'b0;1'b1
) gtp_ogddr3(
   .DO    (stxd_rgm[2]),
   .TQ    (padt3),
   .DI    ({6'd0,rtxd_gm[6],rtxd_gm[2]}),
   .TI    (4'd0),
   .RCLK  (tx_clk),
   .SERCLK(tx_clk),
   .OCLK  (1'd0),
   .RST   (rst)
); 

GTP_OUTBUFT  gtp_outbuft3
(    
    .I(stxd_rgm[2]),     
    .T(padt3)  ,
    .O(txd_rgm[2])        
);
//--------------------------------------

GTP_OSERDES #(
 .OSERDES_MODE("ODDR"),  //"ODDR","OMDDR","OGSER4","OMSER4","OGSER7","OGSER8",OMSER8"
 .WL_EXTEND   ("FALSE"),     //"TRUE"; "FALSE"
 .GRS_EN      ("TRUE"),         //"TRUE"; "FALSE"
 .LRS_EN      ("TRUE"),          //"TRUE"; "FALSE"
 .TSDDR_INIT  (1'b0)         //1'b0;1'b1
) gtp_ogddr4(
   .DO    (stxd_rgm[1]),
   .TQ    (padt4),
   .DI    ({6'd0,rtxd_gm[5],rtxd_gm[1]}),
   .TI    (4'd0),
   .RCLK  (tx_clk),
   .SERCLK(tx_clk),
   .OCLK  (1'd0),
   .RST   (rst)
); 

GTP_OUTBUFT  gtp_outbuft4
(
    .I(stxd_rgm[1]),     
    .T(padt4)  ,
    .O(txd_rgm[1])        
);
//--------------------------------------

GTP_OSERDES #(
 .OSERDES_MODE("ODDR"),  //"ODDR","OMDDR","OGSER4","OMSER4","OGSER7","OGSER8",OMSER8"
 .WL_EXTEND   ("FALSE"),     //"TRUE"; "FALSE"
 .GRS_EN      ("TRUE"),         //"TRUE"; "FALSE"
 .LRS_EN      ("TRUE"),          //"TRUE"; "FALSE"
 .TSDDR_INIT  (1'b0)         //1'b0;1'b1
) gtp_ogddr5(
   .DO    (stxd_rgm[0]),
   .TQ    (padt5),
   .DI    ({6'd0,rtxd_gm[4],rtxd_gm[0]}),
   .TI    (4'd0),
   .RCLK  (tx_clk),
   .SERCLK(tx_clk),
   .OCLK  (1'd0),
   .RST   (rst)
); 

GTP_OUTBUFT  gtp_outbuft5
(
    
    .I(stxd_rgm[0]),     
    .T(padt5)  ,
    .O(txd_rgm[0])        
);
endmodule
