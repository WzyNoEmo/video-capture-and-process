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
//      Checked In          : $Date: 2008-03-11 12:23:10 +0000 (Tue, 11 Mar 2008) $
//
//      Revision            : $Revision: 78356 $
//
//      Release Information : Cortex-M1-AT470-r1p0-00rel0
//-----------------------------------------------------------------------------
// Purpose : Define file
//-----------------------------------------------------------------------------

`define CM1_SHIFT_LSL  2'b00
`define CM1_SHIFT_LSR  2'b01
`define CM1_SHIFT_ROR  2'b10
`define CM1_SHIFT_ASR  2'b11

`define CM1_NOP       16'hbf00

`define CM1_LU_CTL_AND 2'b00
`define CM1_LU_CTL_ORR 2'b01
`define CM1_LU_CTL_XOR 2'b10

`define CM1_RF_MUX_CTL_AU  3'b000
`define CM1_RF_MUX_CTL_RD  3'b001
`define CM1_RF_MUX_CTL_MUL 3'b010
`define CM1_RF_MUX_CTL_RF1 3'b011
`define CM1_RF_MUX_CTL_LU  3'b100
`define CM1_RF_MUX_CTL_SHF 3'b101
`define CM1_RF_MUX_CTL_WD  3'b110
`define CM1_RF_MUX_CTL_HR1 3'b111

`define CM1_Z_MUX_CTL_AU   2'b00
`define CM1_Z_MUX_CTL_LU   2'b01
`define CM1_Z_MUX_CTL_SHF  2'b10
`define CM1_Z_MUX_CTL_MUL  2'b11

`define CM1_PC_MUX_CTL_FE  2'b00
`define CM1_PC_MUX_CTL_RD  2'b01
`define CM1_PC_MUX_CTL_DE  2'b10
`define CM1_PC_MUX_CTL_EX  2'b11

`define CM1_WD_MUX_CTL_WD   2'b00
`define CM1_WD_MUX_CTL_HR2  2'b01
`define CM1_WD_MUX_CTL_PSR  2'b10
`define CM1_WD_MUX_CTL_DBG  2'b11

// Used in the NVIC and the debug control block
`define CM1_CPUID_REV 4'h0
`define CM1_CPUID_VAR 4'h1

`define CM1_CPUID     {8'h41,`CM1_CPUID_VAR, 4'hC,12'hC21,`CM1_CPUID_REV}
  
// CPUID Base Register is used in NVIC and DBG CTL
`define CM1_CPUIDBASEREG    10'b1101_0000_00

