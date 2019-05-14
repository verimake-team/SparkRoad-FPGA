`timescale 1 ns / 1 ps

module system (
	input            clk,
	input            resetn_i,
	output           trap,
	output reg [7:0] out_byte,
	output reg       out_byte_en,
	//output mem_valid,
	//output mem_instr,
	//output reset_o,
	//output mem_la_write,
	output txd,
	input rxd
);
	//wire clk;
	//EG_LOGIC_CCLK cclk(.cclk(clk), .en(1'b1));
	
	reg mem_ready;
	wire [31:0] mem_addr;
	wire [31:0] mem_wdata;
	wire [3:0] mem_wstrb;
	reg [31:0] mem_rdata; 
	wire mem_instr;
	wire mem_valid;

	wire mem_la_read;
	wire mem_la_write; 
	wire [31:0] mem_la_addr;
	wire [31:0] mem_la_wdata;
	wire [3:0] mem_la_wstrb;
	
	reg resetn = 0;
	reg [1:0]initial_reset = 0; 
	 
	always @(posedge clk)
	begin
		resetn <= resetn_i && (initial_reset == 2'b11);
		
		if(initial_reset != 2'b11)
			initial_reset <= initial_reset + 1;
	end
	
	picorv32 picorv32_core (
		.clk         (clk         ),
		.resetn      (resetn      ),
		.trap        (trap        ),
		.mem_valid   (mem_valid   ),
		.mem_instr   (mem_instr   ),
		.mem_ready   (mem_ready   ),
		.mem_addr    (mem_addr    ),
		.mem_wdata   (mem_wdata   ),
		.mem_wstrb   (mem_wstrb   ),
		.mem_rdata   (mem_rdata   ),
		.mem_la_read (mem_la_read ),
		.mem_la_write(mem_la_write),
		.mem_la_addr (mem_la_addr ),
		.mem_la_wdata(mem_la_wdata),
		.mem_la_wstrb(mem_la_wstrb)
	);

	assign reset_o = resetn;
	reg [31:0] m_read_data;
	reg m_read_en;
	
	wire [31:0]memory_out;

	/* system memory, you can also use AXI-wrapper here */
	sysmem_lo mem_lo  (.doa(memory_out[7:0]),
			.dia(mem_la_wdata[7:0]), 
			.addra(mem_la_addr[11:2]), 
			.cea(1'b1), 
			.clka(clk), 
			.wea(mem_la_wstrb[0] && mem_la_write && mem_la_addr[31:12] == 20'b0), 
			.rsta(~resetn));
	sysmem_ml mem_ml  (.doa(memory_out[15:8]),
			.dia(mem_la_wdata[15:8]), 
			.addra(mem_la_addr[11:2]),
			.cea(1'b1), 
			.clka(clk), 
			.wea(mem_la_wstrb[1] && mem_la_write && mem_la_addr[31:12] == 20'b0), 
			.rsta(~resetn));
	sysmem_mh mem_mh  (.doa(memory_out[23:16]),
			.dia(mem_la_wdata[23:16]), 
			.addra(mem_la_addr[11:2]),
			.cea(1'b1), 
			.clka(clk), 
			.wea(mem_la_wstrb[2] && mem_la_write && mem_la_addr[31:12] == 20'b0), 
			.rsta(~resetn));
	sysmem_hi mem_hi  (.doa(memory_out[31:24]),
			.dia(mem_la_wdata[31:24]), 
			.addra(mem_la_addr[11:2]),
			.cea(1'b1), 
			.clka(clk), 
			.wea(mem_la_wstrb[3] && mem_la_write && mem_la_addr[31:12] == 20'b0), 
			.rsta(~resetn));
		wire uart_sel = (mem_la_addr[31:4] == 28'h1000_001);		
		wire [31:0]uart_do;
						
		simple_uart uart(.clk_i(clk), .rst_i(resetn),
			.txd_o(txd), .rxd_i(rxd),
			.sel_i(uart_sel), .addr_i(mem_la_addr[3:2]),
			.data_i(mem_la_wdata), .data_o(uart_do),
			.we_i(mem_la_write));	
	always @*
	begin
		if(uart_sel)
			mem_rdata = uart_do;
		else
			mem_rdata = memory_out;
	end			
														 
		always @(posedge clk or negedge resetn) begin
			mem_ready <= 1;
			if(!resetn)
			begin
				out_byte_en <= 0;
				out_byte <= 8'hff;
			end	
			else
			begin	
				out_byte_en <= 0;
				/* our I/O port */
				if (mem_la_write && mem_la_addr == 32'h1000_0000) begin
					out_byte_en <= 1;
					out_byte <= ~mem_la_wdata[7:0];
				end 
			end
		end
endmodule
