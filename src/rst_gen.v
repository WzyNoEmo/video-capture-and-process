module rst_gen(
    input       HCLK,
    input       pad_nRST,
    input       ddrc_init_done,
    input       watchdog_reset,
    input       SYSRESETREQ,

    output      DBGRESETn,
    output      SYSRESETn
);

//sys reset-------------------------------------------------------
//    reg    ddrc_init_done0;
//    reg    ddrc_init_done1;
//    
//    always@(posedge HCLK)
//    begin
//        ddrc_init_done0 <= ddrc_init_done;
//        ddrc_init_done1 <= ddrc_init_done0;
//    end 

    wire   core_resetn;
    assign core_resetn = ddrc_init_done && ~watchdog_reset && pad_nRST;

    reg [5:0] cnt;
    always @(posedge HCLK or negedge core_resetn)
    begin
        if (!core_resetn) cnt <= {6{1'b0}};
	    else if (cnt != 6'b101010) cnt <= cnt + 1'd1;	
    end

    wire   softsetn;
    assign softsetn = cnt == 6'b101010;

    assign DBGRESETn = softsetn;

    // SYSRESETREQ causes a SYSRESET for three cycles.
    reg [1:0] sysreset_st;
    reg [1:0] nxt_sysreset_st;
    always @ (posedge HCLK or negedge softsetn) begin
        if (!softsetn)
          sysreset_st <= 2'b00;        
        else
          sysreset_st <= nxt_sysreset_st;
    end

    reg SYSRESETn_temp;
    always @ (SYSRESETREQ or sysreset_st)
    begin
      case (sysreset_st[1:0])
        2'b00:
          begin
            SYSRESETn_temp  = 1'b0;
            nxt_sysreset_st = 2'b01;
          end
        2'b01:
          begin
            SYSRESETn_temp  = 1'b0;
            nxt_sysreset_st = 2'b10;
          end
        2'b10:
          begin
            SYSRESETn_temp  = 1'b0;
            nxt_sysreset_st = 2'b11;
          end        
        2'b11:
          begin
            SYSRESETn_temp  = 1'b1;
            nxt_sysreset_st = SYSRESETREQ ? 2'b00 : 2'b11;
          end
        default:
          begin
            SYSRESETn_temp  = 1'b0;
            nxt_sysreset_st = 2'b00;
          end
      endcase
    end

    assign SYSRESETn = SYSRESETn_temp;

endmodule
