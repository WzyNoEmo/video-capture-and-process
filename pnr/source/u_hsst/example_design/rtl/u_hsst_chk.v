// Created by IP Generator (Version 2022.1 build 99559)


///////////////////////////////////////////////////////////////////////////////
//
// Copyright (c) 2019 PANGO MICROSYSTEMS, INC
// ALL RIGHTS REVERVED.
//
// THE SOURCE CODE CONTAINED HEREIN IS PROPRIETARY TO PANGO MICROSYSTEMS, INC.
// IT SHALL NOT BE REPRODUCED OR DISCLOSED IN WHOLE OR IN PART OR USED BY
// PARTIES WITHOUT WRITTEN AUTHORIZATION FROM THE OWNER.
//
///////////////////////////////////////////////////////////////////////////////
//
// Library:
// Filename:
///////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100fs

module u_hsst_chk #(
    parameter RD_8BIT_ONLY_0   = 0, 
    parameter RD_10BIT_ONLY_0  = 0, 
    parameter RD_8B10B_8BIT_0  = 1, 
    parameter RD_16BIT_ONLY_0  = 0, 
    parameter RD_20BIT_ONLY_0  = 0, 
    parameter RD_8B10B_16BIT_0 = 0, 
    parameter RD_32BIT_ONLY_0  = 0, 
    parameter RD_40BIT_ONLY_0  = 0, 
    parameter RD_8B10B_32BIT_0 = 0,
    parameter RD_64B66B_16BIT_0   = 0,
    parameter RD_64B66B_32BIT_0   = 0,
    parameter RD_64B67B_16BIT_0   = 0,
    parameter RD_64B67B_32BIT_0   = 0,
    parameter RD_8BIT_ONLY_1   = 0, 
    parameter RD_10BIT_ONLY_1  = 0, 
    parameter RD_8B10B_8BIT_1  = 1, 
    parameter RD_16BIT_ONLY_1  = 0, 
    parameter RD_20BIT_ONLY_1  = 0, 
    parameter RD_8B10B_16BIT_1 = 0, 
    parameter RD_32BIT_ONLY_1  = 0, 
    parameter RD_40BIT_ONLY_1  = 0, 
    parameter RD_8B10B_32BIT_1 = 0,
    parameter RD_64B66B_16BIT_1   = 0,
    parameter RD_64B66B_32BIT_1   = 0,
    parameter RD_64B67B_16BIT_1   = 0,
    parameter RD_64B67B_32BIT_1   = 0,
    parameter RD_8BIT_ONLY_2   = 0, 
    parameter RD_10BIT_ONLY_2  = 0, 
    parameter RD_8B10B_8BIT_2  = 1, 
    parameter RD_16BIT_ONLY_2  = 0, 
    parameter RD_20BIT_ONLY_2  = 0, 
    parameter RD_8B10B_16BIT_2 = 0, 
    parameter RD_32BIT_ONLY_2  = 0, 
    parameter RD_40BIT_ONLY_2  = 0, 
    parameter RD_8B10B_32BIT_2 = 0,
    parameter RD_64B66B_16BIT_2   = 0,
    parameter RD_64B66B_32BIT_2   = 0,
    parameter RD_64B67B_16BIT_2   = 0,
    parameter RD_64B67B_32BIT_2   = 0,
    parameter RD_8BIT_ONLY_3   = 0, 
    parameter RD_10BIT_ONLY_3  = 0, 
    parameter RD_8B10B_8BIT_3  = 1, 
    parameter RD_16BIT_ONLY_3  = 0, 
    parameter RD_20BIT_ONLY_3  = 0, 
    parameter RD_8B10B_16BIT_3 = 0, 
    parameter RD_32BIT_ONLY_3  = 0, 
    parameter RD_40BIT_ONLY_3  = 0, 
    parameter RD_8B10B_32BIT_3 = 0,
    parameter RD_64B66B_16BIT_3   = 0,
    parameter RD_64B66B_32BIT_3   = 0,
    parameter RD_64B67B_16BIT_3   = 0,
    parameter RD_64B67B_32BIT_3   = 0
)(
    input          i_chk_clk0                    ,
    input          i_chk_clk1                    ,
    input          i_chk_clk2                    ,
    input          i_chk_clk3                    ,
    input  [3:0]   i_chk_rstn                    ,
    input  [2:0]   i_rxstatus_0                  ,
    input  [39:0]  i_rxd_0                       ,
    input  [3:0]   i_rdisper_0                   ,
    input  [3:0]   i_rdecer_0                    ,
    input  [3:0]   i_rxk_0                       ,
    input  [2:0]   i_rxh_0                       ,
    input          i_rxq_start_0                 ,
    input          i_rxh_vld_0                    ,
    input          i_rxd_vld_0                    ,
    input  [2:0]   i_rxstatus_1                  ,
    input  [39:0]  i_rxd_1                       ,
    input  [3:0]   i_rdisper_1                   ,
    input  [3:0]   i_rdecer_1                    ,
    input  [3:0]   i_rxk_1                       ,
    input  [2:0]   i_rxh_1                       ,
    input          i_rxq_start_1                 ,
    input          i_rxh_vld_1                    ,
    input          i_rxd_vld_1                    ,
    input  [2:0]   i_rxstatus_2                  ,
    input  [39:0]  i_rxd_2                       ,
    input  [3:0]   i_rdisper_2                   ,
    input  [3:0]   i_rdecer_2                    ,
    input  [3:0]   i_rxk_2                       ,
    input  [2:0]   i_rxh_2                       ,
    input          i_rxq_start_2                 ,
    input          i_rxh_vld_2                    ,
    input          i_rxd_vld_2                    ,
    input  [2:0]   i_rxstatus_3                  ,
    input  [39:0]  i_rxd_3                       ,
    input  [3:0]   i_rdisper_3                   ,
    input  [3:0]   i_rdecer_3                    ,
    input  [3:0]   i_rxk_3                       ,
    input  [2:0]   i_rxh_3                       ,
    input          i_rxq_start_3                 ,
    input          i_rxh_vld_3                    ,
    input          i_rxd_vld_3                    ,
    output         o_p_rxgear_slip_0               ,
    output         o_p_rxgear_slip_1               ,
    output         o_p_rxgear_slip_2               ,
    output         o_p_rxgear_slip_3               ,
    output [3:0]   o_pl_err                      
);

localparam CH0_PROTOCOL = "CUSTOMERIZEDx1";
localparam CH1_PROTOCOL = "CUSTOMERIZEDx1";
localparam CH2_PROTOCOL = "CUSTOMERIZEDx2";
localparam CH3_PROTOCOL = "CUSTOMERIZEDx2";
localparam CH0_RXPCS_BONDING = "Bypassed";
localparam CH1_RXPCS_BONDING = "Bypassed";
localparam CH2_RXPCS_BONDING = "Bypassed";
localparam CH3_RXPCS_BONDING = "Bypassed";

localparam [3:0] RD_8BIT_ONLY   = {{RD_8BIT_ONLY_3  =="TRUE"},{RD_8BIT_ONLY_2  =="TRUE"},{RD_8BIT_ONLY_1  =="TRUE"},{RD_8BIT_ONLY_0  =="TRUE"}}; 
localparam [3:0] RD_10BIT_ONLY  = {{RD_10BIT_ONLY_3 =="TRUE"},{RD_10BIT_ONLY_2 =="TRUE"},{RD_10BIT_ONLY_1 =="TRUE"},{RD_10BIT_ONLY_0 =="TRUE"}}; 
localparam [3:0] RD_8B10B_8BIT  = {{RD_8B10B_8BIT_3 =="TRUE"},{RD_8B10B_8BIT_2 =="TRUE"},{RD_8B10B_8BIT_1 =="TRUE"},{RD_8B10B_8BIT_0 =="TRUE"}}; 
localparam [3:0] RD_16BIT_ONLY  = {{RD_16BIT_ONLY_3 =="TRUE"},{RD_16BIT_ONLY_2 =="TRUE"},{RD_16BIT_ONLY_1 =="TRUE"},{RD_16BIT_ONLY_0 =="TRUE"}}; 
localparam [3:0] RD_20BIT_ONLY  = {{RD_20BIT_ONLY_3 =="TRUE"},{RD_20BIT_ONLY_2 =="TRUE"},{RD_20BIT_ONLY_1 =="TRUE"},{RD_20BIT_ONLY_0 =="TRUE"}}; 
localparam [3:0] RD_8B10B_16BIT = {{RD_8B10B_16BIT_3=="TRUE"},{RD_8B10B_16BIT_2=="TRUE"},{RD_8B10B_16BIT_1=="TRUE"},{RD_8B10B_16BIT_0=="TRUE"}}; 
localparam [3:0] RD_32BIT_ONLY  = {{RD_32BIT_ONLY_3 =="TRUE"},{RD_32BIT_ONLY_2 =="TRUE"},{RD_32BIT_ONLY_1 =="TRUE"},{RD_32BIT_ONLY_0 =="TRUE"}}; 
localparam [3:0] RD_40BIT_ONLY  = {{RD_40BIT_ONLY_3 =="TRUE"},{RD_40BIT_ONLY_2 =="TRUE"},{RD_40BIT_ONLY_1 =="TRUE"},{RD_40BIT_ONLY_0 =="TRUE"}}; 
localparam [3:0] RD_8B10B_32BIT = {{RD_8B10B_32BIT_3=="TRUE"},{RD_8B10B_32BIT_2=="TRUE"},{RD_8B10B_32BIT_1=="TRUE"},{RD_8B10B_32BIT_0=="TRUE"}};
localparam [3:0] RD_66B_16B   = {{RD_64B66B_16BIT_3  =="TRUE"},{RD_64B66B_16BIT_2  =="TRUE"},{RD_64B66B_16BIT_1  =="TRUE"},{RD_64B66B_16BIT_0  =="TRUE"}}; 
localparam [3:0] RD_66B_32B   = {{RD_64B66B_32BIT_3  =="TRUE"},{RD_64B66B_32BIT_2  =="TRUE"},{RD_64B66B_32BIT_1  =="TRUE"},{RD_64B66B_32BIT_0  =="TRUE"}};
localparam [3:0] RD_67B_16B   = {{RD_64B67B_16BIT_3  =="TRUE"},{RD_64B67B_16BIT_2  =="TRUE"},{RD_64B67B_16BIT_1  =="TRUE"},{RD_64B67B_16BIT_0  =="TRUE"}};
localparam [3:0] RD_67B_32B   = {{RD_64B67B_32BIT_3  =="TRUE"},{RD_64B67B_32BIT_2  =="TRUE"},{RD_64B67B_32BIT_1  =="TRUE"},{RD_64B67B_32BIT_0  =="TRUE"}};


