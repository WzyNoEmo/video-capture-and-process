
`timescale 1 ns / 10 fs

module GTP_PLL_WRAPPER #(
    parameter CLKIN_FREQ = "50MHZ", 
    parameter DYNAMIC_CLKIN_EN = "FALSE",  //"TRUE"; "FALSE"
    parameter CLKIN_SSEL = 0,       //0/1
    parameter DYNAMIC_IDIV_EN = "FALSE",   //"TRUE"; "FALSE"
    parameter STATIC_IDIV = 1,     //1~64
    parameter DYNAMIC_FDIV_EN = "FALSE",   //"TRUE"; "FALSE"
    parameter STATIC_FDIV = 1,     //1~64
    parameter DYNAMIC_ODIV_EN = "FALSE",   //"TRUE"; "FALSE"
    parameter STATIC_ODIV = 2,     //2,4,~128
    parameter CLKO2_SEL   = 2, //0~3
    parameter DYNAMIC_O2DIV_EN = "FALSE",  //"TRUE"; "FALSE"
    parameter STATIC_O2DIV = 2,     //2,4,6,8~128
    parameter CLKO3_SEL    = 2, //0~3
    parameter DYNAMIC_O3DIV_EN = "FALSE",  //"TRUE"; "FALSE"
    parameter STATIC_O3DIV = 2,     //2,4,6,8~128
    parameter CLKO4_SEL    = 2, //0~3
    parameter DYNAMIC_O4DIV_EN = "FALSE",  //"TRUE"; "FALSE"
    parameter STATIC_O4DIV = 2,     //2,4,6,8~128
    parameter INTERNAL_FB  = "DISABLE",    //"CLKOUT0"; "CLKOUT1"; "CLKOUT2"; "DISABLE"
    parameter DYNAMIC_DUPS1_EN  = "FALSE", //"TRUE"; "FALSE"
    parameter STATIC_DU1 = 8,         
    parameter STATIC_PS1 = 0,       
    parameter DYNAMIC_DUPS2_EN  = "FALSE", //"TRUE"; "FALSE"
    parameter STATIC_DU2 = 8,         
    parameter STATIC_PS2 = 0,       
    parameter DYNAMIC_DUPS3_EN  = "FALSE", //"TRUE"; "FALSE"
    parameter STATIC_DU3 = 8,        
    parameter STATIC_PS3 = 0,       
    parameter DYNAMIC_DUPS4_EN  = "FALSE", //"TRUE"; "FALSE"
    parameter STATIC_DU4 = 8,         
    parameter STATIC_PS4 = 0,       
    parameter GATEO_EN   = "TRUE", //"TRUE"; "FALSE"
    parameter GATE1_EN   = "FALSE", //"TRUE"; "FALSE"
    parameter GATE2_EN   = "FALSE", //"TRUE"; "FALSE"
    parameter GATE3_EN   = "FALSE", //"TRUE"; "FALSE"
    parameter GATE4_EN   = "FALSE", //"TRUE"; "FALSE"
    parameter EN_INNER_RST  = "TRUE", //"TRUE"; "FALSE"
    parameter EN_RESET_ODIV = "TRUE", //"TRUE"; "FALSE"
    parameter EN_RESET_IDIV = "TRUE", //"TRUE"; "FALSE"
    parameter DIV125_M   = 1, 
    parameter DIV125_N   = 1,
    parameter DIV32BIT_K = 1000
    )(
    input PLL_PWD,
    input PLL_RST,
    input CLKIN1,
    input CLKIN2,
    input CLKIN_DSEL,
    input CLKFB,
    input [5:0] DYN_IDIV,
    input [5:0] DYN_FDIV,
    input [5:0] CIM_DYNODIV,
    input [5:0] CIM_DYNO2DIV,
    input [5:0] CIM_DYNO3DIV,
    input [5:0] CIM_DYNO4DIV, 
    input [3:0] CIM_DYNDU1,
    input [3:0] CIM_DYNDU2,
    input [3:0] CIM_DYNDU3,
    input [3:0] CIM_DYNDU4,
    input [3:0] CIM_DYNPS1,
    input [3:0] CIM_DYNPS2,
    input [3:0] CIM_DYNPS3,
    input [3:0] CIM_DYNPS4,
    input RESET_IDIV,
    input RESET_ODIV,
    input [4:0] GATEO,
    output PLL_LOCK,
    output [4:0] CLKOUT
    );
  
    GTP_PLL #(
        .CLKIN_FREQ(CLKIN_FREQ),
        .DYNAMIC_CLKIN_EN(DYNAMIC_CLKIN_EN),
        .CLKIN_SSEL(CLKIN_SSEL),
        .DYNAMIC_RATIOI_EN(DYNAMIC_IDIV_EN),
        .STATIC_RATIOI(STATIC_IDIV),
        .DYNAMIC_RATIOF_EN(DYNAMIC_FDIV_EN),
        .STATIC_RATIOF(STATIC_FDIV),
        .DYNAMIC_RATIO_EN(DYNAMIC_ODIV_EN),
        .STATIC_RATIO(STATIC_ODIV),
        .CLKOUT2_SEL(CLKO2_SEL),
        .DYNAMIC_RATIO2_EN(DYNAMIC_O2DIV_EN),
        .STATIC_RATIO2(STATIC_O2DIV),
        .CLKOUT3_SEL(CLKO3_SEL),
        .DYNAMIC_RATIO3_EN(DYNAMIC_O3DIV_EN),
        .STATIC_RATIO3(STATIC_O3DIV),
        .CLKOUT4_SEL(CLKO4_SEL),
        .DYNAMIC_RATIO4_EN(DYNAMIC_O4DIV_EN),
        .STATIC_RATIO4(STATIC_O4DIV),
        .INTERNAL_FB(INTERNAL_FB),
        .DYNAMIC_DUPS1_EN(DYNAMIC_DUPS1_EN),
        .STATIC_DUTY1(STATIC_DU1),
        .STATIC_PHASE1(STATIC_PS1),
        .DYNAMIC_DUPS2_EN(DYNAMIC_DUPS2_EN),
        .STATIC_DUTY2(STATIC_DU2),
        .STATIC_PHASE2(STATIC_PS2),
        .DYNAMIC_DUPS3_EN(DYNAMIC_DUPS3_EN),
        .STATIC_DUTY3(STATIC_DU3),
        .STATIC_PHASE3(STATIC_PS3),
        .DYNAMIC_DUPS4_EN(DYNAMIC_DUPS4_EN),
        .STATIC_DUTY4(STATIC_DU4),
        .STATIC_PHASE4(STATIC_PS4),
        .CLKOUT0_SYN_EN(GATEO_EN),
        .CLKOUT1_SYN_EN(GATE1_EN),
        .CLKOUT2_SYN_EN(GATE2_EN),
        .CLKOUT3_SYN_EN(GATE3_EN),
        .CLKOUT4_SYN_EN(GATE4_EN),
        .RST_INNER_EN(EN_INNER_RST),
        .RSTIDIV_EN(EN_RESET_IDIV),
        .RSTODIV_EN(EN_RESET_ODIV),
        .CLKOUT3_DIV125_M(DIV125_M),
        .CLKOUT3_DIV125_N(DIV125_N),
        .CLKOUT4_DIV32BIT_K(DIV32BIT_K)
        ) pll (
        .CLKOUT0(CLKOUT[0]),
        .CLKOUT1(CLKOUT[1]),
        .CLKOUT2(CLKOUT[2]),
        .CLKOUT3(CLKOUT[3]),
        .CLKOUT4(CLKOUT[4]),
        .LOCK(PLL_LOCK),
        .CLKIN1(CLKIN1),
        .CLKIN2(CLKIN2),
        .CLKIN_DSEL(CLKIN_DSEL),
        .CLKFB(CLKFB),
        .CLKOUT0_SYN(GATEO[0]),
        .CLKOUT1_SYN(GATEO[1]),
        .CLKOUT2_SYN(GATEO[2]),
        .CLKOUT3_SYN(GATEO[3]),
        .CLKOUT4_SYN(GATEO[4]),
        .RATIOI(DYN_IDIV),
        .RATIOF(DYN_FDIV),
        .RATIO(CIM_DYNODIV),
        .RATIO2(CIM_DYNO2DIV),
        .RATIO3(CIM_DYNO3DIV),
        .RATIO4(CIM_DYNO4DIV), 
        .DUTY1(CIM_DYNDU1),
        .DUTY2(CIM_DYNDU2),
        .DUTY3(CIM_DYNDU3),
        .DUTY4(CIM_DYNDU4),
        .PHASE1(CIM_DYNPS1),
        .PHASE2(CIM_DYNPS2),
        .PHASE3(CIM_DYNPS3),
        .PHASE4(CIM_DYNPS4),
        .PLL_PWD(PLL_PWD),
        .RST(PLL_RST),
        .RSTIDIV(RESET_IDIV),
        .RSTODIV(RESET_ODIV)
        );
endmodule
