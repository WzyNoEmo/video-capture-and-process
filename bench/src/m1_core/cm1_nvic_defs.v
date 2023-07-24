//===========================================================================-- 
//  The confidential and proprietary information contained in this file may
//  only be used by a person authorised under and to the extent permitted  
//  by a subsisting licensing agreement from ARM limited.                  
//                                                                         
//                (C) COPYRIGHT 2006-2008 ARM limited                      
//                    ALL RIGHTS RESERVED                                  
//                                                                         
//  This entire notice must be reproduced on all copies of this file       
//  and copies of this file may only be made by a person if such person is 
//  permitted to do so under the terms of a subsisting license agreement   
//  from ARM limited.                                                      
//                                                                         
//  SVN Information
//
//  Checked In          : $Date: 2008-02-01 18:33:14 +0000 (Fri, 01 Feb 2008) $
//  Revision            : $Revision: 75222 $
//  Release Information : Cortex-M1-AT470-r1p0-00rel0
//                                                                         
// -----------------------------------------------------------------------------
// Abstract : Cortex-M1 supports up to 32 external IRQs 
// -----------------------------------------------------------------------------

// 0         Stack top
// 1         Reset     (-3)
// 2         NMI       (-2)
// 3         HardFault (-1)
// 4         Reserved
// 5         Reserved
// 6         Reserved
// 7         Reserved
// 8         Reserved
// 9         Reserved
// 10        Reserved
// 11        SVCall     (OS ext)
// 12        Reserved
// 13        Reserved
// 14        PendSV     (OS ext)
// 15        SysTick    (OS ext)
// 16-47     External Interrupt

//-----------------------------------------------------------------------------
// Constants
//
// these constants must not be changed and are defined to make
// the code easier to read
//-----------------------------------------------------------------------------

// Number of non-IRQ exceptions
// SysTick, PendSV, SVCall, HardFault, NMI
`define CM1_NVIC_NUM_NON_IRQ  5
// Total number of exceptions
`define CM1_NVIC_NUM_EXCPT    (NUM_IRQ+`CM1_NVIC_NUM_NON_IRQ)

// Number of bits in each programmable priority level
`define CM1_NVIC_LVL_BITS     2
// Total number of bits in programmable priority levels
`define CM1_NVIC_LVL_WIDTH    (NUM_IRQ*`CM1_NVIC_LVL_BITS)

// Maximum number of IRQs
`define CM1_NVIC_MAX_IRQ      32

//
`define CM1_NVIC_NMIVEC       6'h02
`define CM1_NVIC_HDFVEC       6'h03
`define CM1_NVIC_SVCVEC       6'h0B
`define CM1_NVIC_PSVVEC       6'h0E
`define CM1_NVIC_TCKVEC       6'h0F
`define CM1_NVIC_IRQ0VEC      6'h10

// Local mapping of first vector table entries
`define CM1_NVIC_NMINUM       0
`define CM1_NVIC_HDFNUM       1
`define CM1_NVIC_SVCNUM       2
`define CM1_NVIC_PSVNUM       3
`define CM1_NVIC_TCKNUM       4
`define CM1_NVIC_IRQBASE      `CM1_NVIC_NUM_NON_IRQ

// Interrupt controller type register
`define CM1_INTCTRLTYPE       10'b0000_0000_01
// Auxiliary Control register
`define CM1_ACTLR             10'b0000_0000_10
// Interrupt Set-Enable registers
`define CM1_INTSET0           10'b0001_0000_00
// Interrupt Clear-Enable registers
`define CM1_INTCLR0           10'b0001_1000_00
// Interrupt Pending Set register
`define CM1_INTPENDSET0       10'b0010_0000_00
// Interrupt Pending Clear register
`define CM1_INTPENDCLR0       10'b0010_1000_00
// Interrupt priority level registers
`define CM1_INTPRILVL0        10'b0100_0000_00
`define CM1_INTPRILVL1        10'b0100_0000_01
`define CM1_INTPRILVL2        10'b0100_0000_10
`define CM1_INTPRILVL3        10'b0100_0000_11
`define CM1_INTPRILVL4        10'b0100_0001_00
`define CM1_INTPRILVL5        10'b0100_0001_01
`define CM1_INTPRILVL6        10'b0100_0001_10
`define CM1_INTPRILVL7        10'b0100_0001_11
// CPUID Base Register is used in NVIC and DBG CTL
// The define is therefore moved to cm1_defs
// to avoid define dublicated in dbg_define.
//`define CM1_CPUIDBASEREG      -- see cm1_defs.v
// Interrupt control status register
`define CM1_INTCTRLSTAT       10'b1101_0000_01
// Application Interrupt and Reset control register
`define CM1_APPIRC            10'b1101_0000_11
// Configuration and Control Register
`define CM1_CCR               10'b1101_0001_01

// Interupt control register key
`define CM1_INTCTRLKEY        16'h05FA

// SysTick control/status register
`define CM1_SYSTICKCS         10'b0000_0001_00
// SysTick reload value register
`define CM1_SYSTICKRL         10'b0000_0001_01
// SysTick current value register
`define CM1_SYSTICKCV         10'b0000_0001_10
// SysTick callibration value register
`define CM1_SYSTICKCAL        10'b0000_0001_11

`define CM1_SYSHNDLRPRI1      10'b1101_0001_11
// System handler priority register
`define CM1_SYSHNDLRPRI2      10'b1101_0010_00
// System Handler Control and State Register
`define CM1_SYSHNDCSR         10'b1101_0010_01
