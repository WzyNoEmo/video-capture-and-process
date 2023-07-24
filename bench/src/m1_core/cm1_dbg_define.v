//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM limited.
//
//            (C) COPYRIGHT 2006-2008 ARM limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2007-07-18 14:32:22 +0100 (Wed, 18 Jul 2007) $
//
//      Revision            : $Revision: 61271 $
//
//      Release Information : Cortex-M1-AT470-r1p0-00rel0
//-----------------------------------------------------------------------------
// Purpose : All defines for all debug components
//
// Notes: Debug components:
//
//  --  cm1_dbg_ctrl    - control the core logic and ahb register interface
//  --  cm1_dbg_bp     - break point unit
//  --  cm1_dbg_ahb_dec - AHB decoder local to the debug slaves
//  --  cm1_dbg_ahb_mux - Combine the slave response to one signal
//  --  cm1_dbg_dw      - Data watch points 
//  --  cm1_dbg_tcm     - TCM interface
//  --  cm1_dbg_dap     - Debug access port
//
//  upper 16 bits (HADDR[31:16]) are decoded in a AHB decoder cm1_dbg_ahb_dec, 
//  peripheral select
// 
//  lower 10 bits (HADDR[11:2]) are decoded in the periperal, register select.
//
//  There is overlap between the debug control block and the nvic address area
//  0xE00E is the nvic address space and the dbg_ctl address space.
//  If a read or a write is done to this region both peripheral will be 
//  accessed. If a read a done the response from the peripherals will be ORed
//  together. The peripherals have been designed with the same amount of wait 
//  states. The reason for these two peripherals using the same address region 
//  is that these two blocks are one peripheral in CM3 and debug is not 
//  optional in that design.
//-----------------------------------------------------------------------------

 
// #########################
// ### General selects   ###
// #########################
`define CM1_DEBUGKEY      16'hA05F

// #########################
// ### PERIPHERAL SELECT ###
// #########################
// AHB Decoder decodes 20 bits and 10 bits are done in the peripherals
// Only word access supported

// Select NVIC space (HADDR[31:12])
`define CM1_DBG_NVIC     20'hE000E

// Select for HADDR[31:20]
`define CM1_DBG_ITCM      12'h000
`define CM1_DBG_DTCM      12'h200
`define CM1_DBG_PERIP     12'hE00

// Select for HADDR[19:12]
`define CM1_DBG_DW        8'h01
`define CM1_DBG_BPU       8'h02
`define CM1_DBG_CTL       8'h0E
`define CM1_DBG_ROM       8'hFF

// ########################
// ### REGISTERS SELECT ###
// ########################
// ### Cortex-M1 CORE DEBUG CONTROL REGISTERS ###

//  Register space 0xE00E

// Debug fault status register                     0xE000ED30
`define CM1_DBG_DFSR      10'b1101_0011_00
// Debug halting control status register           0xE000EDF0
`define CM1_DBG_DHCSR     10'b1101_1111_00
// Debug core register selector register           0xE000EDF4
`define CM1_DBG_DCRSR     10'b1101_1111_01
// Debug core register data register               0xE000EDF8
`define CM1_DBG_DCRDR     10'b1101_1111_10
// Debug exception and monitor control register    0xE000EDFC 
`define CM1_DBG_DEMCR     10'b1101_1111_11
// CPUID Base Register is used in NVIC and DBG CTL
// The define is therefore moved to cm1_defs
// to avoid define duplicated in nvic_defs.
// `define CM1_CPUIDBASEREG    10'b1101_0000_00


// ### Cortex-M1 BREAK POINT UNIT ###

//  Register space 0xE0002

// Break point control                             0xE0002000
`define CM1_DBG_BP_CTRL   10'b0000_0000_00
// Breakpoint comparator register 0                0xE0002008
`define CM1_DBG_BP_COMP0  10'b0000_0000_10
// Breakpoint comparator register 1                0xE000200C
`define CM1_DBG_BP_COMP1  10'b0000_0000_11
// Breakpoint comparator register 2                0xE0002010
`define CM1_DBG_BP_COMP2  10'b0000_0001_00
// Breakpoint comparator register 3                0xE0002014
`define CM1_DBG_BP_COMP3  10'b0000_0001_01


// ### Cortex-M1 ROM TABLE ###

//  Register space 0xE00FF

// Rom table NVIC ID                               0xE00FF000
`define CM1_DBG_ROM_NVIC     10'b0000_0000_00
// Rom table DW ID                                 0xE00FF004
`define CM1_DBG_ROM_DW       10'b0000_0000_01
// Rom table BPU ID                                0xE00FF008
`define CM1_DBG_ROM_BPU      10'b0000_0000_10
// Rom table END                                   0xE00FF00C
`define CM1_DBG_ROM_END      10'b0000_0000_11

// Rom table MEMTYPE ID                            0xE00FFFCC
`define CM1_DBG_ROM_MEMTYPE  10'b1111_1100_11

// Rom table PID4 ID                               0xE00FFFD0
`define CM1_DBG_ROM_PID4     10'b1111_1101_00
// Rom table PID5 ID                               0xE00FFFD4
`define CM1_DBG_ROM_PID5     10'b1111_1101_01
// Rom table PID6 ID                               0xE00FFFD8
`define CM1_DBG_ROM_PID6     10'b1111_1101_10
// Rom table PID7 ID                               0xE00FFFDC
`define CM1_DBG_ROM_PID7     10'b1111_1101_11
// Rom table PID0 ID                               0xE00FFFE0
`define CM1_DBG_ROM_PID0     10'b1111_1110_00
// Rom table PID1 ID                               0xE00FFFE4
`define CM1_DBG_ROM_PID1     10'b1111_1110_01
// Rom table PID2 ID                               0xE00FFFE8
`define CM1_DBG_ROM_PID2     10'b1111_1110_10
// Rom table PID3 ID                               0xE00FFFEC
`define CM1_DBG_ROM_PID3     10'b1111_1110_11
// Rom table CID0 ID                               0xE00FFFF0
`define CM1_DBG_ROM_CID0     10'b1111_1111_00
// Rom table CID1 ID                               0xE00FFFF4
`define CM1_DBG_ROM_CID1     10'b1111_1111_01
// Rom table CID2 ID                               0xE00FFFF8
`define CM1_DBG_ROM_CID2     10'b1111_1111_10
// Rom table CID3 ID                               0xE00FFFFC
`define CM1_DBG_ROM_CID3     10'b1111_1111_11

// ############################
// ### Data Watchpoint (DW) ###
// ############################

// Register space
//

// Control Register                                0xE0001000
`define CM1_DW_CTRL         10'b0000_0000_00
// Program Counter Sample Register                 0xE000101C
`define CM1_DW_PCSR         10'b0000_0001_11
// Comparator Register                             0xE0001020
`define CM1_DW_COMP0        10'b0000_0010_00
// Mask Register                                   0xE0001024
`define CM1_DW_MASK0        10'b0000_0010_01
// Function Register                               0xE0001028
`define CM1_DW_FUNCTION0    10'b0000_0010_10
// Comparator Register                             0xE0001030
`define CM1_DW_COMP1        10'b0000_0011_00
// Mask Register                                   0xE0001034
`define CM1_DW_MASK1        10'b0000_0011_01
// Function Register                               0xE0001038
`define CM1_DW_FUNCTION1    10'b0000_0011_10

