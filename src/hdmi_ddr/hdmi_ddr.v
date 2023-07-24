module hdmi_ddr( 
    input                                cfg_clk                   , 
    input                                rstn_out                  ,  
    output                               init_over_tx              ,//HDMI_OUT初始化完成

    //hdmi_in
    output            iic_scl,
    inout             iic_sda, 
    output            iic_tx_scl,
    inout             iic_tx_sda, 
    input             pixclk_in,                            
    input             vs_in, 
    input             hs_in, 
    input             de_in,
    input     [7:0]   r_in, 
    input     [7:0]   g_in, 
    input     [7:0]   b_in,

    //rgb接口
    output  [15:0]                       i_rgb565_hdmi      ,
    output                               de_in_hdmi         ,
    output                               vs_in_hdmi         ,
    output                               pixclk_in_hdmi       
);

/////////////////////////////////////////////////////////////////////////////////////
    wire                        pixclk_in_hdmi        ;    
    wire                        vs_in_hdmi          ;
    wire                        de_in_hdmi          ;
    wire[15:0]                  i_rgb565_hdmi            ;

//配置72xx
    ms72xx_ctl ms72xx_ctl(
        .clk             (  cfg_clk        ), //input       clk,
        .rst_n           (  rstn_out       ), //input       rstn,
        .init_over_tx    (  init_over_tx   ), //output      init_over,                                
        .init_over_rx    (  init_over_rx   ), //output      init_over,
        .iic_tx_scl      (  iic_tx_scl     ), //output      iic_scl,
        .iic_tx_sda      (  iic_tx_sda     ), //inout       iic_sda
        .iic_scl         (  iic_scl        ), //output      iic_scl,
        .iic_sda         (  iic_sda        )  //inout       iic_sda
    );
    

assign     pixclk_in_hdmi    =    pixclk_in    ;
assign     vs_in_hdmi        =    vs_in      ;
assign     de_in_hdmi        =    de_in    ;
assign     i_rgb565_hdmi     =    {r_in[7:3], g_in[7:2], b_in[7:3]};//{r,g,b};

endmodule
