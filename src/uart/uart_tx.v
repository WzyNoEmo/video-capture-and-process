`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:Meyesemi 
// Engineer: Will
// 
// Create Date: 2023-01-29 20:31  
// Design Name:  
// Module Name: 
// Project Name: 
// Target Devices: Pango
// Tool Versions: 
// Description: 
//      
// Dependencies: 
// 
// Revision:
// Revision 1.0 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define UD #1

module uart_tx #(
    parameter            BPS_NUM  =    16'd434
//  设置波特率为4800时，bit位宽时钟周期个数:50MHz set 10417  40MHz set 8333
//  设置波特率为9600时，bit位宽时钟周期个数:50MHz set 5208   40MHz set 4167
//  设置波特率为115200时，bit位宽时钟周期个数:50MHz set 434  40MHz set 347 12M set 104
)
(
    input          clk,         // clock                                   时钟信号
    input [7:0]    tx_data,     // uart tx data signal byte；              等待发送的字节数据
    input          tx_pluse,    // uart tx enable signal,rising is active; 发送模块发送触发信号
                   
    output reg     uart_tx,     // uart tx transmit data line              发送模块串口发送信号线
    output         tx_busy      // uart tx module work states,high is busy;发送模块忙状态指示
);

    //==========================================================================
    //wire and reg in the module
    //==========================================================================
    reg             tx_pluse_reg =0;
    
    reg	[2:0]	    tx_bit_cnt=0;	//the bits number has transmited.
                  
    reg	[2:0]	    tx_state=0;		//current state of tx state machine.
    reg	[2:0]	    tx_state_n=0;	//next state of tx state machine.
                  
    reg	[3:0]	    pluse_delay_cnt=0;
    reg             tx_en = 0;

    // uart tx state machine's state
    localparam  IDLE	   = 4'h0;	//tx state machine's state.空闲状态
    localparam  SEND_START = 4'h1;	//tx state machine's state.发送start状态
    localparam  SEND_DATA  = 4'h2;	//tx state machine's state.发送数据状态
    localparam  SEND_STOP  = 4'h3;	//tx state machine's state.发送stop状态
    localparam  SEND_END   = 4'h4;	//tx state machine's state.发送结束状态
    
    // uart bps set  the clk's frequency is 50MHz
    reg	[15:0]	  clk_div_cnt=0;	//count for division the clock. 

    //==========================================================================
    //logic
    //==========================================================================
    assign tx_busy = (tx_state != IDLE); //一次状态循环发送8bit数据
    //some control single.
    
    always @(posedge clk)
    begin
        tx_pluse_reg <= `UD tx_pluse;
    end
    
    // uart 模块发送工作使能标志信号  //检测pulse上升沿获得en
    always @(posedge clk)
    begin
        if(~tx_pluse_reg & tx_pluse)
            tx_en <= 1'b1;
        else if(tx_state == SEND_END)
            tx_en <= 1'b0;
    end
    
    //division the clock to satisfy baud rate.波特周期计数器
    always @ (posedge clk)
    begin
        if(clk_div_cnt == BPS_NUM || (~tx_pluse_reg & tx_pluse)) //数据来了 或者 数据传输1bit了 ，计数归位
            clk_div_cnt   <= `UD 16'h0;
        else
            clk_div_cnt   <= `UD clk_div_cnt + 16'h1;
    end
    
    //count the number has transmited.发送数据状态中，发送bit位计数，以波特周期累加
    always @ (posedge clk)
    begin
        if(!tx_en)
            tx_bit_cnt    <= `UD 3'h0;
        else if((tx_bit_cnt == 3'h7) && (clk_div_cnt == BPS_NUM))
            tx_bit_cnt    <= `UD 3'h0;
        else if((tx_state == SEND_DATA) && (clk_div_cnt == BPS_NUM))
            tx_bit_cnt    <= `UD tx_bit_cnt + 3'h1;
        else 
            tx_bit_cnt    <= `UD tx_bit_cnt;
    end
    
    //==========================================================================
    //transmitter state machine
    //==========================================================================
    
    //   state change 状态跳转
    always @(posedge clk)
    begin
        tx_state <= tx_state_n;
    end
    
    //   state change condition 状态跳转条件及规律
    always @ (*)
    begin
      case(tx_state)
        IDLE   	:  
        begin
            if(~tx_pluse_reg & tx_pluse)   //触发发送做16个时钟周期延时后跳转到，发送start状态 //检测上升沿
    	        tx_state_n = SEND_START;
    	    else
    	        tx_state_n = tx_state;
    	end
        SEND_START	:  
        begin
            if(clk_div_cnt == BPS_NUM)               //发送一个波特周期的低电平后进入，发送数据状态
    	        tx_state_n = SEND_DATA;
    	    else
    		    tx_state_n = tx_state;
    	end
        SEND_DATA	:  
        begin
            if(tx_bit_cnt == 3'h7 && clk_div_cnt == BPS_NUM)    //计时8个波特周期后（发送了8bit数据），跳转到发送stop状态
    	        tx_state_n = SEND_STOP;
    	    else
    		    tx_state_n = tx_state;
    	end
        SEND_STOP	:  
        begin
            if(clk_div_cnt == BPS_NUM)              //设置停止位宽为1个波特周期，计数发送一个波特周期的高电平，之后跳转到发送结束状态
    	        tx_state_n = SEND_END;
    	    else
    		    tx_state_n = tx_state;
        end
        SEND_END	:  tx_state_n = IDLE;
        default	:  tx_state_n = IDLE;
      endcase
    end
    
    //   logical ouput  状态机输出
    always @ (posedge clk)
    begin
      if(tx_en)
      begin
          case(tx_state)
              IDLE       :  uart_tx  <= `UD 1'h1;           //空闲状态输出高电平
              SEND_START :  uart_tx  <= `UD 1'h0;           //start状态发送一个波特周期的低电平
              SEND_DATA  :                                  //发送状态每个波特周期发送一个bit；
              begin
                  case(tx_bit_cnt)
                      3'h0  :  uart_tx  <= `UD tx_data[0];
                      3'h1  :  uart_tx  <= `UD tx_data[1];
                      3'h2  :  uart_tx  <= `UD tx_data[2];
                      3'h3  :  uart_tx  <= `UD tx_data[3];
                      3'h4  :  uart_tx  <= `UD tx_data[4];
                      3'h5  :  uart_tx  <= `UD tx_data[5];
                      3'h6  :  uart_tx  <= `UD tx_data[6];
                      3'h7  :  uart_tx  <= `UD tx_data[7];
                      default: uart_tx  <= `UD 1'h1;
                  endcase
              end
              SEND_STOP  :  uart_tx  <= `UD 1'h1;          //发送停止状态 输出1个波特周期高电平
              default    :  uart_tx  <= `UD 1'h1;          // 其他状态默认与空闲状态一致，保持高电平输出
          endcase
      end
      else
          uart_tx <= `UD 1'h1;
    end
    
    endmodule
