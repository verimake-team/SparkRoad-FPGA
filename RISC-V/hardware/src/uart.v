module simple_uart(clk_i, 
		rst_i,
		txd_o,
		rxd_i,
		sel_i, /* 选通 */
		addr_i, /* 寄存器地址 */
		data_i, /* 输入数据 */
		data_o, /* 输出数据 */
		we_i); /* 写入使能 */
	input clk_i;
	input rst_i;
	output reg txd_o;
	input rxd_i;
	input sel_i; /* 地址选通 */
	/* 寄存器 */
	/* 0-UART_ODR 发送寄存器*/
	/* 1-UART_IDR 接收寄存器*/
	/* 2-UART_BSR 波特率寄存器 */
	/* 3-UART_SR 状态寄存器 */
	/* 固定8N1 */
	input [1:0]addr_i;
	input [31:0]data_i;
	output reg [31:0]data_o;
	input we_i;
	
	reg [7:0]uart_odr;
	reg [7:0]uart_idr;
	reg [31:0]uart_bsrr; //三倍波特率
	
	reg [31:0]uart_counter;//定时器
	
	reg [3:0]uart_status_txd;
	
	reg uart_op_clock;
	reg [2:0]uart_op_clock_by_3_c;
	
	wire uart_op_clock_by_3 = uart_op_clock_by_3_c[0] && uart_op_clock;
	
	reg uart_status_fe;//帧错误
	reg uart_status_rx;//已收到
		
	wire [7:0]uart_sr = {5'b0, uart_status_fe,uart_status_rx,(uart_status_txd!= 0 || uart_trigger_tx)};
	
	reg uart_trigger_tx;
		
	always @(posedge clk_i or negedge rst_i)
	begin /* 总线时序部分 */
		if(!rst_i)
		begin
			uart_status_rx_clr <= 0;
			data_o <= 32'h0;
			uart_counter <= 0;
			uart_op_clock_by_3_c <= 1;
			uart_bsrr <= 2;
			uart_trigger_tx <= 0;
		end
		else
		begin
			if(uart_counter >= uart_bsrr)
			begin
				uart_counter <= 0;
				uart_op_clock <= 1;
				uart_op_clock_by_3_c <= (uart_op_clock_by_3_c << 1)? uart_op_clock_by_3_c<<1: 1;
			end
			else
			begin
				uart_op_clock <= 0;
				uart_counter <= uart_counter + 1;
			end
			
			if(uart_op_clock_by_3)
				uart_trigger_tx <= 0;
				
			uart_status_rx_clr <= 0;
			if(sel_i)
			begin
				if(we_i)
					case (addr_i)
						2'b00:
							if(uart_status_txd == 0)
							begin //空闲状态
								uart_odr <= data_i[7:0];
								uart_trigger_tx <= 1;
							end
						2'b10:
							uart_bsrr <= data_i;
						2'b11:
							uart_status_rx_clr <= 1;
					endcase
				else
					case (addr_i)
						2'b00:
							data_o <= uart_odr;
						2'b01:
							data_o <= uart_idr;
						2'b10:
							data_o <= uart_bsrr;
						2'b11:
							data_o <= uart_sr;
					endcase
			end
		end
	end
	
	always @(posedge clk_i or negedge rst_i)
	begin //发送处理
		if(!rst_i)
		begin
			txd_o <= 1;
			uart_status_txd <= 0;
		end
		else
		begin
			if(uart_status_txd || uart_trigger_tx)
			begin
				case(uart_status_txd)
					4'd0://装填
					begin
						//txd_o <= 0;
						if(uart_op_clock_by_3)
							uart_status_txd <= 1;
					end
					4'd1://开始位
					begin
						txd_o <= 0;
						if(uart_op_clock_by_3)
							uart_status_txd <= 2;
					end
					4'd2, 4'd3, 4'd4, 4'd5, 4'd6, 4'd7, 4'd8,4'd9://数据位
					begin
						txd_o <= uart_odr[uart_status_txd - 2];
						if(uart_op_clock_by_3)
							uart_status_txd <= uart_status_txd + 1;
					end
					4'd10: //停止位
					begin
						txd_o <= 1;
						if(uart_op_clock_by_3)
							uart_status_txd <= 0;
					end
					default:
						uart_status_txd <= 0;
				endcase
			end
		end
	end
	
	reg [3:0]uart_status_rxd;// ---|___|---|___|---|___|___|---|___|---
				//  ^^^ ^^^ ^^^ ^^^ ^^^ ^^^ ^^^ ^^^ ^^^ ^^^
				//       S   1   0   1   0   0   1   0   E
	reg [2:0]uart_cnt_rx; //采样次数
	reg [3:0]uart_smp_rx; //为0的次数
	reg [7:0]uart_idr_t;
	reg uart_test_o;
	
	reg uart_status_rx_clr = 0;
	always @(posedge clk_i or negedge rst_i)
	begin //接收处理
		if(!rst_i)
		begin
			uart_status_rxd <= 0;
			uart_idr <= 0;
			uart_idr_t <= 0;
			uart_cnt_rx <= 1;
			uart_smp_rx <= 0;
			uart_status_fe <= 0;
			uart_status_rx <= 0;
			uart_test_o <= 1;
		end
		else
		begin
			if(uart_status_rx_clr)
			begin
				uart_status_rx <= 0;
				uart_status_fe <= 0;
			end
			if(uart_op_clock) //三倍采样
			begin
				case(uart_status_rxd)
				4'd0:/* 测量起始位 */
				begin
					if(!rxd_i)
					begin
						uart_idr_t <= 0;
						uart_cnt_rx <= 3'b010;
						uart_smp_rx <= 1;
						uart_status_rxd <= 1;
					end
				end
				4'd1:
				begin
					if(!rxd_i)
					begin
						uart_smp_rx <= uart_smp_rx + 1;
					end
					
					if(uart_cnt_rx == 3'b100)
					begin
						uart_cnt_rx <= 3'b001;
						if(uart_smp_rx >= 2) //三选2
						begin
							uart_status_rxd <= 2;
							uart_smp_rx <= !rxd_i;
							uart_test_o <= 0;
						end
						else
							uart_status_rxd <= 0; //滤波
					end
					uart_cnt_rx <= (uart_cnt_rx << 1)? uart_cnt_rx << 1: 1;
				end
				4'd2,4'd3,4'd4,4'd5,4'd6,4'd7,4'd8,4'd9:/* 0~7位 */
				begin
					if(!rxd_i)
					begin
						uart_smp_rx <= uart_smp_rx + 1;
					end
					if(uart_cnt_rx == 3'b100)
					begin
						uart_cnt_rx <= 3'b001;
						if(uart_smp_rx >= 2)		
						begin
							uart_idr_t[uart_status_rxd - 2] <= 0;
							uart_test_o <= 0;
						end
						else
						begin
							uart_idr_t[uart_status_rxd - 2] <= 1; //滤波
							uart_test_o <= 1;
						end
						uart_smp_rx <= !rxd_i;
						uart_status_rxd <= uart_status_rxd + 1;
					end
					uart_cnt_rx <= (uart_cnt_rx << 1)? uart_cnt_rx << 1: 1;
				end
				4'd10: /* 结束位 */
				begin
					if(!rxd_i)
					begin
						uart_smp_rx <= uart_smp_rx + 1;
					end
					if(uart_cnt_rx == 3'b010)
					begin
						uart_cnt_rx <= 3'b001;
						uart_status_rxd <= 0;
						
						uart_idr <= uart_idr_t;
						
						uart_status_rx <= 1;
						uart_test_o <= 1;
						if(uart_smp_rx)	
						begin	
							uart_status_fe <= 1;
						end
						else
							uart_status_fe <= 0;
					end	
					uart_cnt_rx <= (uart_cnt_rx << 1)? uart_cnt_rx << 1: 1;
				end			
				default:
					uart_status_rxd <= 0;	
				endcase
			end
		end
	end
	
endmodule
