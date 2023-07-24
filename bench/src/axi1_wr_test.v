module axi1_wr_test(
    input             rstn,
    input             clk,

    //AXI WRITE
    output reg [31:0] awaddr_1,
    output reg        awvalid_1,
    input             awready_1,
    output reg [63:0] wdata_1,
    output reg        wlast_1,
    output reg        wvalid_1,
    input             wready_1,
                      
    //AXI READ        
    output reg [31:0] araddr_1,
    output reg        arvalid_1,
    input             arready_1,
    input      [63:0] rdata_1,
    input             rlast_1,
    input             rvalid_1,
    output reg        rready_1
   );

   localparam TIME = 32'd3;       

   reg [31:0] ddr_waddr;
   reg [31:0] ddr_raddr;
        
   reg [31:0] cnt;   
   always @(posedge clk or negedge rstn)
   begin
	   if (~rstn) cnt <= {32{1'b0}};	
       else if(cnt <= TIME) cnt <= cnt + 1'd1; 
   end  
   
//TX
   reg tx_start;
   always @ (posedge clk or negedge rstn) begin
     if(~rstn) 
         tx_start <= 1'b0;
     else if((cnt == 1) || (rlast_1 & rvalid_1 & rready_1 & (ddr_raddr == 32'h08004000)))
         tx_start <= 1'b1;
     else if(wlast_1 & wvalid_1 & wready_1 & (ddr_waddr <= 32'h08003800))
         tx_start <= 1'b1;
     else
         tx_start <= 1'b0;
   end

   always @ (posedge clk or negedge rstn) begin
     if(~rstn) 
         ddr_waddr <= 32'h08000000;
     else if(wlast_1 & wvalid_1 & wready_1 & (ddr_waddr < 32'h08004000))
         ddr_waddr <= ddr_waddr + 32'h800;
     else if(wlast_1 & wvalid_1 & wready_1 & (ddr_waddr == 32'h08004000))
         ddr_waddr <= 32'h08000000;
   end

   //tx_state
   reg [1:0]  cstate;
   reg [1:0]  nstate;
   reg [8:0]  axi_tx_cnt;

   always @ (posedge clk or negedge rstn) begin
     if(~rstn) cstate <= 0;
     else      cstate <= nstate;
   end

   always @ (*) begin
     case(cstate)
        0 : begin
              if(tx_start) nstate = 1;
              else nstate = cstate;
            end       
        1 : begin
              if(awready_1) nstate = 2;
              else nstate = cstate;
            end
        2 : begin
              if(axi_tx_cnt == 9'h0ff && wlast_1 && wvalid_1 && wready_1) nstate = 0;
              else nstate = cstate;
            end           
        default : nstate = 0;
     endcase
   end

   always @ (posedge clk or negedge rstn) begin
     if(~rstn) begin
       awaddr_1   <= {32{1'b0}};
       awvalid_1  <= 1'b0;

       wdata_1    <= {64{1'b0}};
       wlast_1    <= 1'b0;
       wvalid_1   <= 1'b0;

       axi_tx_cnt <= {9{1'b0}};
     end
     else begin
         case(nstate)
            0 : begin
                  awaddr_1   <= {32{1'b0}};
                  awvalid_1  <= 1'b0;

                  wdata_1    <= {64{1'b0}};
                  wlast_1    <= 1'b0;
                  wvalid_1   <= 1'b0;

                  axi_tx_cnt <= {9{1'b0}};
                end
            1 : begin
                  awaddr_1   <= ddr_waddr;
                  awvalid_1  <= 1'b1;

                  wdata_1    <= {64{1'b0}};
                  wlast_1    <= 1'b0;
                  wvalid_1   <= 1'b0;

                  axi_tx_cnt <= {9{1'b0}};
                end
            2 : begin
                  awaddr_1   <= {32{1'b0}}; 
                  awvalid_1  <= 1'b0;

                  wvalid_1   <= 1'b1;
                  if(wready_1) begin
                      if(~awvalid_1) begin
					    wdata_1    <= wdata_1 + 1'b1;
						axi_tx_cnt <= axi_tx_cnt + 1'b1;
					  end
                      if(axi_tx_cnt == 9'h0fe) wlast_1 <= 1'b1;
                  end
                end         
            default : begin
                        awaddr_1   <= {32{1'b0}};
                        awvalid_1  <= 1'b0;
        
                        wdata_1    <= {64{1'b0}};
                        wvalid_1   <= 1'b0;
                        wlast_1    <= 1'b0;
						
						axi_tx_cnt <= {9{1'b0}};
                      end  
         endcase
     end
   end
   
//RX
   reg rx_start;
   always @ (posedge clk or negedge rstn) begin
     if(~rstn) 
         rx_start <= 1'b0;
     else if(wlast_1 & wvalid_1 & wready_1 & (ddr_waddr == 32'h08004000))
         rx_start <= 1'b1;
     else if(rlast_1 & rvalid_1 & rready_1 & (ddr_raddr <= 32'h08003800))
         rx_start <= 1'b1;
     else
         rx_start <= 1'b0;
   end

   always @ (posedge clk or negedge rstn) begin
     if(~rstn) 
         ddr_raddr <= 32'h08000000;
     else if(rlast_1 & rvalid_1 & rready_1 & (ddr_raddr < 32'h08004000))
         ddr_raddr <= ddr_raddr + 32'h800;
     else if(rlast_1 & rvalid_1 & rready_1 & (ddr_raddr == 32'h08004000))
         ddr_raddr <= 32'h08000000;
   end

   //rx_state
   reg [1:0]  cstate0;
   reg [1:0]  nstate0;

   always @ (posedge clk or negedge rstn) begin
     if(~rstn) cstate0 <= 0;
     else      cstate0 <= nstate0;
   end

   always @ (*) begin
     case(cstate0)
        0 : begin
              if(rx_start) nstate0 = 1;
              else nstate0 = cstate0;
            end       
        1 : begin
              if(arready_1) nstate0 = 2;
              else nstate0 = cstate0;
            end
        2 : begin
              if(rlast_1) nstate0 = 0;
              else nstate0 = cstate0;
            end            
        default : nstate0 = 0;
     endcase
   end

   always @ (posedge clk or negedge rstn) begin
     if(~rstn) begin
       araddr_1   <= {32{1'b0}};
       arvalid_1  <= 1'b0;
       rready_1   <= 1'b0;
     end
     else begin
         case(nstate0)
            0 : begin
                  araddr_1   <= {32{1'b0}};
                  arvalid_1  <= 1'b0;
                  rready_1   <= 1'b0;
                end
            1 : begin
                  araddr_1   <= ddr_raddr;
                  arvalid_1  <= 1'b1;
                  rready_1   <= 1'b0;
                end
            2 : begin
                  araddr_1   <= {32{1'b0}};
                  arvalid_1  <= 1'b0;
                  rready_1   <= 1'b1;
                end        
            default : begin
                        araddr_1   <= {32{1'b0}};
                        arvalid_1  <= 1'b0;
                        rready_1   <= 1'b0;
                      end  
         endcase
     end
   end

endmodule