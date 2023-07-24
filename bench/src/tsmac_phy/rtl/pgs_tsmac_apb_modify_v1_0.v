//************************************************************************
//Copyright (c) 2015, PANGO MICROSYSTEMS,INC
//All Rights Reserved
//************************************************************************
`timescale 1ns / 1ns

// ***********************************************************************
// --- Module Description
// According to APB protocol,hstcsn and penable are valid when they are set
// also hstwrn set "1" meaning write conversely read. In the module of pehst
// hstcsn and hstwrn are valid when they set "0",so we inverse the hstwrn
// and hstcsn.  
// ***********************************************************************
// --- Module Definition
module pgs_tsmac_apb_modify_v1_0
(
   hstcsn  ,
   hstwrn  , 
   hstable ,
   pwrt    ,
   psel  
);

// ------------------------------------------------------------------------
// --- Port Declarations
input         hstcsn;    //APB selection 
input         hstwrn;    //APB write 
input         hstable ;  //APB enable
output        pwrt;      //inverse write 
output        psel;      //inverse selection


 wire     penable;
 assign   penable=hstcsn&hstable;                              
 assign   pwrt=~hstwrn;
 assign   psel=~penable; 

endmodule  
  