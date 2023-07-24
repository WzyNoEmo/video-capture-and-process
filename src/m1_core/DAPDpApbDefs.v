// ----------------------------------------------------------------------------
//  The confidential and proprietary information contained in this file may
//  only be used by a person authorised under and to the extent permitted  
//  by a subsisting licensing agreement from ARM Limited.                  
//                                                                         
//                (C) COPYRIGHT 2004-2008 ARM Limited                      
//                    ALL RIGHTS RESERVED                                  
//                                                                         
//  This entire notice must be reproduced on all copies of this file       
//  and copies of this file may only be made by a person if such person is 
//  permitted to do so under the terms of a subsisting license agreement   
//  from ARM Limited.                                                      
//                                                                         
//  SVN Information                                                        
//                                                                         
//  Revision            : 1.63
//  Release Information : Cortex-M1-AT470-r1p0-00rel0
//                                                                         
// ----------------------------------------------------------------------------
//  Purpose : DAP DP APB Interface Definitions.
// ----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// APB state machine
//-----------------------------------------------------------------------------
`define DAP_APBIDLE     2'b00
`define DAP_APBSETUP    2'b01
`define DAP_APBENABLE   2'b11
`define DAP_APBEND      2'b10

//-----------------------------------------------------------------------------
// Transfer mode
//-----------------------------------------------------------------------------
`define DAP_M_NORMAL    2'b00
`define DAP_M_VERIFY    2'b01
`define DAP_M_FIND      2'b10
`define DAP_M_RSVD      2'b11
