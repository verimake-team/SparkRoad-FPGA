`timescale 1 ns / 1 ps

module system_tb;
	reg clk = 1;
	always #5 clk = ~clk;

	reg resetn = 0;
	initial begin
		//if ($test$plusargs("vcd")) begin
			$dumpfile("system.vcd");
			$dumpvars(0, system_tb);
		//end
		repeat (100) @(posedge clk);
		resetn <= 1;
	end

	wire trap;
	wire [7:0] out_byte;
	wire out_byte_en;
	reg rxd = 1;

	system uut (
		.clk        (clk        ),
		.resetn_i     (resetn     ),
		.trap       (trap       ),
		.out_byte   (out_byte   ),
		.out_byte_en(out_byte_en),
		.rxd	(rxd)
	);
	initial
	begin
		#88040 rxd = 0;
		#2070 rxd = 1;
		#19000 rxd = 0;
		#2070 rxd = 1;
	end
	always @(posedge clk) begin
		if (resetn && out_byte_en) begin
			$write("%c", out_byte);
			$fflush;
		end
		if (resetn && trap) begin
			$finish;
		end
	end
endmodule

module regfile_dp(di, waddr, we, wclk, do, raddr);
	input [31:0] di;
	input [4:0] waddr;
	input [4:0] raddr;
	input we;
	input wclk;
	output reg [31:0] do;
	
	reg [31:0]memory[0:31];
	integer i;
	initial begin
	for(i = 0; i < 32; i++)
		memory[i] = 32'h0;
	end
	always @(posedge wclk)
		if(we)
			memory[waddr] <= di;
	
	always @*
		do = memory[raddr];
endmodule
/*
module cpuregs_m(wclk, cpuregs_rs1, cpuregs_rs2, decoded_rs1, decoded_rs2, cpuregs_write, latched_rd, cpuregs_wrdata);
	input [31:0]cpuregs_wrdata;
	input [4:0]latched_rd;
	input [4:0]decoded_rs1;
	input [4:0]decoded_rs2;
	
	output reg [31:0]cpuregs_rs1;
	output reg [31:0]cpuregs_rs2;
	
	reg [31:0] cpuregs[0:31];
	input cpuregs_write;
	input wclk;
	
	always @(posedge wclk) begin
		if (cpuregs_write)
			cpuregs[latched_rd] <= cpuregs_wrdata;
	end

	always @* begin
			cpuregs_rs1 = cpuregs[decoded_rs1];
			cpuregs_rs2 = cpuregs[decoded_rs2];
	end
endmodule
*/