genvar i;

wire [ 3:0] chk_clk = {i_chk_clk3,i_chk_clk2,i_chk_clk1,i_chk_clk0};

// ********************* RXD BUFFER *********************
wire  [39:0] rxd     [3:0];
reg   [39:0] rxd_ff1 [3:0];
reg   [39:0] rxd_ff2 [3:0];
reg   [39:0] rxd_ff3 [3:0];
reg   [39:0] rxd_ff4 [3:0];
reg   [39:0] rxd_ff5 [3:0];
wire  [ 3:0] rxk     [3:0];
reg   [ 3:0] rxk_ff1 [3:0];
reg   [ 3:0] rxk_ff2 [3:0];
reg   [ 3:0] rxk_ff3 [3:0];
reg   [39:0] rxd_algn [3:0];
reg   [ 3:0] rxk_algn [3:0];
reg   [39:0] rxd_algn_ff1 [3:0];
reg   [39:0] rxd_algn_ff2 [3:0];
reg   [ 3:0] rxk_algn_ff1 [3:0];
reg   [ 3:0] rxk_algn_ff2 [3:0];
reg   [1:0] rxbyte_shft [3:0];

assign rxd[0] = i_rxd_0;
assign rxd[1] = i_rxd_1;
assign rxd[2] = i_rxd_2;
assign rxd[3] = i_rxd_3;
assign rxk[0] = i_rxk_0;
assign rxk[1] = i_rxk_1;
assign rxk[2] = i_rxk_2;
assign rxk[3] = i_rxk_3;

//********************** 66B67B Checker **********************
reg [6:0] slip_cycle   [3:0];
wire[3:0] slip_finish       ;
reg [6:0] slip_cnt    [3:0] ;
reg [3:0] slip_chk_done     ;
reg [3:0] rxq_start_ff1     ;
reg [3:0] rxq_start_ff2     ;
reg [3:0] rxq_start_ff3     ;
reg [3:0] rxq_start_ff4     ;
reg [3:0] rxq_start_ff5     ;
wire[3:0] rxq_start         ;
wire[2:0] rxh         [3:0] ;
reg [2:0] rxh_ff1     [3:0] ;
reg [2:0] rxh_ff2     [3:0] ;
reg [2:0] rxh_ff3     [3:0] ;
reg [2:0] rxh_ff4     [3:0] ;
reg [2:0] rxh_ff5     [3:0] ;
wire[3:0] rxhvld            ;
reg [3:0] rxhvld_ff         ;
wire[3:0] rxdvld            ;
reg [3:0] rxdvld_ff1        ;
reg [3:0] rxdvld_ff2        ;
wire[65:0]data_66b    [3:0] ;
reg       rxgear_slip [3:0] ;

assign rxq_start   = {i_rxq_start_3,i_rxq_start_2,i_rxq_start_1,i_rxq_start_0} ;
assign rxhvld      = {i_rxh_vld_3,i_rxh_vld_2,i_rxh_vld_1,i_rxh_vld_0} ;
assign rxdvld      = {i_rxd_vld_3,i_rxd_vld_2,i_rxd_vld_1,i_rxd_vld_0} ;
assign rxh[0]      = i_rxh_0 ;
assign rxh[1]      = i_rxh_1 ;
assign rxh[2]      = i_rxh_2 ;
assign rxh[3]      = i_rxh_3 ;

