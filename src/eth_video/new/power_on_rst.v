module power_on_rst
#(
  parameter CLK_FRE  = 50,
  parameter DELAY_MS = 50
)
(
 input clk,
 input rst_n,
 
 output power_on_rstn
);

reg [31:0] rst_cnt ;
localparam RESET_DELAY = CLK_FRE*1000*DELAY_MS ;  //

always @(posedge clk or negedge rst_n)
begin
  if (!rst_n)
    rst_cnt <= 32'd0 ;
  else if (rst_cnt < RESET_DELAY)  //50ms
    rst_cnt <= rst_cnt + 1'b1 ;
  else 
    rst_cnt <= rst_cnt ;
end

assign power_on_rstn = (rst_cnt < RESET_DELAY)? 1'b0 : 1'b1 ;

endmodule
