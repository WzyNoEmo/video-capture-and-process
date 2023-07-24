//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2005-2008 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      RCS Information
//
//      RCS Filename        : DAPSwjDpDefs.v.rca
//
//      Checked In          : $Date: 2008-04-24 14:28:49 +0100 (Thu, 24 Apr 2008) $
//
//      Revision            : 1.63
//
//      Release Information : Cortex-M1-AT470-r1p0-00rel0
//-----------------------------------------------------------------------------
//
// ----------------------------------------------------------------------------
//  Purpose : SWJ-DP Definitions
// ----------------------------------------------------------------------------

// 'defines for DAPSwjWatcher.v
   
  // Main watcher state machine encoding

  `define SWJ_JTLR        6'b000000    // JTAG Test-Logic-Reset - also entered from reset

  `define SWJ_JDET        6'b000001    // JTAG-Selected - SW sequence detecting
  `define SWJ_SSEQ2       6'b000010    // Looking for 2nd bit in SWD Select sequence
  `define SWJ_SSEQ3       6'b000011    // Looking for 3rd bit in SWD Select sequence
  `define SWJ_SSEQ4       6'b000100    // Looking for 4th bit in SWD Select sequence
  `define SWJ_SSEQ5       6'b000101    // Looking for 5th bit in SWD Select sequence
  `define SWJ_SSEQ6       6'b000110    // Looking for 6th bit in SWD Select sequence
  `define SWJ_SSEQ7       6'b000111    // Looking for 7th bit in SWD Select sequence
  `define SWJ_SSEQ8       6'b001000    // Looking for 8th bit in SWD Select sequence
  `define SWJ_SSEQ9       6'b001001    // Looking for 9th bit in SWD Select sequence
  `define SWJ_SSEQ10      6'b001010    // Looking for 10th bit in SWD Select sequence
  `define SWJ_SSEQ11      6'b001011    // Looking for 11th bit in SWD Select sequence
  `define SWJ_SSEQ12      6'b001100    // Looking for 12th bit in SWD Select sequence
  `define SWJ_SSEQ13      6'b001101    // Looking for 13th bit in SWD Select sequence
  `define SWJ_SSEQ14      6'b001110    // Looking for 14th bit in SWD Select sequence
  `define SWJ_SSEQ15      6'b001111    // Looking for 15th bit in SWD Select sequence

  `define SWJ_SSLP        6'b111111    // SW selected - SW-DP performing transactions

  `define SWJ_SLRST       6'b100000    // SW-Selected - SW-DP in line reset

  `define SWJ_SDET        6'b100001    // SW-Selected - JTAG sequence detecting
  `define SWJ_JSEQ2       6'b100010    // Looking for 2nd bit in JTAG Select sequence
  `define SWJ_JSEQ3       6'b100011    // Looking for 3rd bit in JTAG Select sequence
  `define SWJ_JSEQ4       6'b100100    // Looking for 4th bit in JTAG Select sequence
  `define SWJ_JSEQ5       6'b100101    // Looking for 5th bit in JTAG Select sequence
  `define SWJ_JSEQ6       6'b100110    // Looking for 6th bit in JTAG Select sequence
  `define SWJ_JSEQ7       6'b100111    // Looking for 7th bit in JTAG Select sequence
  `define SWJ_JSEQ8       6'b101000    // Looking for 8th bit in JTAG Select sequence
  `define SWJ_JSEQ9       6'b101001    // Looking for 9th bit in JTAG Select sequence
  `define SWJ_JSEQ10      6'b101010    // Looking for 10th bit in JTAG Select sequence
  `define SWJ_JSEQ11      6'b101011    // Looking for 11th bit in JTAG Select sequence
  `define SWJ_JSEQ12      6'b101100    // Looking for 12th bit in JTAG Select sequence
  `define SWJ_JSEQ13      6'b101101    // Looking for 13th bit in JTAG Select sequence
  `define SWJ_JSEQ14      6'b101110    // Looking for 14th bit in JTAG Select sequence
  `define SWJ_JSEQ15      6'b101111    // Looking for 15th bit in JTAG Select sequence

  `define SWJ_JSLP        6'b010000    // JTAG-Selected - JTAG-DP performing transactions


  `define SWJUNUSED1   6'b010011,6'b010100,6'b010101,6'b010110,6'b010111,6'b011000
  `define SWJUNUSED2   6'b011001,6'b011010,6'b011011,6'b011100,6'b011101,6'b011110,6'b011111
  `define SWJUNUSED3   6'b110000,6'b110001,6'b110010,6'b110011,6'b110100,6'b110101
  `define SWJUNUSED4   6'b110110,6'b110111,6'b111000,6'b111001,6'b111010,6'b111011
  `define SWJUNUSED5   6'b111100,6'b111101,6'b111110,6'b010010,6'b010001

  `define SWJ_UNUSED `SWJUNUSED1, `SWJUNUSED2, `SWJUNUSED3, `SWJUNUSED4, `SWJUNUSED5


  `define SWJ_UNDEF    6'bXXXXXX     // Undefined state