// ********************* Payload Checker *********************
localparam [ 7:0] PAYLOAD_8W  =  8'b01_000_111;
localparam [ 9:0] PAYLOAD_10W = 10'b01_0000_1111;
localparam [15:0] PAYLOAD_16W = {2{8'b0001_0111}};
localparam [19:0] PAYLOAD_20W = {2{10'b00001_01111}};
localparam [31:0] PAYLOAD_32W = {4{8'b0101_0011}};
localparam [39:0] PAYLOAD_40W = {4{10'b00101_00111}};
localparam [15:0] PAYLOAD_66B67B_16B = {2{8'b1010_1010}};
localparam [31:0] PAYLOAD_66B67B_32B = {4{8'b1010_1010}};

reg  [39:0] payload     [3:0];
reg  [39:0] payload_buf [3:0];
reg  [ 5:0] shift_bits  [3:0];
reg  [ 5:0] shift_bits_ff1  [3:0];
reg  [ 3:0] pl_err  ;
reg  [15:0] pattern_cnt [3:0] ;
wire [40:0] payload_shift [3:0];

generate
for (i=0; i<=3; i=i+1) begin: PL_LANE
    always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
        if(i_chk_rstn[i]==1'b0) 
            rxd_ff1[i] <= 40'd0;
        else 
            rxd_ff1[i] <= rxd[i];
    end
    always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
        if(i_chk_rstn[i]==1'b0) 
            rxd_ff2[i] <= 40'd0;
        else 
            rxd_ff2[i] <= rxd_ff1[i];
    end
    always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
        if(i_chk_rstn[i]==1'b0) 
            rxd_ff3[i] <= 40'd0;
        else 
            rxd_ff3[i] <= rxd_ff2[i];
    end
    always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
        if(i_chk_rstn[i]==1'b0) 
            rxd_ff4[i] <= 40'd0;
        else 
            rxd_ff4[i] <= rxd_ff3[i];
    end
    always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
        if(i_chk_rstn[i]==1'b0) 
            rxd_ff5[i] <= 40'd0;
        else 
            rxd_ff5[i] <= rxd_ff4[i];
    end
    always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
        if(i_chk_rstn[i]==1'b0) 
            rxhvld_ff[i] <= 1'd0;
        else 
            rxhvld_ff[i] <= rxhvld[i];
    end
    always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
        if(i_chk_rstn[i]==1'b0) 
            rxdvld_ff1[i] <= 1'd0;
        else 
            rxdvld_ff1[i] <= rxdvld[i];
    end
    always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
        if(i_chk_rstn[i]==1'b0) 
            rxdvld_ff2[i] <= 1'd0;
        else 
            rxdvld_ff2[i] <= rxdvld_ff1[i];
    end
    always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
        if(i_chk_rstn[i]==1'b0) 
            rxq_start_ff1[i] <= 1'd0;
        else 
            rxq_start_ff1[i] <= rxq_start[i];
    end
    always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
        if(i_chk_rstn[i]==1'b0) 
            rxq_start_ff2[i] <= 1'd0;
        else 
            rxq_start_ff2[i] <= rxq_start_ff1[i];
    end
    always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
        if(i_chk_rstn[i]==1'b0) 
            rxq_start_ff3[i] <= 1'd0;
        else 
            rxq_start_ff3[i] <= rxq_start_ff2[i];
    end
    always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
        if(i_chk_rstn[i]==1'b0) 
            rxq_start_ff4[i] <= 1'd0;
        else 
            rxq_start_ff4[i] <= rxq_start_ff3[i];
    end
    always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
        if(i_chk_rstn[i]==1'b0) 
            rxq_start_ff5[i] <= 1'd0;
        else 
            rxq_start_ff5[i] <= rxq_start_ff4[i];
    end
    always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
        if(i_chk_rstn[i]==1'b0) 
            rxh_ff1[i] <= 3'd0;
        else 
            rxh_ff1[i] <= rxh[i];
    end
    always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
        if(i_chk_rstn[i]==1'b0) 
            rxh_ff2[i] <= 3'd0;
        else 
            rxh_ff2[i] <= rxh_ff1[i];
    end
    always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
        if(i_chk_rstn[i]==1'b0) 
            rxh_ff3[i] <= 3'd0;
        else 
            rxh_ff3[i] <= rxh_ff2[i];
    end
    always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
        if(i_chk_rstn[i]==1'b0) 
            rxh_ff4[i] <= 3'd0;
        else 
            rxh_ff4[i] <= rxh_ff3[i];
    end
    always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
        if(i_chk_rstn[i]==1'b0) 
            rxh_ff5[i] <= 3'd0;
        else 
            rxh_ff5[i] <= rxh_ff4[i];
    end
    always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
        if(i_chk_rstn[i]==1'b0) 
            rxk_ff1[i] <=  4'd0;
        else 
            rxk_ff1[i] <= rxk[i];
    end
    always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
        if(i_chk_rstn[i]==1'b0) 
            rxk_ff2[i] <=  4'd0;
        else 
            rxk_ff2[i] <= rxk_ff1[i];
    end
    always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
        if(i_chk_rstn[i]==1'b0) 
            rxk_ff3[i] <=  4'd0;
        else 
            rxk_ff3[i] <= rxk_ff2[i];
    end
    always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
        if(i_chk_rstn[i]==1'b0) 
            shift_bits_ff1[i] <= 6'd0;
        else 
            shift_bits_ff1[i] <= shift_bits[i];
    end

    if(RD_8BIT_ONLY[i]==1) begin : RD_8BIT_ONLY
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) 
                shift_bits[i] <= 6'd0;
            else begin
                case(3'b010)
                     rxd_ff1[i][7:5] : shift_bits[i] <= 6'd0;
                     rxd_ff1[i][6:4] : shift_bits[i] <= 6'd1;
                     rxd_ff1[i][5:3] : shift_bits[i] <= 6'd2;
                     rxd_ff1[i][4:2] : shift_bits[i] <= 6'd3;
                     rxd_ff1[i][3:1] : shift_bits[i] <= 6'd4;
                     rxd_ff1[i][2:0] : shift_bits[i] <= 6'd5;
                    {rxd_ff1[i][1:0],rxd_ff2[i][7]} : shift_bits[i] <= 6'd6;
                    {rxd_ff1[i][0],rxd_ff2[i][7:6]} : shift_bits[i] <= 6'd7;
                    default: ;
                endcase
            end
        end

        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) 
                payload[i] <= 40'b0;
            else begin
                case(shift_bits[i])
                    6'd0:  payload[i][7:0] <=  rxd_ff1[i][7:0];
                    6'd1:  payload[i][7:0] <= {rxd_ff1[i][6:0],rxd_ff2[i][7:7]};
                    6'd2:  payload[i][7:0] <= {rxd_ff1[i][5:0],rxd_ff2[i][7:6]};
                    6'd3:  payload[i][7:0] <= {rxd_ff1[i][4:0],rxd_ff2[i][7:5]};
                    6'd4:  payload[i][7:0] <= {rxd_ff1[i][3:0],rxd_ff2[i][7:4]};
                    6'd5:  payload[i][7:0] <= {rxd_ff1[i][2:0],rxd_ff2[i][7:3]};
                    6'd6:  payload[i][7:0] <= {rxd_ff1[i][1:0],rxd_ff2[i][7:2]};
                    6'd7:  payload[i][7:0] <= {rxd_ff1[i][0:0],rxd_ff2[i][7:1]};
                    default: ;
                endcase
            end
        end

        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) 
                pl_err[i] <= 1'b0;
            else if((shift_bits[i]!=shift_bits_ff1[i])||(payload[i][7:0]!=PAYLOAD_8W))
                pl_err[i] <= 1'b1;
            else
                pl_err[i] <= 1'b0;
        end

    end
    else if(RD_10BIT_ONLY[i]==1) begin : RD_10BIT_ONLY
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) 
                shift_bits[i] <= 6'd0;
            else begin
                case(3'b010)
                     rxd_ff1[i][9:7] : shift_bits[i] <= 6'd0;
                     rxd_ff1[i][8:6] : shift_bits[i] <= 6'd1;
                     rxd_ff1[i][7:5] : shift_bits[i] <= 6'd2;
                     rxd_ff1[i][6:4] : shift_bits[i] <= 6'd3;
                     rxd_ff1[i][5:3] : shift_bits[i] <= 6'd4;
                     rxd_ff1[i][4:2] : shift_bits[i] <= 6'd5;
                     rxd_ff1[i][3:1] : shift_bits[i] <= 6'd6;
                     rxd_ff1[i][2:0] : shift_bits[i] <= 6'd7;
                    {rxd_ff1[i][1:0],rxd_ff2[i][9]} : shift_bits[i] <= 6'd8;
                    {rxd_ff1[i][0],rxd_ff2[i][9:8]} : shift_bits[i] <= 6'd9;
                    default: ;
                endcase
            end
        end

        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) 
                payload[i] <= 40'b0;
            else begin
                case(shift_bits[i])
                    6'd0:  payload[i][9:0] <=  rxd_ff1[i][9:0];
                    6'd1:  payload[i][9:0] <= {rxd_ff1[i][8:0],rxd_ff2[i][9:9]};
                    6'd2:  payload[i][9:0] <= {rxd_ff1[i][7:0],rxd_ff2[i][9:8]};
                    6'd3:  payload[i][9:0] <= {rxd_ff1[i][6:0],rxd_ff2[i][9:7]};
                    6'd4:  payload[i][9:0] <= {rxd_ff1[i][5:0],rxd_ff2[i][9:6]};
                    6'd5:  payload[i][9:0] <= {rxd_ff1[i][4:0],rxd_ff2[i][9:5]};
                    6'd6:  payload[i][9:0] <= {rxd_ff1[i][3:0],rxd_ff2[i][9:4]};
                    6'd7:  payload[i][9:0] <= {rxd_ff1[i][2:0],rxd_ff2[i][9:3]};
                    6'd8:  payload[i][9:0] <= {rxd_ff1[i][1:0],rxd_ff2[i][9:2]};
                    6'd9:  payload[i][9:0] <= {rxd_ff1[i][0:0],rxd_ff2[i][9:1]};
                    default: ;
                endcase
            end
        end

        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) 
                pl_err[i] <= 1'b0;
            else if((shift_bits[i]!=shift_bits_ff1[i])||(payload[i][9:0]!=PAYLOAD_10W))
                pl_err[i] <= 1'b1;
            else
                pl_err[i] <= 1'b0;
        end

    end
    else if(RD_16BIT_ONLY[i]==1) begin : RD_16BIT_ONLY
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) 
                shift_bits[i] <= 6'd0;
            else begin
                case(3'b000)
                     rxd_ff1[i][7:5] : shift_bits[i] <= 6'd0;
                     rxd_ff1[i][6:4] : shift_bits[i] <= 6'd1;
                     rxd_ff1[i][5:3] : shift_bits[i] <= 6'd2;
                     rxd_ff1[i][4:2] : shift_bits[i] <= 6'd3;
                     rxd_ff1[i][3:1] : shift_bits[i] <= 6'd4;
                     rxd_ff1[i][2:0] : shift_bits[i] <= 6'd5;
                    {rxd_ff1[i][1:0],rxd_ff2[i][7]} : shift_bits[i] <= 6'd6;
                    {rxd_ff1[i][0],rxd_ff2[i][7:6]} : shift_bits[i] <= 6'd7;
                    default: ;
                endcase
            end
        end

        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) 
                payload[i] <= 40'b0;
            else begin
                case(shift_bits[i])
                    6'd0:  payload[i][15:0] <=  rxd_ff1[i][15:0];
                    6'd1:  payload[i][15:0] <= {rxd_ff1[i][14:0],rxd_ff2[i][15]};
                    6'd2:  payload[i][15:0] <= {rxd_ff1[i][13:0],rxd_ff2[i][15:14]};
                    6'd3:  payload[i][15:0] <= {rxd_ff1[i][12:0],rxd_ff2[i][15:13]};
                    6'd4:  payload[i][15:0] <= {rxd_ff1[i][11:0],rxd_ff2[i][15:12]};
                    6'd5:  payload[i][15:0] <= {rxd_ff1[i][10:0],rxd_ff2[i][15:11]};
                    6'd6:  payload[i][15:0] <= {rxd_ff1[i][ 9:0],rxd_ff2[i][15:10]};
                    6'd7:  payload[i][15:0] <= {rxd_ff1[i][ 8:0],rxd_ff2[i][15: 9]};
                    default: ;
                endcase
            end
        end

        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) 
                pl_err[i] <= 1'b0;
            else if((shift_bits[i]!=shift_bits_ff1[i])||(payload[i][15:0]!=PAYLOAD_16W))
                pl_err[i] <= 1'b1;
            else
                pl_err[i] <= 1'b0;
        end

    end
    else if(RD_20BIT_ONLY[i]==1) begin : RD_20BIT_ONLY
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) 
                shift_bits[i] <= 6'd0;
            else begin
                case(4'b0000)
                     rxd_ff1[i][9:6] : shift_bits[i] <= 6'd0;
                     rxd_ff1[i][8:5] : shift_bits[i] <= 6'd1;
                     rxd_ff1[i][7:4] : shift_bits[i] <= 6'd2;
                     rxd_ff1[i][6:3] : shift_bits[i] <= 6'd3;
                     rxd_ff1[i][5:2] : shift_bits[i] <= 6'd4;
                     rxd_ff1[i][4:1] : shift_bits[i] <= 6'd5;
                     rxd_ff1[i][3:0] : shift_bits[i] <= 6'd6;
                    {rxd_ff1[i][2:0],rxd_ff2[i][9]}   : shift_bits[i] <= 6'd7;
                    {rxd_ff1[i][1:0],rxd_ff2[i][9:8]} : shift_bits[i] <= 6'd8;
                    {rxd_ff1[i][0],rxd_ff2[i][9:7]}   : shift_bits[i] <= 6'd9;
                    default: ;
                endcase
            end
        end

        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) 
                payload[i] <= 40'b0;
            else begin
                case(shift_bits[i])
                    6'd0:  payload[i][19:0] <=  rxd_ff1[i][19:0];
                    6'd1:  payload[i][19:0] <= {rxd_ff1[i][18:0],rxd_ff2[i][19]};
                    6'd2:  payload[i][19:0] <= {rxd_ff1[i][17:0],rxd_ff2[i][19:18]};
                    6'd3:  payload[i][19:0] <= {rxd_ff1[i][16:0],rxd_ff2[i][19:17]};
                    6'd4:  payload[i][19:0] <= {rxd_ff1[i][15:0],rxd_ff2[i][19:16]};
                    6'd5:  payload[i][19:0] <= {rxd_ff1[i][14:0],rxd_ff2[i][19:15]};
                    6'd6:  payload[i][19:0] <= {rxd_ff1[i][13:0],rxd_ff2[i][19:14]};
                    6'd7:  payload[i][19:0] <= {rxd_ff1[i][12:0],rxd_ff2[i][19:13]};
                    6'd8:  payload[i][19:0] <= {rxd_ff1[i][11:0],rxd_ff2[i][19:12]};
                    6'd9:  payload[i][19:0] <= {rxd_ff1[i][10:0],rxd_ff2[i][19:11]};
                    default: ;
                endcase
            end
        end

        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) 
                pl_err[i] <= 1'b0;
            else if((shift_bits[i]!=shift_bits_ff1[i])||(payload[i][19:0]!=PAYLOAD_20W))
                pl_err[i] <= 1'b1;
            else
                pl_err[i] <= 1'b0;
        end

    end
    else if(RD_32BIT_ONLY[i]==1) begin : RD_32BIT_ONLY
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) 
                shift_bits[i] <= 6'd0;
            else begin
                case(4'b0101)
                     rxd_ff1[i][7:4] : shift_bits[i] <= 6'd0;
                     rxd_ff1[i][6:3] : shift_bits[i] <= 6'd1;
                     rxd_ff1[i][5:2] : shift_bits[i] <= 6'd2;
                     rxd_ff1[i][4:1] : shift_bits[i] <= 6'd3;
                     rxd_ff1[i][3:0] : shift_bits[i] <= 6'd4;
                    {rxd_ff1[i][2:0],rxd_ff2[i][7]}   : shift_bits[i] <= 6'd5;
                    {rxd_ff1[i][1:0],rxd_ff2[i][7:6]} : shift_bits[i] <= 6'd6;
                    {rxd_ff1[i][0],rxd_ff2[i][7:5]}   : shift_bits[i] <= 6'd7;
                    default: ;
                endcase
            end
        end

        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) 
                payload[i] <= 40'b0;
            else begin
                case(shift_bits[i])
                    6'd0:  payload[i][31:0] <=  rxd_ff1[i][31:0];
                    6'd1:  payload[i][31:0] <= {rxd_ff1[i][30:0],rxd_ff2[i][31]};
                    6'd2:  payload[i][31:0] <= {rxd_ff1[i][29:0],rxd_ff2[i][31:30]};
                    6'd3:  payload[i][31:0] <= {rxd_ff1[i][28:0],rxd_ff2[i][31:29]};
                    6'd4:  payload[i][31:0] <= {rxd_ff1[i][27:0],rxd_ff2[i][31:28]};
                    6'd5:  payload[i][31:0] <= {rxd_ff1[i][26:0],rxd_ff2[i][31:27]};
                    6'd6:  payload[i][31:0] <= {rxd_ff1[i][25:0],rxd_ff2[i][31:26]};
                    6'd7:  payload[i][31:0] <= {rxd_ff1[i][24:0],rxd_ff2[i][31:25]};
                    default: ;
                endcase
            end
        end

        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) 
                pl_err[i] <= 1'b0;
            else if((shift_bits[i]!=shift_bits_ff1[i])||(payload[i][31:0]!=PAYLOAD_32W))
                pl_err[i] <= 1'b1;
            else
                pl_err[i] <= 1'b0;
        end

    end
    else if(RD_40BIT_ONLY[i]==1) begin : RD_40BIT_ONLY
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) 
                shift_bits[i] <= 6'd0;
            else begin
                case(4'b0010)
                     rxd_ff1[i][9:6] : shift_bits[i] <= 6'd0;
                     rxd_ff1[i][8:5] : shift_bits[i] <= 6'd1;
                     rxd_ff1[i][7:4] : shift_bits[i] <= 6'd2;
                     rxd_ff1[i][6:3] : shift_bits[i] <= 6'd3;
                     rxd_ff1[i][5:2] : shift_bits[i] <= 6'd4;
                     rxd_ff1[i][4:1] : shift_bits[i] <= 6'd5;
                     rxd_ff1[i][3:0] : shift_bits[i] <= 6'd6;
                    {rxd_ff1[i][2:0],rxd_ff2[i][9]}   : shift_bits[i] <= 6'd7;
                    {rxd_ff1[i][1:0],rxd_ff2[i][9:8]} : shift_bits[i] <= 6'd8;
                    {rxd_ff1[i][0],rxd_ff2[i][9:7]}   : shift_bits[i] <= 6'd9;
                    default: ;
                endcase
            end
        end

        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) 
                payload[i] <= 40'b0;
            else begin
                case(shift_bits[i])
                    6'd0:  payload[i][39:0] <=  rxd_ff1[i][39:0];
                    6'd1:  payload[i][39:0] <= {rxd_ff1[i][38:0],rxd_ff2[i][39]};
                    6'd2:  payload[i][39:0] <= {rxd_ff1[i][37:0],rxd_ff2[i][39:38]};
                    6'd3:  payload[i][39:0] <= {rxd_ff1[i][36:0],rxd_ff2[i][39:37]};
                    6'd4:  payload[i][39:0] <= {rxd_ff1[i][35:0],rxd_ff2[i][39:36]};
                    6'd5:  payload[i][39:0] <= {rxd_ff1[i][34:0],rxd_ff2[i][39:35]};
                    6'd6:  payload[i][39:0] <= {rxd_ff1[i][33:0],rxd_ff2[i][39:34]};
                    6'd7:  payload[i][39:0] <= {rxd_ff1[i][32:0],rxd_ff2[i][39:33]};
                    6'd8:  payload[i][39:0] <= {rxd_ff1[i][31:0],rxd_ff2[i][39:32]};
                    6'd9:  payload[i][39:0] <= {rxd_ff1[i][30:0],rxd_ff2[i][39:31]};
                    default: ;
                endcase
            end
        end

        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) 
                pl_err[i] <= 1'b0;
            else if((shift_bits[i]!=shift_bits_ff1[i])||(payload[i][39:0]!=PAYLOAD_40W))
                pl_err[i] <= 1'b1;
            else
                pl_err[i] <= 1'b0;
        end

    end
    else if(RD_8B10B_8BIT[i]==1) begin : RD_8B10B_8BIT
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) 
                shift_bits[i] <= 6'd0;
            else 
                shift_bits[i] <= shift_bits[i];
        end
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0)
                pattern_cnt[i] <= 16'd4;
            else if(pattern_cnt[i]==16'd4)begin
               if(({rxk_ff2[i][0],rxk_ff1[i][0],rxk[i][0]}==3'b100) || ({rxk_ff2[i][0],rxk_ff1[i][0],rxk[i][0]}==3'b110)) 
                   pattern_cnt[i] <= 16'd0;
               else;
            end
            else if(pattern_cnt[i]<16'd4) 
                pattern_cnt[i] <= pattern_cnt[i]+16'd1;
            else;
        end
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) begin
                payload[i][7:0] <= 8'b0;
                payload_buf[i][7:0] <= 8'b0;
            end
            else if((pattern_cnt[i]<=16'd3)&&(pattern_cnt[i]>=16'd0)) begin
                payload[i][7:0] <= rxd_ff1[i][7:0];
                payload_buf[i][7:0] <= payload[i][7:0];
            end
            else ;
        end
        assign payload_shift[i][7:0] = {payload_buf[i][6:0],payload_buf[i][7]}; 
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0)
                pl_err[i] <= 1'b0;
            else if((pattern_cnt[i]<=16'd3)&&(pattern_cnt[i]>=16'd0)&&(payload[i][7:0]!=payload_shift[i][7:0]))
                pl_err[i] <= 1'b1;
            else
                pl_err[i] <= 1'b0;
        end
    end
    else if(RD_8B10B_16BIT[i]==1) begin : RD_8B10B_16BIT
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) 
                shift_bits[i] <= 6'd0;
            else 
                shift_bits[i] <= shift_bits[i];
        end
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0)
                rxbyte_shft[i] <= 2'd0;
            else if({rxk[i][0],rxk_ff1[i][1:0],rxk_ff2[i][1:0]}==5'b1_0000)
                rxbyte_shft[i] <= 2'd0;
            else if({rxk[i][1:0],rxk_ff1[i][1:0],rxk_ff2[i][1]}==5'b1_0000)
                rxbyte_shft[i] <= 2'd1;
            else ;
        end
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) begin
                rxd_algn[i] <= 40'd0;
                rxk_algn[i] <= 4'd0;
            end
            else if(rxbyte_shft[i]==2'd1) begin
                rxd_algn[i] <= {24'b0,rxd_ff2[i][7:0],rxd_ff3[i][15:8]};
                rxk_algn[i] <= {2'b0,rxk_ff2[i][0],rxk_ff3[i][1]};
            end
            else begin
                rxd_algn[i] <= {24'b0,rxd_ff3[i][15:0]};
                rxk_algn[i] <= {2'b0,rxk_ff3[i][1:0]};
            end
        end
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) begin
                rxd_algn_ff1[i] <= 40'd0;
                rxd_algn_ff2[i] <= 40'd0;
                rxk_algn_ff1[i] <= 4'd0;
                rxk_algn_ff2[i] <= 4'd0;
            end
            else begin
                rxd_algn_ff1[i] <= rxd_algn[i];
                rxd_algn_ff2[i] <= rxd_algn_ff1[i];
                rxk_algn_ff1[i] <= rxk_algn[i];
                rxk_algn_ff2[i] <= rxk_algn_ff1[i];
            end
        end
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0)
                pattern_cnt[i] <= 16'd2;
            else if({rxk_algn[i][1:0],rxk_algn_ff1[i][1:0]}==4'b0000) 
                pattern_cnt[i] <= 16'd0;
            else if(pattern_cnt[i]<16'd2) 
                pattern_cnt[i] <= pattern_cnt[i]+16'd1;
            else;
        end
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) begin
                payload[i][15:0] <= 16'b0;
                payload_buf[i][15:0] <= 16'b0;
            end
            else if((pattern_cnt[i]<=16'd1)&&(pattern_cnt[i]>=16'd0)) begin
                payload[i][15:0] <= rxd_algn_ff2[i][15:0];
                payload_buf[i][15:0] <= payload[i][15:0];
            end
            else ;
        end
        assign payload_shift[i][15:0] = {payload_buf[i][14:0],payload_buf[i][15]}; 
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0)
                pl_err[i] <= 1'b0;
            else if((pattern_cnt[i]<=16'd1)&&(pattern_cnt[i]>=16'd0)&&(payload[i][15:0]!=payload_shift[i][15:0]))
                pl_err[i] <= 1'b1;
            else
                pl_err[i] <= 1'b0;
        end
    end
    else if (RD_66B_16B[i] == 1 ) begin : RD_66B_16B
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) 
                shift_bits[i] <= 6'd0;
            else 
                shift_bits[i] <= shift_bits[i];
        end
        assign data_66b[i] = {rxh_ff1[i][1:0],rxd_ff2[i][15:0],rxd_ff3[i][15:0],rxd_ff4[i][15:0],rxd_ff5[i][15:0]}    ;
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) begin
                slip_chk_done[i] <= 1'd0;
                slip_cnt[i]   <= 7'd0;
            end
            else if (rxq_start_ff5[i] && (!slip_chk_done[i])) begin
                case(3'b001)
                {data_66b[i][0],rxh_ff5[i][1:0]}  :    begin
                                                        slip_cnt[i]    <= 7'd0     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                {data_66b[i][1:0],rxh_ff5[i][1]}      :    begin
                                                        slip_cnt[i]    <= 7'd1     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][2:0]                   :    begin
                                                        slip_cnt[i]    <= 7'd2     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][3:1]                   :    begin
                                                        slip_cnt[i]    <= 7'd3     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][4:2]                   :    begin
                                                        slip_cnt[i]    <= 7'd4     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][5:3]                   :    begin
                                                        slip_cnt[i]    <= 7'd5     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][6:4]                   :    begin
                                                        slip_cnt[i]    <= 7'd6     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][7:5]                   :    begin
                                                        slip_cnt[i]    <= 7'd7     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][8:6]                   :    begin
                                                        slip_cnt[i]    <= 7'd8     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][9:7]                   :    begin
                                                        slip_cnt[i]    <= 7'd9     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][10:8]                  :    begin
                                                        slip_cnt[i]    <= 7'd10    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][11:9]                  :    begin
                                                        slip_cnt[i]    <= 7'd11    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][12:10]                 :    begin
                                                        slip_cnt[i]    <= 7'd12    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][13:11]                 :    begin
                                                        slip_cnt[i]    <= 7'd13    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][14:12]                 :    begin
                                                        slip_cnt[i]    <= 7'd14    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][15:13]                 :    begin
                                                        slip_cnt[i]    <= 7'd15    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][16:14]                 :    begin
                                                        slip_cnt[i]    <= 7'd16    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][17:15]                 :    begin
                                                        slip_cnt[i]    <= 7'd17    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][18:16]                 :    begin
                                                        slip_cnt[i]    <= 7'd18    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][19:17]                 :    begin
                                                        slip_cnt[i]    <= 7'd19    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][20:18]                 :    begin
                                                        slip_cnt[i]    <= 7'd20    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][21:19]                 :    begin
                                                        slip_cnt[i]    <= 7'd21    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][22:20]                 :    begin
                                                        slip_cnt[i]    <= 7'd22    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][23:21]                 :    begin
                                                        slip_cnt[i]    <= 7'd23    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][24:22]                 :    begin
                                                        slip_cnt[i]    <= 7'd24    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][25:23]                 :    begin
                                                        slip_cnt[i]    <= 7'd25    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][26:24]                 :    begin
                                                        slip_cnt[i]    <= 7'd26    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][27:25]                 :    begin
                                                        slip_cnt[i]    <= 7'd27    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][28:26]                 :    begin
                                                        slip_cnt[i]    <= 7'd28    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][29:27]                 :    begin
                                                        slip_cnt[i]    <= 7'd29    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][30:28]                 :    begin
                                                        slip_cnt[i]    <= 7'd30    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][31:29]                 :    begin
                                                        slip_cnt[i]    <= 7'd31    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][32:30]                 :    begin
                                                        slip_cnt[i]    <= 7'd32    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][33:31]                 :    begin
                                                        slip_cnt[i]    <= 7'd33    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][34:32]                 :    begin
                                                        slip_cnt[i]    <= 7'd34    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][35:33]                 :    begin
                                                        slip_cnt[i]    <= 7'd35    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][36:34]                 :    begin
                                                        slip_cnt[i]    <= 7'd36    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][37:35]                 :    begin
                                                        slip_cnt[i]    <= 7'd37    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][38:36]                 :    begin
                                                        slip_cnt[i]    <= 7'd38    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][39:37]                 :    begin
                                                        slip_cnt[i]    <= 7'd39    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][40:38]                 :    begin
                                                        slip_cnt[i]    <= 7'd40    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][41:39]                 :    begin
                                                        slip_cnt[i]    <= 7'd41    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][42:40]                 :    begin
                                                        slip_cnt[i]    <= 7'd42    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][43:41]                 :    begin
                                                        slip_cnt[i]    <= 7'd43    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][44:42]                 :    begin
                                                        slip_cnt[i]    <= 7'd44    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][45:43]                 :    begin
                                                        slip_cnt[i]    <= 7'd45    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][46:44]                 :    begin
                                                        slip_cnt[i]    <= 7'd46    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][47:45]                 :    begin
                                                        slip_cnt[i]    <= 7'd47    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][48:46]                 :    begin
                                                        slip_cnt[i]    <= 7'd48    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][49:47]                 :    begin
                                                        slip_cnt[i]    <= 7'd49    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][50:48]                 :    begin
                                                        slip_cnt[i]    <= 7'd50    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][51:49]                 :    begin
                                                        slip_cnt[i]    <= 7'd51    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][52:50]                 :    begin
                                                        slip_cnt[i]    <= 7'd52    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][53:51]                 :    begin
                                                        slip_cnt[i]    <= 7'd53    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][54:52]                 :    begin
                                                        slip_cnt[i]    <= 7'd54    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][55:53]                 :    begin
                                                        slip_cnt[i]    <= 7'd55    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][56:54]                 :    begin
                                                        slip_cnt[i]    <= 7'd56    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][57:55]                 :    begin
                                                        slip_cnt[i]    <= 7'd57    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][58:56]                 :    begin
                                                        slip_cnt[i]    <= 7'd58    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][59:57]                 :    begin
                                                        slip_cnt[i]    <= 7'd59    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][60:58]                 :    begin
                                                        slip_cnt[i]    <= 7'd60    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][61:59]                 :    begin
                                                        slip_cnt[i]    <= 7'd61    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][62:60]                 :    begin
                                                        slip_cnt[i]    <= 7'd62    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][63:61]                 :    begin
                                                        slip_cnt[i]    <= 7'd63    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][64:62]                 :    begin
                                                        slip_cnt[i]    <= 7'd64    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][65:63]                 :    begin
                                                        slip_cnt[i]    <= 7'd65    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                default                            :    begin
                                                        slip_cnt[i]    <= 7'd0    ;
                                                        slip_chk_done[i]  <= 1'd0  ;
                                                        end
                endcase
            end
        end
        assign slip_finish[i] = (slip_chk_done[i] && (slip_cycle[i] == (slip_cnt[i] + 7'd16))) ? 1'b1 : 1'b0 ;
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) begin
                rxgear_slip[i]   <= 1'b0;
            end
            else if (slip_chk_done[i] && (slip_cycle[i] < slip_cnt[i]))
                rxgear_slip[i]   <= !rxgear_slip[i] ;
        end
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) begin
                slip_cycle[i]   <= 7'd0;
            end
            else if (slip_chk_done[i] && (slip_cycle[i] < slip_cnt[i] + 7'd16))
                slip_cycle[i]   <= slip_cycle[i] + 7'd1 ;
        end
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) begin
                payload[i][15:0] <= 16'd0;
            end
            else begin
                payload[i][15:0] <= rxd_ff1[i][15:0];
            end
        end
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0)
                pl_err[i] <= 1'b0;
            else if(slip_finish[i] && ((rxdvld_ff2[i] && (payload[i][15:0] != PAYLOAD_66B67B_16B )) || (rxhvld_ff[i] && (rxh_ff1[i][1:0] != 2'b01))))
                pl_err[i] <= 1'b1;
            else
                pl_err[i] <= 1'b0;
        end
    end
    else if (RD_66B_32B[i] == 1 ) begin : RD_66B_32B
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) 
                shift_bits[i] <= 6'd0;
            else 
                shift_bits[i] <= shift_bits[i];
        end
        assign data_66b[i] = {rxh_ff1[i][1:0],rxd_ff2[i][31:0],rxd_ff3[i][31:0]}  ;
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) begin
                slip_chk_done[i] <= 1'd0;
                slip_cnt[i]   <= 7'd0;
            end
            else if (rxq_start_ff3[i] && (!slip_chk_done[i])) begin
                case(3'b001)
                {data_66b[i][0],rxh_ff3[i][1:0]}  :    begin
                                                        slip_cnt[i]    <= 7'd0     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                {data_66b[i][1:0],rxh_ff3[i][1]}      :    begin
                                                        slip_cnt[i]    <= 7'd1     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][2:0]                   :    begin
                                                        slip_cnt[i]    <= 7'd2     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][3:1]                   :    begin
                                                        slip_cnt[i]    <= 7'd3     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][4:2]                   :    begin
                                                        slip_cnt[i]    <= 7'd4     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][5:3]                   :    begin
                                                        slip_cnt[i]    <= 7'd5     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][6:4]                   :    begin
                                                        slip_cnt[i]    <= 7'd6     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][7:5]                   :    begin
                                                        slip_cnt[i]    <= 7'd7     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][8:6]                   :    begin
                                                        slip_cnt[i]    <= 7'd8     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][9:7]                   :    begin
                                                        slip_cnt[i]    <= 7'd9     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][10:8]                  :    begin
                                                        slip_cnt[i]    <= 7'd10    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][11:9]                  :    begin
                                                        slip_cnt[i]    <= 7'd11    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][12:10]                 :    begin
                                                        slip_cnt[i]    <= 7'd12    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][13:11]                 :    begin
                                                        slip_cnt[i]    <= 7'd13    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][14:12]                 :    begin
                                                        slip_cnt[i]    <= 7'd14    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][15:13]                 :    begin
                                                        slip_cnt[i]    <= 7'd15    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][16:14]                 :    begin
                                                        slip_cnt[i]    <= 7'd16    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][17:15]                 :    begin
                                                        slip_cnt[i]    <= 7'd17    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][18:16]                 :    begin
                                                        slip_cnt[i]    <= 7'd18    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][19:17]                 :    begin
                                                        slip_cnt[i]    <= 7'd19    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][20:18]                 :    begin
                                                        slip_cnt[i]    <= 7'd20    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][21:19]                 :    begin
                                                        slip_cnt[i]    <= 7'd21    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][22:20]                 :    begin
                                                        slip_cnt[i]    <= 7'd22    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][23:21]                 :    begin
                                                        slip_cnt[i]    <= 7'd23    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][24:22]                 :    begin
                                                        slip_cnt[i]    <= 7'd24    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][25:23]                 :    begin
                                                        slip_cnt[i]    <= 7'd25    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][26:24]                 :    begin
                                                        slip_cnt[i]    <= 7'd26    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][27:25]                 :    begin
                                                        slip_cnt[i]    <= 7'd27    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][28:26]                 :    begin
                                                        slip_cnt[i]    <= 7'd28    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][29:27]                 :    begin
                                                        slip_cnt[i]    <= 7'd29    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][30:28]                 :    begin
                                                        slip_cnt[i]    <= 7'd30    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][31:29]                 :    begin
                                                        slip_cnt[i]    <= 7'd31    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][32:30]                 :    begin
                                                        slip_cnt[i]    <= 7'd32    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][33:31]                 :    begin
                                                        slip_cnt[i]    <= 7'd33    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][34:32]                 :    begin
                                                        slip_cnt[i]    <= 7'd34    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][35:33]                 :    begin
                                                        slip_cnt[i]    <= 7'd35    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][36:34]                 :    begin
                                                        slip_cnt[i]    <= 7'd36    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][37:35]                 :    begin
                                                        slip_cnt[i]    <= 7'd37    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][38:36]                 :    begin
                                                        slip_cnt[i]    <= 7'd38    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][39:37]                 :    begin
                                                        slip_cnt[i]    <= 7'd39    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][40:38]                 :    begin
                                                        slip_cnt[i]    <= 7'd40    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][41:39]                 :    begin
                                                        slip_cnt[i]    <= 7'd41    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][42:40]                 :    begin
                                                        slip_cnt[i]    <= 7'd42    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][43:41]                 :    begin
                                                        slip_cnt[i]    <= 7'd43    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][44:42]                 :    begin
                                                        slip_cnt[i]    <= 7'd44    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][45:43]                 :    begin
                                                        slip_cnt[i]    <= 7'd45    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][46:44]                 :    begin
                                                        slip_cnt[i]    <= 7'd46    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][47:45]                 :    begin
                                                        slip_cnt[i]    <= 7'd47    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][48:46]                 :    begin
                                                        slip_cnt[i]    <= 7'd48    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][49:47]                 :    begin
                                                        slip_cnt[i]    <= 7'd49    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][50:48]                 :    begin
                                                        slip_cnt[i]    <= 7'd50    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][51:49]                 :    begin
                                                        slip_cnt[i]    <= 7'd51    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][52:50]                 :    begin
                                                        slip_cnt[i]    <= 7'd52    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][53:51]                 :    begin
                                                        slip_cnt[i]    <= 7'd53    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][54:52]                 :    begin
                                                        slip_cnt[i]    <= 7'd54    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][55:53]                 :    begin
                                                        slip_cnt[i]    <= 7'd55    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][56:54]                 :    begin
                                                        slip_cnt[i]    <= 7'd56    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][57:55]                 :    begin
                                                        slip_cnt[i]    <= 7'd57    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][58:56]                 :    begin
                                                        slip_cnt[i]    <= 7'd58    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][59:57]                 :    begin
                                                        slip_cnt[i]    <= 7'd59    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][60:58]                 :    begin
                                                        slip_cnt[i]    <= 7'd60    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][61:59]                 :    begin
                                                        slip_cnt[i]    <= 7'd61    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][62:60]                 :    begin
                                                        slip_cnt[i]    <= 7'd62    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][63:61]                 :    begin
                                                        slip_cnt[i]    <= 7'd63    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][64:62]                 :    begin
                                                        slip_cnt[i]    <= 7'd64    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][65:63]                 :    begin
                                                        slip_cnt[i]    <= 7'd65    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                default                            :    begin
                                                        slip_cnt[i]    <= 7'd0    ;
                                                        slip_chk_done[i]  <= 1'd0  ;
                                                        end
                endcase
            end
        end
        assign slip_finish[i] = (slip_chk_done[i] && (slip_cycle[i] == (slip_cnt[i] + 7'd16))) ? 1'b1 : 1'b0 ;
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) begin
                rxgear_slip[i]   <= 1'b0;
            end
            else if (slip_chk_done[i] && (slip_cycle[i] < slip_cnt[i]))
                rxgear_slip[i]   <= !rxgear_slip[i] ;
        end
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) begin
                slip_cycle[i]   <= 7'd0;
            end
            else if (slip_chk_done[i] && (slip_cycle[i] < slip_cnt[i] + 7'd16))
                slip_cycle[i]   <= slip_cycle[i] + 7'd1 ;
        end
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) begin
                payload[i][31:0] <= 32'd0;
            end
            else begin
                payload[i][31:0] <= rxd_ff1[i][31:0];
            end
        end
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0)
                pl_err[i] <= 1'b0;
            else if(slip_finish[i] && ((rxdvld_ff2[i] && (payload[i][31:0] != PAYLOAD_66B67B_32B )) || (rxhvld_ff[i] && (rxh_ff1[i][1:0] != 2'b01))))
                pl_err[i] <= 1'b1;
            else
                pl_err[i] <= 1'b0;
        end
    end
    else if (RD_67B_32B[i] == 1) begin : RD_67B_32B
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) 
                shift_bits[i] <= 6'd0;
            else 
                shift_bits[i] <= shift_bits[i];
        end
        assign data_66b[i] = {rxh_ff1[i][1:0],rxd_ff2[i][31:0],rxd_ff3[i][31:0]}  ;
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) begin
                slip_chk_done[i] <= 1'd0;
                slip_cnt[i]   <= 7'd0;
            end
            else if (rxq_start_ff3[i] && (!slip_chk_done[i])) begin
                case(3'b100)
                {rxh_ff3[i]}                       :    begin
                                                        slip_cnt[i]    <= 7'd0     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                {data_66b[i][0],rxh_ff3[i][2:1]}   :    begin
                                                        slip_cnt[i]    <= 7'd1     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                {data_66b[i][1:0],rxh_ff3[i][2]}   :    begin
                                                        slip_cnt[i]    <= 7'd2     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][2:0]                   :    begin
                                                        slip_cnt[i]    <= 7'd3  ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][3:1]                   :    begin
                                                        slip_cnt[i]    <= 7'd4     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][4:2]                   :    begin
                                                        slip_cnt[i]    <= 7'd5     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][5:3]                   :    begin
                                                        slip_cnt[i]    <= 7'd6     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][6:4]                   :    begin
                                                        slip_cnt[i]    <= 7'd7     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][7:5]                   :    begin
                                                        slip_cnt[i]    <= 7'd8     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][8:6]                   :    begin
                                                        slip_cnt[i]    <= 7'd9     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][9:7]                   :    begin
                                                        slip_cnt[i]    <= 7'd10    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][10:8]                  :    begin
                                                        slip_cnt[i]    <= 7'd11    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][11:9]                  :    begin
                                                        slip_cnt[i]    <= 7'd12    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][12:10]                 :    begin
                                                        slip_cnt[i]    <= 7'd13    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][13:11]                 :    begin
                                                        slip_cnt[i]    <= 7'd14    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][14:12]                 :    begin
                                                        slip_cnt[i]    <= 7'd15    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][15:13]                 :    begin
                                                        slip_cnt[i]    <= 7'd16    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][16:14]                 :    begin
                                                        slip_cnt[i]    <= 7'd17    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][17:15]                 :    begin
                                                        slip_cnt[i]    <= 7'd18    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][18:16]                 :    begin
                                                        slip_cnt[i]    <= 7'd19    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][19:17]                 :    begin
                                                        slip_cnt[i]    <= 7'd20    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][20:18]                 :    begin
                                                        slip_cnt[i]    <= 7'd21    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][21:19]                 :    begin
                                                        slip_cnt[i]    <= 7'd22    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][22:20]                 :    begin
                                                        slip_cnt[i]    <= 7'd23    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][23:21]                 :    begin
                                                        slip_cnt[i]    <= 7'd24    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][24:22]                 :    begin
                                                        slip_cnt[i]    <= 7'd25    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][25:23]                 :    begin
                                                        slip_cnt[i]    <= 7'd26    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][26:24]                 :    begin
                                                        slip_cnt[i]    <= 7'd27    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][27:25]                 :    begin
                                                        slip_cnt[i]    <= 7'd28    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][28:26]                 :    begin
                                                        slip_cnt[i]    <= 7'd29    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][29:27]                 :    begin
                                                        slip_cnt[i]    <= 7'd30    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][30:28]                 :    begin
                                                        slip_cnt[i]    <= 7'd31    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][31:29]                 :    begin
                                                        slip_cnt[i]    <= 7'd32    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][32:30]                 :    begin
                                                        slip_cnt[i]    <= 7'd33    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][33:31]                 :    begin
                                                        slip_cnt[i]    <= 7'd34    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][34:32]                 :    begin
                                                        slip_cnt[i]    <= 7'd35    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][35:33]                 :    begin
                                                        slip_cnt[i]    <= 7'd36    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][36:34]                 :    begin
                                                        slip_cnt[i]    <= 7'd37    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][37:35]                 :    begin
                                                        slip_cnt[i]    <= 7'd38    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][38:36]                 :    begin
                                                        slip_cnt[i]    <= 7'd39    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][39:37]                 :    begin
                                                        slip_cnt[i]    <= 7'd40    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][40:38]                 :    begin
                                                        slip_cnt[i]    <= 7'd41    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][41:39]                 :    begin
                                                        slip_cnt[i]    <= 7'd42    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][42:40]                 :    begin
                                                        slip_cnt[i]    <= 7'd43    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][43:41]                 :    begin
                                                        slip_cnt[i]    <= 7'd44    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][44:42]                 :    begin
                                                        slip_cnt[i]    <= 7'd45    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][45:43]                 :    begin
                                                        slip_cnt[i]    <= 7'd46    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][46:44]                 :    begin
                                                        slip_cnt[i]    <= 7'd47    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][47:45]                 :    begin
                                                        slip_cnt[i]    <= 7'd48    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][48:46]                 :    begin
                                                        slip_cnt[i]    <= 7'd49    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][49:47]                 :    begin
                                                        slip_cnt[i]    <= 7'd50    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][50:48]                 :    begin
                                                        slip_cnt[i]    <= 7'd51    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][51:49]                 :    begin
                                                        slip_cnt[i]    <= 7'd52    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][52:50]                 :    begin
                                                        slip_cnt[i]    <= 7'd53    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][53:51]                 :    begin
                                                        slip_cnt[i]    <= 7'd54    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][54:52]                 :    begin
                                                        slip_cnt[i]    <= 7'd55    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][55:53]                 :    begin
                                                        slip_cnt[i]    <= 7'd56    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][56:54]                 :    begin
                                                        slip_cnt[i]    <= 7'd57    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][57:55]                 :    begin
                                                        slip_cnt[i]    <= 7'd58    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][58:56]                 :    begin
                                                        slip_cnt[i]    <= 7'd59    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][59:57]                 :    begin
                                                        slip_cnt[i]    <= 7'd60    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][60:58]                 :    begin
                                                        slip_cnt[i]    <= 7'd61    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][61:59]                 :    begin
                                                        slip_cnt[i]    <= 7'd62    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][62:60]                 :    begin
                                                        slip_cnt[i]    <= 7'd63    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][63:61]                 :    begin
                                                        slip_cnt[i]    <= 7'd64    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][64:62]                 :    begin
                                                        slip_cnt[i]    <= 7'd65    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][65:63]                 :    begin
                                                        slip_cnt[i]    <= 7'd66    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                default                            :    begin
                                                        slip_cnt[i]    <= 7'd0    ;
                                                        slip_chk_done[i]  <= 1'd0  ;
                                                        end
                endcase
            end
        end
        assign slip_finish[i] = (slip_chk_done[i] && (slip_cycle[i] == (slip_cnt[i] + 7'd16))) ? 1'b1 : 1'b0 ;
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) begin
                rxgear_slip[i]   <= 1'b0;
            end
            else if (slip_chk_done[i] && (slip_cycle[i] < slip_cnt[i]))
                rxgear_slip[i]   <= !rxgear_slip[i] ;
        end
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) begin
                slip_cycle[i]   <= 7'd0;
            end
            else if (slip_chk_done[i] && (slip_cycle[i] < slip_cnt[i] + 7'd16))
                slip_cycle[i]   <= slip_cycle[i] + 7'd1 ;
        end
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) begin
                payload[i][31:0] <= 32'd0;
            end
            else begin
                payload[i][31:0] <= rxd_ff1[i][31:0];
            end
        end
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0)
                pl_err[i] <= 1'b0;
            else if(slip_finish[i] && ((rxdvld_ff2[i] && (payload[i][31:0] != PAYLOAD_66B67B_32B )) || (rxhvld_ff[i] && (rxh_ff1[i] != 3'b100))))
                pl_err[i] <= 1'b1;
            else
                pl_err[i] <= 1'b0;
        end
    end
    else if (RD_67B_16B[i] == 1) begin : RD_67B_16B
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) 
                shift_bits[i] <= 6'd0;
            else 
                shift_bits[i] <= shift_bits[i];
        end
        assign data_66b[i] = {rxh_ff1[i][1:0],rxd_ff2[i][15:0],rxd_ff3[i][15:0],rxd_ff4[i][15:0],rxd_ff5[i][15:0]} ;
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) begin 
                slip_chk_done[i] <= 1'd0;
                slip_cnt[i]   <= 7'd0;
            end
            else if (rxq_start_ff5[i] && (!slip_chk_done[i])) begin
                case(3'b100)
                {rxh_ff5[i]}                       :    begin
                                                        slip_cnt[i]    <= 7'd0     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                {data_66b[i][0],rxh_ff5[i][2:1]}   :    begin
                                                        slip_cnt[i]    <= 7'd1     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                {data_66b[i][1:0],rxh_ff5[i][2]}   :    begin
                                                        slip_cnt[i]    <= 7'd2     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][2:0]                   :    begin
                                                        slip_cnt[i]    <= 7'd3  ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][3:1]                   :    begin
                                                        slip_cnt[i]    <= 7'd4     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][4:2]                   :    begin
                                                        slip_cnt[i]    <= 7'd5     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][5:3]                   :    begin
                                                        slip_cnt[i]    <= 7'd6     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][6:4]                   :    begin
                                                        slip_cnt[i]    <= 7'd7     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][7:5]                   :    begin
                                                        slip_cnt[i]    <= 7'd8     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][8:6]                   :    begin
                                                        slip_cnt[i]    <= 7'd9     ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][9:7]                   :    begin
                                                        slip_cnt[i]    <= 7'd10    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][10:8]                  :    begin
                                                        slip_cnt[i]    <= 7'd11    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][11:9]                  :    begin
                                                        slip_cnt[i]    <= 7'd12    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][12:10]                 :    begin
                                                        slip_cnt[i]    <= 7'd13    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][13:11]                 :    begin
                                                        slip_cnt[i]    <= 7'd14    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][14:12]                 :    begin
                                                        slip_cnt[i]    <= 7'd15    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][15:13]                 :    begin
                                                        slip_cnt[i]    <= 7'd16    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][16:14]                 :    begin
                                                        slip_cnt[i]    <= 7'd17    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][17:15]                 :    begin
                                                        slip_cnt[i]    <= 7'd18    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][18:16]                 :    begin
                                                        slip_cnt[i]    <= 7'd19    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][19:17]                 :    begin
                                                        slip_cnt[i]    <= 7'd20    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][20:18]                 :    begin
                                                        slip_cnt[i]    <= 7'd21    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][21:19]                 :    begin
                                                        slip_cnt[i]    <= 7'd22    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][22:20]                 :    begin
                                                        slip_cnt[i]    <= 7'd23    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][23:21]                 :    begin
                                                        slip_cnt[i]    <= 7'd24    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][24:22]                 :    begin
                                                        slip_cnt[i]    <= 7'd25    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][25:23]                 :    begin
                                                        slip_cnt[i]    <= 7'd26    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][26:24]                 :    begin
                                                        slip_cnt[i]    <= 7'd27    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][27:25]                 :    begin
                                                        slip_cnt[i]    <= 7'd28    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][28:26]                 :    begin
                                                        slip_cnt[i]    <= 7'd29    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][29:27]                 :    begin
                                                        slip_cnt[i]    <= 7'd30    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][30:28]                 :    begin
                                                        slip_cnt[i]    <= 7'd31    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][31:29]                 :    begin
                                                        slip_cnt[i]    <= 7'd32    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][32:30]                 :    begin
                                                        slip_cnt[i]    <= 7'd33    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][33:31]                 :    begin
                                                        slip_cnt[i]    <= 7'd34    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][34:32]                 :    begin
                                                        slip_cnt[i]    <= 7'd35    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][35:33]                 :    begin
                                                        slip_cnt[i]    <= 7'd36    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][36:34]                 :    begin
                                                        slip_cnt[i]    <= 7'd37    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][37:35]                 :    begin
                                                        slip_cnt[i]    <= 7'd38    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][38:36]                 :    begin
                                                        slip_cnt[i]    <= 7'd39    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][39:37]                 :    begin
                                                        slip_cnt[i]    <= 7'd40    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][40:38]                 :    begin
                                                        slip_cnt[i]    <= 7'd41    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][41:39]                 :    begin
                                                        slip_cnt[i]    <= 7'd42    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][42:40]                 :    begin
                                                        slip_cnt[i]    <= 7'd43    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][43:41]                 :    begin
                                                        slip_cnt[i]    <= 7'd44    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][44:42]                 :    begin
                                                        slip_cnt[i]    <= 7'd45    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][45:43]                 :    begin
                                                        slip_cnt[i]    <= 7'd46    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][46:44]                 :    begin
                                                        slip_cnt[i]    <= 7'd47    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][47:45]                 :    begin
                                                        slip_cnt[i]    <= 7'd48    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][48:46]                 :    begin
                                                        slip_cnt[i]    <= 7'd49    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][49:47]                 :    begin
                                                        slip_cnt[i]    <= 7'd50    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][50:48]                 :    begin
                                                        slip_cnt[i]    <= 7'd51    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][51:49]                 :    begin
                                                        slip_cnt[i]    <= 7'd52    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][52:50]                 :    begin
                                                        slip_cnt[i]    <= 7'd53    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][53:51]                 :    begin
                                                        slip_cnt[i]    <= 7'd54    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][54:52]                 :    begin
                                                        slip_cnt[i]    <= 7'd55    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][55:53]                 :    begin
                                                        slip_cnt[i]    <= 7'd56    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][56:54]                 :    begin
                                                        slip_cnt[i]    <= 7'd57    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][57:55]                 :    begin
                                                        slip_cnt[i]    <= 7'd58    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][58:56]                 :    begin
                                                        slip_cnt[i]    <= 7'd59    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][59:57]                 :    begin
                                                        slip_cnt[i]    <= 7'd60    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][60:58]                 :    begin
                                                        slip_cnt[i]    <= 7'd61    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][61:59]                 :    begin
                                                        slip_cnt[i]    <= 7'd62    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][62:60]                 :    begin
                                                        slip_cnt[i]    <= 7'd63    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][63:61]                 :    begin
                                                        slip_cnt[i]    <= 7'd64    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][64:62]                 :    begin
                                                        slip_cnt[i]    <= 7'd65    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                data_66b[i][65:63]                 :    begin
                                                        slip_cnt[i]    <= 7'd66    ;
                                                        slip_chk_done[i]  <= 1'd1  ;
                                                        end
                default                            :    begin
                                                        slip_cnt[i]    <= 7'd0    ;
                                                        slip_chk_done[i]  <= 1'd0  ;
                                                        end
                endcase
            end
        end
        assign slip_finish[i] = (slip_chk_done[i] && (slip_cycle[i] == (slip_cnt[i] + 7'd16))) ? 1'b1 : 1'b0 ;
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) begin
                rxgear_slip[i]   <= 1'b0;
            end
            else if (slip_chk_done[i] && (slip_cycle[i] < slip_cnt[i]))
                rxgear_slip[i]   <= !rxgear_slip[i] ;
        end
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) begin
                slip_cycle[i]   <= 7'd0;
            end
            else if (slip_chk_done[i] && (slip_cycle[i] < slip_cnt[i] + 7'd16))
                slip_cycle[i]   <= slip_cycle[i] + 7'd1 ;
        end
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) begin
                payload[i][15:0] <= 16'd0;
            end
            else begin
                payload[i][15:0] <= rxd_ff1[i][15:0];
            end
        end
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0)
                pl_err[i] <= 1'b0;
            else if(slip_finish[i] && ((rxdvld_ff2[i] && (payload[i][15:0] != PAYLOAD_66B67B_16B )) || (rxhvld_ff[i] && (rxh_ff1[i] != 3'b100))))
                pl_err[i] <= 1'b1;
            else
                pl_err[i] <= 1'b0;
        end
    end
    else begin : RD_8B10B_32BIT
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) 
                shift_bits[i] <= 6'd0;
            else 
                shift_bits[i] <= shift_bits[i];
        end
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0)
                rxbyte_shft[i] <= 2'd0;
            else if((rxk[i]==4'b1000)&&(rxk_ff1[i][3]==1'b0))
                rxbyte_shft[i] <= 2'd1;
            else if((rxk[i][2:0]==3'b100)&&(rxk_ff1[i][3:2]==2'b00))
                rxbyte_shft[i] <= 2'd2;
            else if((rxk[i][1:0]==2'b10)&&(rxk_ff1[i][3:1]==3'b000))
                rxbyte_shft[i] <= 2'd3;
            else if((rxk[i][0]==1'b1)&&(rxk_ff1[i]==4'b0000))
                rxbyte_shft[i] <= 2'd0;
            else ;
        end
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) begin
                rxd_algn[i] <= 40'd0;
                rxk_algn[i] <= 4'd0;
            end
            else if(rxbyte_shft[i]==2'd1) begin
                rxd_algn[i] <= {8'b0,rxd_ff1[i][23:0],rxd_ff2[i][31:24]};
                rxk_algn[i] <= {rxk_ff1[i][2:0],rxk_ff2[i][3]};
            end
            else if(rxbyte_shft[i]==2'd2) begin
                rxd_algn[i] <= {8'b0,rxd_ff1[i][15:0],rxd_ff2[i][31:16]};
                rxk_algn[i] <= {rxk_ff1[i][1:0],rxk_ff2[i][3:2]};
            end
            else if(rxbyte_shft[i]==2'd3) begin
                rxd_algn[i] <= {8'b0,rxd_ff1[i][7:0],rxd_ff2[i][31:8]};
                rxk_algn[i] <= {rxk_ff1[i][0],rxk_ff2[i][3:1]};
            end
            else begin
                rxd_algn[i] <= {8'b0,rxd_ff2[i][31:0]};
                rxk_algn[i] <= rxk_ff2[i][3:0];
            end
        end
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) begin
                rxd_algn_ff1[i] <= 40'd0;
                rxk_algn_ff1[i] <= 4'd0;
            end
            else begin
                rxd_algn_ff1[i] <= rxd_algn[i];
                rxk_algn_ff1[i] <= rxk_algn[i];
            end
        end
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0)
                pattern_cnt[i] <= 16'd1;
            else if(rxk_algn[i]==4'b0000) 
                pattern_cnt[i] <= 16'd0;
            else if(pattern_cnt[i]<16'd1) 
                pattern_cnt[i] <= pattern_cnt[i]+16'd1;
            else;
        end
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0) begin
                payload[i][31:0] <= 32'b0;
                payload_buf[i][31:0] <= 32'b0;
            end
            else if(pattern_cnt[i]==16'd0) begin
                payload[i][31:0] <= rxd_algn_ff1[i][31:0];
                payload_buf[i][31:0] <= payload[i][31:0];
            end
            else ;
        end
        assign payload_shift[i][31:0] = {payload_buf[i][30:0],payload_buf[i][31]}; 
        always @ (posedge chk_clk[i] or negedge i_chk_rstn[i]) begin 
            if(i_chk_rstn[i]==1'b0)
                pl_err[i] <= 1'b0;
            else if((pattern_cnt[i]==16'd0)&&(payload[i][31:0]!=payload_shift[i][31:0]))
                pl_err[i] <= 1'b1;
            else
                pl_err[i] <= 1'b0;
        end
    end
end
endgenerate


// ********************* Bonding Checker *********************
reg   bonding_err_0  ;
reg   bonding_err_2  ;
generate
    if(((CH0_PROTOCOL=="XAUI")||(CH0_PROTOCOL=="PCIEx4")||(CH0_PROTOCOL=="CUSTOMERIZEDx4"))&&(CH0_RXPCS_BONDING!="Bypassed" && CH0_RXPCS_BONDING!="CUSTOMERIZED_MODE"))
        always @ (posedge chk_clk[0] or negedge i_chk_rstn[0]) begin 
            if(i_chk_rstn[0]==1'b0) 
                bonding_err_0 <= 1'b0;
            else if( rxd_ff2[0]!= rxd_ff2[1])
                bonding_err_0 <= 1'b1;
            else if( rxd_ff2[0]!= rxd_ff2[2])
                bonding_err_0 <= 1'b1;
            else if( rxd_ff2[0]!= rxd_ff2[3])
                bonding_err_0 <= 1'b1;
            else
                bonding_err_0 <= 1'b0;
        end
    else if((CH0_PROTOCOL=="CUSTOMERIZEDx2")&&(CH0_RXPCS_BONDING!="Bypassed" && CH0_RXPCS_BONDING!="CUSTOMERIZED_MODE"))
        always @ (posedge chk_clk[0] or negedge i_chk_rstn[0]) begin 
            if(i_chk_rstn[0]==1'b0) 
                bonding_err_0 <= 1'b0;
            else if( rxd_ff2[0]!= rxd_ff2[1])
                bonding_err_0 <= 1'b1;
            else
                bonding_err_0 <= 1'b0;
        end
    else
        always @ (posedge chk_clk[0] or negedge i_chk_rstn[0]) begin 
            if(i_chk_rstn[0]==1'b0) 
                bonding_err_0 <= 1'b0;
            else
                bonding_err_0 <= bonding_err_0;
        end

    if((CH2_PROTOCOL=="CUSTOMERIZEDx2")&&(CH2_RXPCS_BONDING!="Bypassed" || CH2_RXPCS_BONDING!="CUSTOMERIZED_MODE"))
        always @ (posedge chk_clk[2] or negedge i_chk_rstn[2]) begin 
            if(i_chk_rstn[2]==1'b0) 
                bonding_err_2 <= 1'b0;
            else if( rxd_ff2[2]!= rxd_ff2[3])
                bonding_err_2 <= 1'b1;
            else
                bonding_err_2 <= 1'b0;
        end
    else
        always @ (posedge chk_clk[2] or negedge i_chk_rstn[2]) begin 
            if(i_chk_rstn[2]==1'b0) 
                bonding_err_2 <= 1'b0;
            else
                bonding_err_2 <= bonding_err_2;
        end

endgenerate

// ********************* 6667B SLIP PUTPUT ******************
generate
if((RD_66B_16B[0] == 1)||(RD_66B_32B[0] == 1)||(RD_67B_16B[0] == 1)||(RD_67B_32B[0] == 1)) begin : RXGEAR_SLIP_0_ENABLE
    assign o_p_rxgear_slip_0 = rxgear_slip[0] ;
end
else begin : RXGEAR_SLIP_0_DISABLE
    assign o_p_rxgear_slip_0 = 1'b0 ;
end

if((RD_66B_16B[1] == 1)||(RD_66B_32B[1] == 1)||(RD_67B_16B[1] == 1)||(RD_67B_32B[1] == 1)) begin : RXGEAR_SLIP_1_ENABLE
    assign o_p_rxgear_slip_1 = rxgear_slip[1] ;
end
else begin : RXGEAR_SLIP_1_DISABLE
    assign o_p_rxgear_slip_1 = 1'b0 ;
end

if((RD_66B_16B[2] == 1)||(RD_66B_32B[2] == 1)||(RD_67B_16B[2] == 1)||(RD_67B_32B[2] == 1)) begin : RXGEAR_SLIP_2_ENABLE
    assign o_p_rxgear_slip_2 = rxgear_slip[2] ;
end
else begin : RXGEAR_SLIP_2_DISABLE
    assign o_p_rxgear_slip_2 = 1'b0 ;
end

if((RD_66B_16B[3] == 1)||(RD_66B_32B[3] == 1)||(RD_67B_16B[3] == 1)||(RD_67B_32B[3] == 1)) begin : RXGEAR_SLIP_3_ENABLE
    assign o_p_rxgear_slip_3 = rxgear_slip[3] ;
end
else begin : RXGEAR_SLIP_3_DISABLE
    assign o_p_rxgear_slip_3 = 1'b0 ;
end
endgenerate
// ********************* Checker Result *********************
assign o_pl_err = pl_err | {1'b0,bonding_err_2,1'b0,bonding_err_0};






    

endmodule    
