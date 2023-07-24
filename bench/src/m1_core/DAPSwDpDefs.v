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
//  Purpose : DAP SW-DP Definitions.
// ----------------------------------------------------------------------------

`include "DAPDpApbDefs.v"

//-----------------------------------------------------------------------------
// Wire Manager States
//-----------------------------------------------------------------------------
`define SWWM_IDLE    2'b00
`define SWWM_RESET   2'b01
`define SWWM_W4TRAIN 2'b10
`define SWWM_TRAIN   2'b11

//-----------------------------------------------------------------------------
// Serial Protocol states
//-----------------------------------------------------------------------------
// Reset state,
`define SWDP_SLERESET        5'b00000
// Header States
`define SWDP_SLEIDLE         5'b00001
`define SWDP_SLEBANK         5'b00010
`define SWDP_SLEDIR          5'b00011
`define SWDP_SLEADDR0        5'b00100
`define SWDP_SLEADDR1        5'b00101
`define SWDP_SLEPARITYH      5'b00110
`define SWDP_SLESTOPH        5'b00111
`define SWDP_SLEPARKH        5'b01000
`define SWDP_SLETRNH2        5'b01010
`define SWDP_SLETRNH1        5'b01011
`define SWDP_SLETRNH0        5'b01100
`define SWDP_UNUSED01        5'b01101
// Acknowledge States
`define SWDP_SLEACK0         5'b10000
`define SWDP_SLEACK1         5'b10001
`define SWDP_SLEACK2         5'b10010
// Write States
`define SWDP_SLEPARKW        5'b10011
`define SWDP_SLETRNW3        5'b10100
`define SWDP_SLETRNW2        5'b10101
`define SWDP_SLETRNW1        5'b10110
`define SWDP_SLETRNW0        5'b10111
`define SWDP_SLERESW         5'b11000
`define SWDP_SLEDATAW        5'b11001
`define SWDP_SLEPARITYW      5'b11010
`define SWDP_SLEMARKW        5'b11011
`define SWDP_SLESTOPW        5'b11100
// Read States
`define SWDP_SLEDATAR        5'b11101
`define SWDP_SLEPARITYR      5'b11110
`define SWDP_SLESTOPR        5'b11111
// Wait States
// Closing States
`define SWDP_SLETRNC         5'b01110
`define SWDP_SLERESC         5'b01111
// Error States
`define SWDP_SLEERROR        5'b01001

`define SWDP_SLEUNUSED `SWDP_SLEMARKW,`SWDP_SLESTOPR,`SWDP_SLERESW, `SWDP_UNUSED01
// X-prop state
`define SWDP_SLEXXXX         5'bXXXXX
//-----------------------------------------------------------------------------
// Internal register locations
//-----------------------------------------------------------------------------
//  Address  Register  Direction  Width  Reset       Description
//  0x0      AbortReg  W          32     0x00000000  Abort
//  0x0      IDReg     R          32     0x--------  IdCode
//  0x1      CSWReg    R/W        32     0x00000000  Control/Status
//  0x2      AddrReg   W          32     0x00000000  Address
//  0x2      Resend    R          32     0x00000000  Resend AP data
//  0x3      RdBuffReg R          32     0x00000000  Read Buffer
`define SWDP_ABORT           2'b00   // Wr
`define SWDP_IDCODE          2'b00   // Rd
`define SWDP_CTRL            2'b01   // Wr
`define SWDP_STAT            2'b01   // Rd
`define SWDP_ADDR            2'b10   // Wr
`define SWDP_RESEND          2'b10   // Rd
`define SWDP_RDBUFF          2'b11   // Rd

//-----------------------------------------------------------------------------
// Serial Protocol bit meaning
//-----------------------------------------------------------------------------
`define SWDP_STARTBIT        1'b1
`define SWDP_SERREAD         1'b1
`define SWDP_SERWRITE        1'b0
`define SWDP_APBREAD         1'b0
`define SWDP_APBWRITE        1'b1
`define SWDP_DPREG           1'b0
`define SWDP_APREG           1'b1

//-----------------------------------------------------------------------------
// SE protocol data count
//-----------------------------------------------------------------------------
`define SWDP_CNT32           5'b11111

//-----------------------------------------------------------------------------
// Transfer count
//-----------------------------------------------------------------------------
`define SWDP_ZERO12          12'b000000000000
