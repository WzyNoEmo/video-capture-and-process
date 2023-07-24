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
//  Purpose : DAP JTAG-DP Definitions.
// ----------------------------------------------------------------------------

`include "DAPDpApbDefs.v"

//-----------------------------------------------------------------------------
// JTAG states
//-----------------------------------------------------------------------------
`define JTAGDP_E2D     4'b0000
`define JTAGDP_E1D     4'b0001
`define JTAGDP_SHD     4'b0010
`define JTAGDP_PDR     4'b0011
`define JTAGDP_SIR     4'b0100
`define JTAGDP_UDR     4'b0101
`define JTAGDP_CDR     4'b0110
`define JTAGDP_SDR     4'b0111
`define JTAGDP_E2I     4'b1000
`define JTAGDP_E1I     4'b1001
`define JTAGDP_SHI     4'b1010
`define JTAGDP_PIR     4'b1011
`define JTAGDP_RTI     4'b1100
`define JTAGDP_UIR     4'b1101
`define JTAGDP_CIR     4'b1110
`define JTAGDP_TLR     4'b1111

//-----------------------------------------------------------------------------
// Internal register locations
//-----------------------------------------------------------------------------
`define JTAGDP_EXTEST  4'b0000
`define JTAGDP_ABORT   4'b1000
`define JTAGDP_DPACC   4'b1010
`define JTAGDP_APACC   4'b1011
`define JTAGDP_IDCODE  4'b1110
`define JTAGDP_BYPASS  4'b1111

//-----------------------------------------------------------------------------
// Control
//-----------------------------------------------------------------------------
`define JTAGDP_CTRL    2'b01
`define JTAGDP_STAT    2'b01
`define JTAGDP_ADDR    2'b10
`define JTAGDP_DAPW    1'b0 
`define JTAGDP_DAPR    1'b1
`define JTAGDP_APBR    1'b0 
`define JTAGDP_APBW    1'b1 
`define JTAGDP_MUXSTAT 2'b01
`define JTAGDP_MUXADDR 2'b10
`define JTAGDP_MUXRBUF 2'b11
`define JTAGDP_AP      1'b0 
`define JTAGDP_DP      1'b1 

//-----------------------------------------------------------------------------
// Transfer count
//-----------------------------------------------------------------------------
`define JTAGDP_ZERO12  12'b000000000000

//-----------------------------------------------------------------------------
// TAP ID code
//-----------------------------------------------------------------------------
`define JTAGDP_DEVICEID 32'h4BA00477
