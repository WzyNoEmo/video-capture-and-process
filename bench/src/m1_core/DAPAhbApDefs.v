//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2003-2008,2008 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//  Version and Release Control Information:
//
//  File Name           : DAPAhbApDefs.v.rca
//
//  Checked In          : $Date: 2008-04-25 16:48:38 +0100 (Fri, 25 Apr 2008) $
//
//  File Revision       : 1.58
//
//  Release Information : Cortex-M1-AT470-r1p0-00rel0
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// Abstract : Debug Access Port AHB Access Port (DAPAHBAP) - Top Level Block
//-----------------------------------------------------------------------------
//
// DAPAHBAP - Debug Access Port AHB Access Port
// --------------------------------------------
//
// Debug Access Port AHB Access Port component provides an AHB-Lite interface to
// a System On Chip (SOC).
//
// DAPAhbApDefs.v
// --------------
//
// DAPAhbApDefs.v provides the tick defines for all the modules of the DAPAHBAP.
//
// Instantiated blocks
// -------------------
// None
//-----------------------------------------------------------------------------

//------------------------------------------------------------------------------
// USER MODIFIED
//------------------------------------------------------------------------------
`define        AHB_ROM_ADDR      32'hE00FF000

//------------------------------------------------------------------------------
// NOT USER MODIFIED
//------------------------------------------------------------------------------

//----------------------------------------------------------------------------
// AHB transfer encoding
//----------------------------------------------------------------------------
`define IDLE_TRAN                2'b00
`define NONSEQ_TRAN              2'b10

//----------------------------------------------------------------------------
// AHB response encoding
//----------------------------------------------------------------------------
`define ERR_RESP                 2'b01

//-----------------------------------------------------------------------------
// DAP slave interface state machine encoding
//-----------------------------------------------------------------------------
`define        ST_DAP_RST        4'b0000
`define        ST_DAP_IDLE       4'b0001
`define        ST_DAP_REG        4'b0010
`define        ST_DAP_AHB        4'b0011
`define        ST_DAP_WAIT       4'b0100
`define        ST_DAP_RDY1       4'b0101
`define        ST_DAP_RDY2       4'b0110
`define        ST_DAP_RDY        4'b0111
`define        ST_DAP_PACK       4'b1000
`define        ST_DAP_UNUSED     4'b1001, 4'b1010, 4'b1011, 4'b1100, 4'b1101, 4'b1110, 4'b1111
`define        ST_DAP_UNDEF      4'bxxxx

//----------------------------------------------------------------------------
// AHB master interface state machine encoding
//----------------------------------------------------------------------------
`define        ST_AHB_RST        3'b000
`define        ST_AHB_IDLE       3'b001
`define        ST_AHB_ADDR       3'b010
`define        ST_AHB_WAIT       3'b011
`define        ST_AHB_RDY        3'b100
`define        ST_AHB_UNDEF      3'bxxx

//-----------------------------------------------------------------------------
// DAP slave interface states to AHB interface
//-----------------------------------------------------------------------------
`define        ST_DAPIF_INIT     4'b0001
`define        ST_DAPIF_RDY      4'b0010
`define        ST_DAPIF_BSY      4'b0100
`define        ST_DAPIF_HOLD     4'b1000
`define        ST_DAPIF_UNDEF    4'bxxxx

//-----------------------------------------------------------------------------
// AHB master interface states to DAP interface
//-----------------------------------------------------------------------------
`define        ST_AHBIF_INIT     3'b001
`define        ST_AHBIF_RDY      3'b010
`define        ST_AHBIF_BSY      3'b100
`define        ST_AHBIF_UNDEF    3'bxxx

//----------------------------------------------------------------------------
// Register reset values
//----------------------------------------------------------------------------
`define        CSW_RESET         10'b1000110010

//----------------------------------------------------------------------------
// Control status word register increment values
//----------------------------------------------------------------------------
`define        INC_SINGLE        2'b01
`define        INC_PACKED        2'b10

//----------------------------------------------------------------------------
// AHB-AP registers
//----------------------------------------------------------------------------
`define        CSWREG            6'b000000
`define        TAREG             6'b000001
`define        DRWREG            6'b000011
`define        BD0REG            6'b000100
`define        BD1REG            6'b000101
`define        BD2REG            6'b000110
`define        BD3REG            6'b000111
`define        ROMREG            6'b111110
`define        IDREG             6'b111111

//----------------------------------------------------------------------------
// AHB size encoding
//----------------------------------------------------------------------------
`define        AHBAP_BYTE        2'b00
`define        AHBAP_HALF_WORD   2'b01
`define        AHBAP_WORD        2'b10
`define        AHBAP_UNUSED      2'b11

//----------------------------------------------------------------------------
// AHB burst encoding
//----------------------------------------------------------------------------
`define        SINGLE_BURST      3'b000

//----------------------------------------------------------------------------
// AHB lock encoding
//----------------------------------------------------------------------------
`define        ZERO_LOCK         1'b0

//-----------------------------------------------------------------------------
// Miscellaneous
//-----------------------------------------------------------------------------
`define        ID_REG_AHBAP      32'h44770001
