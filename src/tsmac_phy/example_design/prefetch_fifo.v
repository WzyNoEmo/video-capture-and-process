//******************************************************************
// Copyright (c) 2015 PANGO MICROSYSTEMS, INC
// ALL RIGHTS REVERVED.
//******************************************************************

`timescale 1ns/1ps

module prefetch_fifo
    #( 
       parameter D = 2048, //should be 2^N
       parameter W = 18
     )
    (
      input                     wr_clk,
      input                     rd_clk,
      input                     rst_n,

      input                     data_in_valid,
      input  [W-1:0]            data_in,
      output                    data_in_ready,

      input                     data_out_ready,
      output [W-1:0]            data_out,
      output                    data_out_valid
    );

//===================================================================
//     Type        |  Latency   |   ADDR_WIDTH   |   Data width
// "Distributed"   |    2       |      4~10      |     1~256
// "DRM"           |    3       |      9~20      |     1~1152
//===================================================================

reg                         fifo_vld;
reg                         rd_en_ff1;
reg  [2:0]                  shift_vld;
reg  [W-1:0]                rd_data_ff1;

wire [W-1:0]                rd_data;
wire                        pop;
wire                        wr_en;
wire                        rd_en;
wire                        empty;
wire                        full;
wire                        rst;

//
assign wr_en = data_in_valid & ~full;
assign data_in_ready = ~full;
assign rst = ~rst_n;

// 
//"DRM"
    localparam DEPTH = (D < 512) ? 512 : D;
    assign rd_en = (~shift_vld[2] | data_out_ready) & ~empty;
    always@(posedge rd_clk or negedge rst_n)
    begin
        if (!rst_n)
            rd_en_ff1 <= 1'b0;
        else
            rd_en_ff1 <= rd_en;
    end
    
    assign pop = data_out_valid & data_out_ready;
    always@(posedge rd_clk or negedge rst_n)
    begin
        if(!rst_n)
            shift_vld <= 3'b001;
        else
        begin
            case ({rd_en, pop})
                2'b10: shift_vld <= {shift_vld[1:0], shift_vld[2]};
                2'b01: shift_vld <= {shift_vld[0], shift_vld[2:1]};
            endcase 
        end
    end

    // DRM FIFO
    pgm_fifo_v1_1
        #(
          .c_RD_DATA_WIDTH  ( W           ),
          .c_WR_DEPTH_WIDTH ( log2(DEPTH) ),
          .c_WR_DATA_WIDTH  ( W           ),
          .c_RD_DEPTH_WIDTH ( log2(DEPTH) ),
          .c_OUTPUT_REG     ( 0           )
         )
        U_pgm_fifo_v1_1
        (
        .wr_data        ( data_in ),
        .wr_en          ( wr_en   ),
        .wr_clk         ( wr_clk  ),
        .wr_full        ( full    ),
        .wr_rst         ( rst     ),
        .wr_byte_en     ( 8'b0    ),
        .almost_full    (         ),
        .wr_water_level (         ),
        .rd_data        ( rd_data ),
        .rd_en          ( rd_en   ),
        .rd_clk         ( rd_clk  ),
        .rd_empty       ( empty   ),
        .rd_rst         ( rst     ),
        .rd_oce         ( 1'b1    ),
        .almost_empty   (         ),
        .rd_water_level (         )
        );
        
    // Depth = 2
    reg_fifo2
        #(
        .W ( W )
        )
        U_reg_fifo2
        (
        .clk            ( rd_clk         ),
        .rst_n          ( rst_n          ),
        .data_in_valid  ( rd_en_ff1      ),
        .data_in        ( rd_data        ),
        .data_in_ready  (                ),
        .data_out_ready ( data_out_ready ),
        .data_out       ( data_out       ),
        .data_out_valid ( data_out_valid )
        );
// Log 2
function integer log2;
    input integer dep;
    begin
        log2 = 0;
        while (dep > 1)
        begin
            dep  = dep >> 1;
            log2 = log2 + 1;
        end
    end
endfunction

endmodule
