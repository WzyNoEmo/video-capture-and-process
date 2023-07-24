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
//      Checked In          : $Date: 2008-05-02 18:20:15 +0100 (Fri, 02 May 2008) $
//
//      Revision            : $Revision: 82391 $
//
//      Release Information : Cortex-M1-AT470-r1p0-00rel0
//-----------------------------------------------------------------------------
// Purpose : User configurable options
//
// This file is included in CortexM1Integration.v and CortexM1DbgIntegration.v.
// It defines the values which are driven on the parameters and configuration
// pins in those files.
//
// - CM1_OS is defined to 1 to include OS extensions.  Define to 0 to
//   exclude OS Extensions
// - CM1_BE8 is defined to 1 to configure the core to have BE8 endianess.
//   Define to 0 to configure LE endianess
// - Number of external interrupts is defined with the constant CM1_NUM_IRQ.
//   Supported number of interrupts : 1, 8, 16 or 32
// - CM1_SMALL_MUL is defined to 0 to use the normal multiplier.  Define to
//   1 to use the small multiplier
// - CM1_ITCMSIZE defines the size of ITCM supported
// - CM1_DTCMSIZE defines the size of DTCM supported
// - CM1_ITCM_INIT is defined to initialize the ITCM in a synthesis compatible
//   format.  Comment out to disable synthesis compatible initialization
// - CM1_DTCM_INIT is defined to initialize the DTCM in a synthesis compatible
//   format.  Comment out to disable synthesis compatible initialization
// - CM1_ITCM_LA_EN is defined to 1 to set the lower alias enable for the ITCM
// - CM1_ITCM_UA_EN is defined to 1 to set the upper alias enable for the ITCM
// - CM1_SMALL_DEBUG is defined to 0 to use the full debug option.  Define to
//   1 to reduce the features present
// - CM1_JTAG is defined to 1 to include the JTAG DP in CortexM1DbgIntegration
//   Define to 0 to exclude the JTAG DP
// - CM1_SW is defined to 1 to include the SW DP in CortexM1DbgIntegration
//   Define to 0 to exclude the SW DP
//-----------------------------------------------------------------------------


// Parameters for CortexM1 and CortexM1Dbg
// ---------------------------------------

// Cortex-M1 supports 1, 8, 16, 32 user interrupts
// There are always 32 IRQ input pins, which should be tied to 0 if unused.
// Note:  Due to implementation optimisations, other values WILL NOT work

`define CM1_NUM_IRQ    8
// The inclusion of OS extensions is controlled by CM1_OS.  Define as 1 to
// include OS extensions, or as 0 to exclude OS extensions

`define CM1_OS         1

// The multiplier may be a 3-cycle implementation or a smaller implementation
// which takes more cycles.  This is for use in devices which do not have
// dedicated multiplier resources, or where these are all required for user
// logic.
// Defining CM1_SMALL_MUL to 0 here will use the 3-cycle implementation.
// Defining CM1_SMALL_MUL to 1 here will use the smaller implementation.


`define CM1_SMALL_MUL  0

// The endianess of the core is controlled by CM1_BE8.
// Defining CM1_BE8 to 0 here will select Little Endian (LE)
// Defining CM1_BE8 to 1 here will select Big Endian 8  (BE8)

`define CM1_BE8        0

// These defines configure the size of memory attached to the core.  The number
// of address line outputs to the core is constant.  When TCM sizes smaller
// than 1Mbyte are configured, the upper bits of the address are unused, and
// should be left unconnected.  When Zero size TCMs are configured, all output
// address and data lines are unused, and should be left unconnected; all input
// data lines are unused, and should be tied to 0.
//
//        4'b0000   0 kB 
//        4'b0001   1 kB
//        4'b0010   2 kB
//        4'b0011   4 kB
//        4'b0100   8 kB
//        4'b0101  16 kB
//        4'b0110  32 kB
//        4'b0111  64 kB
//        4'b1000 128 kB
//        4'b1001 256 kB
//        4'b1010 512 kB
//        4'b1011   1 MB

 // defaults to 32K
`define CM1_ITCMSIZE 4'b0011

 // defaults to 32K
`define CM1_DTCMSIZE 4'b0011

// The usage of $readmemh for ITCM initialization in a synthesis compatible
// format is controlled by CM1_ITCM_INIT
// Commenting out CM1_ITCM_INIT here will disable the initializing of the ITCM
// for synthesis.
// Defining CM1_ITCM_INIT here will enable the initializing of the ITCM for synthesis.
`define CM1_ITCM_INIT   1

// The usage of $readmemh for DTCM initialization in a synthesis compatible
// format is controlled by CM1_DTCM_INIT
// Commenting out CM1_DTCM_INIT here will disable the initializing of the DTCM
// for synthesis.
// Defining CM1_DTCM_INIT here will enable the initializing of the DTCM for synthesis.
`define CM1_DTCM_INIT   1


// These defines control the values of the ITCM alias enables out of reset
// The CM1_ITCM_LA_EN define controls the lower alias enable for the ITCM
// The CM1_ITCM_UA_EN define controls the upper alias enable for the ITCM
// By default, the upper alias is disabled and the lower alias is enabled
`define CM1_ITCM_LA_EN    1
`define CM1_ITCM_UA_EN    0

// Parameters for CortexM1Dbg only
// -------------------------------

// The CM1_SMALL_DEBUG option can be used to reduce the features present
// for debug
// Defining CM1_SMALL_DEBUG to 1 will select the reduced debug option
// Defining CM1_SMALL_DEBUG to 0 will select the full debug option
`define CM1_SMALL_DEBUG 0

// The presence of a JTAG DP in the DAPSWJDP is controlled by CM1_JTAG
// Defining CM1_JTAG to 0 here will exclude the JTAG DP
// Defining CM1_JTAG to 1 here will include the JTAG DP
// Note that if you do not set CM1_JTAG to 1, you must set CM1_SW to 1
`define CM1_JTAG        1

// The presence of a SW DP in the DAPSWJDP in is controlled by CM1_SW
// Defining CM1_SW to 0 here will exclude the SW DP
// Defining CM1_SW to 1 here will include the SW DP
// Note that if you do not set CM1_SW to 1, you must set CM1_JTAG to 1
`define CM1_SW          0

// debug enable, 1: enable   0:disable
`define CORTEXM1_DEBUG_ENABLE          0

//peripheral ahb device
`define CORTEXM1_AHB_GPIO0             1
`define CORTEXM1_AHB_MEM0              1
`define CORTEXM1_AHB_ICACHE            1
`define CORTEXM1_AHB_DCACHE            1
`define CORTEXM1_AHB_ETHERNET          1

//peripheral apb device
`define CORTEXM1_APB_TIMER0            1
`define CORTEXM1_APB_TIMER1            1
`define CORTEXM1_APB_UART0             1
`define CORTEXM1_APB_UART1             1
`define CORTEXM1_APB_WATCHDOG          1
`define CORTEXM1_APB_SPI0              1
`define CORTEXM1_APB_I2C0              1
`define CORTEXM1_APB_PERIP             1

//custom-made
`define CORTEXM1_AHB_UDP               1

// the source of sysclk,
//`define UNCACHE