// Verilog netlist created by TD v4.3.815
// Tue May 14 16:18:53 2019

`timescale 1ns / 1ps
module system  // ../src/top.v(3)
  (
  clk,
  resetn_i,
  rxd,
  out_byte,
  out_byte_en,
  trap,
  txd
  );

  input clk;  // ../src/top.v(4)
  input resetn_i;  // ../src/top.v(5)
  input rxd;  // ../src/top.v(14)
  output [7:0] out_byte;  // ../src/top.v(7)
  output out_byte_en;  // ../src/top.v(8)
  output trap;  // ../src/top.v(6)
  output txd;  // ../src/top.v(13)

  wire [1:0] initial_reset;  // ../src/top.v(34)
  wire [31:0] mem_la_addr;  // ../src/top.v(29)
  wire [31:0] mem_la_wdata;  // ../src/top.v(30)
  wire [3:0] mem_la_wstrb;  // ../src/top.v(31)
  wire [31:0] mem_rdata;  // ../src/top.v(23)
  wire [31:0] memory_out;  // ../src/top.v(66)
  wire [7:0] n17;
  wire [7:0] n18;
  wire [1:0] n3;
  wire [1:0] n4;
  wire [31:0] uart_do;  // ../src/top.v(98)
  wire mem_la_write;  // ../src/top.v(28)
  wire mem_ready;  // ../src/top.v(19)
  wire n0;
  wire n1;
  wire n10;
  wire n11;
  wire n12;
  wire n13;
  wire n14;
  wire n15;
  wire n16;
  wire n2;
  wire n5;
  wire n6;
  wire n7;
  wire n8;
  wire n9;
  wire resetn;  // ../src/top.v(33)
  wire uart_sel;  // ../src/top.v(97)

  add_pu2_pu2_o2 add0 (
    .i0(initial_reset),
    .i1(2'b01),
    .o(n3));  // ../src/top.v(41)
  eq_w2 eq0 (
    .i0(initial_reset),
    .i1(2'b11),
    .o(n0));  // ../src/top.v(38)
  eq_w20 eq1 (
    .i0(mem_la_addr[31:12]),
    .i1(20'b00000000000000000000),
    .o(n6));  // ../src/top.v(74)
  eq_w28 eq2 (
    .i0(mem_la_addr[31:4]),
    .i1(28'b0001000000000000000000000001),
    .o(uart_sel));  // ../src/top.v(97)
  eq_w32 eq3 (
    .i0(mem_la_addr),
    .i1(32'b00010000000000000000000000000000),
    .o(n15));  // ../src/top.v(124)
  sysmem_hi mem_hi (
    .addra(mem_la_addr[11:2]),
    .cea(1'b1),
    .clka(clk),
    .dia(mem_la_wdata[31:24]),
    .rsta(n14),
    .wea(n13),
    .doa(memory_out[31:24]));  // ../src/top.v(90)
  sysmem_lo mem_lo (
    .addra(mem_la_addr[11:2]),
    .cea(1'b1),
    .clka(clk),
    .dia(mem_la_wdata[7:0]),
    .rsta(n14),
    .wea(n7),
    .doa(memory_out[7:0]));  // ../src/top.v(69)
  sysmem_mh mem_mh (
    .addra(mem_la_addr[11:2]),
    .cea(1'b1),
    .clka(clk),
    .dia(mem_la_wdata[23:16]),
    .rsta(n14),
    .wea(n11),
    .doa(memory_out[23:16]));  // ../src/top.v(83)
  sysmem_ml mem_ml (
    .addra(mem_la_addr[11:2]),
    .cea(1'b1),
    .clka(clk),
    .dia(mem_la_wdata[15:8]),
    .rsta(n14),
    .wea(n9),
    .doa(memory_out[15:8]));  // ../src/top.v(76)
  binary_mux_s1_w2 mux0 (
    .i0(initial_reset),
    .i1(n3),
    .sel(n2),
    .o(n4));  // ../src/top.v(41)
  binary_mux_s1_w32 mux1 (
    .i0(memory_out),
    .i1(uart_do),
    .sel(uart_sel),
    .o(mem_rdata));  // ../src/top.v(110)
  binary_mux_s1_w8 mux2 (
    .i0(out_byte),
    .i1(n17),
    .sel(n16),
    .o(n18));  // ../src/top.v(127)
  ne_w2 neq0 (
    .i0(initial_reset),
    .i1(2'b11),
    .o(n2));  // ../src/top.v(40)
  AL_DFF out_byte_en_reg (
    .clk(clk),
    .d(n16),
    .reset(n14),
    .set(1'b0),
    .q(out_byte_en));  // ../src/top.v(128)
  picorv32 picorv32_core (
    .clk(clk),
    .mem_rdata(mem_rdata),
    .mem_ready(mem_ready),
    .resetn(resetn),
    .mem_la_addr(mem_la_addr),
    .mem_la_wdata(mem_la_wdata),
    .mem_la_write(mem_la_write),
    .mem_la_wstrb(mem_la_wstrb),
    .trap(trap));  // ../src/top.v(44)
  reg_ar_as_w2 reg0 (
    .clk(clk),
    .d(n4),
    .reset(2'b00),
    .set(2'b00),
    .q(initial_reset));  // ../src/top.v(42)
  reg_ar_as_w8 reg1 (
    .clk(clk),
    .d(n18),
    .reset(8'b00000000),
    .set({n14,n14,n14,n14,n14,n14,n14,n14}),
    .q(out_byte));  // ../src/top.v(128)
  AL_DFF resetn_reg (
    .clk(clk),
    .d(n1),
    .reset(1'b0),
    .set(1'b0),
    .q(resetn));  // ../src/top.v(42)
  and u10 (n10, mem_la_wstrb[2], mem_la_write);  // ../src/top.v(88)
  not u11 (n17[5], mem_la_wdata[5]);  // ../src/top.v(126)
  and u12 (n11, n10, n6);  // ../src/top.v(88)
  not u13 (n17[4], mem_la_wdata[4]);  // ../src/top.v(126)
  and u14 (n12, mem_la_wstrb[3], mem_la_write);  // ../src/top.v(95)
  not u15 (n17[3], mem_la_wdata[3]);  // ../src/top.v(126)
  and u16 (n13, n12, n6);  // ../src/top.v(95)
  not u17 (n17[2], mem_la_wdata[2]);  // ../src/top.v(126)
  not u18 (n17[1], mem_la_wdata[1]);  // ../src/top.v(126)
  and u19 (n16, mem_la_write, n15);  // ../src/top.v(124)
  and u2 (n1, resetn_i, n0);  // ../src/top.v(38)
  not u20 (n17[0], mem_la_wdata[0]);  // ../src/top.v(126)
  buf u21 (mem_ready, 1'b1);  // ../src/top.v(129)
  and u3 (n5, mem_la_wstrb[0], mem_la_write);  // ../src/top.v(74)
  and u4 (n7, n5, n6);  // ../src/top.v(74)
  not u5 (n14, resetn);  // ../src/top.v(75)
  and u6 (n8, mem_la_wstrb[1], mem_la_write);  // ../src/top.v(81)
  not u7 (n17[7], mem_la_wdata[7]);  // ../src/top.v(126)
  and u8 (n9, n8, n6);  // ../src/top.v(81)
  not u9 (n17[6], mem_la_wdata[6]);  // ../src/top.v(126)
  simple_uart uart (
    .addr_i(mem_la_addr[3:2]),
    .clk_i(clk),
    .data_i(mem_la_wdata),
    .rst_i(resetn),
    .rxd_i(rxd),
    .sel_i(uart_sel),
    .we_i(mem_la_write),
    .data_o(uart_do),
    .txd_o(txd));  // ../src/top.v(100)

endmodule 

module add_pu2_pu2_o2
  (
  i0,
  i1,
  o
  );

  input [1:0] i0;
  input [1:0] i1;
  output [1:0] o;



endmodule 

module eq_w2
  (
  i0,
  i1,
  o
  );

  input [1:0] i0;
  input [1:0] i1;
  output o;



endmodule 

module eq_w20
  (
  i0,
  i1,
  o
  );

  input [19:0] i0;
  input [19:0] i1;
  output o;



endmodule 

module eq_w28
  (
  i0,
  i1,
  o
  );

  input [27:0] i0;
  input [27:0] i1;
  output o;



endmodule 

module eq_w32
  (
  i0,
  i1,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  output o;



endmodule 

module sysmem_hi  // al_ip/mem_hi.v(14)
  (
  addra,
  cea,
  clka,
  dia,
  rsta,
  wea,
  doa
  );

  input [9:0] addra;  // al_ip/mem_hi.v(19)
  input cea;  // al_ip/mem_hi.v(21)
  input clka;  // al_ip/mem_hi.v(22)
  input [7:0] dia;  // al_ip/mem_hi.v(18)
  input rsta;  // al_ip/mem_hi.v(23)
  input wea;  // al_ip/mem_hi.v(20)
  output [7:0] doa;  // al_ip/mem_hi.v(16)


  EG_LOGIC_BRAM #(
    //.FORCE_KEEP("OFF"),
    //.INIT_FILE("hi.mif"),
    .ADDR_WIDTH_A(10),
    .ADDR_WIDTH_B(10),
    .BYTE_A(1),
    .BYTE_B(1),
    .BYTE_ENABLE(0),
    .DATA_DEPTH_A(1024),
    .DATA_DEPTH_B(1024),
    .DATA_WIDTH_A(8),
    .DATA_WIDTH_B(8),
    .DEBUGGABLE("NO"),
    .FILL_ALL("NONE"),
    .IMPLEMENT("9K"),
    .MODE("SP"),
    .PACKABLE("NO"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst (
    .addra(addra),
    .addrb(10'b0000000000),
    .bea(1'b0),
    .beb(1'b0),
    .cea(cea),
    .ceb(1'b0),
    .clka(clka),
    .clkb(1'b0),
    .dia(dia),
    .dib(8'b00000000),
    .ocea(1'b0),
    .oceb(1'b0),
    .rsta(rsta),
    .rstb(1'b0),
    .wea(wea),
    .web(1'b0),
    .doa(doa));  // al_ip/mem_hi.v(43)

endmodule 

module sysmem_lo  // al_ip/mem_lo.v(14)
  (
  addra,
  cea,
  clka,
  dia,
  rsta,
  wea,
  doa
  );

  input [9:0] addra;  // al_ip/mem_lo.v(19)
  input cea;  // al_ip/mem_lo.v(21)
  input clka;  // al_ip/mem_lo.v(22)
  input [7:0] dia;  // al_ip/mem_lo.v(18)
  input rsta;  // al_ip/mem_lo.v(23)
  input wea;  // al_ip/mem_lo.v(20)
  output [7:0] doa;  // al_ip/mem_lo.v(16)


  EG_LOGIC_BRAM #(
    //.FORCE_KEEP("OFF"),
    //.INIT_FILE("lo.mif"),
    .ADDR_WIDTH_A(10),
    .ADDR_WIDTH_B(10),
    .BYTE_A(1),
    .BYTE_B(1),
    .BYTE_ENABLE(0),
    .DATA_DEPTH_A(1024),
    .DATA_DEPTH_B(1024),
    .DATA_WIDTH_A(8),
    .DATA_WIDTH_B(8),
    .DEBUGGABLE("NO"),
    .FILL_ALL("NONE"),
    .IMPLEMENT("9K"),
    .MODE("SP"),
    .PACKABLE("NO"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst (
    .addra(addra),
    .addrb(10'b0000000000),
    .bea(1'b0),
    .beb(1'b0),
    .cea(cea),
    .ceb(1'b0),
    .clka(clka),
    .clkb(1'b0),
    .dia(dia),
    .dib(8'b00000000),
    .ocea(1'b0),
    .oceb(1'b0),
    .rsta(rsta),
    .rstb(1'b0),
    .wea(wea),
    .web(1'b0),
    .doa(doa));  // al_ip/mem_lo.v(43)

endmodule 

module sysmem_mh  // al_ip/mem_mh.v(14)
  (
  addra,
  cea,
  clka,
  dia,
  rsta,
  wea,
  doa
  );

  input [9:0] addra;  // al_ip/mem_mh.v(19)
  input cea;  // al_ip/mem_mh.v(21)
  input clka;  // al_ip/mem_mh.v(22)
  input [7:0] dia;  // al_ip/mem_mh.v(18)
  input rsta;  // al_ip/mem_mh.v(23)
  input wea;  // al_ip/mem_mh.v(20)
  output [7:0] doa;  // al_ip/mem_mh.v(16)


  EG_LOGIC_BRAM #(
    //.FORCE_KEEP("OFF"),
    //.INIT_FILE("mh.mif"),
    .ADDR_WIDTH_A(10),
    .ADDR_WIDTH_B(10),
    .BYTE_A(1),
    .BYTE_B(1),
    .BYTE_ENABLE(0),
    .DATA_DEPTH_A(1024),
    .DATA_DEPTH_B(1024),
    .DATA_WIDTH_A(8),
    .DATA_WIDTH_B(8),
    .DEBUGGABLE("NO"),
    .FILL_ALL("NONE"),
    .IMPLEMENT("9K"),
    .MODE("SP"),
    .PACKABLE("NO"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst (
    .addra(addra),
    .addrb(10'b0000000000),
    .bea(1'b0),
    .beb(1'b0),
    .cea(cea),
    .ceb(1'b0),
    .clka(clka),
    .clkb(1'b0),
    .dia(dia),
    .dib(8'b00000000),
    .ocea(1'b0),
    .oceb(1'b0),
    .rsta(rsta),
    .rstb(1'b0),
    .wea(wea),
    .web(1'b0),
    .doa(doa));  // al_ip/mem_mh.v(43)

endmodule 

module sysmem_ml  // al_ip/mem_ml.v(14)
  (
  addra,
  cea,
  clka,
  dia,
  rsta,
  wea,
  doa
  );

  input [9:0] addra;  // al_ip/mem_ml.v(19)
  input cea;  // al_ip/mem_ml.v(21)
  input clka;  // al_ip/mem_ml.v(22)
  input [7:0] dia;  // al_ip/mem_ml.v(18)
  input rsta;  // al_ip/mem_ml.v(23)
  input wea;  // al_ip/mem_ml.v(20)
  output [7:0] doa;  // al_ip/mem_ml.v(16)


  EG_LOGIC_BRAM #(
    //.FORCE_KEEP("OFF"),
    //.INIT_FILE("ml.mif"),
    .ADDR_WIDTH_A(10),
    .ADDR_WIDTH_B(10),
    .BYTE_A(1),
    .BYTE_B(1),
    .BYTE_ENABLE(0),
    .DATA_DEPTH_A(1024),
    .DATA_DEPTH_B(1024),
    .DATA_WIDTH_A(8),
    .DATA_WIDTH_B(8),
    .DEBUGGABLE("NO"),
    .FILL_ALL("NONE"),
    .IMPLEMENT("9K"),
    .MODE("SP"),
    .PACKABLE("NO"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("SYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    inst (
    .addra(addra),
    .addrb(10'b0000000000),
    .bea(1'b0),
    .beb(1'b0),
    .cea(cea),
    .ceb(1'b0),
    .clka(clka),
    .clkb(1'b0),
    .dia(dia),
    .dib(8'b00000000),
    .ocea(1'b0),
    .oceb(1'b0),
    .rsta(rsta),
    .rstb(1'b0),
    .wea(wea),
    .web(1'b0),
    .doa(doa));  // al_ip/mem_ml.v(43)

endmodule 

module binary_mux_s1_w2
  (
  i0,
  i1,
  sel,
  o
  );

  input [1:0] i0;
  input [1:0] i1;
  input sel;
  output [1:0] o;



endmodule 

module binary_mux_s1_w32
  (
  i0,
  i1,
  sel,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  input sel;
  output [31:0] o;



endmodule 

module binary_mux_s1_w8
  (
  i0,
  i1,
  sel,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  input sel;
  output [7:0] o;



endmodule 

module ne_w2
  (
  i0,
  i1,
  o
  );

  input [1:0] i0;
  input [1:0] i1;
  output o;



endmodule 

module picorv32  // ../src/picorv32.v(46)
  (
  clk,
  irq,
  mem_rdata,
  mem_ready,
  pcpi_rd,
  pcpi_ready,
  pcpi_wait,
  pcpi_wr,
  resetn,
  eoi,
  mem_addr,
  mem_instr,
  mem_la_addr,
  mem_la_read,
  mem_la_wdata,
  mem_la_write,
  mem_la_wstrb,
  mem_valid,
  mem_wdata,
  mem_wstrb,
  pcpi_insn,
  pcpi_rs1,
  pcpi_rs2,
  pcpi_valid,
  trace_data,
  trace_valid,
  trap
  );

  input clk;  // ../src/picorv32.v(74)
  input [31:0] irq;  // ../src/picorv32.v(104)
  input [31:0] mem_rdata;  // ../src/picorv32.v(84)
  input mem_ready;  // ../src/picorv32.v(79)
  input [31:0] pcpi_rd;  // ../src/picorv32.v(99)
  input pcpi_ready;  // ../src/picorv32.v(101)
  input pcpi_wait;  // ../src/picorv32.v(100)
  input pcpi_wr;  // ../src/picorv32.v(98)
  input resetn;  // ../src/picorv32.v(74)
  output [31:0] eoi;  // ../src/picorv32.v(105)
  output [31:0] mem_addr;  // ../src/picorv32.v(81)
  output mem_instr;  // ../src/picorv32.v(78)
  output [31:0] mem_la_addr;  // ../src/picorv32.v(89)
  output mem_la_read;  // ../src/picorv32.v(87)
  output [31:0] mem_la_wdata;  // ../src/picorv32.v(90)
  output mem_la_write;  // ../src/picorv32.v(88)
  output [3:0] mem_la_wstrb;  // ../src/picorv32.v(91)
  output mem_valid;  // ../src/picorv32.v(77)
  output [31:0] mem_wdata;  // ../src/picorv32.v(82)
  output [3:0] mem_wstrb;  // ../src/picorv32.v(83)
  output [31:0] pcpi_insn;  // ../src/picorv32.v(95)
  output [31:0] pcpi_rs1;  // ../src/picorv32.v(96)
  output [31:0] pcpi_rs2;  // ../src/picorv32.v(97)
  output pcpi_valid;  // ../src/picorv32.v(94)
  output [35:0] trace_data;  // ../src/picorv32.v(129)
  output trace_valid;  // ../src/picorv32.v(128)
  output trap;  // ../src/picorv32.v(75)

  parameter BARREL_SHIFTER = 1'b0;
  parameter CATCH_ILLINSN = 1'b1;
  parameter CATCH_MISALIGN = 1'b1;
  parameter COMPRESSED_ISA = 1'b1;
  parameter ENABLE_COUNTERS = 1'b1;
  parameter ENABLE_COUNTERS64 = 1'b1;
  parameter ENABLE_DIV = 1'b0;
  parameter ENABLE_FAST_MUL = 1'b0;
  parameter ENABLE_IRQ = 1'b0;
  parameter ENABLE_IRQ_QREGS = 1'b1;
  parameter ENABLE_IRQ_TIMER = 1'b1;
  parameter ENABLE_MUL = 1'b0;
  parameter ENABLE_PCPI = 1'b0;
  parameter ENABLE_REGS_16_31 = 1'b1;
  parameter ENABLE_REGS_DUALPORT = 1'b1;
  parameter ENABLE_TRACE = 1'b0;
  parameter LATCHED_IRQ = 32'b11111111111111111111111111111111;
  parameter LATCHED_MEM_RDATA = 1'b0;
  parameter MASKED_IRQ = 32'b00000000000000000000000000000000;
  parameter PROGADDR_IRQ = 32'b00000000000000000000000000010000;
  parameter PROGADDR_RESET = 32'b00000000000000000000000000000100;
  parameter REGS_INIT_ZERO = 1'b0;
  parameter STACKADDR = 32'b11111111111111111111111111111111;
  parameter TWO_CYCLE_ALU = 1'b0;
  parameter TWO_CYCLE_COMPARE = 1'b0;
  parameter TWO_STAGE_SHIFT = 1'b1;
  // localparam TRACE_ADDR = 36'b001000000000000000000000000000000000;
  // localparam TRACE_BRANCH = 36'b000100000000000000000000000000000000;
  // localparam TRACE_IRQ = 36'b100000000000000000000000000000000000;
  // localparam WITH_PCPI = 1'b0;
  // localparam cpu_state_exec = 8'b00001000;
  // localparam cpu_state_fetch = 8'b01000000;
  // localparam cpu_state_ld_rs1 = 8'b00100000;
  // localparam cpu_state_ld_rs2 = 8'b00010000;
  // localparam cpu_state_ldmem = 8'b00000001;
  // localparam cpu_state_shift = 8'b00000100;
  // localparam cpu_state_stmem = 8'b00000010;
  // localparam cpu_state_trap = 8'b10000000;
  // localparam irq_buserror = 2;
  // localparam irq_ebreak = 1;
  // localparam irq_timer = 0;
  // localparam irqregs_offset = 32;
  // localparam regfile_size = 32;
  // localparam regindex_bits = 5;
  wire [31:0] alu_add_sub;  // ../src/picorv32.v(1178)
  wire [31:0] alu_out;  // ../src/picorv32.v(1174)
  wire [31:0] alu_out_q;  // ../src/picorv32.v(1174)
  wire [63:0] count_cycle;  // ../src/picorv32.v(145)
  wire [63:0] count_instr;  // ../src/picorv32.v(145)
  wire [7:0] cpu_state;  // ../src/picorv32.v(1134)
  wire [31:0] cpuregs_rs1;  // ../src/picorv32.v(1254)
  wire [31:0] cpuregs_rs1_z;  // ../src/picorv32.v(1309)
  wire [31:0] cpuregs_rs2;  // ../src/picorv32.v(1255)
  wire [31:0] cpuregs_rs2_z;  // ../src/picorv32.v(1310)
  wire [31:0] cpuregs_wrdata;  // ../src/picorv32.v(1252)
  wire [31:0] decoded_imm;  // ../src/picorv32.v(620)
  wire [31:0] decoded_imm_uj;  // ../src/picorv32.v(620)
  wire [4:0] decoded_rd;  // ../src/picorv32.v(619)
  wire [4:0] decoded_rs1;  // ../src/picorv32.v(619)
  wire [4:0] decoded_rs2;  // ../src/picorv32.v(619)
  wire [1:0] irq_state;  // ../src/picorv32.v(1135)
  wire [4:0] latched_rd;  // ../src/picorv32.v(1163)
  wire [15:0] mem_16bit_buffer;  // ../src/picorv32.v(331)
  wire [31:0] mem_rdata_latched;  // ../src/picorv32.v(334)
  wire [31:0] mem_rdata_latched_noshuffle;  // ../src/picorv32.v(333)
  wire [31:0] mem_rdata_q;  // ../src/picorv32.v(319)
  wire [31:0] mem_rdata_word;  // ../src/picorv32.v(318)
  wire [1:0] mem_state;  // ../src/picorv32.v(316)
  wire [1:0] mem_wordsize;  // ../src/picorv32.v(317)
  wire [4:0] n102;
  wire [1:0] n103;
  wire [2:0] n105;
  wire [4:0] n107;
  wire [4:0] n108;
  wire [24:0] n109;
  wire [24:0] n110;
  wire [1:0] n112;
  wire [3:0] n116;
  wire [31:0] n117;
  wire [3:0] n118;
  wire [31:0] n119;
  wire [3:0] n123;
  wire [1:0] n124;
  wire [1:0] n127;
  wire [15:0] n128;
  wire [15:0] n132;
  wire [15:0] n133;
  wire [1:0] n135;
  wire [15:0] n136;
  wire [1:0] n138;
  wire [15:0] n141;
  wire [1:0] n143;
  wire [1:0] n145;
  wire [1:0] n146;
  wire [1:0] n147;
  wire [15:0] n150;
  wire [3:0] n153;
  wire [1:0] n154;
  wire [31:0] n158;
  wire [3:0] n159;
  wire [31:0] n160;
  wire [15:0] n161;
  wire [1:0] n186;
  wire [2:0] n189;
  wire [2:0] n192;
  wire [4:0] n195;
  wire [3:0] n199;
  wire [4:0] n200;
  wire [3:0] n202;
  wire [3:0] n205;
  wire [4:0] n206;
  wire [4:0] n208;
  wire [4:0] n209;
  wire [4:0] n212;
  wire [4:0] n216;
  wire [4:0] n218;
  wire [4:0] n219;
  wire [4:0] n220;
  wire [4:0] n222;
  wire [4:0] n223;
  wire [4:0] n225;
  wire [4:0] n226;
  wire [4:0] n227;
  wire [4:0] n229;
  wire [4:0] n230;
  wire [4:0] n231;
  wire [4:0] n235;
  wire [4:0] n236;
  wire [4:0] n237;
  wire [4:0] n245;
  wire [4:0] n246;
  wire [4:0] n247;
  wire [29:0] n248;
  wire [31:0] n268;
  wire [4:0] n269;
  wire [4:0] n270;
  wire [4:0] n271;
  wire [29:0] n30;
  wire [31:0] n31;
  wire [31:0] n32;
  wire [31:0] n358;
  wire [31:0] n359;
  wire [3:0] n38;
  wire [31:0] n39;
  wire [3:0] n40;
  wire [31:0] n406;
  wire [31:0] n41;
  wire [31:0] n42;
  wire [31:0] n433;
  wire [31:0] n434;
  wire [31:0] n439;
  wire [31:0] n441;
  wire [31:0] n443;
  wire [2:0] n449;
  wire [4:0] n45;
  wire [31:0] n450;
  wire [31:0] n453;
  wire [31:0] n455;
  wire [63:0] n459;
  wire [63:0] n460;
  wire [4:0] n47;
  wire [3:0] n49;
  wire [31:0] n496;
  wire [31:0] n500;
  wire [2:0] n501;
  wire [31:0] n502;
  wire [63:0] n503;
  wire [31:0] n504;
  wire [31:0] n508;
  wire [7:0] n510;
  wire [31:0] n511;
  wire [63:0] n512;
  wire [7:0] n516;
  wire [31:0] n517;
  wire [31:0] n518;
  wire [4:0] n52;
  wire [7:0] n521;
  wire [7:0] n524;
  wire [31:0] n525;
  wire [31:0] n527;
  wire [31:0] n528;
  wire [16:0] n53;
  wire [4:0] n532;
  wire [31:0] n543;
  wire [7:0] n544;
  wire [4:0] n546;
  wire [7:0] n549;
  wire [9:0] n55;
  wire [31:0] n558;
  wire [5:0] n559;
  wire [31:0] n563;
  wire [5:0] n564;
  wire [31:0] n565;
  wire [4:0] n566;
  wire [31:0] n567;
  wire [7:0] n569;
  wire [9:0] n57;
  wire [31:0] n570;
  wire [4:0] n571;
  wire [1:0] n575;
  wire [31:0] n576;
  wire [1:0] n577;
  wire [31:0] n578;
  wire [7:0] n581;
  wire [1:0] n583;
  wire [31:0] n584;
  wire [9:0] n59;
  wire [4:0] n60;
  wire [1:0] n601;
  wire [2:0] n62;
  wire [1:0] n634;
  wire [31:0] n638;
  wire [2:0] n64;
  wire [31:0] n641;
  wire [31:0] n642;
  wire [1:0] n652;
  wire [31:0] n656;
  wire [31:0] n658;
  wire [2:0] n66;
  wire [7:0] n661;
  wire [1:0] n672;
  wire [31:0] n673;
  wire [31:0] n674;
  wire [2:0] n68;
  wire [4:0] n688;
  wire [9:0] n69;
  wire [63:0] n690;
  wire [7:0] n692;
  wire [31:0] n693;
  wire [31:0] n694;
  wire [31:0] n695;
  wire [4:0] n696;
  wire [19:0] n70;
  wire [31:0] n704;
  wire [31:0] n705;
  wire [63:0] n706;
  wire [4:0] n71;
  wire [1:0] n714;
  wire [31:0] n715;
  wire [7:0] n716;
  wire [1:0] n719;
  wire [4:0] n720;
  wire [31:0] n723;
  wire [31:0] n724;
  wire [31:0] n725;
  wire [4:0] n726;
  wire [7:0] n737;
  wire [7:0] n741;
  wire [7:0] n742;
  wire [7:0] n745;
  wire [4:0] n75;
  wire [1:0] n76;
  wire [2:0] n77;
  wire [4:0] n78;
  wire [4:0] n81;
  wire [1:0] n82;
  wire [2:0] n83;
  wire [4:0] n88;
  wire [1:0] n89;
  wire [2:0] n90;
  wire [4:0] n91;
  wire [4:0] n93;
  wire [1:0] n94;
  wire [2:0] n95;
  wire [31:0] next_pc;  // ../src/picorv32.v(168)
  wire [31:0] reg_next_pc;  // ../src/picorv32.v(146)
  wire [31:0] reg_op1;  // ../src/picorv32.v(146)
  wire [31:0] reg_op2;  // ../src/picorv32.v(146)
  wire [31:0] reg_out;  // ../src/picorv32.v(146)
  wire [31:0] reg_pc;  // ../src/picorv32.v(146)
  wire [4:0] reg_sh;  // ../src/picorv32.v(151)
  wire alu_eq;  // ../src/picorv32.v(1180)
  wire alu_lts;  // ../src/picorv32.v(1180)
  wire alu_ltu;  // ../src/picorv32.v(1180)
  wire alu_out_0;  // ../src/picorv32.v(1175)
  wire clear_prefetched_high_word;  // ../src/picorv32.v(330)
  wire clear_prefetched_high_word_q;  // ../src/picorv32.v(1240)
  wire compressed_instr;  // ../src/picorv32.v(625)
  wire cpuregs_write;  // ../src/picorv32.v(1251)
  wire decoder_pseudo_trigger;  // ../src/picorv32.v(623)
  wire decoder_trigger;  // ../src/picorv32.v(621)
  wire instr_add;  // ../src/picorv32.v(614)
  wire instr_addi;  // ../src/picorv32.v(613)
  wire instr_and;  // ../src/picorv32.v(614)
  wire instr_andi;  // ../src/picorv32.v(613)
  wire instr_auipc;  // ../src/picorv32.v(610)
  wire instr_beq;  // ../src/picorv32.v(611)
  wire instr_bge;  // ../src/picorv32.v(611)
  wire instr_bgeu;  // ../src/picorv32.v(611)
  wire instr_blt;  // ../src/picorv32.v(611)
  wire instr_bltu;  // ../src/picorv32.v(611)
  wire instr_bne;  // ../src/picorv32.v(611)
  wire instr_getq;  // ../src/picorv32.v(616)
  wire instr_jal;  // ../src/picorv32.v(610)
  wire instr_jalr;  // ../src/picorv32.v(610)
  wire instr_lb;  // ../src/picorv32.v(612)
  wire instr_lbu;  // ../src/picorv32.v(612)
  wire instr_lh;  // ../src/picorv32.v(612)
  wire instr_lhu;  // ../src/picorv32.v(612)
  wire instr_lui;  // ../src/picorv32.v(610)
  wire instr_lw;  // ../src/picorv32.v(612)
  wire instr_maskirq;  // ../src/picorv32.v(616)
  wire instr_or;  // ../src/picorv32.v(614)
  wire instr_ori;  // ../src/picorv32.v(613)
  wire instr_rdcycle;  // ../src/picorv32.v(615)
  wire instr_rdcycleh;  // ../src/picorv32.v(615)
  wire instr_rdinstr;  // ../src/picorv32.v(615)
  wire instr_rdinstrh;  // ../src/picorv32.v(615)
  wire instr_retirq;  // ../src/picorv32.v(616)
  wire instr_sb;  // ../src/picorv32.v(612)
  wire instr_setq;  // ../src/picorv32.v(616)
  wire instr_sh;  // ../src/picorv32.v(612)
  wire instr_sll;  // ../src/picorv32.v(614)
  wire instr_slli;  // ../src/picorv32.v(613)
  wire instr_slt;  // ../src/picorv32.v(614)
  wire instr_slti;  // ../src/picorv32.v(613)
  wire instr_sltiu;  // ../src/picorv32.v(613)
  wire instr_sltu;  // ../src/picorv32.v(614)
  wire instr_sra;  // ../src/picorv32.v(614)
  wire instr_srai;  // ../src/picorv32.v(613)
  wire instr_srl;  // ../src/picorv32.v(614)
  wire instr_srli;  // ../src/picorv32.v(613)
  wire instr_sub;  // ../src/picorv32.v(614)
  wire instr_sw;  // ../src/picorv32.v(612)
  wire instr_timer;  // ../src/picorv32.v(616)
  wire instr_trap;  // ../src/picorv32.v(617)
  wire instr_waitirq;  // ../src/picorv32.v(616)
  wire instr_xor;  // ../src/picorv32.v(614)
  wire instr_xori;  // ../src/picorv32.v(613)
  wire is_alu_reg_imm;  // ../src/picorv32.v(638)
  wire is_alu_reg_reg;  // ../src/picorv32.v(639)
  wire is_beq_bne_blt_bge_bltu_bgeu;  // ../src/picorv32.v(636)
  wire is_compare;  // ../src/picorv32.v(640)
  wire is_jalr_addi_slti_sltiu_xori_ori_andi;  // ../src/picorv32.v(630)
  wire is_lb_lh_lw_lbu_lhu;  // ../src/picorv32.v(628)
  wire is_lbu_lhu_lw;  // ../src/picorv32.v(637)
  wire is_lui_auipc_jal;  // ../src/picorv32.v(627)
  wire is_lui_auipc_jal_jalr_addi_add_sub;  // ../src/picorv32.v(633)
  wire is_rdcycle_rdcycleh_rdinstr_rdinstrh;  // ../src/picorv32.v(650)
  wire is_sb_sh_sw;  // ../src/picorv32.v(631)
  wire is_sll_srl_sra;  // ../src/picorv32.v(632)
  wire is_slli_srli_srai;  // ../src/picorv32.v(629)
  wire is_slti_blt_slt;  // ../src/picorv32.v(634)
  wire is_sltiu_bltu_sltu;  // ../src/picorv32.v(635)
  wire last_mem_valid;  // ../src/picorv32.v(325)
  wire latched_branch;  // ../src/picorv32.v(1157)
  wire latched_compr;  // ../src/picorv32.v(1158)
  wire latched_is_lb;  // ../src/picorv32.v(1162)
  wire latched_is_lh;  // ../src/picorv32.v(1161)
  wire latched_is_lu;  // ../src/picorv32.v(1160)
  wire latched_stalu;  // ../src/picorv32.v(1156)
  wire latched_store;  // ../src/picorv32.v(1155)
  wire mem_do_prefetch;  // ../src/picorv32.v(320)
  wire mem_do_rdata;  // ../src/picorv32.v(322)
  wire mem_do_rinst;  // ../src/picorv32.v(321)
  wire mem_do_wdata;  // ../src/picorv32.v(323)
  wire mem_done;  // ../src/picorv32.v(340)
  wire mem_la_firstword;  // ../src/picorv32.v(326)
  wire mem_la_firstword_reg;  // ../src/picorv32.v(325)
  wire mem_la_firstword_xfer;  // ../src/picorv32.v(327)
  wire mem_la_secondword;  // ../src/picorv32.v(325)
  wire mem_la_use_prefetched_high_word;  // ../src/picorv32.v(336)
  wire mem_xfer;  // ../src/picorv32.v(337)
  wire n0;
  wire n1;
  wire n10;
  wire n100;
  wire n101;
  wire n104;
  wire n106;
  wire n11;
  wire n111;
  wire n113;
  wire n114;
  wire n115;
  wire n12;
  wire n120;
  wire n121;
  wire n122;
  wire n125;
  wire n126;
  wire n129;
  wire n13;
  wire n130;
  wire n131;
  wire n134;
  wire n137;
  wire n139;
  wire n14;
  wire n140;
  wire n142;
  wire n144;
  wire n148;
  wire n149;
  wire n15;
  wire n151;
  wire n152;
  wire n155;
  wire n156;
  wire n157;
  wire n16;
  wire n162;
  wire n163;
  wire n164;
  wire n165;
  wire n166;
  wire n167;
  wire n168;
  wire n169;
  wire n17;
  wire n170;
  wire n171;
  wire n172;
  wire n173;
  wire n174;
  wire n175;
  wire n176;
  wire n177;
  wire n178;
  wire n179;
  wire n18;
  wire n180;
  wire n181;
  wire n182;
  wire n183;
  wire n184;
  wire n185;
  wire n187;
  wire n188;
  wire n19;
  wire n190;
  wire n191;
  wire n193;
  wire n194;
  wire n196;
  wire n197;
  wire n198;
  wire n2;
  wire n20;
  wire n201;
  wire n203;
  wire n204;
  wire n207;
  wire n21;
  wire n210;
  wire n211;
  wire n213;
  wire n214;
  wire n215;
  wire n217;
  wire n22;
  wire n221;
  wire n224;
  wire n228;
  wire n23;
  wire n232;
  wire n233;
  wire n234;
  wire n238;
  wire n239;
  wire n24;
  wire n240;
  wire n241;
  wire n242;
  wire n243;
  wire n244;
  wire n249;
  wire n25;
  wire n250;
  wire n251;
  wire n252;
  wire n253;
  wire n254;
  wire n255;
  wire n256;
  wire n257;
  wire n258;
  wire n259;
  wire n26;
  wire n260;
  wire n261;
  wire n262;
  wire n263;
  wire n264;
  wire n265;
  wire n266;
  wire n267;
  wire n27;
  wire n272;
  wire n273;
  wire n274;
  wire n275;
  wire n276;
  wire n277;
  wire n278;
  wire n279;
  wire n28;
  wire n280;
  wire n281;
  wire n282;
  wire n283;
  wire n284;
  wire n285;
  wire n286;
  wire n287;
  wire n288;
  wire n289;
  wire n29;
  wire n290;
  wire n291;
  wire n292;
  wire n293;
  wire n294;
  wire n295;
  wire n296;
  wire n297;
  wire n298;
  wire n299;
  wire n3;
  wire n300;
  wire n301;
  wire n302;
  wire n303;
  wire n304;
  wire n305;
  wire n306;
  wire n307;
  wire n308;
  wire n309;
  wire n310;
  wire n311;
  wire n312;
  wire n313;
  wire n314;
  wire n315;
  wire n316;
  wire n317;
  wire n318;
  wire n319;
  wire n320;
  wire n321;
  wire n322;
  wire n323;
  wire n324;
  wire n325;
  wire n326;
  wire n327;
  wire n328;
  wire n329;
  wire n33;
  wire n330;
  wire n331;
  wire n332;
  wire n333;
  wire n334;
  wire n335;
  wire n336;
  wire n337;
  wire n338;
  wire n339;
  wire n34;
  wire n340;
  wire n341;
  wire n342;
  wire n343;
  wire n344;
  wire n345;
  wire n346;
  wire n347;
  wire n348;
  wire n349;
  wire n35;
  wire n350;
  wire n351;
  wire n352;
  wire n353;
  wire n354;
  wire n355;
  wire n356;
  wire n357;
  wire n36;
  wire n360;
  wire n361;
  wire n362;
  wire n363;
  wire n364;
  wire n365;
  wire n366;
  wire n367;
  wire n368;
  wire n369;
  wire n37;
  wire n370;
  wire n371;
  wire n372;
  wire n373;
  wire n374;
  wire n375;
  wire n376;
  wire n377;
  wire n378;
  wire n379;
  wire n380;
  wire n381;
  wire n382;
  wire n383;
  wire n384;
  wire n385;
  wire n386;
  wire n387;
  wire n388;
  wire n389;
  wire n390;
  wire n391;
  wire n392;
  wire n393;
  wire n394;
  wire n395;
  wire n396;
  wire n397;
  wire n398;
  wire n399;
  wire n4;
  wire n400;
  wire n401;
  wire n402;
  wire n403;
  wire n404;
  wire n405;
  wire n407;
  wire n408;
  wire n409;
  wire n410;
  wire n411;
  wire n412;
  wire n413;
  wire n414;
  wire n415;
  wire n416;
  wire n417;
  wire n418;
  wire n419;
  wire n420;
  wire n421;
  wire n422;
  wire n423;
  wire n424;
  wire n425;
  wire n426;
  wire n427;
  wire n428;
  wire n429;
  wire n43;
  wire n430;
  wire n431;
  wire n432;
  wire n435;
  wire n436;
  wire n437;
  wire n438;
  wire n44;
  wire n440;
  wire n442;
  wire n444;
  wire n445;
  wire n446;
  wire n447;
  wire n448;
  wire n451;
  wire n452;
  wire n454;
  wire n456;
  wire n457;
  wire n458;
  wire n46;
  wire n461;
  wire n462;
  wire n463;
  wire n464;
  wire n465;
  wire n466;
  wire n467;
  wire n468;
  wire n469;
  wire n470;
  wire n471;
  wire n472;
  wire n473;
  wire n474;
  wire n475;
  wire n476;
  wire n477;
  wire n478;
  wire n479;
  wire n48;
  wire n480;
  wire n481;
  wire n482;
  wire n483;
  wire n484;
  wire n485;
  wire n486;
  wire n487;
  wire n488;
  wire n489;
  wire n490;
  wire n491;
  wire n492;
  wire n493;
  wire n494;
  wire n495;
  wire n497;
  wire n498;
  wire n499;
  wire n5;
  wire n50;
  wire n505;
  wire n506;
  wire n507;
  wire n509;
  wire n51;
  wire n513;
  wire n514;
  wire n515;
  wire n519;
  wire n520;
  wire n522;
  wire n523;
  wire n526;
  wire n529;
  wire n530;
  wire n531;
  wire n533;
  wire n534;
  wire n535;
  wire n536;
  wire n537;
  wire n538;
  wire n539;
  wire n54;
  wire n540;
  wire n541;
  wire n542;
  wire n545;
  wire n547;
  wire n548;
  wire n550;
  wire n551;
  wire n552;
  wire n553;
  wire n554;
  wire n555;
  wire n556;
  wire n557;
  wire n56;
  wire n560;
  wire n561;
  wire n562;
  wire n568;
  wire n572;
  wire n573;
  wire n574;
  wire n579;
  wire n58;
  wire n580;
  wire n582;
  wire n585;
  wire n586;
  wire n587;
  wire n588;
  wire n589;
  wire n590;
  wire n591;
  wire n592;
  wire n593;
  wire n594;
  wire n595;
  wire n596;
  wire n597;
  wire n598;
  wire n599;
  wire n6;
  wire n600;
  wire n602;
  wire n603;
  wire n604;
  wire n605;
  wire n606;
  wire n607;
  wire n608;
  wire n609;
  wire n61;
  wire n610;
  wire n611;
  wire n612;
  wire n613;
  wire n614;
  wire n615;
  wire n616;
  wire n617;
  wire n618;
  wire n619;
  wire n620;
  wire n621;
  wire n622;
  wire n623;
  wire n624;
  wire n625;
  wire n626;
  wire n627;
  wire n628;
  wire n629;
  wire n63;
  wire n630;
  wire n631;
  wire n632;
  wire n633;
  wire n635;
  wire n636;
  wire n637;
  wire n639;
  wire n640;
  wire n643;
  wire n644;
  wire n645;
  wire n646;
  wire n647;
  wire n648;
  wire n649;
  wire n65;
  wire n650;
  wire n651;
  wire n653;
  wire n654;
  wire n655;
  wire n657;
  wire n659;
  wire n660;
  wire n662;
  wire n663;
  wire n664;
  wire n665;
  wire n666;
  wire n667;
  wire n668;
  wire n669;
  wire n67;
  wire n670;
  wire n671;
  wire n675;
  wire n676;
  wire n677;
  wire n678;
  wire n679;
  wire n680;
  wire n681;
  wire n682;
  wire n683;
  wire n684;
  wire n685;
  wire n686;
  wire n687;
  wire n689;
  wire n691;
  wire n697;
  wire n698;
  wire n699;
  wire n7;
  wire n700;
  wire n701;
  wire n702;
  wire n703;
  wire n707;
  wire n708;
  wire n709;
  wire n710;
  wire n711;
  wire n712;
  wire n713;
  wire n717;
  wire n718;
  wire n72;
  wire n721;
  wire n722;
  wire n727;
  wire n728;
  wire n729;
  wire n73;
  wire n730;
  wire n731;
  wire n732;
  wire n733;
  wire n734;
  wire n735;
  wire n736;
  wire n738;
  wire n739;
  wire n74;
  wire n740;
  wire n743;
  wire n744;
  wire n746;
  wire n747;
  wire n748;
  wire n749;
  wire n750;
  wire n751;
  wire n752;
  wire n753;
  wire n754;
  wire n79;
  wire n8;
  wire n80;
  wire n84;
  wire n85;
  wire n86;
  wire n87;
  wire n9;
  wire n92;
  wire n96;
  wire n97;
  wire n98;
  wire n99;
  wire prefetched_high_word;  // ../src/picorv32.v(329)

  assign trace_valid = 1'b0;
  add_pu30_pu30_o30 add0 (
    .i0(next_pc[31:2]),
    .i1({29'b00000000000000000000000000000,mem_la_firstword_xfer}),
    .o(n30));  // ../src/picorv32.v(346)
  add_pu32_pu32_o32 add1 (
    .i0(reg_op1),
    .i1(reg_op2),
    .o(n434));  // ../src/picorv32.v(1193)
  add_pu32_pu32_o32 add2 (
    .i0(reg_pc),
    .i1({29'b00000000000000000000000000000,n449[2],latched_compr,1'b0}),
    .o(n450));  // ../src/picorv32.v(1270)
  add_pu64_pu64_o64 add3 (
    .i0(count_cycle),
    .i1(64'b0000000000000000000000000000000000000000000000000000000000000001),
    .o(n459));  // ../src/picorv32.v(1365)
  add_pu32_pu32_o32 add4 (
    .i0(n500),
    .i1({29'b00000000000000000000000000000,n501[2],compressed_instr,1'b0}),
    .o(n502));  // ../src/picorv32.v(1498)
  add_pu64_pu64_o64 add5 (
    .i0(count_instr),
    .i1(64'b0000000000000000000000000000000000000000000000000000000000000001),
    .o(n503));  // ../src/picorv32.v(1502)
  add_pu32_pu32_o32 add6 (
    .i0(n500),
    .i1(decoded_imm_uj),
    .o(n504));  // ../src/picorv32.v(1507)
  add_pu32_pu32_o32 add7 (
    .i0(reg_pc),
    .i1(decoded_imm),
    .o(n543));  // ../src/picorv32.v(1744)
  add_pu32_pu32_o32 add8 (
    .i0(reg_op1),
    .i1(decoded_imm),
    .o(n576));  // ../src/picorv32.v(1807)
  AL_DFF clear_prefetched_high_word_q_reg (
    .clk(clk),
    .d(clear_prefetched_high_word),
    .reset(1'b0),
    .set(1'b0),
    .q(clear_prefetched_high_word_q));  // ../src/picorv32.v(1241)
  AL_DFF compressed_instr_reg (
    .clk(clk),
    .d(n272),
    .reset(1'b0),
    .set(1'b0),
    .q(compressed_instr));  // ../src/picorv32.v(1120)
  regfile_dp cpuregs_p1 (
    .di(cpuregs_wrdata),
    .raddr(decoded_rs1),
    .waddr(latched_rd),
    .wclk(clk),
    .we(n456),
    .do(cpuregs_rs1_z));  // ../src/picorv32.v(1311)
  regfile_dp cpuregs_p2 (
    .di(cpuregs_wrdata),
    .raddr(decoded_rs2),
    .waddr(latched_rd),
    .wclk(clk),
    .we(n456),
    .do(cpuregs_rs2_z));  // ../src/picorv32.v(1320)
  AL_DFF decoder_pseudo_trigger_reg (
    .clk(clk),
    .d(n730),
    .reset(1'b0),
    .set(1'b0),
    .q(decoder_pseudo_trigger));  // ../src/picorv32.v(1906)
  AL_DFF decoder_trigger_reg (
    .clk(clk),
    .d(n727),
    .reset(1'b0),
    .set(1'b0),
    .q(decoder_trigger));  // ../src/picorv32.v(1906)
  eq_w3 eq0 (
    .i0(mem_rdata_latched[15:13]),
    .i1(3'b000),
    .o(n96));  // ../src/picorv32.v(404)
  eq_w3 eq1 (
    .i0(mem_rdata_latched[15:13]),
    .i1(3'b010),
    .o(n97));  // ../src/picorv32.v(408)
  eq_w2 eq10 (
    .i0(mem_rdata_latched[6:5]),
    .i1(2'b10),
    .o(n65));  // ../src/picorv32.v(453)
  eq_w2 eq11 (
    .i0(mem_rdata_latched[6:5]),
    .i1(2'b11),
    .o(n67));  // ../src/picorv32.v(454)
  eq_w1 eq12 (
    .i0(mem_rdata_latched[12]),
    .i1(1'b0),
    .o(n72));  // ../src/picorv32.v(483)
  eq_w5 eq13 (
    .i0(mem_rdata_latched[6:2]),
    .i1(5'b00000),
    .o(n73));  // ../src/picorv32.v(483)
  eq_w3 eq14 (
    .i0(mem_rdata_latched[15:13]),
    .i1(3'b100),
    .o(n98));  // ../src/picorv32.v(482)
  eq_w7 eq15 (
    .i0(mem_rdata_latched[6:0]),
    .i1(7'b0110111),
    .o(n171));  // ../src/picorv32.v(829)
  eq_w7 eq16 (
    .i0(mem_rdata_latched[6:0]),
    .i1(7'b0010111),
    .o(n172));  // ../src/picorv32.v(830)
  eq_w7 eq17 (
    .i0(mem_rdata_latched[6:0]),
    .i1(7'b1101111),
    .o(n173));  // ../src/picorv32.v(831)
  eq_w7 eq18 (
    .i0(mem_rdata_latched[6:0]),
    .i1(7'b1100111),
    .o(n174));  // ../src/picorv32.v(832)
  eq_w7 eq19 (
    .i0(mem_rdata_latched[6:0]),
    .i1(7'b1100011),
    .o(n175));  // ../src/picorv32.v(836)
  eq_w3 eq2 (
    .i0(mem_rdata_latched[15:13]),
    .i1(3'b110),
    .o(n99));  // ../src/picorv32.v(412)
  eq_w7 eq20 (
    .i0(mem_rdata_latched[6:0]),
    .i1(7'b0000011),
    .o(n176));  // ../src/picorv32.v(837)
  eq_w7 eq21 (
    .i0(mem_rdata_latched[6:0]),
    .i1(7'b0100011),
    .o(n177));  // ../src/picorv32.v(838)
  eq_w7 eq22 (
    .i0(mem_rdata_latched[6:0]),
    .i1(7'b0010011),
    .o(n178));  // ../src/picorv32.v(839)
  eq_w7 eq23 (
    .i0(mem_rdata_latched[6:0]),
    .i1(7'b0110011),
    .o(n179));  // ../src/picorv32.v(840)
  eq_w3 eq24 (
    .i0(mem_rdata_q[14:12]),
    .i1(3'b000),
    .o(n275));  // ../src/picorv32.v(996)
  eq_w3 eq25 (
    .i0(mem_rdata_q[14:12]),
    .i1(3'b001),
    .o(n277));  // ../src/picorv32.v(997)
  eq_w3 eq26 (
    .i0(mem_rdata_q[14:12]),
    .i1(3'b100),
    .o(n279));  // ../src/picorv32.v(998)
  eq_w3 eq27 (
    .i0(mem_rdata_q[14:12]),
    .i1(3'b101),
    .o(n281));  // ../src/picorv32.v(999)
  eq_w3 eq28 (
    .i0(mem_rdata_q[14:12]),
    .i1(3'b110),
    .o(n283));  // ../src/picorv32.v(1000)
  eq_w3 eq29 (
    .i0(mem_rdata_q[14:12]),
    .i1(3'b111),
    .o(n285));  // ../src/picorv32.v(1001)
  eq_w5 eq3 (
    .i0(mem_rdata_latched[11:7]),
    .i1(5'b00010),
    .o(n193));  // ../src/picorv32.v(429)
  eq_w3 eq30 (
    .i0(mem_rdata_q[14:12]),
    .i1(3'b010),
    .o(n289));  // ../src/picorv32.v(1005)
  eq_w3 eq31 (
    .i0(mem_rdata_q[14:12]),
    .i1(3'b011),
    .o(n298));  // ../src/picorv32.v(1015)
  eq_w7 eq32 (
    .i0(mem_rdata_q[31:25]),
    .i1(7'b0000000),
    .o(n304));  // ../src/picorv32.v(1020)
  eq_w7 eq33 (
    .i0(mem_rdata_q[31:25]),
    .i1(7'b0100000),
    .o(n308));  // ../src/picorv32.v(1022)
  eq_w7 eq34 (
    .i0(mem_rdata_q[6:0]),
    .i1(7'b1110011),
    .o(n328));  // ../src/picorv32.v(1035)
  eq_w20 eq35 (
    .i0(mem_rdata_q[31:12]),
    .i1(20'b11000000000000000010),
    .o(n329));  // ../src/picorv32.v(1035)
  eq_w20 eq36 (
    .i0(mem_rdata_q[31:12]),
    .i1(20'b11000000000100000010),
    .o(n331));  // ../src/picorv32.v(1036)
  eq_w20 eq37 (
    .i0(mem_rdata_q[31:12]),
    .i1(20'b11001000000000000010),
    .o(n334));  // ../src/picorv32.v(1037)
  eq_w20 eq38 (
    .i0(mem_rdata_q[31:12]),
    .i1(20'b11001000000100000010),
    .o(n336));  // ../src/picorv32.v(1038)
  eq_w20 eq39 (
    .i0(mem_rdata_q[31:12]),
    .i1(20'b11000000001000000010),
    .o(n339));  // ../src/picorv32.v(1039)
  eq_w2 eq4 (
    .i0(mem_rdata_latched[11:10]),
    .i1(2'b00),
    .o(n54));  // ../src/picorv32.v(438)
  eq_w20 eq40 (
    .i0(mem_rdata_q[31:12]),
    .i1(20'b11001000001000000010),
    .o(n341));  // ../src/picorv32.v(1040)
  eq_w32 eq41 (
    .i0(reg_op1),
    .i1(reg_op2),
    .o(alu_eq));  // ../src/picorv32.v(1194)
  eq_w8 eq42 (
    .i0(cpu_state),
    .i1(8'b01000000),
    .o(n663));  // ../src/picorv32.v(1266)
  eq_w5 eq43 (
    .i0(reg_sh),
    .i1(5'b00000),
    .o(n553));  // ../src/picorv32.v(1769)
  eq_w8 eq44 (
    .i0(cpu_state),
    .i1(8'b10000000),
    .o(n662));  // ../src/picorv32.v(1425)
  eq_w8 eq45 (
    .i0(cpu_state),
    .i1(8'b00100000),
    .o(n664));  // ../src/picorv32.v(1517)
  eq_w8 eq46 (
    .i0(cpu_state),
    .i1(8'b00010000),
    .o(n665));  // ../src/picorv32.v(1697)
  eq_w8 eq47 (
    .i0(cpu_state),
    .i1(8'b00001000),
    .o(n666));  // ../src/picorv32.v(1743)
  eq_w8 eq48 (
    .i0(cpu_state),
    .i1(8'b00000100),
    .o(n667));  // ../src/picorv32.v(1767)
  eq_w8 eq49 (
    .i0(cpu_state),
    .i1(8'b00000010),
    .o(n668));  // ../src/picorv32.v(1792)
  eq_w2 eq5 (
    .i0(mem_rdata_latched[11:10]),
    .i1(2'b01),
    .o(n56));  // ../src/picorv32.v(442)
  eq_w8 eq50 (
    .i0(cpu_state),
    .i1(8'b00000001),
    .o(n669));  // ../src/picorv32.v(1818)
  eq_w2 eq51 (
    .i0(mem_wordsize),
    .i1(2'b00),
    .o(n734));  // ../src/picorv32.v(1854)
  eq_w2 eq52 (
    .i0(mem_wordsize),
    .i1(2'b01),
    .o(n738));  // ../src/picorv32.v(1861)
  eq_w2 eq6 (
    .i0(mem_rdata_latched[11:10]),
    .i1(2'b10),
    .o(n58));  // ../src/picorv32.v(446)
  eq_w3 eq7 (
    .i0(mem_rdata_latched[12:10]),
    .i1(3'b011),
    .o(n203));  // ../src/picorv32.v(450)
  eq_w2 eq8 (
    .i0(mem_rdata_latched[6:5]),
    .i1(2'b00),
    .o(n61));  // ../src/picorv32.v(451)
  eq_w2 eq9 (
    .i0(mem_rdata_latched[6:5]),
    .i1(2'b01),
    .o(n63));  // ../src/picorv32.v(452)
  AL_DFF instr_add_reg (
    .clk(clk),
    .d(n422),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_add));  // ../src/picorv32.v(1120)
  AL_DFF instr_addi_reg (
    .clk(clk),
    .d(n416),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_addi));  // ../src/picorv32.v(1120)
  AL_DFF instr_and_reg (
    .clk(clk),
    .d(n431),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_and));  // ../src/picorv32.v(1120)
  AL_DFF instr_andi_reg (
    .clk(clk),
    .d(n421),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_andi));  // ../src/picorv32.v(1120)
  AL_DFF instr_auipc_reg (
    .clk(clk),
    .d(n258),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_auipc));  // ../src/picorv32.v(1120)
  AL_DFF instr_beq_reg (
    .clk(clk),
    .d(n410),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_beq));  // ../src/picorv32.v(1120)
  AL_DFF instr_bge_reg (
    .clk(clk),
    .d(n413),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_bge));  // ../src/picorv32.v(1120)
  AL_DFF instr_bgeu_reg (
    .clk(clk),
    .d(n415),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_bgeu));  // ../src/picorv32.v(1120)
  AL_DFF instr_blt_reg (
    .clk(clk),
    .d(n412),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_blt));  // ../src/picorv32.v(1120)
  AL_DFF instr_bltu_reg (
    .clk(clk),
    .d(n414),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_bltu));  // ../src/picorv32.v(1120)
  AL_DFF instr_bne_reg (
    .clk(clk),
    .d(n411),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_bne));  // ../src/picorv32.v(1120)
  AL_DFF instr_getq_reg (
    .clk(clk),
    .d(n397),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_getq));  // ../src/picorv32.v(1120)
  AL_DFF instr_jal_reg (
    .clk(clk),
    .d(n259),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_jal));  // ../src/picorv32.v(1120)
  AL_DFF instr_jalr_reg (
    .clk(clk),
    .d(n260),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_jalr));  // ../src/picorv32.v(1120)
  AL_DFF instr_lb_reg (
    .clk(clk),
    .d(n366),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_lb));  // ../src/picorv32.v(1120)
  AL_DFF instr_lbu_reg (
    .clk(clk),
    .d(n369),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_lbu));  // ../src/picorv32.v(1120)
  AL_DFF instr_lh_reg (
    .clk(clk),
    .d(n367),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_lh));  // ../src/picorv32.v(1120)
  AL_DFF instr_lhu_reg (
    .clk(clk),
    .d(n370),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_lhu));  // ../src/picorv32.v(1120)
  AL_DFF instr_lui_reg (
    .clk(clk),
    .d(n257),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_lui));  // ../src/picorv32.v(1120)
  AL_DFF instr_lw_reg (
    .clk(clk),
    .d(n368),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_lw));  // ../src/picorv32.v(1120)
  AL_DFF instr_maskirq_reg (
    .clk(clk),
    .d(n399),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_maskirq));  // ../src/picorv32.v(1120)
  AL_DFF instr_or_reg (
    .clk(clk),
    .d(n430),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_or));  // ../src/picorv32.v(1120)
  AL_DFF instr_ori_reg (
    .clk(clk),
    .d(n420),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_ori));  // ../src/picorv32.v(1120)
  AL_DFF instr_rdcycle_reg (
    .clk(clk),
    .d(n393),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_rdcycle));  // ../src/picorv32.v(1120)
  AL_DFF instr_rdcycleh_reg (
    .clk(clk),
    .d(n394),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_rdcycleh));  // ../src/picorv32.v(1120)
  AL_DFF instr_rdinstr_reg (
    .clk(clk),
    .d(n395),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_rdinstr));  // ../src/picorv32.v(1120)
  AL_DFF instr_rdinstrh_reg (
    .clk(clk),
    .d(n396),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_rdinstrh));  // ../src/picorv32.v(1120)
  AL_DFF instr_retirq_reg (
    .clk(clk),
    .d(n261),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_retirq));  // ../src/picorv32.v(1120)
  AL_DFF instr_sb_reg (
    .clk(clk),
    .d(n371),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_sb));  // ../src/picorv32.v(1120)
  AL_DFF instr_setq_reg (
    .clk(clk),
    .d(n398),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_setq));  // ../src/picorv32.v(1120)
  AL_DFF instr_sh_reg (
    .clk(clk),
    .d(n372),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_sh));  // ../src/picorv32.v(1120)
  AL_DFF instr_sll_reg (
    .clk(clk),
    .d(n424),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_sll));  // ../src/picorv32.v(1120)
  AL_DFF instr_slli_reg (
    .clk(clk),
    .d(n380),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_slli));  // ../src/picorv32.v(1120)
  AL_DFF instr_slt_reg (
    .clk(clk),
    .d(n425),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_slt));  // ../src/picorv32.v(1120)
  AL_DFF instr_slti_reg (
    .clk(clk),
    .d(n417),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_slti));  // ../src/picorv32.v(1120)
  AL_DFF instr_sltiu_reg (
    .clk(clk),
    .d(n418),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_sltiu));  // ../src/picorv32.v(1120)
  AL_DFF instr_sltu_reg (
    .clk(clk),
    .d(n426),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_sltu));  // ../src/picorv32.v(1120)
  AL_DFF instr_sra_reg (
    .clk(clk),
    .d(n429),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_sra));  // ../src/picorv32.v(1120)
  AL_DFF instr_srai_reg (
    .clk(clk),
    .d(n382),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_srai));  // ../src/picorv32.v(1120)
  AL_DFF instr_srl_reg (
    .clk(clk),
    .d(n428),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_srl));  // ../src/picorv32.v(1120)
  AL_DFF instr_srli_reg (
    .clk(clk),
    .d(n381),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_srli));  // ../src/picorv32.v(1120)
  AL_DFF instr_sub_reg (
    .clk(clk),
    .d(n423),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_sub));  // ../src/picorv32.v(1120)
  AL_DFF instr_sw_reg (
    .clk(clk),
    .d(n373),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_sw));  // ../src/picorv32.v(1120)
  AL_DFF instr_timer_reg (
    .clk(clk),
    .d(n400),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_timer));  // ../src/picorv32.v(1120)
  AL_DFF instr_waitirq_reg (
    .clk(clk),
    .d(n262),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_waitirq));  // ../src/picorv32.v(1120)
  AL_DFF instr_xor_reg (
    .clk(clk),
    .d(n427),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_xor));  // ../src/picorv32.v(1120)
  AL_DFF instr_xori_reg (
    .clk(clk),
    .d(n419),
    .reset(1'b0),
    .set(1'b0),
    .q(instr_xori));  // ../src/picorv32.v(1120)
  AL_DFF is_alu_reg_imm_reg (
    .clk(clk),
    .d(n266),
    .reset(1'b0),
    .set(1'b0),
    .q(is_alu_reg_imm));  // ../src/picorv32.v(1120)
  AL_DFF is_alu_reg_reg_reg (
    .clk(clk),
    .d(n267),
    .reset(1'b0),
    .set(1'b0),
    .q(is_alu_reg_reg));  // ../src/picorv32.v(1120)
  AL_DFF is_beq_bne_blt_bge_bltu_bgeu_reg (
    .clk(clk),
    .d(n408),
    .reset(1'b0),
    .set(1'b0),
    .q(is_beq_bne_blt_bge_bltu_bgeu));  // ../src/picorv32.v(1120)
  AL_DFF is_compare_reg (
    .clk(clk),
    .d(n409),
    .reset(1'b0),
    .set(1'b0),
    .q(is_compare));  // ../src/picorv32.v(1120)
  AL_DFF is_jalr_addi_slti_sltiu_xori_ori_andi_reg (
    .clk(clk),
    .d(n402),
    .reset(1'b0),
    .set(1'b0),
    .q(is_jalr_addi_slti_sltiu_xori_ori_andi));  // ../src/picorv32.v(1120)
  AL_DFF is_lb_lh_lw_lbu_lhu_reg (
    .clk(clk),
    .d(n264),
    .reset(1'b0),
    .set(1'b0),
    .q(is_lb_lh_lw_lbu_lhu));  // ../src/picorv32.v(1120)
  AL_DFF is_lbu_lhu_lw_reg (
    .clk(clk),
    .d(n168),
    .reset(1'b0),
    .set(1'b0),
    .q(is_lbu_lhu_lw));  // ../src/picorv32.v(1120)
  AL_DFF is_lui_auipc_jal_jalr_addi_add_sub_reg (
    .clk(clk),
    .d(n404),
    .reset(1'b0),
    .set(1'b0),
    .q(is_lui_auipc_jal_jalr_addi_add_sub));  // ../src/picorv32.v(1120)
  AL_DFF is_lui_auipc_jal_reg (
    .clk(clk),
    .d(n164),
    .reset(1'b0),
    .set(1'b0),
    .q(is_lui_auipc_jal));  // ../src/picorv32.v(1120)
  AL_DFF is_sb_sh_sw_reg (
    .clk(clk),
    .d(n265),
    .reset(1'b0),
    .set(1'b0),
    .q(is_sb_sh_sw));  // ../src/picorv32.v(1120)
  AL_DFF is_sll_srl_sra_reg (
    .clk(clk),
    .d(n403),
    .reset(1'b0),
    .set(1'b0),
    .q(is_sll_srl_sra));  // ../src/picorv32.v(1120)
  AL_DFF is_slli_srli_srai_reg (
    .clk(clk),
    .d(n401),
    .reset(1'b0),
    .set(1'b0),
    .q(is_slli_srli_srai));  // ../src/picorv32.v(1120)
  AL_DFF is_slti_blt_slt_reg (
    .clk(clk),
    .d(n166),
    .reset(1'b0),
    .set(1'b0),
    .q(is_slti_blt_slt));  // ../src/picorv32.v(1120)
  AL_DFF is_sltiu_bltu_sltu_reg (
    .clk(clk),
    .d(n167),
    .reset(1'b0),
    .set(1'b0),
    .q(is_sltiu_bltu_sltu));  // ../src/picorv32.v(1120)
  AL_DFF last_mem_valid_reg (
    .clk(clk),
    .d(n36),
    .reset(1'b0),
    .set(1'b0),
    .q(last_mem_valid));  // ../src/picorv32.v(363)
  AL_DFF latched_branch_reg (
    .clk(clk),
    .d(n709),
    .reset(1'b0),
    .set(1'b0),
    .q(latched_branch));  // ../src/picorv32.v(1906)
  AL_DFF latched_compr_reg (
    .clk(clk),
    .d(n721),
    .reset(1'b0),
    .set(1'b0),
    .q(latched_compr));  // ../src/picorv32.v(1906)
  AL_DFF latched_is_lb_reg (
    .clk(clk),
    .d(n712),
    .reset(1'b0),
    .set(1'b0),
    .q(latched_is_lb));  // ../src/picorv32.v(1906)
  AL_DFF latched_is_lh_reg (
    .clk(clk),
    .d(n711),
    .reset(1'b0),
    .set(1'b0),
    .q(latched_is_lh));  // ../src/picorv32.v(1906)
  AL_DFF latched_is_lu_reg (
    .clk(clk),
    .d(n710),
    .reset(1'b0),
    .set(1'b0),
    .q(latched_is_lu));  // ../src/picorv32.v(1906)
  AL_DFF latched_stalu_reg (
    .clk(clk),
    .d(n708),
    .reset(1'b0),
    .set(1'b0),
    .q(latched_stalu));  // ../src/picorv32.v(1906)
  AL_DFF latched_store_reg (
    .clk(clk),
    .d(n707),
    .reset(1'b0),
    .set(1'b0),
    .q(latched_store));  // ../src/picorv32.v(1906)
  lt_u32_u32 lt0 (
    .ci(1'b0),
    .i0({reg_op2[31],reg_op1[30:0]}),
    .i1({reg_op1[31],reg_op2[30:0]}),
    .o(alu_lts));  // ../src/picorv32.v(1195)
  lt_u32_u32 lt1 (
    .ci(1'b0),
    .i0(reg_op1),
    .i1(reg_op2),
    .o(alu_ltu));  // ../src/picorv32.v(1196)
  lt_u5_u5 lt2 (
    .ci(1'b1),
    .i0(5'b00100),
    .i1(reg_sh),
    .o(n554));  // ../src/picorv32.v(1773)
  AL_DFF mem_do_prefetch_reg (
    .clk(clk),
    .d(n748),
    .reset(1'b0),
    .set(1'b0),
    .q(mem_do_prefetch));  // ../src/picorv32.v(1906)
  AL_DFF mem_do_rdata_reg (
    .clk(clk),
    .d(n753),
    .reset(1'b0),
    .set(1'b0),
    .q(mem_do_rdata));  // ../src/picorv32.v(1906)
  AL_DFF mem_do_rinst_reg (
    .clk(clk),
    .d(n752),
    .reset(1'b0),
    .set(1'b0),
    .q(mem_do_rinst));  // ../src/picorv32.v(1906)
  AL_DFF mem_do_wdata_reg (
    .clk(clk),
    .d(n754),
    .reset(1'b0),
    .set(1'b0),
    .q(mem_do_wdata));  // ../src/picorv32.v(1906)
  AL_DFF mem_instr_reg (
    .clk(clk),
    .d(n162),
    .reset(1'b0),
    .set(1'b0),
    .q(mem_instr));  // ../src/picorv32.v(605)
  AL_DFF mem_la_firstword_reg_reg (
    .clk(clk),
    .d(n35),
    .reset(1'b0),
    .set(1'b0),
    .q(mem_la_firstword_reg));  // ../src/picorv32.v(363)
  AL_DFF mem_la_secondword_reg (
    .clk(clk),
    .d(n156),
    .reset(1'b0),
    .set(1'b0),
    .q(mem_la_secondword));  // ../src/picorv32.v(605)
  AL_DFF mem_valid_reg (
    .clk(clk),
    .d(n155),
    .reset(1'b0),
    .set(1'b0),
    .q(mem_valid));  // ../src/picorv32.v(605)
  binary_mux_s1_w32 mux0 (
    .i0({reg_op1[31:2],2'b00}),
    .i1({n30,2'b00}),
    .sel(n0),
    .o(mem_la_addr));  // ../src/picorv32.v(346)
  binary_mux_s1_w32 mux1 (
    .i0(mem_rdata_q),
    .i1(mem_rdata),
    .sel(mem_xfer),
    .o(mem_rdata_latched_noshuffle));  // ../src/picorv32.v(348)
  binary_mux_s1_w32 mux10 (
    .i0(mem_rdata_q),
    .i1(mem_rdata_latched),
    .sel(mem_xfer),
    .o(n42));  // ../src/picorv32.v(398)
  binary_mux_s2_w1 mux100 (
    .i0(n174),
    .i1(n174),
    .i2(n232),
    .i3(n174),
    .sel(mem_rdata_latched[1:0]),
    .o(n239));  // ../src/picorv32.v(989)
  binary_mux_s2_w1 mux101 (
    .i0(n179),
    .i1(n213),
    .i2(n233),
    .i3(n179),
    .sel(mem_rdata_latched[1:0]),
    .o(n240));  // ../src/picorv32.v(989)
  binary_mux_s2_w1 mux102 (
    .i0(n191),
    .i1(n177),
    .i2(n191),
    .i3(n177),
    .sel(mem_rdata_latched[1:0]),
    .o(n241));  // ../src/picorv32.v(989)
  binary_mux_s2_w1 mux103 (
    .i0(n175),
    .i1(n207),
    .i2(n175),
    .i3(n175),
    .sel(mem_rdata_latched[1:0]),
    .o(n242));  // ../src/picorv32.v(989)
  binary_mux_s2_w1 mux104 (
    .i0(n173),
    .i1(n210),
    .i2(n173),
    .i3(n173),
    .sel(mem_rdata_latched[1:0]),
    .o(n243));  // ../src/picorv32.v(989)
  binary_mux_s2_w1 mux105 (
    .i0(n171),
    .i1(n214),
    .i2(n171),
    .i3(n171),
    .sel(mem_rdata_latched[1:0]),
    .o(n244));  // ../src/picorv32.v(989)
  binary_mux_s1_w5 mux106 (
    .i0(mem_rdata_latched[11:7]),
    .i1(n235),
    .sel(n180),
    .o(n245));  // ../src/picorv32.v(990)
  binary_mux_s1_w5 mux107 (
    .i0(mem_rdata_latched[19:15]),
    .i1(n236),
    .sel(n180),
    .o(n246));  // ../src/picorv32.v(990)
  binary_mux_s1_w5 mux108 (
    .i0(mem_rdata_latched[24:20]),
    .i1(n237),
    .sel(n180),
    .o(n247));  // ../src/picorv32.v(990)
  binary_mux_s1_w32 mux109 (
    .i0(decoded_imm_uj),
    .i1({n248[29:11],mem_rdata_latched[12],n248[10:0],1'b0}),
    .sel(n170),
    .o(n268));  // ../src/picorv32.v(991)
  binary_mux_s1_w3 mux11 (
    .i0(3'b000),
    .i1(mem_rdata_latched[4:2]),
    .sel(n188),
    .o(n189));  // ../src/picorv32.v(882)
  binary_mux_s1_w5 mux110 (
    .i0(decoded_rd),
    .i1(n245),
    .sel(n170),
    .o(n269));  // ../src/picorv32.v(991)
  binary_mux_s1_w5 mux111 (
    .i0(decoded_rs1),
    .i1(n246),
    .sel(n170),
    .o(n270));  // ../src/picorv32.v(991)
  binary_mux_s1_w5 mux112 (
    .i0(decoded_rs2),
    .i1(n247),
    .sel(n170),
    .o(n271));  // ../src/picorv32.v(991)
  binary_mux_s1_w32 mux113 (
    .i0(pcpi_insn),
    .i1(32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx),
    .sel(n274),
    .o(n359));  // ../src/picorv32.v(1089)
  binary_mux_s1_w32 mux114 (
    .i0(decoded_imm),
    .i1(n358),
    .sel(n274),
    .o(n406));  // ../src/picorv32.v(1089)
  binary_mux_s1_w32 mux115 (
    .i0(reg_next_pc),
    .i1(reg_out),
    .sel(n432),
    .o({next_pc[31:1],open_n0}));  // ../src/picorv32.v(1166)
  binary_mux_s1_w32 mux116 (
    .i0(n434),
    .i1(n433),
    .sel(instr_sub),
    .o(alu_add_sub));  // ../src/picorv32.v(1193)
  binary_mux_s1_w32 mux117 (
    .i0(reg_out),
    .i1(alu_out_q),
    .sel(latched_stalu),
    .o(n453));  // ../src/picorv32.v(1274)
  binary_mux_s1_w32 mux118 (
    .i0(32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx),
    .i1(n455),
    .sel(n663),
    .o(cpuregs_wrdata));  // ../src/picorv32.v(1286)
  binary_mux_s1_w32 mux119 (
    .i0(32'b00000000000000000000000000000000),
    .i1(cpuregs_rs1_z),
    .sel(n457),
    .o(cpuregs_rs1));  // ../src/picorv32.v(1328)
  binary_mux_s2_w5 mux12 (
    .i0(n42[11:7]),
    .i1(n42[11:7]),
    .i2(n42[11:7]),
    .i3({mem_rdata_latched[11:10],mem_rdata_latched[4:3],mem_rdata_latched[12]}),
    .sel(mem_rdata_latched[15:14]),
    .o(n71));  // ../src/picorv32.v(470)
  binary_mux_s1_w32 mux120 (
    .i0(32'b00000000000000000000000000000000),
    .i1(cpuregs_rs2_z),
    .sel(n458),
    .o(cpuregs_rs2));  // ../src/picorv32.v(1329)
  binary_mux_s1_w64 mux121 (
    .i0(64'b0000000000000000000000000000000000000000000000000000000000000000),
    .i1(n459),
    .sel(resetn),
    .o(n460));  // ../src/picorv32.v(1365)
  binary_mux_s1_w32 mux122 (
    .i0(reg_next_pc),
    .i1(n453),
    .sel(latched_store),
    .o(n496));  // ../src/picorv32.v(1438)
  binary_mux_s1_w32 mux123 (
    .i0(n502),
    .i1(n504),
    .sel(instr_jal),
    .o(n508));  // ../src/picorv32.v(1513)
  binary_mux_s1_w8 mux124 (
    .i0(8'b00100000),
    .i1(cpu_state),
    .sel(instr_jal),
    .o(n510));  // ../src/picorv32.v(1513)
  binary_mux_s1_w32 mux125 (
    .i0(n500),
    .i1(n508),
    .sel(decoder_trigger),
    .o(n511));  // ../src/picorv32.v(1514)
  binary_mux_s1_w64 mux126 (
    .i0(count_instr),
    .i1(n503),
    .sel(decoder_trigger),
    .o(n512));  // ../src/picorv32.v(1514)
  binary_mux_s1_w8 mux127 (
    .i0(cpu_state),
    .i1(n510),
    .sel(decoder_trigger),
    .o(n516));  // ../src/picorv32.v(1514)
  binary_mux_s1_w32 mux128 (
    .i0(reg_pc),
    .i1(32'b00000000000000000000000000000000),
    .sel(instr_lui),
    .o(n518));  // ../src/picorv32.v(1580)
  binary_mux_s1_w8 mux129 (
    .i0(cpu_state),
    .i1(8'b01000000),
    .sel(mem_done),
    .o(n544));  // ../src/picorv32.v(1754)
  binary_mux_s1_w3 mux13 (
    .i0(n66),
    .i1(3'b111),
    .sel(n67),
    .o(n68));  // ../src/picorv32.v(454)
  binary_mux_s1_w5 mux130 (
    .i0(latched_rd),
    .i1(5'b00000),
    .sel(is_beq_bne_blt_bge_bltu_bgeu),
    .o(n546));  // ../src/picorv32.v(1764)
  binary_mux_s1_w8 mux131 (
    .i0(8'b01000000),
    .i1(n544),
    .sel(is_beq_bne_blt_bge_bltu_bgeu),
    .o(n549));  // ../src/picorv32.v(1764)
  binary_mux_s1_w64 mux132 (
    .i0({reg_op1,reg_op1}),
    .i1({n578,n638}),
    .sel(n597),
    .o({n584,n656}));  // ../src/picorv32.v(1815)
  binary_mux_s1_w32 mux133 (
    .i0(n563),
    .i1(n558),
    .sel(n554),
    .o(n565));  // ../src/picorv32.v(1789)
  binary_mux_s1_w5 mux134 (
    .i0(n564[4:0]),
    .i1(n559[4:0]),
    .sel(n554),
    .o(n566));  // ../src/picorv32.v(1789)
  binary_mux_s1_w32 mux135 (
    .i0(32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx),
    .i1(reg_op1),
    .sel(n553),
    .o(n567));  // ../src/picorv32.v(1789)
  binary_mux_s1_w8 mux136 (
    .i0(cpu_state),
    .i1(8'b01000000),
    .sel(n553),
    .o(n569));  // ../src/picorv32.v(1789)
  binary_mux_s1_w32 mux137 (
    .i0(n565),
    .i1(reg_op1),
    .sel(n553),
    .o(n570));  // ../src/picorv32.v(1789)
  binary_mux_s1_w5 mux138 (
    .i0(n566),
    .i1(5'bxxxxx),
    .sel(n553),
    .o(n571));  // ../src/picorv32.v(1789)
  binary_mux_s1_w2 mux139 (
    .i0(mem_wordsize),
    .i1(n575),
    .sel(n574),
    .o(n577));  // ../src/picorv32.v(1809)
  binary_mux_s1_w10 mux14 (
    .i0({n42[31:25],n42[14:12]}),
    .i1(10'b0000000101),
    .sel(n54),
    .o(n55));  // ../src/picorv32.v(441)
  binary_mux_s1_w32 mux140 (
    .i0(reg_op1),
    .i1(n576),
    .sel(n574),
    .o(n578));  // ../src/picorv32.v(1809)
  binary_mux_s1_w8 mux141 (
    .i0(cpu_state),
    .i1(8'b01000000),
    .sel(n580),
    .o(n581));  // ../src/picorv32.v(1814)
  binary_mux_s1_w10 mux142 (
    .i0({n42[11:7],n42[11:7]}),
    .i1({mem_rdata_latched[11:9],2'b00,mem_rdata_latched[11:10],mem_rdata_latched[6],2'b00}),
    .sel(n99),
    .o({n108,n52}));  // ../src/picorv32.v(504)
  binary_mux_s1_w4 mux143 (
    .i0({mem_wordsize,mem_wordsize}),
    .i1({n577,n634}),
    .sel(n597),
    .o({n583,n652}));  // ../src/picorv32.v(1815)
  binary_mux_s1_w2 mux144 (
    .i0(mem_wordsize),
    .i1(n601),
    .sel(n598),
    .o(n634));  // ../src/picorv32.v(1837)
  binary_mux_s1_w32 mux145 (
    .i0(reg_op1),
    .i1(n576),
    .sel(n598),
    .o(n638));  // ../src/picorv32.v(1837)
  binary_mux_s1_w32 mux146 (
    .i0(32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx),
    .i1(n641),
    .sel(n580),
    .o(n642));  // ../src/picorv32.v(1848)
  binary_mux_s1_w32 mux147 (
    .i0(32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx),
    .i1(n642),
    .sel(n597),
    .o(n658));  // ../src/picorv32.v(1849)
  binary_mux_s1_w8 mux148 (
    .i0(cpu_state),
    .i1(n581),
    .sel(n597),
    .o(n661));  // ../src/picorv32.v(1849)
  binary_mux_s1_w32 mux149 (
    .i0(n673),
    .i1(32'b00000000000000000000000000000100),
    .sel(n407),
    .o(n704));  // ../src/picorv32.v(1851)
  binary_mux_s1_w10 mux15 (
    .i0(n55),
    .i1(10'b0100000101),
    .sel(n56),
    .o(n57));  // ../src/picorv32.v(445)
  binary_mux_s1_w32 mux150 (
    .i0(n674),
    .i1(32'b00000000000000000000000000000100),
    .sel(n407),
    .o(n705));  // ../src/picorv32.v(1851)
  binary_mux_s1_w64 mux151 (
    .i0(n690),
    .i1(64'b0000000000000000000000000000000000000000000000000000000000000000),
    .sel(n407),
    .o(n706));  // ../src/picorv32.v(1851)
  binary_mux_s1_w2 mux152 (
    .i0(irq_state),
    .i1(2'b00),
    .sel(n407),
    .o(n714));  // ../src/picorv32.v(1851)
  binary_mux_s1_w32 mux153 (
    .i0(eoi),
    .i1(32'b00000000000000000000000000000000),
    .sel(n407),
    .o(n715));  // ../src/picorv32.v(1851)
  binary_mux_s1_w8 mux154 (
    .i0(n692),
    .i1(8'b01000000),
    .sel(n407),
    .o(n716));  // ../src/picorv32.v(1851)
  binary_mux_s1_w2 mux155 (
    .i0(n672),
    .i1(mem_wordsize),
    .sel(n407),
    .o(n719));  // ../src/picorv32.v(1851)
  binary_mux_s1_w5 mux156 (
    .i0(n688),
    .i1(latched_rd),
    .sel(n407),
    .o(n720));  // ../src/picorv32.v(1851)
  binary_mux_s1_w32 mux157 (
    .i0(n693),
    .i1(reg_op1),
    .sel(n407),
    .o(n723));  // ../src/picorv32.v(1851)
  binary_mux_s1_w32 mux158 (
    .i0(n694),
    .i1(reg_op2),
    .sel(n407),
    .o(n724));  // ../src/picorv32.v(1851)
  binary_mux_s1_w32 mux159 (
    .i0(n695),
    .i1(32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx),
    .sel(n407),
    .o(n725));  // ../src/picorv32.v(1851)
  binary_mux_s1_w17 mux16 (
    .i0({mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[6:2]}),
    .i1({mem_rdata_latched[4:3],mem_rdata_latched[5],mem_rdata_latched[2],mem_rdata_latched[6],4'b0000,n42[19:15],3'b000}),
    .sel(n193),
    .o(n53));  // ../src/picorv32.v(435)
  binary_mux_s1_w5 mux160 (
    .i0(n696),
    .i1(5'bxxxxx),
    .sel(n407),
    .o(n726));  // ../src/picorv32.v(1851)
  binary_mux_s1_w8 mux161 (
    .i0(n716),
    .i1(8'b10000000),
    .sel(n736),
    .o(n737));  // ../src/picorv32.v(1860)
  binary_mux_s1_w8 mux162 (
    .i0(n737),
    .i1(8'b10000000),
    .sel(n740),
    .o(n741));  // ../src/picorv32.v(1867)
  binary_mux_s1_w8 mux163 (
    .i0(n716),
    .i1(n741),
    .sel(n733),
    .o(n742));  // ../src/picorv32.v(1868)
  binary_mux_s1_w8 mux164 (
    .i0(n742),
    .i1(8'b10000000),
    .sel(n744),
    .o(n745));  // ../src/picorv32.v(1875)
  binary_mux_s2_w16 mux165 (
    .i0(reg_op2[31:16]),
    .i1(reg_op2[15:0]),
    .i2({reg_op2[7:0],reg_op2[7:0]}),
    .i3(16'bxxxxxxxxxxxxxxxx),
    .sel(mem_wordsize),
    .o(mem_la_wdata[31:16]));  // ../src/picorv32.v(391)
  binary_mux_s1_w5 mux17 (
    .i0(n42[24:20]),
    .i1(mem_rdata_latched[6:2]),
    .sel(n58),
    .o(n60));  // ../src/picorv32.v(449)
  binary_mux_s1_w3 mux18 (
    .i0(n59[2:0]),
    .i1(3'b000),
    .sel(n61),
    .o(n62));  // ../src/picorv32.v(451)
  binary_mux_s1_w3 mux19 (
    .i0(n62),
    .i1(3'b100),
    .sel(n63),
    .o(n64));  // ../src/picorv32.v(452)
  binary_mux_s1_w32 mux2 (
    .i0(mem_rdata_latched_noshuffle),
    .i1({16'bxxxxxxxxxxxxxxxx,mem_rdata_latched_noshuffle[31:16]}),
    .sel(mem_la_firstword),
    .o(n31));  // ../src/picorv32.v(352)
  binary_mux_s1_w3 mux20 (
    .i0(n64),
    .i1(3'b110),
    .sel(n65),
    .o(n66));  // ../src/picorv32.v(453)
  binary_mux_s1_w10 mux21 (
    .i0(n57),
    .i1({mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],3'b111}),
    .sel(n58),
    .o(n59));  // ../src/picorv32.v(449)
  binary_mux_s1_w10 mux22 (
    .i0(n59),
    .i1({1'b0,n61,5'b00000,n68}),
    .sel(n203),
    .o(n69));  // ../src/picorv32.v(456)
  binary_mux_s1_w3 mux23 (
    .i0(3'b000),
    .i1(mem_rdata_latched[4:2]),
    .sel(n99),
    .o(n192));  // ../src/picorv32.v(882)
  binary_mux_s3_w20 mux24 (
    .i0({mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[6:2],n42[19:15],3'b000}),
    .i1(n42[31:12]),
    .i2({mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[6:2],n42[19:15],3'b000}),
    .i3({mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],n53}),
    .i4({n69[9:3],n60,n42[19:15],n69[2:0]}),
    .i5(n42[31:12]),
    .i6({mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[6:5],mem_rdata_latched[2],n42[24:15],3'b000}),
    .i7({mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[6:5],mem_rdata_latched[2],n42[24:15],3'b001}),
    .sel(mem_rdata_latched[15:13]),
    .o(n70));  // ../src/picorv32.v(470)
  binary_mux_s1_w5 mux25 (
    .i0({n42[31:28],n42[14]}),
    .i1(5'b00000),
    .sel(n74),
    .o(n75));  // ../src/picorv32.v(486)
  binary_mux_s1_w2 mux26 (
    .i0(n42[27:26]),
    .i1(2'b00),
    .sel(n74),
    .o(n76));  // ../src/picorv32.v(486)
  binary_mux_s1_w3 mux27 (
    .i0({n42[25],n42[13:12]}),
    .i1(3'b000),
    .sel(n74),
    .o(n77));  // ../src/picorv32.v(486)
  binary_mux_s1_w5 mux28 (
    .i0(n75),
    .i1(5'b00000),
    .sel(n80),
    .o(n81));  // ../src/picorv32.v(490)
  binary_mux_s1_w2 mux29 (
    .i0(n76),
    .i1(2'b00),
    .sel(n80),
    .o(n82));  // ../src/picorv32.v(490)
  binary_mux_s1_w32 mux3 (
    .i0(n31),
    .i1({mem_rdata_latched_noshuffle[15:0],mem_16bit_buffer}),
    .sel(mem_la_secondword),
    .o(n32));  // ../src/picorv32.v(352)
  binary_mux_s1_w3 mux30 (
    .i0(n77),
    .i1(3'b000),
    .sel(n80),
    .o(n83));  // ../src/picorv32.v(490)
  binary_mux_s1_w5 mux31 (
    .i0(n42[24:20]),
    .i1(5'b00000),
    .sel(n74),
    .o(n78));  // ../src/picorv32.v(486)
  binary_mux_s1_w5 mux32 (
    .i0(n81),
    .i1(5'b00000),
    .sel(n87),
    .o(n88));  // ../src/picorv32.v(494)
  binary_mux_s1_w2 mux33 (
    .i0(n82),
    .i1(2'b00),
    .sel(n87),
    .o(n89));  // ../src/picorv32.v(494)
  binary_mux_s1_w3 mux34 (
    .i0(n83),
    .i1(3'b000),
    .sel(n87),
    .o(n90));  // ../src/picorv32.v(494)
  binary_mux_s1_w5 mux35 (
    .i0(n88),
    .i1(5'b00000),
    .sel(n92),
    .o(n93));  // ../src/picorv32.v(498)
  binary_mux_s1_w2 mux36 (
    .i0(n89),
    .i1(2'b00),
    .sel(n92),
    .o(n94));  // ../src/picorv32.v(498)
  binary_mux_s1_w3 mux37 (
    .i0(n90),
    .i1(3'b000),
    .sel(n92),
    .o(n95));  // ../src/picorv32.v(498)
  binary_mux_s1_w5 mux38 (
    .i0(n78),
    .i1(5'b00000),
    .sel(n87),
    .o(n91));  // ../src/picorv32.v(494)
  binary_mux_s1_w5 mux39 (
    .i0({2'b00,mem_rdata_latched[12],2'b00}),
    .i1({n42[31:30],n42[25],n42[14],n42[12]}),
    .sel(n44),
    .o(n45));  // ../src/picorv32.v(416)
  binary_mux_s1_w32 mux4 (
    .i0(n32),
    .i1({16'bxxxxxxxxxxxxxxxx,mem_16bit_buffer}),
    .sel(mem_la_use_prefetched_high_word),
    .o(mem_rdata_latched));  // ../src/picorv32.v(352)
  binary_mux_s1_w4 mux40 (
    .i0({n42[24],n42[22:20]}),
    .i1({mem_rdata_latched[11],mem_rdata_latched[6],2'b00}),
    .sel(n188),
    .o(n49));  // ../src/picorv32.v(416)
  binary_mux_s2_w25 mux41 (
    .i0({n45[4:3],n47[4:1],n45[2],n49[3],n51,n49[2:0],n42[19:15],n45[1],n47[0],n45[0],n52}),
    .i1({n70,n71}),
    .i2({n102[4:1],n103,n105[2],n107,n42[19:15],n102[0],n105[1:0],n108}),
    .i3(n42[31:7]),
    .sel(mem_rdata_latched[1:0]),
    .o(n109));  // ../src/picorv32.v(506)
  binary_mux_s1_w2 mux42 (
    .i0(2'b00),
    .i1(mem_state),
    .sel(resetn),
    .o(n112));  // ../src/picorv32.v(532)
  binary_mux_s1_w32 mux43 (
    .i0(mem_addr),
    .i1(mem_la_addr),
    .sel(n115),
    .o(n117));  // ../src/picorv32.v(541)
  binary_mux_s1_w4 mux44 (
    .i0(mem_wstrb),
    .i1(n116),
    .sel(n115),
    .o(n118));  // ../src/picorv32.v(541)
  binary_mux_s1_w32 mux45 (
    .i0(mem_wdata),
    .i1(mem_la_wdata),
    .sel(mem_la_write),
    .o(n119));  // ../src/picorv32.v(544)
  binary_mux_s1_w4 mux46 (
    .i0(n118),
    .i1(4'b0000),
    .sel(n120),
    .o(n123));  // ../src/picorv32.v(552)
  binary_mux_s1_w2 mux47 (
    .i0(mem_state),
    .i1(2'b01),
    .sel(n120),
    .o(n124));  // ../src/picorv32.v(552)
  binary_mux_s1_w2 mux48 (
    .i0(n124),
    .i1(2'b10),
    .sel(mem_do_wdata),
    .o(n127));  // ../src/picorv32.v(557)
  binary_mux_s1_w16 mux49 (
    .i0(mem_rdata[31:16]),
    .i1(mem_16bit_buffer),
    .sel(mem_la_use_prefetched_high_word),
    .o(n128));  // ../src/picorv32.v(569)
  binary_mux_s1_w32 mux5 (
    .i0({16'b0000000000000000,mem_rdata[15:0]}),
    .i1({16'b0000000000000000,mem_rdata[31:16]}),
    .sel(reg_op1[1]),
    .o(n39));  // ../src/picorv32.v(379)
  binary_mux_s1_w16 mux50 (
    .i0(mem_16bit_buffer),
    .i1(mem_rdata[31:16]),
    .sel(n131),
    .o(n132));  // ../src/picorv32.v(579)
  binary_mux_s1_w16 mux51 (
    .i0(mem_16bit_buffer),
    .i1(n132),
    .sel(n598),
    .o(n133));  // ../src/picorv32.v(580)
  binary_mux_s1_w16 mux52 (
    .i0(n133),
    .i1(n128),
    .sel(mem_la_read),
    .o(n136));  // ../src/picorv32.v(582)
  binary_mux_s1_w2 mux53 (
    .i0({n135[0],n135[0]}),
    .i1(mem_state),
    .sel(mem_la_read),
    .o(n138));  // ../src/picorv32.v(582)
  binary_mux_s1_w16 mux54 (
    .i0(mem_16bit_buffer),
    .i1(n136),
    .sel(mem_xfer),
    .o(n141));  // ../src/picorv32.v(583)
  binary_mux_s1_w25 mux55 (
    .i0(n42[31:7]),
    .i1(n109),
    .sel(n43),
    .o(n110));  // ../src/picorv32.v(507)
  binary_mux_s1_w2 mux56 (
    .i0(mem_state),
    .i1(2'b00),
    .sel(mem_do_rinst),
    .o(n146));  // ../src/picorv32.v(598)
  binary_mux_s2_w2 mux57 (
    .i0(n127),
    .i1(n143),
    .i2(n145),
    .i3(n146),
    .sel(mem_state),
    .o(n147));  // ../src/picorv32.v(600)
  binary_mux_s2_w1 mux58 (
    .i0(n125),
    .i1(n139),
    .i2(n144),
    .i3(mem_valid),
    .sel(mem_state),
    .o(n148));  // ../src/picorv32.v(600)
  binary_mux_s2_w1 mux59 (
    .i0(mem_la_secondword),
    .i1(n140),
    .i2(mem_la_secondword),
    .i3(mem_la_secondword),
    .sel(mem_state),
    .o(n149));  // ../src/picorv32.v(600)
  binary_mux_s2_w32 mux6 (
    .i0({24'b000000000000000000000000,mem_rdata[7:0]}),
    .i1({24'b000000000000000000000000,mem_rdata[15:8]}),
    .i2({24'b000000000000000000000000,mem_rdata[23:16]}),
    .i3({24'b000000000000000000000000,mem_rdata[31:24]}),
    .sel(reg_op1[1:0]),
    .o(n41));  // ../src/picorv32.v(389)
  binary_mux_s2_w16 mux60 (
    .i0(mem_16bit_buffer),
    .i1(n141),
    .i2(mem_16bit_buffer),
    .i3(mem_16bit_buffer),
    .sel(mem_state),
    .o(n150));  // ../src/picorv32.v(600)
  binary_mux_s2_w1 mux61 (
    .i0(prefetched_high_word),
    .i1(n142),
    .i2(prefetched_high_word),
    .i3(prefetched_high_word),
    .sel(mem_state),
    .o(n151));  // ../src/picorv32.v(600)
  binary_mux_s2_w1 mux62 (
    .i0(n126),
    .i1(mem_instr),
    .i2(mem_instr),
    .i3(mem_instr),
    .sel(mem_state),
    .o(n152));  // ../src/picorv32.v(600)
  binary_mux_s2_w4 mux63 (
    .i0(n123),
    .i1(n118),
    .i2(n118),
    .i3(n118),
    .sel(mem_state),
    .o(n153));  // ../src/picorv32.v(600)
  binary_mux_s1_w2 mux64 (
    .i0(n147),
    .i1(n112),
    .sel(n111),
    .o(n154));  // ../src/picorv32.v(601)
  binary_mux_s1_w32 mux65 (
    .i0(n117),
    .i1(mem_addr),
    .sel(n111),
    .o(n158));  // ../src/picorv32.v(601)
  binary_mux_s1_w4 mux66 (
    .i0(n153),
    .i1(mem_wstrb),
    .sel(n111),
    .o(n159));  // ../src/picorv32.v(601)
  binary_mux_s1_w32 mux67 (
    .i0(n119),
    .i1(mem_wdata),
    .sel(n111),
    .o(n160));  // ../src/picorv32.v(601)
  binary_mux_s1_w16 mux68 (
    .i0(n150),
    .i1(mem_16bit_buffer),
    .sel(n111),
    .o(n161));  // ../src/picorv32.v(601)
  binary_mux_s1_w4 mux69 (
    .i0({mem_state,mem_state}),
    .i1({2'b00,n138}),
    .sel(mem_xfer),
    .o({n145,n143}));  // ../src/picorv32.v(591)
  binary_mux_s1_w8 mux7 (
    .i0(reg_op2[15:8]),
    .i1(reg_op2[7:0]),
    .sel(mem_wordsize[1]),
    .o(mem_la_wdata[15:8]));  // ../src/picorv32.v(391)
  binary_mux_s1_w2 mux70 (
    .i0({mem_rdata_latched[9],mem_rdata_latched[7]}),
    .i1(2'b00),
    .sel(n184),
    .o(n186));  // ../src/picorv32.v(882)
  binary_mux_s1_w30 mux71 (
    .i0({mem_rdata_latched[31],mem_rdata_latched[31],mem_rdata_latched[31],mem_rdata_latched[31],mem_rdata_latched[31],mem_rdata_latched[31],mem_rdata_latched[31],mem_rdata_latched[31],mem_rdata_latched[31],mem_rdata_latched[31],mem_rdata_latched[31],mem_rdata_latched[31],mem_rdata_latched[19:13],mem_rdata_latched[20],mem_rdata_latched[30:21]}),
    .i1({mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[12],mem_rdata_latched[8],mem_rdata_latched[10:9],mem_rdata_latched[6],mem_rdata_latched[7],mem_rdata_latched[2],mem_rdata_latched[11],mem_rdata_latched[5:3]}),
    .sel(n180),
    .o(n248));  // ../src/picorv32.v(990)
  binary_mux_s1_w5 mux72 (
    .i0(5'b00000),
    .i1(mem_rdata_latched[11:7]),
    .sel(n193),
    .o(n195));  // ../src/picorv32.v(909)
  binary_mux_s1_w4 mux73 (
    .i0(4'b0000),
    .i1({1'b1,mem_rdata_latched[9:7]}),
    .sel(n197),
    .o(n199));  // ../src/picorv32.v(917)
  binary_mux_s1_w5 mux74 (
    .i0(5'b00000),
    .i1(mem_rdata_latched[6:2]),
    .sel(n197),
    .o(n200));  // ../src/picorv32.v(917)
  binary_mux_s1_w4 mux75 (
    .i0(n199),
    .i1({1'b1,mem_rdata_latched[9:7]}),
    .sel(n58),
    .o(n202));  // ../src/picorv32.v(922)
  binary_mux_s1_w4 mux76 (
    .i0(n202),
    .i1({1'b1,mem_rdata_latched[9:7]}),
    .sel(n203),
    .o(n205));  // ../src/picorv32.v(928)
  binary_mux_s1_w5 mux77 (
    .i0(n200),
    .i1({2'b01,mem_rdata_latched[4:2]}),
    .sel(n203),
    .o(n206));  // ../src/picorv32.v(928)
  binary_mux_s2_w1 mux78 (
    .i0(n175),
    .i1(n175),
    .i2(n175),
    .i3(1'b1),
    .sel(mem_rdata_latched[15:14]),
    .o(n207));  // ../src/picorv32.v(943)
  binary_mux_s3_w5 mux79 (
    .i0(mem_rdata_latched[11:7]),
    .i1(5'b00000),
    .i2(5'b00000),
    .i3(n195),
    .i4({1'b0,n205}),
    .i5(5'b00000),
    .i6({2'b01,mem_rdata_latched[9:7]}),
    .i7({2'b01,mem_rdata_latched[9:7]}),
    .sel(mem_rdata_latched[15:13]),
    .o(n208));  // ../src/picorv32.v(943)
  binary_mux_s2_w4 mux8 (
    .i0(4'b1111),
    .i1({reg_op1[1],reg_op1[1],n38[0],n38[0]}),
    .i2(n40),
    .i3(4'bxxxx),
    .sel(mem_wordsize),
    .o(mem_la_wstrb));  // ../src/picorv32.v(391)
  binary_mux_s3_w5 mux80 (
    .i0(5'b00000),
    .i1(5'b00000),
    .i2(5'b00000),
    .i3(5'b00000),
    .i4(n206),
    .i5(5'b00000),
    .i6(5'b00000),
    .i7(5'b00000),
    .sel(mem_rdata_latched[15:13]),
    .o(n209));  // ../src/picorv32.v(943)
  binary_mux_s2_w1 mux81 (
    .i0(n173),
    .i1(1'b1),
    .i2(n173),
    .i3(n173),
    .sel(mem_rdata_latched[14:13]),
    .o(n210));  // ../src/picorv32.v(943)
  binary_mux_s3_w1 mux82 (
    .i0(1'b1),
    .i1(n178),
    .i2(1'b1),
    .i3(n194),
    .i4(n201),
    .i5(n178),
    .i6(n178),
    .i7(n178),
    .sel(mem_rdata_latched[15:13]),
    .o(n211));  // ../src/picorv32.v(943)
  binary_mux_s3_w5 mux83 (
    .i0(mem_rdata_latched[11:7]),
    .i1(5'b00001),
    .i2(mem_rdata_latched[11:7]),
    .i3(mem_rdata_latched[11:7]),
    .i4({1'b0,n205}),
    .i5(5'b00000),
    .i6(5'b00000),
    .i7(5'b00000),
    .sel(mem_rdata_latched[15:13]),
    .o(n212));  // ../src/picorv32.v(943)
  binary_mux_s3_w1 mux84 (
    .i0(n179),
    .i1(n179),
    .i2(n179),
    .i3(n179),
    .i4(n204),
    .i5(n179),
    .i6(n179),
    .i7(n179),
    .sel(mem_rdata_latched[15:13]),
    .o(n213));  // ../src/picorv32.v(943)
  binary_mux_s3_w1 mux85 (
    .i0(n171),
    .i1(n171),
    .i2(n171),
    .i3(n196),
    .i4(n171),
    .i5(n171),
    .i6(n171),
    .i7(n171),
    .sel(mem_rdata_latched[15:13]),
    .o(n214));  // ../src/picorv32.v(943)
  binary_mux_s1_w5 mux86 (
    .i0(5'b00000),
    .i1(mem_rdata_latched[11:7]),
    .sel(n74),
    .o(n216));  // ../src/picorv32.v(963)
  binary_mux_s1_w5 mux87 (
    .i0(5'b00000),
    .i1(mem_rdata_latched[11:7]),
    .sel(n80),
    .o(n218));  // ../src/picorv32.v(969)
  binary_mux_s1_w5 mux88 (
    .i0(n216),
    .i1(5'b00000),
    .sel(n80),
    .o(n219));  // ../src/picorv32.v(969)
  binary_mux_s1_w5 mux89 (
    .i0(5'b00000),
    .i1(mem_rdata_latched[6:2]),
    .sel(n80),
    .o(n220));  // ../src/picorv32.v(969)
  binary_mux_s2_w32 mux9 (
    .i0(mem_rdata),
    .i1(n39),
    .i2(n41),
    .i3(32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx),
    .sel(mem_wordsize),
    .o(mem_rdata_word));  // ../src/picorv32.v(391)
  binary_mux_s1_w5 mux90 (
    .i0(n218),
    .i1(5'b00001),
    .sel(n87),
    .o(n222));  // ../src/picorv32.v(974)
  binary_mux_s1_w5 mux91 (
    .i0(n219),
    .i1(mem_rdata_latched[11:7]),
    .sel(n87),
    .o(n223));  // ../src/picorv32.v(974)
  binary_mux_s1_w5 mux92 (
    .i0(n222),
    .i1(mem_rdata_latched[11:7]),
    .sel(n92),
    .o(n225));  // ../src/picorv32.v(980)
  binary_mux_s1_w5 mux93 (
    .i0(n223),
    .i1(mem_rdata_latched[11:7]),
    .sel(n92),
    .o(n226));  // ../src/picorv32.v(980)
  binary_mux_s1_w5 mux94 (
    .i0(n220),
    .i1(mem_rdata_latched[6:2]),
    .sel(n92),
    .o(n227));  // ../src/picorv32.v(980)
  binary_mux_s2_w1 mux95 (
    .i0(n183),
    .i1(n211),
    .i2(n228),
    .i3(n178),
    .sel(mem_rdata_latched[1:0]),
    .o(n234));  // ../src/picorv32.v(989)
  binary_mux_s2_w5 mux96 (
    .i0({1'b0,n188,n189}),
    .i1(n212),
    .i2(n229),
    .i3(5'b00000),
    .sel(mem_rdata_latched[1:0]),
    .o(n235));  // ../src/picorv32.v(989)
  binary_mux_s2_w5 mux97 (
    .i0({1'b0,n185,n186[1],n187,n186[0]}),
    .i1(n208),
    .i2(n230),
    .i3(5'b00000),
    .sel(mem_rdata_latched[1:0]),
    .o(n236));  // ../src/picorv32.v(989)
  binary_mux_s2_w5 mux98 (
    .i0({1'b0,n99,n192}),
    .i1(n209),
    .i2(n231),
    .i3(5'b00000),
    .sel(mem_rdata_latched[1:0]),
    .o(n237));  // ../src/picorv32.v(989)
  binary_mux_s2_w1 mux99 (
    .i0(n190),
    .i1(n176),
    .i2(n190),
    .i3(n176),
    .sel(mem_rdata_latched[1:0]),
    .o(n238));  // ../src/picorv32.v(989)
  ne_w32 neq0 (
    .i0({27'b000000000000000000000000000,mem_rdata_latched[6:2]}),
    .i1(32'b00000000000000000000000000000000),
    .o(n79));  // ../src/picorv32.v(487)
  ne_w32 neq1 (
    .i0({31'b0000000000000000000000000000000,mem_rdata_latched[12]}),
    .i1(32'b00000000000000000000000000000000),
    .o(n84));  // ../src/picorv32.v(491)
  ne_w32 neq2 (
    .i0({27'b000000000000000000000000000,mem_rdata_latched[11:7]}),
    .i1(32'b00000000000000000000000000000000),
    .o(n85));  // ../src/picorv32.v(491)
  ne_w2 neq3 (
    .i0(mem_rdata_latched[1:0]),
    .i1(2'b11),
    .o(n180));  // ../src/picorv32.v(855)
  ne_w32 neq4 (
    .i0({30'b000000000000000000000000000000,reg_op1[1:0]}),
    .i1(32'b00000000000000000000000000000000),
    .o(n735));  // ../src/picorv32.v(1854)
  ne_w32 neq5 (
    .i0({31'b0000000000000000000000000000000,reg_op1[0]}),
    .i1(32'b00000000000000000000000000000000),
    .o(n739));  // ../src/picorv32.v(1861)
  AL_DFF pcpi_valid_reg (
    .clk(clk),
    .d(n713),
    .reset(1'b0),
    .set(1'b0),
    .q(pcpi_valid));  // ../src/picorv32.v(1906)
  AL_DFF prefetched_high_word_reg (
    .clk(clk),
    .d(n163),
    .reset(1'b0),
    .set(1'b0),
    .q(prefetched_high_word));  // ../src/picorv32.v(605)
  reg_ar_as_w32 reg0 (
    .clk(clk),
    .d({n110,n42[6:0]}),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(mem_rdata_q));  // ../src/picorv32.v(508)
  reg_ar_as_w2 reg1 (
    .clk(clk),
    .d(n154),
    .reset(2'b00),
    .set(2'b00),
    .q(mem_state));  // ../src/picorv32.v(605)
  reg_ar_as_w32 reg10 (
    .clk(clk),
    .d(n359),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(pcpi_insn));  // ../src/picorv32.v(1120)
  reg_ar_as_w32 reg11 (
    .clk(clk),
    .d(n406),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(decoded_imm));  // ../src/picorv32.v(1120)
  reg_ar_as_w5 reg12 (
    .clk(clk),
    .d(n726),
    .reset(5'b00000),
    .set(5'b00000),
    .q(reg_sh));  // ../src/picorv32.v(1906)
  reg_ar_as_w32 reg13 (
    .clk(clk),
    .d(n725),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(reg_out));  // ../src/picorv32.v(1906)
  reg_ar_as_w32 reg14 (
    .clk(clk),
    .d(alu_out),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(alu_out_q));  // ../src/picorv32.v(1906)
  reg_ar_as_w64 reg15 (
    .clk(clk),
    .d(n460),
    .reset(64'b0000000000000000000000000000000000000000000000000000000000000000),
    .set(64'b0000000000000000000000000000000000000000000000000000000000000000),
    .q(count_cycle));  // ../src/picorv32.v(1906)
  reg_ar_as_w36 reg16 (
    .clk(clk),
    .d(36'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx),
    .reset(36'b000000000000000000000000000000000000),
    .set(36'b000000000000000000000000000000000000),
    .q(trace_data));  // ../src/picorv32.v(1906)
  reg_ar_as_w32 reg17 (
    .clk(clk),
    .d(n704),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(reg_pc));  // ../src/picorv32.v(1906)
  reg_ar_as_w32 reg18 (
    .clk(clk),
    .d(n705),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(reg_next_pc));  // ../src/picorv32.v(1906)
  reg_ar_as_w64 reg19 (
    .clk(clk),
    .d(n706),
    .reset(64'b0000000000000000000000000000000000000000000000000000000000000000),
    .set(64'b0000000000000000000000000000000000000000000000000000000000000000),
    .q(count_instr));  // ../src/picorv32.v(1906)
  reg_ar_as_w32 reg2 (
    .clk(clk),
    .d(n158),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(mem_addr));  // ../src/picorv32.v(605)
  reg_ar_as_w2 reg20 (
    .clk(clk),
    .d(n714),
    .reset(2'b00),
    .set(2'b00),
    .q(irq_state));  // ../src/picorv32.v(1906)
  reg_ar_as_w32 reg21 (
    .clk(clk),
    .d(n715),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(eoi));  // ../src/picorv32.v(1906)
  reg_ar_as_w8 reg22 (
    .clk(clk),
    .d(n745),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(cpu_state));  // ../src/picorv32.v(1906)
  reg_ar_as_w2 reg23 (
    .clk(clk),
    .d(n719),
    .reset(2'b00),
    .set(2'b00),
    .q(mem_wordsize));  // ../src/picorv32.v(1906)
  reg_ar_as_w5 reg24 (
    .clk(clk),
    .d(n720),
    .reset(5'b00000),
    .set(5'b00000),
    .q(latched_rd));  // ../src/picorv32.v(1906)
  reg_ar_as_w32 reg25 (
    .clk(clk),
    .d(n723),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(reg_op1));  // ../src/picorv32.v(1906)
  reg_ar_as_w32 reg26 (
    .clk(clk),
    .d(n724),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(reg_op2));  // ../src/picorv32.v(1906)
  reg_ar_as_w4 reg3 (
    .clk(clk),
    .d(n159),
    .reset(4'b0000),
    .set(4'b0000),
    .q(mem_wstrb));  // ../src/picorv32.v(605)
  reg_ar_as_w32 reg4 (
    .clk(clk),
    .d(n160),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(mem_wdata));  // ../src/picorv32.v(605)
  reg_ar_as_w16 reg5 (
    .clk(clk),
    .d(n161),
    .reset(16'b0000000000000000),
    .set(16'b0000000000000000),
    .q(mem_16bit_buffer));  // ../src/picorv32.v(605)
  reg_ar_as_w32 reg6 (
    .clk(clk),
    .d(n268),
    .reset(32'b00000000000000000000000000000000),
    .set(32'b00000000000000000000000000000000),
    .q(decoded_imm_uj));  // ../src/picorv32.v(1120)
  reg_ar_as_w5 reg7 (
    .clk(clk),
    .d(n269),
    .reset(5'b00000),
    .set(5'b00000),
    .q(decoded_rd));  // ../src/picorv32.v(1120)
  reg_ar_as_w5 reg8 (
    .clk(clk),
    .d(n270),
    .reset(5'b00000),
    .set(5'b00000),
    .q(decoded_rs1));  // ../src/picorv32.v(1120)
  reg_ar_as_w5 reg9 (
    .clk(clk),
    .d(n271),
    .reset(5'b00000),
    .set(5'b00000),
    .q(decoded_rs2));  // ../src/picorv32.v(1120)
  onehot_mux_s3_w64 sel0 (
    .i0({reg_op1[31],reg_op1[31:1],reg_op1[31],reg_op1[31],reg_op1[31],reg_op1[31],reg_op1[31:4]}),
    .i1({1'b0,reg_op1[31:1],4'b0000,reg_op1[31:4]}),
    .i2({reg_op1[30:0],1'b0,reg_op1[27:0],4'b0000}),
    .sel({n555,n556,n557}),
    .o({n563,n558}));  // ../src/picorv32.v(1787)
  onehot_mux_s3_w5 sel1 (
    .i0({n42[31:28],n42[14]}),
    .i1(n93),
    .i2(5'b00000),
    .sel({n101,n98,n100}),
    .o(n102));  // ../src/picorv32.v(504)
  onehot_mux_s5_w5 sel10 (
    .i0(5'b00000),
    .i1(mem_rdata_latched[6:2]),
    .i2(n227),
    .i3(5'b00000),
    .i4(mem_rdata_latched[6:2]),
    .sel({n96,n97,n98,n99,n100}),
    .o(n231));  // ../src/picorv32.v(987)
  onehot_mux_s6_w32 sel11 (
    .i0(32'b0000000000000000000000000000000x),
    .i1({mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31:25],mem_rdata_q[11:7]}),
    .i2({mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[7],mem_rdata_q[30:25],mem_rdata_q[11:8],1'b0}),
    .i3({mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31:20]}),
    .i4({mem_rdata_q[31:12],12'b000000000000}),
    .i5(decoded_imm_uj),
    .sel({instr_jal,n355,n356,is_beq_bne_blt_bge_bltu_bgeu,is_sb_sh_sw,n357}),
    .o(n358));  // ../src/picorv32.v(1088)
  onehot_mux_s6_w1 sel12 (
    .i0(alu_ltu),
    .i1(alu_lts),
    .i2(n437),
    .i3(n436),
    .i4(n435),
    .i5(alu_eq),
    .sel({instr_beq,instr_bne,instr_bge,instr_bgeu,is_slti_blt_slt,is_sltiu_bltu_sltu}),
    .o(alu_out_0));  // ../src/picorv32.v(1218)
  onehot_mux_s5_w32 sel13 (
    .i0(n443),
    .i1(n441),
    .i2(n439),
    .i3({31'b0000000000000000000000000000000,alu_out_0}),
    .i4(alu_add_sub),
    .sel({is_lui_auipc_jal_jalr_addi_add_sub,is_compare,n438,n440,n442}),
    .o(alu_out));  // ../src/picorv32.v(1237)
  onehot_mux_s3_w32 sel14 (
    .i0(32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx),
    .i1(n453),
    .i2(n450),
    .sel({latched_branch,n452,n454}),
    .o(n455));  // ../src/picorv32.v(1285)
  onehot_mux_s3_w32 sel15 (
    .i0(reg_next_pc),
    .i1(reg_next_pc),
    .i2(n496),
    .sel({latched_branch,n452,n454}),
    .o(n500));  // ../src/picorv32.v(1453)
  onehot_mux_s4_w32 sel16 (
    .i0(count_instr[63:32]),
    .i1(count_instr[31:0]),
    .i2(count_cycle[63:32]),
    .i3(count_cycle[31:0]),
    .sel({instr_rdcycle,instr_rdcycleh,instr_rdinstr,instr_rdinstrh}),
    .o(n517));  // ../src/picorv32.v(1575)
  onehot_mux_s3_w8 sel17 (
    .i0(8'b00001000),
    .i1(8'b00000100),
    .i2(8'b00000010),
    .sel({is_sb_sh_sw,is_sll_srl_sra,n520}),
    .o(n521));  // ../src/picorv32.v(1690)
  onehot_mux_s3_w1 sel18 (
    .i0(mem_do_prefetch),
    .i1(mem_do_rinst),
    .i2(1'b1),
    .sel({is_sb_sh_sw,is_sll_srl_sra,n520}),
    .o(n522));  // ../src/picorv32.v(1690)
  onehot_mux_s7_w8 sel19 (
    .i0(n521),
    .i1(8'b00001000),
    .i2(8'b00000100),
    .i3(8'b00000001),
    .i4(8'b00001000),
    .i5(8'b01000000),
    .i6(8'b10000000),
    .sel({instr_trap,is_rdcycle_rdcycleh_rdinstr_rdinstrh,is_lui_auipc_jal,n519,is_slli_srli_srai,is_jalr_addi_slti_sltiu_xori_ori_andi,n523}),
    .o(n524));  // ../src/picorv32.v(1694)
  onehot_mux_s3_w1 sel2 (
    .i0(n42[23]),
    .i1(mem_rdata_latched[10]),
    .i2(mem_rdata_latched[5]),
    .sel({n96,n97,n50}),
    .o(n51));  // ../src/picorv32.v(416)
  onehot_mux_s7_w32 sel20 (
    .i0(32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx),
    .i1(32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx),
    .i2(32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx),
    .i3(32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx),
    .i4(32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx),
    .i5(n517),
    .i6(32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx),
    .sel({instr_trap,is_rdcycle_rdcycleh_rdinstr_rdinstrh,is_lui_auipc_jal,n519,is_slli_srli_srai,is_jalr_addi_slti_sltiu_xori_ori_andi,n523}),
    .o(n525));  // ../src/picorv32.v(1694)
  onehot_mux_s7_w32 sel21 (
    .i0(cpuregs_rs1),
    .i1(cpuregs_rs1),
    .i2(cpuregs_rs1),
    .i3(cpuregs_rs1),
    .i4(n518),
    .i5(32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx),
    .i6(32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx),
    .sel({instr_trap,is_rdcycle_rdcycleh_rdinstr_rdinstrh,is_lui_auipc_jal,n519,is_slli_srli_srai,is_jalr_addi_slti_sltiu_xori_ori_andi,n523}),
    .o(n527));  // ../src/picorv32.v(1694)
  onehot_mux_s7_w32 sel22 (
    .i0(cpuregs_rs2),
    .i1(decoded_imm),
    .i2(32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx),
    .i3(32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx),
    .i4(decoded_imm),
    .i5(32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx),
    .i6(32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx),
    .sel({instr_trap,is_rdcycle_rdcycleh_rdinstr_rdinstrh,is_lui_auipc_jal,n519,is_slli_srli_srai,is_jalr_addi_slti_sltiu_xori_ori_andi,n523}),
    .o(n528));  // ../src/picorv32.v(1694)
  onehot_mux_s4_w1 sel23 (
    .i0(n522),
    .i1(1'b1),
    .i2(mem_do_prefetch),
    .i3(mem_do_rinst),
    .sel({n529,n530,n519,n523}),
    .o(n531));  // ../src/picorv32.v(1694)
  onehot_mux_s7_w5 sel24 (
    .i0(cpuregs_rs2[4:0]),
    .i1(5'bxxxxx),
    .i2(decoded_rs2),
    .i3(5'bxxxxx),
    .i4(5'bxxxxx),
    .i5(5'bxxxxx),
    .i6(5'bxxxxx),
    .sel({instr_trap,is_rdcycle_rdcycleh_rdinstr_rdinstrh,is_lui_auipc_jal,n519,is_slli_srli_srai,is_jalr_addi_slti_sltiu_xori_ori_andi,n523}),
    .o(n532));  // ../src/picorv32.v(1694)
  onehot_mux_s3_w2 sel25 (
    .i0(2'b00),
    .i1(2'b01),
    .i2(2'b10),
    .sel({instr_sb,instr_sh,instr_sw}),
    .o(n575));  // ../src/picorv32.v(1802)
  onehot_mux_s3_w2 sel26 (
    .i0(2'b00),
    .i1(2'b01),
    .i2(2'b10),
    .sel({n599,n600,instr_lw}),
    .o(n601));  // ../src/picorv32.v(1827)
  onehot_mux_s3_w32 sel27 (
    .i0({mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7:0]}),
    .i1({mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15:0]}),
    .i2(mem_rdata_word),
    .sel({latched_is_lu,latched_is_lh,latched_is_lb}),
    .o(n641));  // ../src/picorv32.v(1844)
  onehot_mux_s5_w1 sel28 (
    .i0(n568),
    .i1(n522),
    .i2(n531),
    .i3(n513),
    .i4(mem_do_rinst),
    .sel({n670,n663,n664,n665,n667}),
    .o(n671));  // ../src/picorv32.v(1851)
  onehot_mux_s8_w2 sel29 (
    .i0(n652),
    .i1(n583),
    .i2(mem_wordsize),
    .i3(mem_wordsize),
    .i4(mem_wordsize),
    .i5(mem_wordsize),
    .i6(2'b00),
    .i7(mem_wordsize),
    .sel({n662,n663,n664,n665,n666,n667,n668,n669}),
    .o(n672));  // ../src/picorv32.v(1851)
  onehot_mux_s5_w2 sel3 (
    .i0(n42[27:26]),
    .i1(mem_rdata_latched[8:7]),
    .i2(n94),
    .i3(mem_rdata_latched[3:2]),
    .i4(2'b00),
    .sel({n96,n97,n98,n99,n100}),
    .o(n103));  // ../src/picorv32.v(504)
  onehot_mux_s8_w32 sel30 (
    .i0(reg_pc),
    .i1(reg_pc),
    .i2(reg_pc),
    .i3(reg_pc),
    .i4(reg_pc),
    .i5(reg_pc),
    .i6(n500),
    .i7(reg_pc),
    .sel({n662,n663,n664,n665,n666,n667,n668,n669}),
    .o(n673));  // ../src/picorv32.v(1851)
  onehot_mux_s8_w32 sel31 (
    .i0(reg_next_pc),
    .i1(reg_next_pc),
    .i2(reg_next_pc),
    .i3(reg_next_pc),
    .i4(reg_next_pc),
    .i5(reg_next_pc),
    .i6(n511),
    .i7(reg_next_pc),
    .sel({n662,n663,n664,n665,n666,n667,n668,n669}),
    .o(n674));  // ../src/picorv32.v(1851)
  onehot_mux_s5_w1 sel32 (
    .i0(1'b1),
    .i1(n547),
    .i2(n526),
    .i3(1'b0),
    .i4(latched_store),
    .sel({n675,n663,n664,n666,n676}),
    .o(n677));  // ../src/picorv32.v(1851)
  onehot_mux_s3_w1 sel33 (
    .i0(n552),
    .i1(1'b0),
    .i2(latched_stalu),
    .sel({n678,n663,n666}),
    .o(n679));  // ../src/picorv32.v(1851)
  onehot_mux_s3_w1 sel34 (
    .i0(n548),
    .i1(n514),
    .i2(latched_branch),
    .sel({n678,n663,n666}),
    .o(n681));  // ../src/picorv32.v(1851)
  onehot_mux_s3_w1 sel35 (
    .i0(n653),
    .i1(1'b0),
    .i2(latched_is_lu),
    .sel({n682,n663,n669}),
    .o(n683));  // ../src/picorv32.v(1851)
  onehot_mux_s3_w1 sel36 (
    .i0(n654),
    .i1(1'b0),
    .i2(latched_is_lh),
    .sel({n682,n663,n669}),
    .o(n685));  // ../src/picorv32.v(1851)
  onehot_mux_s3_w1 sel37 (
    .i0(n655),
    .i1(1'b0),
    .i2(latched_is_lb),
    .sel({n682,n663,n669}),
    .o(n687));  // ../src/picorv32.v(1851)
  onehot_mux_s8_w5 sel38 (
    .i0(latched_rd),
    .i1(latched_rd),
    .i2(latched_rd),
    .i3(n546),
    .i4(latched_rd),
    .i5(latched_rd),
    .i6(decoded_rd),
    .i7(latched_rd),
    .sel({n662,n663,n664,n665,n666,n667,n668,n669}),
    .o(n688));  // ../src/picorv32.v(1851)
  onehot_mux_s8_w64 sel39 (
    .i0(count_instr),
    .i1(count_instr),
    .i2(count_instr),
    .i3(count_instr),
    .i4(count_instr),
    .i5(count_instr),
    .i6(n512),
    .i7(count_instr),
    .sel({n662,n663,n664,n665,n666,n667,n668,n669}),
    .o(n690));  // ../src/picorv32.v(1851)
  onehot_mux_s4_w3 sel4 (
    .i0({n42[25],n42[13:12]}),
    .i1(n95),
    .i2({mem_rdata_latched[12],2'b10}),
    .i3(3'b001),
    .sel({n96,n104,n98,n100}),
    .o(n105));  // ../src/picorv32.v(504)
  onehot_mux_s8_w8 sel40 (
    .i0(n661),
    .i1(n661),
    .i2(n569),
    .i3(n549),
    .i4(n521),
    .i5(n524),
    .i6(n516),
    .i7(cpu_state),
    .sel({n662,n663,n664,n665,n666,n667,n668,n669}),
    .o(n692));  // ../src/picorv32.v(1851)
  onehot_mux_s8_w32 sel41 (
    .i0(n656),
    .i1(n584),
    .i2(n570),
    .i3(reg_op1),
    .i4(reg_op1),
    .i5(n527),
    .i6(reg_op1),
    .i7(reg_op1),
    .sel({n662,n663,n664,n665,n666,n667,n668,n669}),
    .o(n693));  // ../src/picorv32.v(1851)
  onehot_mux_s8_w32 sel42 (
    .i0(reg_op2),
    .i1(reg_op2),
    .i2(reg_op2),
    .i3(reg_op2),
    .i4(cpuregs_rs2),
    .i5(n528),
    .i6(reg_op2),
    .i7(reg_op2),
    .sel({n662,n663,n664,n665,n666,n667,n668,n669}),
    .o(n694));  // ../src/picorv32.v(1851)
  onehot_mux_s8_w32 sel43 (
    .i0(n658),
    .i1(32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx),
    .i2(n567),
    .i3(n543),
    .i4(32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx),
    .i5(n525),
    .i6(32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx),
    .i7(32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx),
    .sel({n662,n663,n664,n665,n666,n667,n668,n669}),
    .o(n695));  // ../src/picorv32.v(1851)
  onehot_mux_s8_w5 sel44 (
    .i0(5'bxxxxx),
    .i1(5'bxxxxx),
    .i2(n571),
    .i3(5'bxxxxx),
    .i4(cpuregs_rs2[4:0]),
    .i5(n532),
    .i6(5'bxxxxx),
    .i7(5'bxxxxx),
    .sel({n662,n663,n664,n665,n666,n667,n668,n669}),
    .o(n696));  // ../src/picorv32.v(1851)
  onehot_mux_s4_w1 sel45 (
    .i0(n659),
    .i1(n659),
    .i2(n550),
    .i3(n170),
    .sel({n697,n666,n668,n669}),
    .o(n698));  // ../src/picorv32.v(1851)
  onehot_mux_s3_w1 sel46 (
    .i0(n660),
    .i1(n660),
    .i2(1'b0),
    .sel({n701,n668,n669}),
    .o(n702));  // ../src/picorv32.v(1851)
  onehot_mux_s3_w5 sel5 (
    .i0(n91),
    .i1({mem_rdata_latched[6:4],2'b00}),
    .i2(n42[24:20]),
    .sel({n106,n97,n98}),
    .o(n107));  // ../src/picorv32.v(504)
  onehot_mux_s3_w5 sel6 (
    .i0({n42[29:26],n42[13]}),
    .i1({3'b000,mem_rdata_latched[5],1'b1}),
    .i2({mem_rdata_latched[10:7],1'b0}),
    .sel({n96,n104,n44}),
    .o(n47));  // ../src/picorv32.v(416)
  onehot_mux_s3_w1 sel7 (
    .i0(1'b0),
    .i1(mem_rdata_latched[8]),
    .i2(1'b1),
    .sel({n96,n104,n44}),
    .o(n187));  // ../src/picorv32.v(882)
  onehot_mux_s5_w5 sel8 (
    .i0(5'b00000),
    .i1(5'b00000),
    .i2(n225),
    .i3(mem_rdata_latched[11:7]),
    .i4(mem_rdata_latched[11:7]),
    .sel({n96,n97,n98,n99,n100}),
    .o(n229));  // ../src/picorv32.v(987)
  onehot_mux_s5_w5 sel9 (
    .i0(5'b00000),
    .i1(5'b00010),
    .i2(n226),
    .i3(5'b00010),
    .i4(mem_rdata_latched[11:7]),
    .sel({n96,n97,n98,n99,n100}),
    .o(n230));  // ../src/picorv32.v(987)
  add_pu32_mu32_o32 sub0 (
    .i0(reg_op1),
    .i1(reg_op2),
    .o(n433));  // ../src/picorv32.v(1193)
  add_pu6_mu6_o6 sub1 (
    .i0({1'b0,reg_sh}),
    .i1(6'b000100),
    .o({open_n28,n559[4:0]}));  // ../src/picorv32.v(1780)
  add_pu6_mu6_o6 sub2 (
    .i0({1'b0,reg_sh}),
    .i1(6'b000001),
    .o({open_n29,n564[4:0]}));  // ../src/picorv32.v(1788)
  AL_DFF trap_reg (
    .clk(clk),
    .d(n717),
    .reset(1'b0),
    .set(1'b0),
    .q(trap));  // ../src/picorv32.v(1906)
  and u10 (mem_la_firstword_xfer, mem_xfer, n3);  // ../src/picorv32.v(327)
  and u100 (n87, n86, n73);  // ../src/picorv32.v(491)
  and u101 (n443[6], reg_op1[6], reg_op2[6]);  // ../src/picorv32.v(1232)
  and u102 (n443[7], reg_op1[7], reg_op2[7]);  // ../src/picorv32.v(1232)
  and u103 (n443[8], reg_op1[8], reg_op2[8]);  // ../src/picorv32.v(1232)
  or u104 (n595, n669, n594);  // ../src/picorv32.v(1851)
  or u105 (n37, n664, n662);  // ../src/picorv32.v(1851)
  or u106 (n746, n665, n37);  // ../src/picorv32.v(1851)
  or u107 (n678, n595, n746);  // ../src/picorv32.v(1851)
  and u108 (n443[9], reg_op1[9], reg_op2[9]);  // ../src/picorv32.v(1232)
  not u109 (n523, n647);  // ../src/picorv32.v(1694)
  and u11 (n4, mem_la_firstword, prefetched_high_word);  // ../src/picorv32.v(336)
  not u110 (n520, n646);  // ../src/picorv32.v(1690)
  buf u111 (mem_la_wdata[3], reg_op2[3]);  // ../src/picorv32.v(392)
  buf u112 (mem_la_wdata[2], reg_op2[2]);  // ../src/picorv32.v(392)
  and u113 (n92, n84, n79);  // ../src/picorv32.v(495)
  and u114 (n443[10], reg_op1[10], reg_op2[10]);  // ../src/picorv32.v(1232)
  and u115 (n443[11], reg_op1[11], reg_op2[11]);  // ../src/picorv32.v(1232)
  and u116 (n443[12], reg_op1[12], reg_op2[12]);  // ../src/picorv32.v(1232)
  and u117 (n443[13], reg_op1[13], reg_op2[13]);  // ../src/picorv32.v(1232)
  or u118 (n644, decoded_rs2[3], decoded_rs2[4]);  // ../src/picorv32.v(1329)
  or u119 (n643, decoded_rs2[2], n644);  // ../src/picorv32.v(1329)
  not u12 (n5, clear_prefetched_high_word);  // ../src/picorv32.v(336)
  buf u120 (mem_la_wdata[1], reg_op2[1]);  // ../src/picorv32.v(392)
  not u121 (n100, n461);  // ../src/picorv32.v(504)
  or u122 (n461, n464, n462);  // ../src/picorv32.v(504)
  buf u123 (mem_la_wdata[0], reg_op2[0]);  // ../src/picorv32.v(392)
  or u124 (n464, n99, n98);  // ../src/picorv32.v(504)
  or u125 (n462, n97, n96);  // ../src/picorv32.v(504)
  and u126 (n443[14], reg_op1[14], reg_op2[14]);  // ../src/picorv32.v(1232)
  or u127 (n101, n99, n465);  // ../src/picorv32.v(504)
  and u128 (n443[15], reg_op1[15], reg_op2[15]);  // ../src/picorv32.v(1232)
  or u129 (n106, n100, n466);  // ../src/picorv32.v(504)
  and u13 (mem_la_use_prefetched_high_word, n4, n5);  // ../src/picorv32.v(336)
  and u130 (n443[16], reg_op1[16], reg_op2[16]);  // ../src/picorv32.v(1232)
  or u131 (n104, n97, n99);  // ../src/picorv32.v(504)
  or u132 (n465, n97, n96);  // ../src/picorv32.v(504)
  and u133 (n116[3], mem_la_wstrb[3], mem_la_write);  // ../src/picorv32.v(540)
  or u134 (n675, n668, n686);  // ../src/picorv32.v(1851)
  and u135 (n116[2], mem_la_wstrb[2], mem_la_write);  // ../src/picorv32.v(540)
  or u136 (n680, n666, n662);  // ../src/picorv32.v(1851)
  and u137 (n116[1], mem_la_wstrb[1], mem_la_write);  // ../src/picorv32.v(540)
  or u138 (n670, n684, n680);  // ../src/picorv32.v(1851)
  not u139 (n130, n467);  // ../src/picorv32.v(574)
  and u14 (n6, mem_valid, mem_ready);  // ../src/picorv32.v(337)
  or u140 (n529, is_slli_srli_srai, n448);  // ../src/picorv32.v(1694)
  not u141 (instr_trap, n468);  // ../src/picorv32.v(648)
  and u142 (n443[17], reg_op1[17], reg_op2[17]);  // ../src/picorv32.v(1232)
  or u143 (n468, n492, n469);  // ../src/picorv32.v(648)
  or u144 (n458, n645, n643);  // ../src/picorv32.v(1329)
  or u145 (n469, n481, n470);  // ../src/picorv32.v(648)
  or u146 (n639, decoded_rs1[3], decoded_rs1[4]);  // ../src/picorv32.v(1328)
  or u147 (n470, n476, n471);  // ../src/picorv32.v(648)
  or u148 (n111, n407, trap);  // ../src/picorv32.v(530)
  buf u149 (pcpi_rs2[10], reg_op2[10]);  // ../src/picorv32.v(166)
  and u15 (n7, mem_la_use_prefetched_high_word, mem_do_rinst);  // ../src/picorv32.v(337)
  or u150 (n471, n474, n472);  // ../src/picorv32.v(648)
  or u151 (n113, n407, mem_ready);  // ../src/picorv32.v(533)
  AL_MUX u152 (
    .i0(mem_valid),
    .i1(1'b0),
    .sel(n113),
    .o(n114));  // ../src/picorv32.v(534)
  or u153 (n115, mem_la_read, mem_la_write);  // ../src/picorv32.v(538)
  or u154 (n466, n99, n96);  // ../src/picorv32.v(504)
  or u155 (n472, instr_jal, n473);  // ../src/picorv32.v(648)
  or u156 (n473, instr_auipc, instr_lui);  // ../src/picorv32.v(648)
  or u157 (n474, instr_bne, n475);  // ../src/picorv32.v(648)
  or u158 (n475, instr_beq, instr_jalr);  // ../src/picorv32.v(648)
  AL_MUX u159 (
    .i0(mem_valid),
    .i1(n23),
    .sel(n120),
    .o(n121));  // ../src/picorv32.v(552)
  or u16 (mem_xfer, n6, n7);  // ../src/picorv32.v(337)
  AL_MUX u160 (
    .i0(mem_instr),
    .i1(n0),
    .sel(n120),
    .o(n122));  // ../src/picorv32.v(552)
  AL_MUX u161 (
    .i0(n121),
    .i1(1'b1),
    .sel(mem_do_wdata),
    .o(n125));  // ../src/picorv32.v(557)
  AL_MUX u162 (
    .i0(n122),
    .i1(1'b0),
    .sel(mem_do_wdata),
    .o(n126));  // ../src/picorv32.v(557)
  buf u163 (pcpi_rs2[9], reg_op2[9]);  // ../src/picorv32.v(166)
  not u164 (n598, mem_do_rdata);  // ../src/picorv32.v(573)
  and u165 (n116[0], mem_la_wstrb[0], mem_la_write);  // ../src/picorv32.v(540)
  or u166 (n131, n130, mem_la_secondword);  // ../src/picorv32.v(574)
  AL_MUX u167 (
    .i0(prefetched_high_word),
    .i1(n131),
    .sel(n598),
    .o(n134));  // ../src/picorv32.v(580)
  or u168 (n476, n479, n477);  // ../src/picorv32.v(648)
  not u169 (n449[2], latched_compr);  // ../src/picorv32.v(1270)
  buf u17 (pcpi_rs2[0], reg_op2[0]);  // ../src/picorv32.v(166)
  AL_MUX u170 (
    .i0(n134),
    .i1(prefetched_high_word),
    .sel(mem_la_read),
    .o(n137));  // ../src/picorv32.v(582)
  AL_MUX u171 (
    .i0(mem_valid),
    .i1(mem_la_read),
    .sel(mem_xfer),
    .o(n139));  // ../src/picorv32.v(583)
  AL_MUX u172 (
    .i0(mem_la_secondword),
    .i1(mem_la_read),
    .sel(mem_xfer),
    .o(n140));  // ../src/picorv32.v(583)
  AL_MUX u173 (
    .i0(prefetched_high_word),
    .i1(n137),
    .sel(mem_xfer),
    .o(n142));  // ../src/picorv32.v(583)
  AL_MUX u174 (
    .i0(mem_valid),
    .i1(1'b0),
    .sel(mem_xfer),
    .o(n144));  // ../src/picorv32.v(591)
  AL_MUX u175 (
    .i0(n148),
    .i1(n114),
    .sel(n111),
    .o(n155));  // ../src/picorv32.v(601)
  AL_MUX u176 (
    .i0(n149),
    .i1(1'b0),
    .sel(n111),
    .o(n156));  // ../src/picorv32.v(601)
  AL_MUX u177 (
    .i0(n151),
    .i1(1'b0),
    .sel(n111),
    .o(n157));  // ../src/picorv32.v(601)
  AL_MUX u178 (
    .i0(n152),
    .i1(mem_instr),
    .sel(n111),
    .o(n162));  // ../src/picorv32.v(601)
  AL_MUX u179 (
    .i0(n157),
    .i1(1'b0),
    .sel(clear_prefetched_high_word),
    .o(n163));  // ../src/picorv32.v(604)
  and u18 (n9, mem_xfer, n8);  // ../src/picorv32.v(340)
  and u180 (n467, mem_rdata[0], mem_rdata[1]);  // ../src/picorv32.v(574)
  or u181 (n596, instr_timer, instr_waitirq);  // ../src/picorv32.v(648)
  or u182 (n129, instr_rdinstrh, instr_rdinstr);  // ../src/picorv32.v(651)
  or u183 (n602, instr_auipc, instr_lui);  // ../src/picorv32.v(821)
  or u184 (n607, instr_add, instr_addi);  // ../src/picorv32.v(822)
  or u185 (n608, instr_blt, instr_slti);  // ../src/picorv32.v(823)
  or u186 (n609, instr_bltu, instr_sltiu);  // ../src/picorv32.v(824)
  or u187 (n610, instr_lhu, instr_lbu);  // ../src/picorv32.v(825)
  and u188 (n170, mem_do_rinst, mem_done);  // ../src/picorv32.v(828)
  or u189 (n613, instr_sltu, instr_sltiu);  // ../src/picorv32.v(826)
  or u19 (n10, mem_do_rinst, mem_do_rdata);  // ../src/picorv32.v(340)
  or u190 (n477, instr_bltu, n478);  // ../src/picorv32.v(648)
  or u191 (n478, instr_bge, instr_blt);  // ../src/picorv32.v(648)
  or u192 (n479, instr_lh, n480);  // ../src/picorv32.v(648)
  or u193 (n619, mem_rdata_latched[5], mem_rdata_latched[6]);  // ../src/picorv32.v(868)
  AL_MUX u194 (
    .i0(n178),
    .i1(n181),
    .sel(n96),
    .o(n183));  // ../src/picorv32.v(882)
  or u195 (n184, n96, n44);  // ../src/picorv32.v(882)
  not u196 (n185, n184);  // ../src/picorv32.v(882)
  or u197 (n480, instr_lb, instr_bgeu);  // ../src/picorv32.v(648)
  or u198 (n182, n666, n665);  // ../src/picorv32.v(1851)
  or u199 (n481, n487, n482);  // ../src/picorv32.v(648)
  or u20 (n11, n10, mem_do_wdata);  // ../src/picorv32.v(340)
  or u200 (n482, n485, n483);  // ../src/picorv32.v(648)
  or u201 (n46, n667, n182);  // ../src/picorv32.v(1851)
  or u202 (n188, n96, n97);  // ../src/picorv32.v(882)
  or u203 (n483, instr_lhu, n484);  // ../src/picorv32.v(648)
  or u204 (n484, instr_lbu, instr_lw);  // ../src/picorv32.v(648)
  or u205 (n48, n663, n662);  // ../src/picorv32.v(1851)
  or u206 (n485, instr_sw, n486);  // ../src/picorv32.v(648)
  or u207 (n593, n664, n48);  // ../src/picorv32.v(1851)
  AL_MUX u208 (
    .i0(n176),
    .i1(1'b1),
    .sel(n97),
    .o(n190));  // ../src/picorv32.v(882)
  AL_MUX u209 (
    .i0(n177),
    .i1(1'b1),
    .sel(n99),
    .o(n191));  // ../src/picorv32.v(882)
  and u21 (n12, n9, n11);  // ../src/picorv32.v(340)
  or u210 (n486, instr_sh, instr_sb);  // ../src/picorv32.v(648)
  AL_MUX u211 (
    .i0(n178),
    .i1(1'b1),
    .sel(n193),
    .o(n194));  // ../src/picorv32.v(909)
  AL_MUX u212 (
    .i0(1'b1),
    .i1(n171),
    .sel(n193),
    .o(n196));  // ../src/picorv32.v(909)
  not u213 (n197, mem_rdata_latched[11]);  // ../src/picorv32.v(912)
  AL_MUX u214 (
    .i0(n178),
    .i1(1'b1),
    .sel(n197),
    .o(n198));  // ../src/picorv32.v(917)
  or u215 (n487, n490, n488);  // ../src/picorv32.v(648)
  or u216 (n488, instr_sltiu, n489);  // ../src/picorv32.v(648)
  AL_MUX u217 (
    .i0(n198),
    .i1(1'b1),
    .sel(n58),
    .o(n201));  // ../src/picorv32.v(922)
  or u218 (n489, instr_slti, instr_addi);  // ../src/picorv32.v(648)
  or u219 (n490, instr_andi, n491);  // ../src/picorv32.v(648)
  or u22 (n8, mem_state[0], mem_state[1]);  // ../src/picorv32.v(340)
  AL_MUX u220 (
    .i0(n179),
    .i1(1'b1),
    .sel(n203),
    .o(n204));  // ../src/picorv32.v(928)
  or u221 (n491, instr_ori, instr_xori);  // ../src/picorv32.v(648)
  or u222 (n492, n538, n493);  // ../src/picorv32.v(648)
  or u223 (n493, n533, n494);  // ../src/picorv32.v(648)
  or u224 (n494, n498, n495);  // ../src/picorv32.v(648)
  AL_MUX u225 (
    .i0(n174),
    .i1(1'b1),
    .sel(n74),
    .o(n215));  // ../src/picorv32.v(963)
  or u226 (n495, instr_srai, n497);  // ../src/picorv32.v(648)
  or u227 (n497, instr_srli, instr_slli);  // ../src/picorv32.v(648)
  or u228 (n498, instr_sll, n499);  // ../src/picorv32.v(648)
  AL_MUX u229 (
    .i0(n179),
    .i1(1'b1),
    .sel(n80),
    .o(n217));  // ../src/picorv32.v(969)
  and u23 (n14, n13, mem_do_rinst);  // ../src/picorv32.v(340)
  or u230 (n499, instr_sub, instr_add);  // ../src/picorv32.v(648)
  or u231 (n533, n536, n534);  // ../src/picorv32.v(648)
  or u232 (n534, instr_xor, n535);  // ../src/picorv32.v(648)
  or u233 (n535, instr_sltu, instr_slt);  // ../src/picorv32.v(648)
  or u234 (n536, instr_or, n537);  // ../src/picorv32.v(648)
  AL_MUX u235 (
    .i0(n215),
    .i1(1'b1),
    .sel(n87),
    .o(n221));  // ../src/picorv32.v(974)
  or u236 (n537, instr_sra, instr_srl);  // ../src/picorv32.v(648)
  or u237 (n538, n561, n539);  // ../src/picorv32.v(648)
  or u238 (n539, n542, n540);  // ../src/picorv32.v(648)
  AL_MUX u239 (
    .i0(n217),
    .i1(1'b1),
    .sel(n92),
    .o(n224));  // ../src/picorv32.v(980)
  or u24 (n15, n12, n14);  // ../src/picorv32.v(340)
  or u240 (n540, instr_rdcycleh, n541);  // ../src/picorv32.v(648)
  or u241 (n541, instr_rdcycle, instr_and);  // ../src/picorv32.v(648)
  or u242 (n542, instr_getq, n560);  // ../src/picorv32.v(648)
  or u243 (n560, instr_rdinstrh, instr_rdinstr);  // ../src/picorv32.v(648)
  or u244 (n561, n596, n562);  // ../src/picorv32.v(648)
  AL_MUX u245 (
    .i0(n178),
    .i1(1'b1),
    .sel(n96),
    .o(n228));  // ../src/picorv32.v(987)
  or u246 (n562, instr_maskirq, n579);  // ../src/picorv32.v(648)
  AL_MUX u247 (
    .i0(n174),
    .i1(n221),
    .sel(n98),
    .o(n232));  // ../src/picorv32.v(987)
  AL_MUX u248 (
    .i0(n179),
    .i1(n224),
    .sel(n98),
    .o(n233));  // ../src/picorv32.v(987)
  or u249 (n579, instr_retirq, instr_setq);  // ../src/picorv32.v(648)
  and u25 (n16, resetn, n15);  // ../src/picorv32.v(340)
  AL_MUX u250 (
    .i0(n178),
    .i1(n234),
    .sel(n180),
    .o(n249));  // ../src/picorv32.v(990)
  AL_MUX u251 (
    .i0(n176),
    .i1(n238),
    .sel(n180),
    .o(n250));  // ../src/picorv32.v(990)
  AL_MUX u252 (
    .i0(n174),
    .i1(n239),
    .sel(n180),
    .o(n251));  // ../src/picorv32.v(990)
  AL_MUX u253 (
    .i0(n179),
    .i1(n240),
    .sel(n180),
    .o(n252));  // ../src/picorv32.v(990)
  AL_MUX u254 (
    .i0(n177),
    .i1(n241),
    .sel(n180),
    .o(n253));  // ../src/picorv32.v(990)
  AL_MUX u255 (
    .i0(n175),
    .i1(n242),
    .sel(n180),
    .o(n254));  // ../src/picorv32.v(990)
  AL_MUX u256 (
    .i0(n173),
    .i1(n243),
    .sel(n180),
    .o(n255));  // ../src/picorv32.v(990)
  AL_MUX u257 (
    .i0(n171),
    .i1(n244),
    .sel(n180),
    .o(n256));  // ../src/picorv32.v(990)
  AL_MUX u258 (
    .i0(instr_lui),
    .i1(n256),
    .sel(n170),
    .o(n257));  // ../src/picorv32.v(991)
  AL_MUX u259 (
    .i0(instr_auipc),
    .i1(n172),
    .sel(n170),
    .o(n258));  // ../src/picorv32.v(991)
  not u26 (n17, mem_la_firstword);  // ../src/picorv32.v(341)
  AL_MUX u260 (
    .i0(instr_jal),
    .i1(n255),
    .sel(n170),
    .o(n259));  // ../src/picorv32.v(991)
  AL_MUX u261 (
    .i0(instr_jalr),
    .i1(n251),
    .sel(n170),
    .o(n260));  // ../src/picorv32.v(991)
  AL_MUX u262 (
    .i0(instr_retirq),
    .i1(1'b0),
    .sel(n170),
    .o(n261));  // ../src/picorv32.v(991)
  AL_MUX u263 (
    .i0(instr_waitirq),
    .i1(1'b0),
    .sel(n170),
    .o(n262));  // ../src/picorv32.v(991)
  AL_MUX u264 (
    .i0(is_beq_bne_blt_bge_bltu_bgeu),
    .i1(n254),
    .sel(n170),
    .o(n263));  // ../src/picorv32.v(991)
  AL_MUX u265 (
    .i0(is_lb_lh_lw_lbu_lhu),
    .i1(n250),
    .sel(n170),
    .o(n264));  // ../src/picorv32.v(991)
  AL_MUX u266 (
    .i0(is_sb_sh_sw),
    .i1(n253),
    .sel(n170),
    .o(n265));  // ../src/picorv32.v(991)
  AL_MUX u267 (
    .i0(is_alu_reg_imm),
    .i1(n249),
    .sel(n170),
    .o(n266));  // ../src/picorv32.v(991)
  AL_MUX u268 (
    .i0(is_alu_reg_reg),
    .i1(n252),
    .sel(n170),
    .o(n267));  // ../src/picorv32.v(991)
  AL_MUX u269 (
    .i0(compressed_instr),
    .i1(n180),
    .sel(n170),
    .o(n272));  // ../src/picorv32.v(991)
  and u27 (n13, mem_state[0], mem_state[1]);  // ../src/picorv32.v(340)
  not u270 (n273, decoder_pseudo_trigger);  // ../src/picorv32.v(993)
  and u271 (n274, decoder_trigger, n273);  // ../src/picorv32.v(993)
  and u272 (n276, is_beq_bne_blt_bge_bltu_bgeu, n275);  // ../src/picorv32.v(996)
  and u273 (n278, is_beq_bne_blt_bge_bltu_bgeu, n277);  // ../src/picorv32.v(997)
  and u274 (n280, is_beq_bne_blt_bge_bltu_bgeu, n279);  // ../src/picorv32.v(998)
  and u275 (n282, is_beq_bne_blt_bge_bltu_bgeu, n281);  // ../src/picorv32.v(999)
  and u276 (n284, is_beq_bne_blt_bge_bltu_bgeu, n283);  // ../src/picorv32.v(1000)
  and u277 (n286, is_beq_bne_blt_bge_bltu_bgeu, n285);  // ../src/picorv32.v(1001)
  or u278 (is_rdcycle_rdcycleh_rdinstr_rdinstrh, n129, n573);  // ../src/picorv32.v(651)
  and u279 (n287, is_lb_lh_lw_lbu_lhu, n275);  // ../src/picorv32.v(1003)
  and u28 (n19, n18, mem_xfer);  // ../src/picorv32.v(341)
  or u280 (n573, instr_rdcycleh, instr_rdcycle);  // ../src/picorv32.v(651)
  and u281 (n288, is_lb_lh_lw_lbu_lhu, n277);  // ../src/picorv32.v(1004)
  and u282 (n290, is_lb_lh_lw_lbu_lhu, n289);  // ../src/picorv32.v(1005)
  or u283 (n164, instr_jal, n602);  // ../src/picorv32.v(821)
  and u284 (n291, is_lb_lh_lw_lbu_lhu, n279);  // ../src/picorv32.v(1006)
  or u285 (n165, n606, n603);  // ../src/picorv32.v(822)
  and u286 (n292, is_lb_lh_lw_lbu_lhu, n281);  // ../src/picorv32.v(1007)
  or u287 (n603, n605, n604);  // ../src/picorv32.v(822)
  and u288 (n293, is_sb_sh_sw, n275);  // ../src/picorv32.v(1009)
  or u289 (n604, instr_auipc, instr_lui);  // ../src/picorv32.v(822)
  or u29 (n20, n17, n19);  // ../src/picorv32.v(341)
  and u290 (n294, is_sb_sh_sw, n277);  // ../src/picorv32.v(1010)
  or u291 (n605, instr_jalr, instr_jal);  // ../src/picorv32.v(822)
  and u292 (n295, is_sb_sh_sw, n289);  // ../src/picorv32.v(1011)
  or u293 (n606, instr_sub, n607);  // ../src/picorv32.v(822)
  and u294 (n296, is_alu_reg_imm, n275);  // ../src/picorv32.v(1013)
  or u295 (n166, instr_slt, n608);  // ../src/picorv32.v(823)
  and u296 (n297, is_alu_reg_imm, n289);  // ../src/picorv32.v(1014)
  and u297 (n299, is_alu_reg_imm, n298);  // ../src/picorv32.v(1015)
  or u298 (n167, instr_sltu, n609);  // ../src/picorv32.v(824)
  and u299 (n300, is_alu_reg_imm, n279);  // ../src/picorv32.v(1016)
  buf u3 (pcpi_rs1[0], reg_op1[0]);  // ../src/picorv32.v(165)
  and u30 (mem_done, n16, n20);  // ../src/picorv32.v(341)
  or u300 (n168, instr_lw, n610);  // ../src/picorv32.v(825)
  and u301 (n301, is_alu_reg_imm, n283);  // ../src/picorv32.v(1017)
  or u302 (n169, n613, n611);  // ../src/picorv32.v(826)
  and u303 (n302, is_alu_reg_imm, n285);  // ../src/picorv32.v(1018)
  or u304 (n611, instr_slt, n612);  // ../src/picorv32.v(826)
  and u305 (n303, is_alu_reg_imm, n277);  // ../src/picorv32.v(1020)
  and u306 (n305, n303, n304);  // ../src/picorv32.v(1020)
  or u307 (n612, instr_slti, is_beq_bne_blt_bge_bltu_bgeu);  // ../src/picorv32.v(826)
  and u308 (n306, is_alu_reg_imm, n281);  // ../src/picorv32.v(1021)
  or u309 (n181, n617, n614);  // ../src/picorv32.v(868)
  and u31 (n351, mem_rdata_latched[0], mem_rdata_latched[1]);  // ../src/picorv32.v(341)
  and u310 (n307, n306, n304);  // ../src/picorv32.v(1021)
  or u311 (n614, n616, n615);  // ../src/picorv32.v(868)
  or u312 (n615, mem_rdata_latched[11], mem_rdata_latched[12]);  // ../src/picorv32.v(868)
  and u313 (n309, n306, n308);  // ../src/picorv32.v(1022)
  or u314 (n616, mem_rdata_latched[9], mem_rdata_latched[10]);  // ../src/picorv32.v(868)
  and u315 (n310, is_alu_reg_reg, n275);  // ../src/picorv32.v(1024)
  or u316 (n617, n619, n618);  // ../src/picorv32.v(868)
  and u317 (n311, n310, n304);  // ../src/picorv32.v(1024)
  or u318 (n618, mem_rdata_latched[7], mem_rdata_latched[8]);  // ../src/picorv32.v(868)
  not u319 (n44, n620);  // ../src/picorv32.v(882)
  and u32 (n22, resetn, n21);  // ../src/picorv32.v(343)
  or u320 (n620, n99, n621);  // ../src/picorv32.v(882)
  and u321 (n312, n310, n308);  // ../src/picorv32.v(1025)
  or u322 (n346, n345, n622);  // ../src/picorv32.v(1054)
  and u323 (n313, is_alu_reg_reg, n277);  // ../src/picorv32.v(1026)
  or u324 (n348, n625, n623);  // ../src/picorv32.v(1063)
  and u325 (n314, n313, n304);  // ../src/picorv32.v(1026)
  or u326 (n623, n298, n624);  // ../src/picorv32.v(1063)
  and u327 (n315, is_alu_reg_reg, n289);  // ../src/picorv32.v(1027)
  or u328 (n624, n289, n275);  // ../src/picorv32.v(1063)
  and u329 (n316, n315, n304);  // ../src/picorv32.v(1027)
  and u33 (mem_la_write, n22, mem_do_wdata);  // ../src/picorv32.v(343)
  or u330 (n625, n285, n626);  // ../src/picorv32.v(1063)
  and u331 (n317, is_alu_reg_reg, n298);  // ../src/picorv32.v(1028)
  or u332 (n356, is_alu_reg_imm, n627);  // ../src/picorv32.v(1080)
  and u333 (n318, n317, n304);  // ../src/picorv32.v(1028)
  not u334 (n357, n628);  // ../src/picorv32.v(1088)
  and u335 (n319, is_alu_reg_reg, n279);  // ../src/picorv32.v(1029)
  or u336 (n628, n631, n629);  // ../src/picorv32.v(1088)
  and u337 (n320, n319, n304);  // ../src/picorv32.v(1029)
  or u338 (n629, n356, n630);  // ../src/picorv32.v(1088)
  and u339 (n321, is_alu_reg_reg, n281);  // ../src/picorv32.v(1030)
  not u34 (n23, mem_la_use_prefetched_high_word);  // ../src/picorv32.v(344)
  or u340 (n630, n355, instr_jal);  // ../src/picorv32.v(1088)
  and u341 (n322, n321, n304);  // ../src/picorv32.v(1030)
  xor u342 (n439[31], reg_op1[31], reg_op2[31]);  // ../src/picorv32.v(1228)
  xor u343 (n439[30], reg_op1[30], reg_op2[30]);  // ../src/picorv32.v(1228)
  xor u344 (n439[29], reg_op1[29], reg_op2[29]);  // ../src/picorv32.v(1228)
  and u345 (n323, n321, n308);  // ../src/picorv32.v(1031)
  xor u346 (n439[28], reg_op1[28], reg_op2[28]);  // ../src/picorv32.v(1228)
  and u347 (n324, is_alu_reg_reg, n283);  // ../src/picorv32.v(1032)
  xor u348 (n439[27], reg_op1[27], reg_op2[27]);  // ../src/picorv32.v(1228)
  and u349 (n325, n324, n304);  // ../src/picorv32.v(1032)
  buf u35 (pcpi_rs2[6], reg_op2[6]);  // ../src/picorv32.v(166)
  xor u350 (n439[26], reg_op1[26], reg_op2[26]);  // ../src/picorv32.v(1228)
  and u351 (n326, is_alu_reg_reg, n285);  // ../src/picorv32.v(1033)
  xor u352 (n439[25], reg_op1[25], reg_op2[25]);  // ../src/picorv32.v(1228)
  and u353 (n327, n326, n304);  // ../src/picorv32.v(1033)
  and u354 (n330, n328, n329);  // ../src/picorv32.v(1035)
  xor u355 (n439[24], reg_op1[24], reg_op2[24]);  // ../src/picorv32.v(1228)
  and u356 (n332, n328, n331);  // ../src/picorv32.v(1036)
  or u357 (n333, n330, n332);  // ../src/picorv32.v(1036)
  xor u358 (n439[23], reg_op1[23], reg_op2[23]);  // ../src/picorv32.v(1228)
  and u359 (n335, n328, n334);  // ../src/picorv32.v(1037)
  and u36 (n24, n23, n21);  // ../src/picorv32.v(344)
  xor u360 (n439[22], reg_op1[22], reg_op2[22]);  // ../src/picorv32.v(1228)
  and u361 (n337, n328, n336);  // ../src/picorv32.v(1038)
  or u362 (n338, n335, n337);  // ../src/picorv32.v(1038)
  xor u363 (n439[21], reg_op1[21], reg_op2[21]);  // ../src/picorv32.v(1228)
  and u364 (n340, n328, n339);  // ../src/picorv32.v(1039)
  xor u365 (n439[20], reg_op1[20], reg_op2[20]);  // ../src/picorv32.v(1228)
  and u366 (n342, n328, n341);  // ../src/picorv32.v(1040)
  xor u367 (n439[19], reg_op1[19], reg_op2[19]);  // ../src/picorv32.v(1228)
  xor u368 (n439[18], reg_op1[18], reg_op2[18]);  // ../src/picorv32.v(1228)
  and u369 (n343, n277, n304);  // ../src/picorv32.v(1051)
  buf u37 (pcpi_rs2[5], reg_op2[5]);  // ../src/picorv32.v(166)
  xor u370 (n439[17], reg_op1[17], reg_op2[17]);  // ../src/picorv32.v(1228)
  xor u371 (n439[16], reg_op1[16], reg_op2[16]);  // ../src/picorv32.v(1228)
  and u372 (n344, n281, n304);  // ../src/picorv32.v(1052)
  xor u373 (n439[15], reg_op1[15], reg_op2[15]);  // ../src/picorv32.v(1228)
  xor u374 (n439[14], reg_op1[14], reg_op2[14]);  // ../src/picorv32.v(1228)
  and u375 (n345, n281, n308);  // ../src/picorv32.v(1053)
  or u376 (n621, n97, n96);  // ../src/picorv32.v(882)
  and u377 (n347, is_alu_reg_imm, n346);  // ../src/picorv32.v(1054)
  xor u378 (n439[13], reg_op1[13], reg_op2[13]);  // ../src/picorv32.v(1228)
  xor u379 (n439[12], reg_op1[12], reg_op2[12]);  // ../src/picorv32.v(1228)
  or u38 (n120, n0, mem_do_rdata);  // ../src/picorv32.v(344)
  xor u380 (n439[11], reg_op1[11], reg_op2[11]);  // ../src/picorv32.v(1228)
  xor u381 (n439[10], reg_op1[10], reg_op2[10]);  // ../src/picorv32.v(1228)
  xor u382 (n439[9], reg_op1[9], reg_op2[9]);  // ../src/picorv32.v(1228)
  xor u383 (n439[8], reg_op1[8], reg_op2[8]);  // ../src/picorv32.v(1228)
  or u384 (n622, n344, n343);  // ../src/picorv32.v(1054)
  and u385 (n349, is_alu_reg_imm, n348);  // ../src/picorv32.v(1063)
  or u386 (n350, instr_jalr, n349);  // ../src/picorv32.v(1063)
  xor u387 (n439[7], reg_op1[7], reg_op2[7]);  // ../src/picorv32.v(1228)
  xor u388 (n439[6], reg_op1[6], reg_op2[6]);  // ../src/picorv32.v(1228)
  xor u389 (n439[5], reg_op1[5], reg_op2[5]);  // ../src/picorv32.v(1228)
  and u39 (n25, n24, n120);  // ../src/picorv32.v(344)
  xor u390 (n439[4], reg_op1[4], reg_op2[4]);  // ../src/picorv32.v(1228)
  xor u391 (n439[3], reg_op1[3], reg_op2[3]);  // ../src/picorv32.v(1228)
  xor u392 (n439[2], reg_op1[2], reg_op2[2]);  // ../src/picorv32.v(1228)
  xor u393 (n439[1], reg_op1[1], reg_op2[1]);  // ../src/picorv32.v(1228)
  or u394 (n441[31], reg_op1[31], reg_op2[31]);  // ../src/picorv32.v(1230)
  or u395 (n441[30], reg_op1[30], reg_op2[30]);  // ../src/picorv32.v(1230)
  or u396 (n441[29], reg_op1[29], reg_op2[29]);  // ../src/picorv32.v(1230)
  and u397 (n354, is_alu_reg_reg, n346);  // ../src/picorv32.v(1069)
  or u398 (n626, n283, n279);  // ../src/picorv32.v(1063)
  or u399 (n355, instr_auipc, instr_lui);  // ../src/picorv32.v(1078)
  or u4 (n0, mem_do_prefetch, mem_do_rinst);  // ../src/picorv32.v(326)
  buf u40 (pcpi_rs2[12], reg_op2[12]);  // ../src/picorv32.v(166)
  or u400 (n627, is_lb_lh_lw_lbu_lhu, instr_jalr);  // ../src/picorv32.v(1080)
  AL_MUX u401 (
    .i0(instr_beq),
    .i1(n276),
    .sel(n274),
    .o(n360));  // ../src/picorv32.v(1089)
  AL_MUX u402 (
    .i0(instr_bne),
    .i1(n278),
    .sel(n274),
    .o(n361));  // ../src/picorv32.v(1089)
  AL_MUX u403 (
    .i0(instr_blt),
    .i1(n280),
    .sel(n274),
    .o(n362));  // ../src/picorv32.v(1089)
  AL_MUX u404 (
    .i0(instr_bge),
    .i1(n282),
    .sel(n274),
    .o(n363));  // ../src/picorv32.v(1089)
  AL_MUX u405 (
    .i0(instr_bltu),
    .i1(n284),
    .sel(n274),
    .o(n364));  // ../src/picorv32.v(1089)
  AL_MUX u406 (
    .i0(instr_bgeu),
    .i1(n286),
    .sel(n274),
    .o(n365));  // ../src/picorv32.v(1089)
  AL_MUX u407 (
    .i0(instr_lb),
    .i1(n287),
    .sel(n274),
    .o(n366));  // ../src/picorv32.v(1089)
  AL_MUX u408 (
    .i0(instr_lh),
    .i1(n288),
    .sel(n274),
    .o(n367));  // ../src/picorv32.v(1089)
  AL_MUX u409 (
    .i0(instr_lw),
    .i1(n290),
    .sel(n274),
    .o(n368));  // ../src/picorv32.v(1089)
  buf u41 (pcpi_rs2[4], reg_op2[4]);  // ../src/picorv32.v(166)
  AL_MUX u410 (
    .i0(instr_lbu),
    .i1(n291),
    .sel(n274),
    .o(n369));  // ../src/picorv32.v(1089)
  AL_MUX u411 (
    .i0(instr_lhu),
    .i1(n292),
    .sel(n274),
    .o(n370));  // ../src/picorv32.v(1089)
  AL_MUX u412 (
    .i0(instr_sb),
    .i1(n293),
    .sel(n274),
    .o(n371));  // ../src/picorv32.v(1089)
  AL_MUX u413 (
    .i0(instr_sh),
    .i1(n294),
    .sel(n274),
    .o(n372));  // ../src/picorv32.v(1089)
  AL_MUX u414 (
    .i0(instr_sw),
    .i1(n295),
    .sel(n274),
    .o(n373));  // ../src/picorv32.v(1089)
  AL_MUX u415 (
    .i0(instr_addi),
    .i1(n296),
    .sel(n274),
    .o(n374));  // ../src/picorv32.v(1089)
  AL_MUX u416 (
    .i0(instr_slti),
    .i1(n297),
    .sel(n274),
    .o(n375));  // ../src/picorv32.v(1089)
  AL_MUX u417 (
    .i0(instr_sltiu),
    .i1(n299),
    .sel(n274),
    .o(n376));  // ../src/picorv32.v(1089)
  AL_MUX u418 (
    .i0(instr_xori),
    .i1(n300),
    .sel(n274),
    .o(n377));  // ../src/picorv32.v(1089)
  AL_MUX u419 (
    .i0(instr_ori),
    .i1(n301),
    .sel(n274),
    .o(n378));  // ../src/picorv32.v(1089)
  buf u42 (pcpi_rs2[3], reg_op2[3]);  // ../src/picorv32.v(166)
  AL_MUX u420 (
    .i0(instr_andi),
    .i1(n302),
    .sel(n274),
    .o(n379));  // ../src/picorv32.v(1089)
  AL_MUX u421 (
    .i0(instr_slli),
    .i1(n305),
    .sel(n274),
    .o(n380));  // ../src/picorv32.v(1089)
  AL_MUX u422 (
    .i0(instr_srli),
    .i1(n307),
    .sel(n274),
    .o(n381));  // ../src/picorv32.v(1089)
  AL_MUX u423 (
    .i0(instr_srai),
    .i1(n309),
    .sel(n274),
    .o(n382));  // ../src/picorv32.v(1089)
  AL_MUX u424 (
    .i0(instr_add),
    .i1(n311),
    .sel(n274),
    .o(n383));  // ../src/picorv32.v(1089)
  AL_MUX u425 (
    .i0(instr_sub),
    .i1(n312),
    .sel(n274),
    .o(n384));  // ../src/picorv32.v(1089)
  AL_MUX u426 (
    .i0(instr_sll),
    .i1(n314),
    .sel(n274),
    .o(n385));  // ../src/picorv32.v(1089)
  AL_MUX u427 (
    .i0(instr_slt),
    .i1(n316),
    .sel(n274),
    .o(n386));  // ../src/picorv32.v(1089)
  AL_MUX u428 (
    .i0(instr_sltu),
    .i1(n318),
    .sel(n274),
    .o(n387));  // ../src/picorv32.v(1089)
  AL_MUX u429 (
    .i0(instr_xor),
    .i1(n320),
    .sel(n274),
    .o(n388));  // ../src/picorv32.v(1089)
  buf u43 (pcpi_rs2[2], reg_op2[2]);  // ../src/picorv32.v(166)
  AL_MUX u430 (
    .i0(instr_srl),
    .i1(n322),
    .sel(n274),
    .o(n389));  // ../src/picorv32.v(1089)
  AL_MUX u431 (
    .i0(instr_sra),
    .i1(n323),
    .sel(n274),
    .o(n390));  // ../src/picorv32.v(1089)
  AL_MUX u432 (
    .i0(instr_or),
    .i1(n325),
    .sel(n274),
    .o(n391));  // ../src/picorv32.v(1089)
  AL_MUX u433 (
    .i0(instr_and),
    .i1(n327),
    .sel(n274),
    .o(n392));  // ../src/picorv32.v(1089)
  AL_MUX u434 (
    .i0(instr_rdcycle),
    .i1(n333),
    .sel(n274),
    .o(n393));  // ../src/picorv32.v(1089)
  AL_MUX u435 (
    .i0(instr_rdcycleh),
    .i1(n338),
    .sel(n274),
    .o(n394));  // ../src/picorv32.v(1089)
  AL_MUX u436 (
    .i0(instr_rdinstr),
    .i1(n340),
    .sel(n274),
    .o(n395));  // ../src/picorv32.v(1089)
  AL_MUX u437 (
    .i0(instr_rdinstrh),
    .i1(n342),
    .sel(n274),
    .o(n396));  // ../src/picorv32.v(1089)
  AL_MUX u438 (
    .i0(instr_getq),
    .i1(1'b0),
    .sel(n274),
    .o(n397));  // ../src/picorv32.v(1089)
  AL_MUX u439 (
    .i0(instr_setq),
    .i1(1'b0),
    .sel(n274),
    .o(n398));  // ../src/picorv32.v(1089)
  and u44 (n26, mem_la_firstword_xfer, n2);  // ../src/picorv32.v(345)
  AL_MUX u440 (
    .i0(instr_maskirq),
    .i1(1'b0),
    .sel(n274),
    .o(n399));  // ../src/picorv32.v(1089)
  AL_MUX u441 (
    .i0(instr_timer),
    .i1(1'b0),
    .sel(n274),
    .o(n400));  // ../src/picorv32.v(1089)
  AL_MUX u442 (
    .i0(is_slli_srli_srai),
    .i1(n347),
    .sel(n274),
    .o(n401));  // ../src/picorv32.v(1089)
  AL_MUX u443 (
    .i0(is_jalr_addi_slti_sltiu_xori_ori_andi),
    .i1(n350),
    .sel(n274),
    .o(n402));  // ../src/picorv32.v(1089)
  AL_MUX u444 (
    .i0(is_sll_srl_sra),
    .i1(n354),
    .sel(n274),
    .o(n403));  // ../src/picorv32.v(1089)
  AL_MUX u445 (
    .i0(n165),
    .i1(1'b0),
    .sel(n274),
    .o(n404));  // ../src/picorv32.v(1089)
  AL_MUX u446 (
    .i0(n169),
    .i1(1'b0),
    .sel(n274),
    .o(n405));  // ../src/picorv32.v(1089)
  or u447 (n441[28], reg_op1[28], reg_op2[28]);  // ../src/picorv32.v(1230)
  AL_MUX u448 (
    .i0(n263),
    .i1(1'b0),
    .sel(n407),
    .o(n408));  // ../src/picorv32.v(1119)
  AL_MUX u449 (
    .i0(n405),
    .i1(1'b0),
    .sel(n407),
    .o(n409));  // ../src/picorv32.v(1119)
  or u45 (n352, mem_state[0], mem_state[1]);  // ../src/picorv32.v(343)
  AL_MUX u450 (
    .i0(n360),
    .i1(1'b0),
    .sel(n407),
    .o(n410));  // ../src/picorv32.v(1119)
  AL_MUX u451 (
    .i0(n361),
    .i1(1'b0),
    .sel(n407),
    .o(n411));  // ../src/picorv32.v(1119)
  AL_MUX u452 (
    .i0(n362),
    .i1(1'b0),
    .sel(n407),
    .o(n412));  // ../src/picorv32.v(1119)
  AL_MUX u453 (
    .i0(n363),
    .i1(1'b0),
    .sel(n407),
    .o(n413));  // ../src/picorv32.v(1119)
  AL_MUX u454 (
    .i0(n364),
    .i1(1'b0),
    .sel(n407),
    .o(n414));  // ../src/picorv32.v(1119)
  AL_MUX u455 (
    .i0(n365),
    .i1(1'b0),
    .sel(n407),
    .o(n415));  // ../src/picorv32.v(1119)
  AL_MUX u456 (
    .i0(n374),
    .i1(1'b0),
    .sel(n407),
    .o(n416));  // ../src/picorv32.v(1119)
  AL_MUX u457 (
    .i0(n375),
    .i1(1'b0),
    .sel(n407),
    .o(n417));  // ../src/picorv32.v(1119)
  AL_MUX u458 (
    .i0(n376),
    .i1(1'b0),
    .sel(n407),
    .o(n418));  // ../src/picorv32.v(1119)
  AL_MUX u459 (
    .i0(n377),
    .i1(1'b0),
    .sel(n407),
    .o(n419));  // ../src/picorv32.v(1119)
  and u46 (n28, n26, n27);  // ../src/picorv32.v(345)
  AL_MUX u460 (
    .i0(n378),
    .i1(1'b0),
    .sel(n407),
    .o(n420));  // ../src/picorv32.v(1119)
  AL_MUX u461 (
    .i0(n379),
    .i1(1'b0),
    .sel(n407),
    .o(n421));  // ../src/picorv32.v(1119)
  AL_MUX u462 (
    .i0(n383),
    .i1(1'b0),
    .sel(n407),
    .o(n422));  // ../src/picorv32.v(1119)
  AL_MUX u463 (
    .i0(n384),
    .i1(1'b0),
    .sel(n407),
    .o(n423));  // ../src/picorv32.v(1119)
  AL_MUX u464 (
    .i0(n385),
    .i1(1'b0),
    .sel(n407),
    .o(n424));  // ../src/picorv32.v(1119)
  AL_MUX u465 (
    .i0(n386),
    .i1(1'b0),
    .sel(n407),
    .o(n425));  // ../src/picorv32.v(1119)
  AL_MUX u466 (
    .i0(n387),
    .i1(1'b0),
    .sel(n407),
    .o(n426));  // ../src/picorv32.v(1119)
  AL_MUX u467 (
    .i0(n388),
    .i1(1'b0),
    .sel(n407),
    .o(n427));  // ../src/picorv32.v(1119)
  AL_MUX u468 (
    .i0(n389),
    .i1(1'b0),
    .sel(n407),
    .o(n428));  // ../src/picorv32.v(1119)
  AL_MUX u469 (
    .i0(n390),
    .i1(1'b0),
    .sel(n407),
    .o(n429));  // ../src/picorv32.v(1119)
  or u47 (n29, n25, n28);  // ../src/picorv32.v(345)
  AL_MUX u470 (
    .i0(n391),
    .i1(1'b0),
    .sel(n407),
    .o(n430));  // ../src/picorv32.v(1119)
  AL_MUX u471 (
    .i0(n392),
    .i1(1'b0),
    .sel(n407),
    .o(n431));  // ../src/picorv32.v(1119)
  and u472 (n432, latched_store, latched_branch);  // ../src/picorv32.v(1166)
  not u473 (n435, alu_eq);  // ../src/picorv32.v(1209)
  not u474 (n436, alu_lts);  // ../src/picorv32.v(1211)
  not u475 (n437, alu_ltu);  // ../src/picorv32.v(1213)
  or u476 (n438, instr_xori, instr_xor);  // ../src/picorv32.v(1227)
  or u477 (n631, is_sb_sh_sw, is_beq_bne_blt_bge_bltu_bgeu);  // ../src/picorv32.v(1088)
  or u478 (n440, instr_ori, instr_or);  // ../src/picorv32.v(1229)
  xor u479 (n439[0], reg_op1[0], reg_op2[0]);  // ../src/picorv32.v(1228)
  and u48 (mem_la_read, resetn, n29);  // ../src/picorv32.v(345)
  or u480 (n442, instr_andi, instr_and);  // ../src/picorv32.v(1231)
  or u481 (n441[0], reg_op1[0], reg_op2[0]);  // ../src/picorv32.v(1230)
  buf u482 (pcpi_rs2[8], reg_op2[8]);  // ../src/picorv32.v(166)
  AL_MUX u483 (
    .i0(1'b0),
    .i1(clear_prefetched_high_word_q),
    .sel(prefetched_high_word),
    .o(n444));  // ../src/picorv32.v(1246)
  and u484 (n443[0], reg_op1[0], reg_op2[0]);  // ../src/picorv32.v(1232)
  or u485 (n446, latched_branch, n445);  // ../src/picorv32.v(1247)
  or u486 (n441[27], reg_op1[27], reg_op2[27]);  // ../src/picorv32.v(1230)
  or u487 (n447, n446, n407);  // ../src/picorv32.v(1247)
  AL_MUX u488 (
    .i0(n444),
    .i1(1'b1),
    .sel(n447),
    .o(clear_prefetched_high_word));  // ../src/picorv32.v(1248)
  not u489 (n501[2], compressed_instr);  // ../src/picorv32.v(1498)
  buf u49 (pcpi_rs2[1], reg_op2[1]);  // ../src/picorv32.v(166)
  not u490 (n451, latched_branch);  // ../src/picorv32.v(1273)
  and u491 (n452, latched_store, n451);  // ../src/picorv32.v(1273)
  or u492 (n445, irq_state[0], irq_state[1]);  // ../src/picorv32.v(1247)
  AL_MUX u493 (
    .i0(1'b0),
    .i1(n632),
    .sel(n663),
    .o(cpuregs_write));  // ../src/picorv32.v(1286)
  and u494 (n456, cpuregs_write, resetn);  // ../src/picorv32.v(1313)
  or u495 (n441[26], reg_op1[26], reg_op2[26]);  // ../src/picorv32.v(1230)
  or u496 (n632, n452, latched_branch);  // ../src/picorv32.v(1285)
  or u497 (n640, decoded_rs1[0], decoded_rs1[1]);  // ../src/picorv32.v(1328)
  or u498 (n441[25], reg_op1[25], reg_op2[25]);  // ../src/picorv32.v(1230)
  or u499 (n441[24], reg_op1[24], reg_op2[24]);  // ../src/picorv32.v(1230)
  and u5 (n1, n0, next_pc[1]);  // ../src/picorv32.v(326)
  not u50 (n407, resetn);  // ../src/picorv32.v(355)
  not u500 (n463, decoder_trigger);  // ../src/picorv32.v(1430)
  buf u501 (pcpi_rs2[15], reg_op2[15]);  // ../src/picorv32.v(166)
  buf u502 (pcpi_rs2[14], reg_op2[14]);  // ../src/picorv32.v(166)
  or u503 (n441[23], reg_op1[23], reg_op2[23]);  // ../src/picorv32.v(1230)
  or u504 (n441[22], reg_op1[22], reg_op2[22]);  // ../src/picorv32.v(1230)
  or u505 (n441[21], reg_op1[21], reg_op2[21]);  // ../src/picorv32.v(1230)
  or u506 (n441[20], reg_op1[20], reg_op2[20]);  // ../src/picorv32.v(1230)
  buf u507 (pcpi_rs2[17], reg_op2[17]);  // ../src/picorv32.v(166)
  not u508 (n505, instr_jalr);  // ../src/picorv32.v(1511)
  not u509 (n506, instr_retirq);  // ../src/picorv32.v(1511)
  buf u51 (pcpi_rs2[11], reg_op2[11]);  // ../src/picorv32.v(166)
  and u510 (n507, n505, n506);  // ../src/picorv32.v(1511)
  AL_MUX u511 (
    .i0(n507),
    .i1(mem_do_prefetch),
    .sel(instr_jal),
    .o(n509));  // ../src/picorv32.v(1513)
  AL_MUX u512 (
    .i0(n463),
    .i1(instr_jal),
    .sel(decoder_trigger),
    .o(n513));  // ../src/picorv32.v(1514)
  AL_MUX u513 (
    .i0(1'b0),
    .i1(instr_jal),
    .sel(decoder_trigger),
    .o(n514));  // ../src/picorv32.v(1514)
  AL_MUX u514 (
    .i0(mem_do_prefetch),
    .i1(n509),
    .sel(decoder_trigger),
    .o(n515));  // ../src/picorv32.v(1514)
  and u515 (n519, is_lb_lh_lw_lbu_lhu, n468);  // ../src/picorv32.v(1634)
  or u516 (n645, decoded_rs2[0], decoded_rs2[1]);  // ../src/picorv32.v(1329)
  or u517 (n646, is_sll_srl_sra, is_sb_sh_sw);  // ../src/picorv32.v(1690)
  AL_MUX u518 (
    .i0(latched_store),
    .i1(1'b1),
    .sel(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
    .o(n526));  // ../src/picorv32.v(1694)
  or u519 (n651, is_slli_srli_srai, n519);  // ../src/picorv32.v(1694)
  not u52 (n18, n351);  // ../src/picorv32.v(341)
  or u520 (n530, is_lui_auipc_jal, is_jalr_addi_slti_sltiu_xori_ori_andi);  // ../src/picorv32.v(1694)
  or u521 (n441[19], reg_op1[19], reg_op2[19]);  // ../src/picorv32.v(1230)
  or u522 (n441[18], reg_op1[18], reg_op2[18]);  // ../src/picorv32.v(1230)
  or u523 (n441[17], reg_op1[17], reg_op2[17]);  // ../src/picorv32.v(1230)
  AL_MUX u524 (
    .i0(n170),
    .i1(1'b0),
    .sel(alu_out_0),
    .o(n545));  // ../src/picorv32.v(1758)
  AL_MUX u525 (
    .i0(1'b1),
    .i1(alu_out_0),
    .sel(is_beq_bne_blt_bge_bltu_bgeu),
    .o(n547));  // ../src/picorv32.v(1764)
  AL_MUX u526 (
    .i0(instr_jalr),
    .i1(alu_out_0),
    .sel(is_beq_bne_blt_bge_bltu_bgeu),
    .o(n548));  // ../src/picorv32.v(1764)
  AL_MUX u527 (
    .i0(n170),
    .i1(n545),
    .sel(is_beq_bne_blt_bge_bltu_bgeu),
    .o(n550));  // ../src/picorv32.v(1764)
  AL_MUX u528 (
    .i0(1'b0),
    .i1(alu_out_0),
    .sel(is_beq_bne_blt_bge_bltu_bgeu),
    .o(n551));  // ../src/picorv32.v(1764)
  AL_MUX u529 (
    .i0(1'b1),
    .i1(latched_stalu),
    .sel(is_beq_bne_blt_bge_bltu_bgeu),
    .o(n552));  // ../src/picorv32.v(1764)
  not u53 (n33, mem_ready);  // ../src/picorv32.v(361)
  or u530 (n555, instr_slli, instr_sll);  // ../src/picorv32.v(1776)
  or u531 (n556, instr_srli, instr_srl);  // ../src/picorv32.v(1777)
  or u532 (n557, instr_srai, instr_sra);  // ../src/picorv32.v(1778)
  and u533 (n443[24], reg_op1[24], reg_op2[24]);  // ../src/picorv32.v(1232)
  or u534 (n441[16], reg_op1[16], reg_op2[16]);  // ../src/picorv32.v(1230)
  or u535 (n441[15], reg_op1[15], reg_op2[15]);  // ../src/picorv32.v(1230)
  or u536 (n441[14], reg_op1[14], reg_op2[14]);  // ../src/picorv32.v(1230)
  AL_MUX u537 (
    .i0(mem_do_rinst),
    .i1(mem_do_prefetch),
    .sel(n553),
    .o(n568));  // ../src/picorv32.v(1789)
  not u538 (n572, mem_do_prefetch);  // ../src/picorv32.v(1795)
  or u539 (n597, n572, mem_done);  // ../src/picorv32.v(1795)
  and u54 (n34, mem_valid, n33);  // ../src/picorv32.v(361)
  not u540 (n574, mem_do_wdata);  // ../src/picorv32.v(1796)
  buf u541 (pcpi_rs1[31], reg_op1[31]);  // ../src/picorv32.v(165)
  buf u542 (pcpi_rs1[30], reg_op1[30]);  // ../src/picorv32.v(165)
  buf u543 (pcpi_rs1[29], reg_op1[29]);  // ../src/picorv32.v(165)
  or u544 (n441[13], reg_op1[13], reg_op2[13]);  // ../src/picorv32.v(1230)
  and u545 (n580, n572, mem_done);  // ../src/picorv32.v(1810)
  AL_MUX u546 (
    .i0(n170),
    .i1(1'b1),
    .sel(n580),
    .o(n582));  // ../src/picorv32.v(1814)
  AL_MUX u547 (
    .i0(1'b0),
    .i1(n574),
    .sel(n597),
    .o(n585));  // ../src/picorv32.v(1815)
  and u548 (n443[27], reg_op1[27], reg_op2[27]);  // ../src/picorv32.v(1232)
  and u549 (n443[28], reg_op1[28], reg_op2[28]);  // ../src/picorv32.v(1232)
  AL_MUX u55 (
    .i0(n3),
    .i1(1'b0),
    .sel(n407),
    .o(n35));  // ../src/picorv32.v(362)
  and u550 (n443[29], reg_op1[29], reg_op2[29]);  // ../src/picorv32.v(1232)
  or u551 (n441[12], reg_op1[12], reg_op2[12]);  // ../src/picorv32.v(1230)
  or u552 (n441[11], reg_op1[11], reg_op2[11]);  // ../src/picorv32.v(1230)
  or u553 (n441[10], reg_op1[10], reg_op2[10]);  // ../src/picorv32.v(1230)
  or u554 (n599, instr_lb, instr_lbu);  // ../src/picorv32.v(1824)
  or u555 (n600, instr_lh, instr_lhu);  // ../src/picorv32.v(1825)
  buf u556 (pcpi_rs1[28], reg_op1[28]);  // ../src/picorv32.v(165)
  buf u557 (pcpi_rs1[27], reg_op1[27]);  // ../src/picorv32.v(165)
  buf u558 (pcpi_rs1[26], reg_op1[26]);  // ../src/picorv32.v(165)
  or u559 (n441[9], reg_op1[9], reg_op2[9]);  // ../src/picorv32.v(1230)
  AL_MUX u56 (
    .i0(n34),
    .i1(1'b0),
    .sel(n407),
    .o(n36));  // ../src/picorv32.v(362)
  AL_MUX u560 (
    .i0(latched_is_lu),
    .i1(is_lbu_lhu_lw),
    .sel(n598),
    .o(n635));  // ../src/picorv32.v(1837)
  AL_MUX u561 (
    .i0(latched_is_lh),
    .i1(instr_lh),
    .sel(n598),
    .o(n636));  // ../src/picorv32.v(1837)
  AL_MUX u562 (
    .i0(latched_is_lb),
    .i1(instr_lb),
    .sel(n598),
    .o(n637));  // ../src/picorv32.v(1837)
  or u563 (n441[8], reg_op1[8], reg_op2[8]);  // ../src/picorv32.v(1230)
  or u564 (n441[7], reg_op1[7], reg_op2[7]);  // ../src/picorv32.v(1230)
  buf u565 (pcpi_rs1[25], reg_op1[25]);  // ../src/picorv32.v(165)
  buf u566 (pcpi_rs1[24], reg_op1[24]);  // ../src/picorv32.v(165)
  buf u567 (pcpi_rs1[23], reg_op1[23]);  // ../src/picorv32.v(165)
  or u568 (n441[6], reg_op1[6], reg_op2[6]);  // ../src/picorv32.v(1230)
  or u569 (n441[5], reg_op1[5], reg_op2[5]);  // ../src/picorv32.v(1230)
  not u57 (n135[0], n10);  // ../src/picorv32.v(581)
  and u570 (n443[22], reg_op1[22], reg_op2[22]);  // ../src/picorv32.v(1232)
  AL_MUX u571 (
    .i0(latched_is_lu),
    .i1(n635),
    .sel(n597),
    .o(n653));  // ../src/picorv32.v(1849)
  AL_MUX u572 (
    .i0(latched_is_lh),
    .i1(n636),
    .sel(n597),
    .o(n654));  // ../src/picorv32.v(1849)
  AL_MUX u573 (
    .i0(latched_is_lb),
    .i1(n637),
    .sel(n597),
    .o(n655));  // ../src/picorv32.v(1849)
  and u574 (n443[23], reg_op1[23], reg_op2[23]);  // ../src/picorv32.v(1232)
  AL_MUX u575 (
    .i0(1'b0),
    .i1(n598),
    .sel(n597),
    .o(n657));  // ../src/picorv32.v(1849)
  AL_MUX u576 (
    .i0(n170),
    .i1(n582),
    .sel(n597),
    .o(n659));  // ../src/picorv32.v(1849)
  AL_MUX u577 (
    .i0(1'b0),
    .i1(n580),
    .sel(n597),
    .o(n660));  // ../src/picorv32.v(1849)
  or u578 (n441[4], reg_op1[4], reg_op2[4]);  // ../src/picorv32.v(1230)
  or u579 (n448, is_rdcycle_rdcycleh_rdinstr_rdinstrh, instr_trap);  // ../src/picorv32.v(1694)
  and u58 (n27, mem_rdata_latched[0], mem_rdata_latched[1]);  // ../src/picorv32.v(345)
  or u580 (n684, n669, n668);  // ../src/picorv32.v(1851)
  or u581 (n676, n667, n669);  // ../src/picorv32.v(1851)
  or u582 (n686, n665, n662);  // ../src/picorv32.v(1851)
  or u583 (n441[3], reg_op1[3], reg_op2[3]);  // ../src/picorv32.v(1230)
  or u584 (n594, n668, n667);  // ../src/picorv32.v(1851)
  or u585 (n441[2], reg_op1[2], reg_op2[2]);  // ../src/picorv32.v(1230)
  or u586 (n441[1], reg_op1[1], reg_op2[1]);  // ../src/picorv32.v(1230)
  AL_MUX u587 (
    .i0(latched_compr),
    .i1(compressed_instr),
    .sel(n663),
    .o(n689));  // ../src/picorv32.v(1851)
  buf u588 (pcpi_rs1[22], reg_op1[22]);  // ../src/picorv32.v(165)
  AL_MUX u589 (
    .i0(mem_do_prefetch),
    .i1(n515),
    .sel(n663),
    .o(n691));  // ../src/picorv32.v(1851)
  not u59 (n353, reg_op1[0]);  // ../src/picorv32.v(383)
  buf u590 (pcpi_rs1[21], reg_op1[21]);  // ../src/picorv32.v(165)
  buf u591 (pcpi_rs1[20], reg_op1[20]);  // ../src/picorv32.v(165)
  buf u592 (pcpi_rs1[19], reg_op1[19]);  // ../src/picorv32.v(165)
  buf u593 (pcpi_rs1[18], reg_op1[18]);  // ../src/picorv32.v(165)
  buf u594 (pcpi_rs1[17], reg_op1[17]);  // ../src/picorv32.v(165)
  or u595 (n589, n667, n666);  // ../src/picorv32.v(1851)
  AL_MUX u596 (
    .i0(1'b0),
    .i1(n551),
    .sel(n666),
    .o(n699));  // ../src/picorv32.v(1851)
  AL_MUX u597 (
    .i0(1'b0),
    .i1(n585),
    .sel(n668),
    .o(n700));  // ../src/picorv32.v(1851)
  or u598 (n592, n667, n665);  // ../src/picorv32.v(1851)
  AL_MUX u599 (
    .i0(1'b0),
    .i1(n657),
    .sel(n669),
    .o(n703));  // ../src/picorv32.v(1851)
  not u6 (n2, mem_la_secondword);  // ../src/picorv32.v(326)
  not u60 (n21, n352);  // ../src/picorv32.v(343)
  AL_MUX u600 (
    .i0(n677),
    .i1(1'b0),
    .sel(n407),
    .o(n707));  // ../src/picorv32.v(1851)
  AL_MUX u601 (
    .i0(n679),
    .i1(1'b0),
    .sel(n407),
    .o(n708));  // ../src/picorv32.v(1851)
  AL_MUX u602 (
    .i0(n681),
    .i1(1'b0),
    .sel(n407),
    .o(n709));  // ../src/picorv32.v(1851)
  buf u603 (pcpi_rs1[16], reg_op1[16]);  // ../src/picorv32.v(165)
  AL_MUX u604 (
    .i0(n683),
    .i1(1'b0),
    .sel(n407),
    .o(n710));  // ../src/picorv32.v(1851)
  AL_MUX u605 (
    .i0(n685),
    .i1(1'b0),
    .sel(n407),
    .o(n711));  // ../src/picorv32.v(1851)
  AL_MUX u606 (
    .i0(n687),
    .i1(1'b0),
    .sel(n407),
    .o(n712));  // ../src/picorv32.v(1851)
  AL_MUX u607 (
    .i0(pcpi_valid),
    .i1(1'b0),
    .sel(n407),
    .o(n713));  // ../src/picorv32.v(1851)
  buf u608 (pcpi_rs1[15], reg_op1[15]);  // ../src/picorv32.v(165)
  buf u609 (pcpi_rs1[14], reg_op1[14]);  // ../src/picorv32.v(165)
  and u61 (n43, mem_done, n0);  // ../src/picorv32.v(400)
  buf u610 (pcpi_rs1[13], reg_op1[13]);  // ../src/picorv32.v(165)
  buf u611 (pcpi_rs1[12], reg_op1[12]);  // ../src/picorv32.v(165)
  buf u612 (pcpi_rs1[11], reg_op1[11]);  // ../src/picorv32.v(165)
  buf u613 (pcpi_rs1[10], reg_op1[10]);  // ../src/picorv32.v(165)
  AL_MUX u614 (
    .i0(n662),
    .i1(1'b0),
    .sel(n407),
    .o(n717));  // ../src/picorv32.v(1851)
  AL_MUX u615 (
    .i0(n671),
    .i1(mem_do_rinst),
    .sel(n407),
    .o(n718));  // ../src/picorv32.v(1851)
  AL_MUX u616 (
    .i0(n689),
    .i1(latched_compr),
    .sel(n407),
    .o(n721));  // ../src/picorv32.v(1851)
  AL_MUX u617 (
    .i0(n691),
    .i1(mem_do_prefetch),
    .sel(n407),
    .o(n722));  // ../src/picorv32.v(1851)
  buf u618 (pcpi_rs1[9], reg_op1[9]);  // ../src/picorv32.v(165)
  buf u619 (pcpi_rs1[8], reg_op1[8]);  // ../src/picorv32.v(165)
  and u62 (n443[21], reg_op1[21], reg_op2[21]);  // ../src/picorv32.v(1232)
  buf u620 (pcpi_rs1[7], reg_op1[7]);  // ../src/picorv32.v(165)
  buf u621 (pcpi_rs1[6], reg_op1[6]);  // ../src/picorv32.v(165)
  AL_MUX u622 (
    .i0(n698),
    .i1(n170),
    .sel(n407),
    .o(n727));  // ../src/picorv32.v(1851)
  AL_MUX u623 (
    .i0(n699),
    .i1(1'b0),
    .sel(n407),
    .o(n728));  // ../src/picorv32.v(1851)
  AL_MUX u624 (
    .i0(n700),
    .i1(1'b0),
    .sel(n407),
    .o(n729));  // ../src/picorv32.v(1851)
  AL_MUX u625 (
    .i0(n702),
    .i1(1'b0),
    .sel(n407),
    .o(n730));  // ../src/picorv32.v(1851)
  AL_MUX u626 (
    .i0(n703),
    .i1(1'b0),
    .sel(n407),
    .o(n731));  // ../src/picorv32.v(1851)
  or u627 (n732, mem_do_rdata, mem_do_wdata);  // ../src/picorv32.v(1853)
  and u628 (n733, resetn, n732);  // ../src/picorv32.v(1853)
  and u629 (n736, n734, n735);  // ../src/picorv32.v(1854)
  and u63 (n443[25], reg_op1[25], reg_op2[25]);  // ../src/picorv32.v(1232)
  and u630 (n740, n738, n739);  // ../src/picorv32.v(1861)
  and u631 (n743, resetn, mem_do_rinst);  // ../src/picorv32.v(1869)
  and u632 (n744, n743, reg_pc[0]);  // ../src/picorv32.v(1869)
  and u633 (n443[31], reg_op1[31], reg_op2[31]);  // ../src/picorv32.v(1232)
  or u634 (n747, n407, mem_done);  // ../src/picorv32.v(1880)
  AL_MUX u635 (
    .i0(n722),
    .i1(1'b0),
    .sel(n747),
    .o(n748));  // ../src/picorv32.v(1885)
  AL_MUX u636 (
    .i0(n718),
    .i1(1'b0),
    .sel(n747),
    .o(n749));  // ../src/picorv32.v(1885)
  AL_MUX u637 (
    .i0(mem_do_rdata),
    .i1(1'b0),
    .sel(n747),
    .o(n750));  // ../src/picorv32.v(1885)
  AL_MUX u638 (
    .i0(mem_do_wdata),
    .i1(1'b0),
    .sel(n747),
    .o(n751));  // ../src/picorv32.v(1885)
  AL_MUX u639 (
    .i0(n749),
    .i1(1'b1),
    .sel(n728),
    .o(n752));  // ../src/picorv32.v(1888)
  AL_MUX u64 (
    .i0(n353),
    .i1(1'b0),
    .sel(reg_op1[1]),
    .o(n40[0]));  // ../src/picorv32.v(383)
  AL_MUX u640 (
    .i0(n750),
    .i1(1'b1),
    .sel(n731),
    .o(n753));  // ../src/picorv32.v(1890)
  AL_MUX u641 (
    .i0(n751),
    .i1(1'b1),
    .sel(n729),
    .o(n754));  // ../src/picorv32.v(1892)
  buf u642 (pcpi_rs1[5], reg_op1[5]);  // ../src/picorv32.v(165)
  buf u643 (pcpi_rs1[4], reg_op1[4]);  // ../src/picorv32.v(165)
  buf u644 (pcpi_rs1[3], reg_op1[3]);  // ../src/picorv32.v(165)
  buf u645 (pcpi_rs1[2], reg_op1[2]);  // ../src/picorv32.v(165)
  buf u646 (pcpi_rs1[1], reg_op1[1]);  // ../src/picorv32.v(165)
  buf u647 (pcpi_rs2[31], reg_op2[31]);  // ../src/picorv32.v(166)
  buf u648 (pcpi_rs2[30], reg_op2[30]);  // ../src/picorv32.v(166)
  buf u649 (pcpi_rs2[29], reg_op2[29]);  // ../src/picorv32.v(166)
  or u65 (n701, n46, n593);  // ../src/picorv32.v(1851)
  buf u650 (pcpi_rs2[28], reg_op2[28]);  // ../src/picorv32.v(166)
  buf u651 (pcpi_rs2[27], reg_op2[27]);  // ../src/picorv32.v(166)
  buf u652 (pcpi_rs2[26], reg_op2[26]);  // ../src/picorv32.v(166)
  buf u653 (pcpi_rs2[25], reg_op2[25]);  // ../src/picorv32.v(166)
  buf u654 (pcpi_rs2[24], reg_op2[24]);  // ../src/picorv32.v(166)
  buf u655 (pcpi_rs2[16], reg_op2[16]);  // ../src/picorv32.v(166)
  buf u656 (pcpi_rs2[7], reg_op2[7]);  // ../src/picorv32.v(166)
  buf u657 (pcpi_rs2[23], reg_op2[23]);  // ../src/picorv32.v(166)
  buf u658 (pcpi_rs2[22], reg_op2[22]);  // ../src/picorv32.v(166)
  buf u659 (pcpi_rs2[21], reg_op2[21]);  // ../src/picorv32.v(166)
  AL_MUX u66 (
    .i0(reg_op1[0]),
    .i1(1'b0),
    .sel(reg_op1[1]),
    .o(n40[1]));  // ../src/picorv32.v(383)
  buf u660 (pcpi_rs2[20], reg_op2[20]);  // ../src/picorv32.v(166)
  buf u661 (pcpi_rs2[19], reg_op2[19]);  // ../src/picorv32.v(166)
  buf u662 (pcpi_rs2[18], reg_op2[18]);  // ../src/picorv32.v(166)
  not u663 (n38[0], reg_op1[1]);  // ../src/picorv32.v(375)
  and u664 (n443[30], reg_op1[30], reg_op2[30]);  // ../src/picorv32.v(1232)
  or u67 (n591, n663, n662);  // ../src/picorv32.v(1851)
  AL_MUX u68 (
    .i0(1'b0),
    .i1(n353),
    .sel(reg_op1[1]),
    .o(n40[2]));  // ../src/picorv32.v(383)
  or u69 (n590, n664, n591);  // ../src/picorv32.v(1851)
  and u7 (mem_la_firstword, n1, n2);  // ../src/picorv32.v(326)
  and u70 (n443[26], reg_op1[26], reg_op2[26]);  // ../src/picorv32.v(1232)
  or u71 (n50, n99, n44);  // ../src/picorv32.v(416)
  AL_MUX u72 (
    .i0(1'b0),
    .i1(reg_op1[0]),
    .sel(reg_op1[1]),
    .o(n40[3]));  // ../src/picorv32.v(383)
  and u73 (n443[18], reg_op1[18], reg_op2[18]);  // ../src/picorv32.v(1232)
  and u74 (n443[19], reg_op1[19], reg_op2[19]);  // ../src/picorv32.v(1232)
  and u75 (n443[20], reg_op1[20], reg_op2[20]);  // ../src/picorv32.v(1232)
  or u76 (n697, n592, n590);  // ../src/picorv32.v(1851)
  buf u77 (mem_la_wdata[7], reg_op2[7]);  // ../src/picorv32.v(392)
  buf u78 (mem_la_wdata[6], reg_op2[6]);  // ../src/picorv32.v(392)
  and u79 (n74, n72, n73);  // ../src/picorv32.v(483)
  buf u8 (pcpi_rs2[13], reg_op2[13]);  // ../src/picorv32.v(166)
  or u80 (n633, decoded_rs1[2], n639);  // ../src/picorv32.v(1328)
  or u81 (n457, n640, n633);  // ../src/picorv32.v(1328)
  not u82 (n454, n632);  // ../src/picorv32.v(1285)
  or u83 (n588, n668, n589);  // ../src/picorv32.v(1851)
  or u84 (n587, n664, n662);  // ../src/picorv32.v(1851)
  or u85 (n586, n665, n587);  // ../src/picorv32.v(1851)
  or u86 (n682, n588, n586);  // ../src/picorv32.v(1851)
  and u87 (n443[1], reg_op1[1], reg_op2[1]);  // ../src/picorv32.v(1232)
  or u88 (n650, is_jalr_addi_slti_sltiu_xori_ori_andi, n651);  // ../src/picorv32.v(1694)
  or u89 (n649, is_rdcycle_rdcycleh_rdinstr_rdinstrh, instr_trap);  // ../src/picorv32.v(1694)
  AL_MUX u9 (
    .i0(mem_la_firstword),
    .i1(mem_la_firstword_reg),
    .sel(last_mem_valid),
    .o(n3));  // ../src/picorv32.v(327)
  buf u90 (mem_la_wdata[5], reg_op2[5]);  // ../src/picorv32.v(392)
  and u91 (n80, n72, n79);  // ../src/picorv32.v(487)
  and u92 (n443[2], reg_op1[2], reg_op2[2]);  // ../src/picorv32.v(1232)
  and u93 (n443[3], reg_op1[3], reg_op2[3]);  // ../src/picorv32.v(1232)
  and u94 (n443[4], reg_op1[4], reg_op2[4]);  // ../src/picorv32.v(1232)
  and u95 (n443[5], reg_op1[5], reg_op2[5]);  // ../src/picorv32.v(1232)
  or u96 (n648, is_lui_auipc_jal, n649);  // ../src/picorv32.v(1694)
  or u97 (n647, n650, n648);  // ../src/picorv32.v(1694)
  and u98 (n86, n84, n85);  // ../src/picorv32.v(491)
  buf u99 (mem_la_wdata[4], reg_op2[4]);  // ../src/picorv32.v(392)

endmodule 

module reg_ar_as_w2
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [1:0] d;
  input en;
  input [1:0] reset;
  input [1:0] set;
  output [1:0] q;



endmodule 

module reg_ar_as_w8
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [7:0] d;
  input en;
  input [7:0] reset;
  input [7:0] set;
  output [7:0] q;



endmodule 

module simple_uart  // ../src/uart.v(1)
  (
  addr_i,
  clk_i,
  data_i,
  rst_i,
  rxd_i,
  sel_i,
  we_i,
  data_o,
  txd_o
  );

  input [1:0] addr_i;  // ../src/uart.v(21)
  input clk_i;  // ../src/uart.v(10)
  input [31:0] data_i;  // ../src/uart.v(22)
  input rst_i;  // ../src/uart.v(11)
  input rxd_i;  // ../src/uart.v(13)
  input sel_i;  // ../src/uart.v(14)
  input we_i;  // ../src/uart.v(24)
  output [31:0] data_o;  // ../src/uart.v(23)
  output txd_o;  // ../src/uart.v(12)

  wire [7:0] n10;
  wire [3:0] n100;
  wire [3:0] n101;
  wire [2:0] n102;
  wire [7:0] n103;
  wire [7:0] n106;
  wire [3:0] n107;
  wire [3:0] n108;
  wire [2:0] n109;
  wire [7:0] n110;
  wire [7:0] n113;
  wire [31:0] n13;
  wire [7:0] n14;
  wire [31:0] n16;
  wire [31:0] n18;
  wire [7:0] n19;
  wire [31:0] n21;
  wire [31:0] n23;
  wire [7:0] n24;
  wire [31:0] n26;
  wire [7:0] n28;
  wire [3:0] n31;
  wire [3:0] n32;
  wire [4:0] n33;
  wire [3:0] n35;
  wire [3:0] n36;
  wire [3:0] n37;
  wire [3:0] n38;
  wire [3:0] n4;
  wire [3:0] n40;
  wire [7:0] n45;
  wire [2:0] n46;
  wire [3:0] n47;
  wire [3:0] n48;
  wire [3:0] n49;
  wire [31:0] n5;
  wire [3:0] n50;
  wire [3:0] n53;
  wire [3:0] n54;
  wire [3:0] n55;
  wire [4:0] n57;
  wire [7:0] n59;
  wire [31:0] n6;
  wire [1:0] n61;
  wire [1:0] n63;
  wire [1:0] n65;
  wire [1:0] n67;
  wire [1:0] n69;
  wire [2:0] n7;
  wire [1:0] n71;
  wire [1:0] n73;
  wire [1:0] n75;
  wire [7:0] n76;
  wire [3:0] n77;
  wire [7:0] n78;
  wire [3:0] n79;
  wire [3:0] n80;
  wire [3:0] n81;
  wire [3:0] n92;
  wire [7:0] n93;
  wire [31:0] uart_bsrr;  // ../src/uart.v(28)
  wire [2:0] uart_cnt_rx;  // ../src/uart.v(151)
  wire [31:0] uart_counter;  // ../src/uart.v(30)
  wire [7:0] uart_idr;  // ../src/uart.v(27)
  wire [7:0] uart_idr_t;  // ../src/uart.v(153)
  wire [7:0] uart_odr;  // ../src/uart.v(26)
  wire [2:0] uart_op_clock_by_3_c;  // ../src/uart.v(35)
  wire [3:0] uart_smp_rx;  // ../src/uart.v(152)
  wire [7:0] uart_sr;  // ../src/uart.v(42)
  wire [3:0] uart_status_rxd;  // ../src/uart.v(148)
  wire [3:0] uart_status_txd;  // ../src/uart.v(32)
  wire n0;
  wire n1;
  wire n104;
  wire n105;
  wire n11;
  wire n111;
  wire n112;
  wire n12;
  wire n15;
  wire n17;
  wire n2;
  wire n20;
  wire n22;
  wire n25;
  wire n27;
  wire n29;
  wire n3;
  wire n30;
  wire n34;
  wire n39;
  wire n41;
  wire n42;
  wire n43;
  wire n44;
  wire n51;
  wire n52;
  wire n56;
  wire n58;
  wire n60;
  wire n62;
  wire n64;
  wire n66;
  wire n68;
  wire n70;
  wire n72;
  wire n74;
  wire n8;
  wire n82;
  wire n83;
  wire n84;
  wire n85;
  wire n86;
  wire n87;
  wire n88;
  wire n89;
  wire n9;
  wire n90;
  wire n91;
  wire n94;
  wire n95;
  wire n96;
  wire n97;
  wire n98;
  wire n99;
  wire uart_op_clock;  // ../src/uart.v(34)
  wire uart_op_clock_by_3;  // ../src/uart.v(37)
  wire uart_status_fe;  // ../src/uart.v(39)
  wire uart_status_rx;  // ../src/uart.v(40)
  wire uart_status_rx_clr;  // ../src/uart.v(156)
  wire uart_trigger_tx;  // ../src/uart.v(44)

  add_pu32_pu32_o32 add0 (
    .i0(uart_counter),
    .i1(32'b00000000000000000000000000000001),
    .o(n5));  // ../src/uart.v(68)
  add_pu4_pu4_o4 add1 (
    .i0(uart_status_txd),
    .i1(4'b0001),
    .o(n35));  // ../src/uart.v(133)
  add_pu4_pu4_o4 add2 (
    .i0(uart_smp_rx),
    .i1(4'b0001),
    .o(n49));  // ../src/uart.v(194)
  add_pu4_pu4_o4 add3 (
    .i0(uart_status_rxd),
    .i1(4'b0001),
    .o(n77));  // ../src/uart.v(231)
  eq_w4 eq0 (
    .i0(uart_status_txd),
    .i1(4'b0000),
    .o(n9));  // ../src/uart.v(80)
  eq_w3 eq1 (
    .i0(uart_cnt_rx),
    .i1(3'b100),
    .o(n51));  // ../src/uart.v(197)
  eq_w3 eq2 (
    .i0(uart_cnt_rx),
    .i1(3'b010),
    .o(n90));  // ../src/uart.v(241)
  lt_u32_u32 lt0 (
    .ci(1'b1),
    .i0(uart_bsrr),
    .i1(uart_counter),
    .o(n2));  // ../src/uart.v(59)
  lt_u4_u4 lt1 (
    .ci(1'b1),
    .i0(4'b0010),
    .i1(uart_smp_rx),
    .o(n52));  // ../src/uart.v(200)
  binary_mux_s1_w4 mux0 (
    .i0(4'b0001),
    .i1({uart_op_clock_by_3_c,1'b0}),
    .sel(n3),
    .o({open_n0,n4[2:0]}));  // ../src/uart.v(63)
  binary_mux_s1_w32 mux1 (
    .i0(n5),
    .i1(32'b00000000000000000000000000000000),
    .sel(n2),
    .o(n6));  // ../src/uart.v(69)
  binary_mux_s1_w8 mux10 (
    .i0(uart_odr),
    .i1(n14),
    .sel(we_i),
    .o(n19));  // ../src/uart.v(100)
  binary_mux_s1_w32 mux11 (
    .i0(n16),
    .i1(data_o),
    .sel(we_i),
    .o(n21));  // ../src/uart.v(100)
  binary_mux_s1_w32 mux12 (
    .i0(uart_bsrr),
    .i1(n18),
    .sel(sel_i),
    .o(n23));  // ../src/uart.v(101)
  binary_mux_s1_w8 mux13 (
    .i0(uart_odr),
    .i1(n19),
    .sel(sel_i),
    .o(n24));  // ../src/uart.v(101)
  binary_mux_s1_w32 mux14 (
    .i0(data_o),
    .i1(n21),
    .sel(sel_i),
    .o(n26));  // ../src/uart.v(101)
  binary_mux_s1_w8 mux15 (
    .i0(n24),
    .i1(uart_odr),
    .sel(n1),
    .o(n28));  // ../src/uart.v(102)
  binary_mux_s3_w1 mux16 (
    .i0(uart_odr[0]),
    .i1(uart_odr[1]),
    .i2(uart_odr[2]),
    .i3(uart_odr[3]),
    .i4(uart_odr[4]),
    .i5(uart_odr[5]),
    .i6(uart_odr[6]),
    .i7(uart_odr[7]),
    .sel(n33[2:0]),
    .o(n34));  // ../src/uart.v(131)
  binary_mux_s4_w4 mux17 (
    .i0(n31),
    .i1(n32),
    .i10(n37),
    .i11(4'b0000),
    .i12(4'b0000),
    .i13(4'b0000),
    .i14(4'b0000),
    .i15(4'b0000),
    .i2(n36),
    .i3(n36),
    .i4(n36),
    .i5(n36),
    .i6(n36),
    .i7(n36),
    .i8(n36),
    .i9(n36),
    .sel(uart_status_txd),
    .o(n38));  // ../src/uart.v(143)
  binary_mux_s4_w1 mux18 (
    .i0(txd_o),
    .i1(1'b0),
    .i10(1'b1),
    .i11(txd_o),
    .i12(txd_o),
    .i13(txd_o),
    .i14(txd_o),
    .i15(txd_o),
    .i2(n34),
    .i3(n34),
    .i4(n34),
    .i5(n34),
    .i6(n34),
    .i7(n34),
    .i8(n34),
    .i9(n34),
    .sel(uart_status_txd),
    .o(n39));  // ../src/uart.v(143)
  binary_mux_s1_w4 mux19 (
    .i0(uart_status_txd),
    .i1(n38),
    .sel(n30),
    .o(n40));  // ../src/uart.v(144)
  binary_mux_s1_w3 mux2 (
    .i0(uart_op_clock_by_3_c),
    .i1(n4[2:0]),
    .sel(n2),
    .o(n7));  // ../src/uart.v(69)
  binary_mux_s1_w8 mux20 (
    .i0(uart_idr_t),
    .i1(8'b00000000),
    .sel(n44),
    .o(n45));  // ../src/uart.v(188)
  binary_mux_s1_w3 mux21 (
    .i0(uart_cnt_rx),
    .i1(3'b010),
    .sel(n44),
    .o(n46));  // ../src/uart.v(188)
  binary_mux_s1_w4 mux22 (
    .i0(uart_smp_rx),
    .i1(4'b0001),
    .sel(n44),
    .o(n47));  // ../src/uart.v(188)
  binary_mux_s1_w4 mux23 (
    .i0(uart_status_rxd),
    .i1(4'b0001),
    .sel(n44),
    .o(n48));  // ../src/uart.v(188)
  binary_mux_s1_w4 mux24 (
    .i0(n49),
    .i1(uart_smp_rx),
    .sel(rxd_i),
    .o(n50));  // ../src/uart.v(195)
  binary_mux_s1_w4 mux25 (
    .i0(n50),
    .i1({3'b000,n44}),
    .sel(n52),
    .o(n53));  // ../src/uart.v(207)
  binary_mux_s1_w4 mux26 (
    .i0(4'b0001),
    .i1({uart_cnt_rx,1'b0}),
    .sel(n56),
    .o({open_n1,n81[2:0]}));  // ../src/uart.v(209)
  binary_mux_s1_w2 mux27 (
    .i0({uart_idr_t[6],uart_idr_t[6]}),
    .i1(2'b10),
    .sel(n62),
    .o(n63));  // ../src/uart.v(227)
  binary_mux_s1_w2 mux28 (
    .i0({uart_idr_t[5],uart_idr_t[5]}),
    .i1(2'b10),
    .sel(n64),
    .o(n65));  // ../src/uart.v(227)
  binary_mux_s1_w2 mux29 (
    .i0({uart_idr_t[4],uart_idr_t[4]}),
    .i1(2'b10),
    .sel(n66),
    .o(n67));  // ../src/uart.v(227)
  binary_mux_s1_w8 mux3 (
    .i0(uart_odr),
    .i1(data_i[7:0]),
    .sel(n9),
    .o(n10));  // ../src/uart.v(84)
  binary_mux_s1_w2 mux30 (
    .i0({uart_idr_t[3],uart_idr_t[3]}),
    .i1(2'b10),
    .sel(n68),
    .o(n69));  // ../src/uart.v(227)
  binary_mux_s1_w2 mux31 (
    .i0({uart_idr_t[2],uart_idr_t[2]}),
    .i1(2'b10),
    .sel(n70),
    .o(n71));  // ../src/uart.v(227)
  binary_mux_s1_w2 mux32 (
    .i0({uart_idr_t[1],uart_idr_t[1]}),
    .i1(2'b10),
    .sel(n72),
    .o(n73));  // ../src/uart.v(227)
  binary_mux_s1_w2 mux33 (
    .i0({uart_idr_t[0],uart_idr_t[0]}),
    .i1(2'b10),
    .sel(n74),
    .o(n75));  // ../src/uart.v(227)
  binary_mux_s1_w8 mux34 (
    .i0({n61[1],n63[1],n65[1],n67[1],n69[1],n71[1],n73[1],n75[1]}),
    .i1({n61[0],n63[0],n65[0],n67[0],n69[0],n71[0],n73[0],n75[0]}),
    .sel(n52),
    .o(n76));  // ../src/uart.v(229)
  binary_mux_s1_w8 mux35 (
    .i0(uart_idr_t),
    .i1(n76),
    .sel(n51),
    .o(n78));  // ../src/uart.v(232)
  binary_mux_s1_w2 mux36 (
    .i0({uart_idr_t[7],uart_idr_t[7]}),
    .i1(2'b10),
    .sel(n60),
    .o(n61));  // ../src/uart.v(227)
  binary_mux_s1_w8 mux37 (
    .i0({n50,n50}),
    .i1({3'b000,n44,n53}),
    .sel(n51),
    .o({n79,n55}));  // ../src/uart.v(232)
  binary_mux_s1_w4 mux38 (
    .i0(uart_status_rxd),
    .i1(4'b0000),
    .sel(n90),
    .o(n92));  // ../src/uart.v(256)
  binary_mux_s1_w8 mux39 (
    .i0(uart_idr),
    .i1(uart_idr_t),
    .sel(n90),
    .o(n93));  // ../src/uart.v(256)
  binary_mux_s2_w1 mux4 (
    .i0(1'b0),
    .i1(1'b0),
    .i2(1'b0),
    .i3(1'b1),
    .sel(addr_i),
    .o(n12));  // ../src/uart.v(89)
  binary_mux_s1_w8 mux40 (
    .i0({uart_status_rxd,uart_status_rxd}),
    .i1({n77,2'b00,n52,1'b0}),
    .sel(n51),
    .o({n80,n54}));  // ../src/uart.v(232)
  binary_mux_s4_w4 mux41 (
    .i0(n48),
    .i1(n54),
    .i10(n92),
    .i11(4'b0000),
    .i12(4'b0000),
    .i13(4'b0000),
    .i14(4'b0000),
    .i15(4'b0000),
    .i2(n80),
    .i3(n80),
    .i4(n80),
    .i5(n80),
    .i6(n80),
    .i7(n80),
    .i8(n80),
    .i9(n80),
    .sel(uart_status_rxd),
    .o(n100));  // ../src/uart.v(261)
  binary_mux_s4_w4 mux42 (
    .i0(n47),
    .i1(n55),
    .i10(n50),
    .i11(uart_smp_rx),
    .i12(uart_smp_rx),
    .i13(uart_smp_rx),
    .i14(uart_smp_rx),
    .i15(uart_smp_rx),
    .i2(n79),
    .i3(n79),
    .i4(n79),
    .i5(n79),
    .i6(n79),
    .i7(n79),
    .i8(n79),
    .i9(n79),
    .sel(uart_status_rxd),
    .o(n101));  // ../src/uart.v(261)
  binary_mux_s4_w3 mux43 (
    .i0(n46),
    .i1(n81[2:0]),
    .i10(n81[2:0]),
    .i11(uart_cnt_rx),
    .i12(uart_cnt_rx),
    .i13(uart_cnt_rx),
    .i14(uart_cnt_rx),
    .i15(uart_cnt_rx),
    .i2(n81[2:0]),
    .i3(n81[2:0]),
    .i4(n81[2:0]),
    .i5(n81[2:0]),
    .i6(n81[2:0]),
    .i7(n81[2:0]),
    .i8(n81[2:0]),
    .i9(n81[2:0]),
    .sel(uart_status_rxd),
    .o(n102));  // ../src/uart.v(261)
  binary_mux_s4_w8 mux44 (
    .i0(uart_idr),
    .i1(uart_idr),
    .i10(n93),
    .i11(uart_idr),
    .i12(uart_idr),
    .i13(uart_idr),
    .i14(uart_idr),
    .i15(uart_idr),
    .i2(uart_idr),
    .i3(uart_idr),
    .i4(uart_idr),
    .i5(uart_idr),
    .i6(uart_idr),
    .i7(uart_idr),
    .i8(uart_idr),
    .i9(uart_idr),
    .sel(uart_status_rxd),
    .o(n103));  // ../src/uart.v(261)
  binary_mux_s4_w1 mux45 (
    .i0(n42),
    .i1(n42),
    .i10(n94),
    .i11(n42),
    .i12(n42),
    .i13(n42),
    .i14(n42),
    .i15(n42),
    .i2(n42),
    .i3(n42),
    .i4(n42),
    .i5(n42),
    .i6(n42),
    .i7(n42),
    .i8(n42),
    .i9(n42),
    .sel(uart_status_rxd),
    .o(n104));  // ../src/uart.v(261)
  binary_mux_s4_w1 mux46 (
    .i0(n43),
    .i1(n43),
    .i10(n95),
    .i11(n43),
    .i12(n43),
    .i13(n43),
    .i14(n43),
    .i15(n43),
    .i2(n43),
    .i3(n43),
    .i4(n43),
    .i5(n43),
    .i6(n43),
    .i7(n43),
    .i8(n43),
    .i9(n43),
    .sel(uart_status_rxd),
    .o(n105));  // ../src/uart.v(261)
  binary_mux_s4_w8 mux47 (
    .i0(n45),
    .i1(uart_idr_t),
    .i10(uart_idr_t),
    .i11(uart_idr_t),
    .i12(uart_idr_t),
    .i13(uart_idr_t),
    .i14(uart_idr_t),
    .i15(uart_idr_t),
    .i2(n78),
    .i3(n78),
    .i4(n78),
    .i5(n78),
    .i6(n78),
    .i7(n78),
    .i8(n78),
    .i9(n78),
    .sel(uart_status_rxd),
    .o(n106));  // ../src/uart.v(261)
  binary_mux_s1_w4 mux48 (
    .i0(uart_status_rxd),
    .i1(n100),
    .sel(uart_op_clock),
    .o(n107));  // ../src/uart.v(262)
  binary_mux_s1_w4 mux49 (
    .i0(uart_smp_rx),
    .i1(n101),
    .sel(uart_op_clock),
    .o(n108));  // ../src/uart.v(262)
  binary_mux_s2_w32 mux5 (
    .i0(uart_bsrr),
    .i1(uart_bsrr),
    .i2(data_i),
    .i3(uart_bsrr),
    .sel(addr_i),
    .o(n13));  // ../src/uart.v(89)
  binary_mux_s1_w3 mux50 (
    .i0(uart_cnt_rx),
    .i1(n102),
    .sel(uart_op_clock),
    .o(n109));  // ../src/uart.v(262)
  binary_mux_s1_w8 mux51 (
    .i0(uart_idr),
    .i1(n103),
    .sel(uart_op_clock),
    .o(n110));  // ../src/uart.v(262)
  binary_mux_s1_w8 mux52 (
    .i0(uart_idr_t),
    .i1(n106),
    .sel(uart_op_clock),
    .o(n113));  // ../src/uart.v(262)
  binary_mux_s1_w16 mux53 (
    .i0({uart_status_txd,uart_status_txd,uart_status_txd,uart_status_txd}),
    .i1({4'b0000,n35,8'b00100001}),
    .sel(uart_op_clock_by_3),
    .o({n37,n36,n32,n31}));  // ../src/uart.v(139)
  binary_mux_s2_w8 mux6 (
    .i0(n10),
    .i1(uart_odr),
    .i2(uart_odr),
    .i3(uart_odr),
    .sel(addr_i),
    .o(n14));  // ../src/uart.v(89)
  binary_mux_s2_w1 mux7 (
    .i0(n11),
    .i1(n8),
    .i2(n8),
    .i3(n8),
    .sel(addr_i),
    .o(n15));  // ../src/uart.v(89)
  binary_mux_s2_w32 mux8 (
    .i0({24'b000000000000000000000000,uart_odr}),
    .i1({24'b000000000000000000000000,uart_idr}),
    .i2(uart_bsrr),
    .i3({24'b000000000000000000000000,uart_sr}),
    .sel(addr_i),
    .o(n16));  // ../src/uart.v(100)
  binary_mux_s1_w32 mux9 (
    .i0(uart_bsrr),
    .i1(n13),
    .sel(we_i),
    .o(n18));  // ../src/uart.v(100)
  ne_w32 neq0 (
    .i0({28'b0000000000000000000000000000,uart_status_txd}),
    .i1(32'b00000000000000000000000000000000),
    .o(n0));  // ../src/uart.v(42)
  reg_ar_as_w32 reg0 (
    .clk(clk_i),
    .d(n26),
    .reset({n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1}),
    .set(32'b00000000000000000000000000000000),
    .q(data_o));  // ../src/uart.v(102)
  reg_ar_as_w32 reg1 (
    .clk(clk_i),
    .d(n6),
    .reset({n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1}),
    .set(32'b00000000000000000000000000000000),
    .q(uart_counter));  // ../src/uart.v(102)
  reg_ar_as_w3 reg10 (
    .clk(clk_i),
    .d(n7),
    .reset({n1,n1,1'b0}),
    .set({2'b00,n1}),
    .q(uart_op_clock_by_3_c));  // ../src/uart.v(102)
  reg_ar_as_w32 reg2 (
    .clk(clk_i),
    .d(n23),
    .reset({n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,n1,1'b0,n1}),
    .set({30'b000000000000000000000000000000,n1,1'b0}),
    .q(uart_bsrr));  // ../src/uart.v(102)
  reg_ar_as_w8 reg3 (
    .clk(clk_i),
    .d(n28),
    .reset(8'b00000000),
    .set(8'b00000000),
    .q(uart_odr));  // ../src/uart.v(102)
  reg_ar_as_w4 reg4 (
    .clk(clk_i),
    .d(n40),
    .reset({n1,n1,n1,n1}),
    .set(4'b0000),
    .q(uart_status_txd));  // ../src/uart.v(145)
  reg_ar_as_w4 reg5 (
    .clk(clk_i),
    .d(n107),
    .reset({n1,n1,n1,n1}),
    .set(4'b0000),
    .q(uart_status_rxd));  // ../src/uart.v(263)
  reg_ar_as_w8 reg6 (
    .clk(clk_i),
    .d(n110),
    .reset({n1,n1,n1,n1,n1,n1,n1,n1}),
    .set(8'b00000000),
    .q(uart_idr));  // ../src/uart.v(263)
  reg_ar_as_w8 reg7 (
    .clk(clk_i),
    .d(n113),
    .reset({n1,n1,n1,n1,n1,n1,n1,n1}),
    .set(8'b00000000),
    .q(uart_idr_t));  // ../src/uart.v(263)
  reg_ar_as_w3 reg8 (
    .clk(clk_i),
    .d(n109),
    .reset({n1,n1,1'b0}),
    .set({2'b00,n1}),
    .q(uart_cnt_rx));  // ../src/uart.v(263)
  reg_ar_as_w4 reg9 (
    .clk(clk_i),
    .d(n108),
    .reset({n1,n1,n1,n1}),
    .set(4'b0000),
    .q(uart_smp_rx));  // ../src/uart.v(263)
  add_pu5_mu5_o5 sub0 (
    .i0({1'b0,uart_status_txd}),
    .i1(5'b00010),
    .o({open_n13,open_n14,n33[2:0]}));  // ../src/uart.v(131)
  add_pu5_mu5_o5 sub1 (
    .i0({1'b0,uart_status_rxd}),
    .i1(5'b00010),
    .o(n57));  // ../src/uart.v(222)
  AL_DFF txd_o_reg (
    .clk(clk_i),
    .d(n41),
    .reset(1'b0),
    .set(n1),
    .q(txd_o));  // ../src/uart.v(145)
  AL_MUX u10 (
    .i0(n8),
    .i1(n20),
    .sel(sel_i),
    .o(n25));  // ../src/uart.v(101)
  AL_MUX u11 (
    .i0(n2),
    .i1(uart_op_clock),
    .sel(n1),
    .o(n27));  // ../src/uart.v(102)
  or u12 (n3, uart_op_clock_by_3_c[0], uart_op_clock_by_3_c[1]);  // ../src/uart.v(63)
  or u13 (n30, n29, uart_trigger_tx);  // ../src/uart.v(114)
  or u14 (n83, uart_status_txd[0], uart_status_txd[1]);  // ../src/uart.v(114)
  AL_MUX u15 (
    .i0(txd_o),
    .i1(n39),
    .sel(n30),
    .o(n41));  // ../src/uart.v(144)
  AL_MUX u16 (
    .i0(uart_status_rx),
    .i1(1'b0),
    .sel(uart_status_rx_clr),
    .o(n42));  // ../src/uart.v(176)
  AL_MUX u17 (
    .i0(uart_status_fe),
    .i1(1'b0),
    .sel(uart_status_rx_clr),
    .o(n43));  // ../src/uart.v(176)
  not u18 (n44, rxd_i);  // ../src/uart.v(182)
  and u19 (n59[0], n87, n96);  // ../src/uart.v(222)
  and u2 (uart_op_clock_by_3, uart_op_clock_by_3_c[0], uart_op_clock);  // ../src/uart.v(37)
  and u20 (n59[4], n87, n57[2]);  // ../src/uart.v(222)
  buf u21 (uart_sr[1], uart_status_rx);  // ../src/uart.v(42)
  or u22 (n56, uart_cnt_rx[0], uart_cnt_rx[1]);  // ../src/uart.v(209)
  or u23 (n84, n57[3], n57[4]);  // ../src/uart.v(222)
  and u24 (n60, n59[7], n58);  // ../src/uart.v(222)
  and u25 (n85, n57[0], n97);  // ../src/uart.v(222)
  and u26 (n62, n59[6], n58);  // ../src/uart.v(222)
  and u27 (n86, n57[0], n57[1]);  // ../src/uart.v(222)
  and u28 (n64, n59[5], n58);  // ../src/uart.v(222)
  and u29 (n87, n89, n97);  // ../src/uart.v(222)
  or u3 (uart_sr[0], n0, uart_trigger_tx);  // ../src/uart.v(42)
  and u30 (n66, n59[4], n58);  // ../src/uart.v(222)
  and u31 (n88, n89, n57[1]);  // ../src/uart.v(222)
  and u32 (n68, n59[3], n58);  // ../src/uart.v(222)
  not u33 (n96, n57[2]);  // ../src/uart.v(222)
  and u34 (n70, n59[2], n58);  // ../src/uart.v(222)
  not u35 (n97, n57[1]);  // ../src/uart.v(222)
  and u36 (n72, n59[1], n58);  // ../src/uart.v(222)
  or u37 (n91, n99, n98);  // ../src/uart.v(250)
  and u38 (n74, n59[0], n58);  // ../src/uart.v(222)
  or u39 (n98, uart_smp_rx[2], uart_smp_rx[3]);  // ../src/uart.v(250)
  not u4 (n1, rst_i);  // ../src/uart.v(48)
  or u40 (n29, n83, n82);  // ../src/uart.v(114)
  or u41 (n82, uart_status_txd[2], uart_status_txd[3]);  // ../src/uart.v(114)
  buf u42 (uart_sr[7], 1'b0);  // ../src/uart.v(42)
  buf u43 (uart_sr[6], 1'b0);  // ../src/uart.v(42)
  buf u44 (uart_sr[5], 1'b0);  // ../src/uart.v(42)
  buf u45 (uart_sr[4], 1'b0);  // ../src/uart.v(42)
  buf u46 (uart_sr[3], 1'b0);  // ../src/uart.v(42)
  buf u47 (uart_sr[2], uart_status_fe);  // ../src/uart.v(42)
  not u48 (n58, n84);  // ../src/uart.v(222)
  or u49 (n99, uart_smp_rx[0], uart_smp_rx[1]);  // ../src/uart.v(250)
  AL_MUX u5 (
    .i0(uart_trigger_tx),
    .i1(1'b0),
    .sel(uart_op_clock_by_3),
    .o(n8));  // ../src/uart.v(72)
  and u50 (n59[3], n86, n96);  // ../src/uart.v(222)
  and u51 (n59[7], n86, n57[2]);  // ../src/uart.v(222)
  and u52 (n59[2], n88, n96);  // ../src/uart.v(222)
  and u53 (n59[6], n88, n57[2]);  // ../src/uart.v(222)
  and u54 (n59[1], n85, n96);  // ../src/uart.v(222)
  not u55 (n89, n57[0]);  // ../src/uart.v(222)
  AL_MUX u56 (
    .i0(n42),
    .i1(1'b1),
    .sel(n90),
    .o(n94));  // ../src/uart.v(256)
  AL_MUX u57 (
    .i0(n43),
    .i1(n91),
    .sel(n90),
    .o(n95));  // ../src/uart.v(256)
  and u58 (n59[5], n85, n57[2]);  // ../src/uart.v(222)
  AL_MUX u59 (
    .i0(n42),
    .i1(n104),
    .sel(uart_op_clock),
    .o(n111));  // ../src/uart.v(262)
  AL_MUX u6 (
    .i0(n8),
    .i1(1'b1),
    .sel(n9),
    .o(n11));  // ../src/uart.v(84)
  AL_MUX u60 (
    .i0(n43),
    .i1(n105),
    .sel(uart_op_clock),
    .o(n112));  // ../src/uart.v(262)
  AL_MUX u7 (
    .i0(1'b0),
    .i1(n12),
    .sel(we_i),
    .o(n17));  // ../src/uart.v(100)
  AL_MUX u8 (
    .i0(n8),
    .i1(n15),
    .sel(we_i),
    .o(n20));  // ../src/uart.v(100)
  AL_MUX u9 (
    .i0(1'b0),
    .i1(n17),
    .sel(sel_i),
    .o(n22));  // ../src/uart.v(101)
  AL_DFF uart_op_clock_reg (
    .clk(clk_i),
    .d(n27),
    .reset(1'b0),
    .set(1'b0),
    .q(uart_op_clock));  // ../src/uart.v(102)
  AL_DFF uart_status_fe_reg (
    .clk(clk_i),
    .d(n112),
    .reset(n1),
    .set(1'b0),
    .q(uart_status_fe));  // ../src/uart.v(263)
  AL_DFF uart_status_rx_clr_reg (
    .clk(clk_i),
    .d(n22),
    .reset(n1),
    .set(1'b0),
    .q(uart_status_rx_clr));  // ../src/uart.v(102)
  AL_DFF uart_status_rx_reg (
    .clk(clk_i),
    .d(n111),
    .reset(n1),
    .set(1'b0),
    .q(uart_status_rx));  // ../src/uart.v(263)
  AL_DFF uart_trigger_tx_reg (
    .clk(clk_i),
    .d(n25),
    .reset(n1),
    .set(1'b0),
    .q(uart_trigger_tx));  // ../src/uart.v(102)

endmodule 

module add_pu30_pu30_o30
  (
  i0,
  i1,
  o
  );

  input [29:0] i0;
  input [29:0] i1;
  output [29:0] o;



endmodule 

module add_pu32_pu32_o32
  (
  i0,
  i1,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  output [31:0] o;



endmodule 

module add_pu64_pu64_o64
  (
  i0,
  i1,
  o
  );

  input [63:0] i0;
  input [63:0] i1;
  output [63:0] o;



endmodule 

module regfile_dp  // al_ip/cpuregs.v(14)
  (
  di,
  raddr,
  waddr,
  wclk,
  we,
  do
  );

  input [31:0] di;  // al_ip/cpuregs.v(23)
  input [4:0] raddr;  // al_ip/cpuregs.v(25)
  input [4:0] waddr;  // al_ip/cpuregs.v(24)
  input wclk;  // al_ip/cpuregs.v(26)
  input we;  // al_ip/cpuregs.v(26)
  output [31:0] do;  // al_ip/cpuregs.v(28)

  parameter ADDR_WIDTH_R = 5;
  parameter ADDR_WIDTH_W = 5;
  parameter DATA_DEPTH_R = 32;
  parameter DATA_DEPTH_W = 32;
  parameter DATA_WIDTH_R = 32;
  parameter DATA_WIDTH_W = 32;

  EG_LOGIC_DRAM #(
    .ADDR_WIDTH_R(5),
    .ADDR_WIDTH_W(5),
    .DATA_DEPTH_R(32),
    .DATA_DEPTH_W(32),
    .DATA_WIDTH_R(32),
    .DATA_WIDTH_W(32),
    .INIT_FILE("zero.mif"))
    dram (
    .di(di),
    .raddr(raddr),
    .waddr(waddr),
    .wclk(wclk),
    .we(we),
    .do(do));  // al_ip/cpuregs.v(40)

endmodule 

module eq_w3
  (
  i0,
  i1,
  o
  );

  input [2:0] i0;
  input [2:0] i1;
  output o;



endmodule 

module eq_w1
  (
  i0,
  i1,
  o
  );

  input i0;
  input i1;
  output o;



endmodule 

module eq_w5
  (
  i0,
  i1,
  o
  );

  input [4:0] i0;
  input [4:0] i1;
  output o;



endmodule 

module eq_w7
  (
  i0,
  i1,
  o
  );

  input [6:0] i0;
  input [6:0] i1;
  output o;



endmodule 

module eq_w8
  (
  i0,
  i1,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  output o;



endmodule 

module lt_u32_u32
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [31:0] i0;
  input [31:0] i1;
  output o;



endmodule 

module lt_u5_u5
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [4:0] i0;
  input [4:0] i1;
  output o;



endmodule 

module binary_mux_s2_w1
  (
  i0,
  i1,
  i2,
  i3,
  sel,
  o
  );

  input i0;
  input i1;
  input i2;
  input i3;
  input [1:0] sel;
  output o;



endmodule 

module binary_mux_s1_w5
  (
  i0,
  i1,
  sel,
  o
  );

  input [4:0] i0;
  input [4:0] i1;
  input sel;
  output [4:0] o;



endmodule 

module binary_mux_s1_w3
  (
  i0,
  i1,
  sel,
  o
  );

  input [2:0] i0;
  input [2:0] i1;
  input sel;
  output [2:0] o;



endmodule 

module binary_mux_s2_w5
  (
  i0,
  i1,
  i2,
  i3,
  sel,
  o
  );

  input [4:0] i0;
  input [4:0] i1;
  input [4:0] i2;
  input [4:0] i3;
  input [1:0] sel;
  output [4:0] o;



endmodule 

module binary_mux_s1_w64
  (
  i0,
  i1,
  sel,
  o
  );

  input [63:0] i0;
  input [63:0] i1;
  input sel;
  output [63:0] o;



endmodule 

module binary_mux_s1_w10
  (
  i0,
  i1,
  sel,
  o
  );

  input [9:0] i0;
  input [9:0] i1;
  input sel;
  output [9:0] o;



endmodule 

module binary_mux_s1_w4
  (
  i0,
  i1,
  sel,
  o
  );

  input [3:0] i0;
  input [3:0] i1;
  input sel;
  output [3:0] o;



endmodule 

module binary_mux_s1_w17
  (
  i0,
  i1,
  sel,
  o
  );

  input [16:0] i0;
  input [16:0] i1;
  input sel;
  output [16:0] o;



endmodule 

module binary_mux_s2_w16
  (
  i0,
  i1,
  i2,
  i3,
  sel,
  o
  );

  input [15:0] i0;
  input [15:0] i1;
  input [15:0] i2;
  input [15:0] i3;
  input [1:0] sel;
  output [15:0] o;



endmodule 

module binary_mux_s3_w20
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  i6,
  i7,
  sel,
  o
  );

  input [19:0] i0;
  input [19:0] i1;
  input [19:0] i2;
  input [19:0] i3;
  input [19:0] i4;
  input [19:0] i5;
  input [19:0] i6;
  input [19:0] i7;
  input [2:0] sel;
  output [19:0] o;



endmodule 

module binary_mux_s2_w25
  (
  i0,
  i1,
  i2,
  i3,
  sel,
  o
  );

  input [24:0] i0;
  input [24:0] i1;
  input [24:0] i2;
  input [24:0] i3;
  input [1:0] sel;
  output [24:0] o;



endmodule 

module binary_mux_s1_w16
  (
  i0,
  i1,
  sel,
  o
  );

  input [15:0] i0;
  input [15:0] i1;
  input sel;
  output [15:0] o;



endmodule 

module binary_mux_s1_w25
  (
  i0,
  i1,
  sel,
  o
  );

  input [24:0] i0;
  input [24:0] i1;
  input sel;
  output [24:0] o;



endmodule 

module binary_mux_s2_w2
  (
  i0,
  i1,
  i2,
  i3,
  sel,
  o
  );

  input [1:0] i0;
  input [1:0] i1;
  input [1:0] i2;
  input [1:0] i3;
  input [1:0] sel;
  output [1:0] o;



endmodule 

module binary_mux_s2_w32
  (
  i0,
  i1,
  i2,
  i3,
  sel,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  input [31:0] i2;
  input [31:0] i3;
  input [1:0] sel;
  output [31:0] o;



endmodule 

module binary_mux_s2_w4
  (
  i0,
  i1,
  i2,
  i3,
  sel,
  o
  );

  input [3:0] i0;
  input [3:0] i1;
  input [3:0] i2;
  input [3:0] i3;
  input [1:0] sel;
  output [3:0] o;



endmodule 

module binary_mux_s1_w30
  (
  i0,
  i1,
  sel,
  o
  );

  input [29:0] i0;
  input [29:0] i1;
  input sel;
  output [29:0] o;



endmodule 

module binary_mux_s3_w5
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  i6,
  i7,
  sel,
  o
  );

  input [4:0] i0;
  input [4:0] i1;
  input [4:0] i2;
  input [4:0] i3;
  input [4:0] i4;
  input [4:0] i5;
  input [4:0] i6;
  input [4:0] i7;
  input [2:0] sel;
  output [4:0] o;



endmodule 

module binary_mux_s3_w1
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  i6,
  i7,
  sel,
  o
  );

  input i0;
  input i1;
  input i2;
  input i3;
  input i4;
  input i5;
  input i6;
  input i7;
  input [2:0] sel;
  output o;



endmodule 

module ne_w32
  (
  i0,
  i1,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  output o;



endmodule 

module reg_ar_as_w32
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [31:0] d;
  input en;
  input [31:0] reset;
  input [31:0] set;
  output [31:0] q;



endmodule 

module reg_ar_as_w5
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [4:0] d;
  input en;
  input [4:0] reset;
  input [4:0] set;
  output [4:0] q;



endmodule 

module reg_ar_as_w64
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [63:0] d;
  input en;
  input [63:0] reset;
  input [63:0] set;
  output [63:0] q;



endmodule 

module reg_ar_as_w36
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [35:0] d;
  input en;
  input [35:0] reset;
  input [35:0] set;
  output [35:0] q;



endmodule 

module reg_ar_as_w4
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [3:0] d;
  input en;
  input [3:0] reset;
  input [3:0] set;
  output [3:0] q;



endmodule 

module reg_ar_as_w16
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [15:0] d;
  input en;
  input [15:0] reset;
  input [15:0] set;
  output [15:0] q;



endmodule 

module onehot_mux_s3_w64
  (
  i0,
  i1,
  i2,
  sel,
  o
  );

  input [63:0] i0;
  input [63:0] i1;
  input [63:0] i2;
  input [2:0] sel;
  output [63:0] o;



endmodule 

module onehot_mux_s3_w5
  (
  i0,
  i1,
  i2,
  sel,
  o
  );

  input [4:0] i0;
  input [4:0] i1;
  input [4:0] i2;
  input [2:0] sel;
  output [4:0] o;



endmodule 

module onehot_mux_s5_w5
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  sel,
  o
  );

  input [4:0] i0;
  input [4:0] i1;
  input [4:0] i2;
  input [4:0] i3;
  input [4:0] i4;
  input [4:0] sel;
  output [4:0] o;



endmodule 

module onehot_mux_s6_w32
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  sel,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  input [31:0] i2;
  input [31:0] i3;
  input [31:0] i4;
  input [31:0] i5;
  input [5:0] sel;
  output [31:0] o;



endmodule 

module onehot_mux_s6_w1
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  sel,
  o
  );

  input i0;
  input i1;
  input i2;
  input i3;
  input i4;
  input i5;
  input [5:0] sel;
  output o;



endmodule 

module onehot_mux_s5_w32
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  sel,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  input [31:0] i2;
  input [31:0] i3;
  input [31:0] i4;
  input [4:0] sel;
  output [31:0] o;



endmodule 

module onehot_mux_s3_w32
  (
  i0,
  i1,
  i2,
  sel,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  input [31:0] i2;
  input [2:0] sel;
  output [31:0] o;



endmodule 

module onehot_mux_s4_w32
  (
  i0,
  i1,
  i2,
  i3,
  sel,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  input [31:0] i2;
  input [31:0] i3;
  input [3:0] sel;
  output [31:0] o;



endmodule 

module onehot_mux_s3_w8
  (
  i0,
  i1,
  i2,
  sel,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  input [7:0] i2;
  input [2:0] sel;
  output [7:0] o;



endmodule 

module onehot_mux_s3_w1
  (
  i0,
  i1,
  i2,
  sel,
  o
  );

  input i0;
  input i1;
  input i2;
  input [2:0] sel;
  output o;



endmodule 

module onehot_mux_s7_w8
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  i6,
  sel,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  input [7:0] i2;
  input [7:0] i3;
  input [7:0] i4;
  input [7:0] i5;
  input [7:0] i6;
  input [6:0] sel;
  output [7:0] o;



endmodule 

module onehot_mux_s7_w32
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  i6,
  sel,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  input [31:0] i2;
  input [31:0] i3;
  input [31:0] i4;
  input [31:0] i5;
  input [31:0] i6;
  input [6:0] sel;
  output [31:0] o;



endmodule 

module onehot_mux_s4_w1
  (
  i0,
  i1,
  i2,
  i3,
  sel,
  o
  );

  input i0;
  input i1;
  input i2;
  input i3;
  input [3:0] sel;
  output o;



endmodule 

module onehot_mux_s7_w5
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  i6,
  sel,
  o
  );

  input [4:0] i0;
  input [4:0] i1;
  input [4:0] i2;
  input [4:0] i3;
  input [4:0] i4;
  input [4:0] i5;
  input [4:0] i6;
  input [6:0] sel;
  output [4:0] o;



endmodule 

module onehot_mux_s3_w2
  (
  i0,
  i1,
  i2,
  sel,
  o
  );

  input [1:0] i0;
  input [1:0] i1;
  input [1:0] i2;
  input [2:0] sel;
  output [1:0] o;



endmodule 

module onehot_mux_s5_w1
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  sel,
  o
  );

  input i0;
  input i1;
  input i2;
  input i3;
  input i4;
  input [4:0] sel;
  output o;



endmodule 

module onehot_mux_s8_w2
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  i6,
  i7,
  sel,
  o
  );

  input [1:0] i0;
  input [1:0] i1;
  input [1:0] i2;
  input [1:0] i3;
  input [1:0] i4;
  input [1:0] i5;
  input [1:0] i6;
  input [1:0] i7;
  input [7:0] sel;
  output [1:0] o;



endmodule 

module onehot_mux_s5_w2
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  sel,
  o
  );

  input [1:0] i0;
  input [1:0] i1;
  input [1:0] i2;
  input [1:0] i3;
  input [1:0] i4;
  input [4:0] sel;
  output [1:0] o;



endmodule 

module onehot_mux_s8_w32
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  i6,
  i7,
  sel,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  input [31:0] i2;
  input [31:0] i3;
  input [31:0] i4;
  input [31:0] i5;
  input [31:0] i6;
  input [31:0] i7;
  input [7:0] sel;
  output [31:0] o;



endmodule 

module onehot_mux_s8_w5
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  i6,
  i7,
  sel,
  o
  );

  input [4:0] i0;
  input [4:0] i1;
  input [4:0] i2;
  input [4:0] i3;
  input [4:0] i4;
  input [4:0] i5;
  input [4:0] i6;
  input [4:0] i7;
  input [7:0] sel;
  output [4:0] o;



endmodule 

module onehot_mux_s8_w64
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  i6,
  i7,
  sel,
  o
  );

  input [63:0] i0;
  input [63:0] i1;
  input [63:0] i2;
  input [63:0] i3;
  input [63:0] i4;
  input [63:0] i5;
  input [63:0] i6;
  input [63:0] i7;
  input [7:0] sel;
  output [63:0] o;



endmodule 

module onehot_mux_s4_w3
  (
  i0,
  i1,
  i2,
  i3,
  sel,
  o
  );

  input [2:0] i0;
  input [2:0] i1;
  input [2:0] i2;
  input [2:0] i3;
  input [3:0] sel;
  output [2:0] o;



endmodule 

module onehot_mux_s8_w8
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  i6,
  i7,
  sel,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  input [7:0] i2;
  input [7:0] i3;
  input [7:0] i4;
  input [7:0] i5;
  input [7:0] i6;
  input [7:0] i7;
  input [7:0] sel;
  output [7:0] o;



endmodule 

module add_pu32_mu32_o32
  (
  i0,
  i1,
  o
  );

  input [31:0] i0;
  input [31:0] i1;
  output [31:0] o;



endmodule 

module add_pu6_mu6_o6
  (
  i0,
  i1,
  o
  );

  input [5:0] i0;
  input [5:0] i1;
  output [5:0] o;



endmodule 

module add_pu4_pu4_o4
  (
  i0,
  i1,
  o
  );

  input [3:0] i0;
  input [3:0] i1;
  output [3:0] o;



endmodule 

module eq_w4
  (
  i0,
  i1,
  o
  );

  input [3:0] i0;
  input [3:0] i1;
  output o;



endmodule 

module lt_u4_u4
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [3:0] i0;
  input [3:0] i1;
  output o;



endmodule 

module binary_mux_s4_w4
  (
  i0,
  i1,
  i10,
  i11,
  i12,
  i13,
  i14,
  i15,
  i2,
  i3,
  i4,
  i5,
  i6,
  i7,
  i8,
  i9,
  sel,
  o
  );

  input [3:0] i0;
  input [3:0] i1;
  input [3:0] i10;
  input [3:0] i11;
  input [3:0] i12;
  input [3:0] i13;
  input [3:0] i14;
  input [3:0] i15;
  input [3:0] i2;
  input [3:0] i3;
  input [3:0] i4;
  input [3:0] i5;
  input [3:0] i6;
  input [3:0] i7;
  input [3:0] i8;
  input [3:0] i9;
  input [3:0] sel;
  output [3:0] o;



endmodule 

module binary_mux_s4_w1
  (
  i0,
  i1,
  i10,
  i11,
  i12,
  i13,
  i14,
  i15,
  i2,
  i3,
  i4,
  i5,
  i6,
  i7,
  i8,
  i9,
  sel,
  o
  );

  input i0;
  input i1;
  input i10;
  input i11;
  input i12;
  input i13;
  input i14;
  input i15;
  input i2;
  input i3;
  input i4;
  input i5;
  input i6;
  input i7;
  input i8;
  input i9;
  input [3:0] sel;
  output o;



endmodule 

module binary_mux_s4_w3
  (
  i0,
  i1,
  i10,
  i11,
  i12,
  i13,
  i14,
  i15,
  i2,
  i3,
  i4,
  i5,
  i6,
  i7,
  i8,
  i9,
  sel,
  o
  );

  input [2:0] i0;
  input [2:0] i1;
  input [2:0] i10;
  input [2:0] i11;
  input [2:0] i12;
  input [2:0] i13;
  input [2:0] i14;
  input [2:0] i15;
  input [2:0] i2;
  input [2:0] i3;
  input [2:0] i4;
  input [2:0] i5;
  input [2:0] i6;
  input [2:0] i7;
  input [2:0] i8;
  input [2:0] i9;
  input [3:0] sel;
  output [2:0] o;



endmodule 

module binary_mux_s4_w8
  (
  i0,
  i1,
  i10,
  i11,
  i12,
  i13,
  i14,
  i15,
  i2,
  i3,
  i4,
  i5,
  i6,
  i7,
  i8,
  i9,
  sel,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  input [7:0] i10;
  input [7:0] i11;
  input [7:0] i12;
  input [7:0] i13;
  input [7:0] i14;
  input [7:0] i15;
  input [7:0] i2;
  input [7:0] i3;
  input [7:0] i4;
  input [7:0] i5;
  input [7:0] i6;
  input [7:0] i7;
  input [7:0] i8;
  input [7:0] i9;
  input [3:0] sel;
  output [7:0] o;



endmodule 

module binary_mux_s2_w8
  (
  i0,
  i1,
  i2,
  i3,
  sel,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  input [7:0] i2;
  input [7:0] i3;
  input [1:0] sel;
  output [7:0] o;



endmodule 

module reg_ar_as_w3
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [2:0] d;
  input en;
  input [2:0] reset;
  input [2:0] set;
  output [2:0] q;



endmodule 

module add_pu5_mu5_o5
  (
  i0,
  i1,
  o
  );

  input [4:0] i0;
  input [4:0] i1;
  output [4:0] o;



endmodule 

module AL_DFF
  (
  input reset,
  input set,
  input clk,
  input d,
  output reg q
  );

  parameter INI = 1'b0;

  always @(posedge reset or posedge set or posedge clk)
  begin
    if (reset)
      q <= 1'b0;
    else if (set)
      q <= 1'b1;
    else
      q <= d;
  end

endmodule

module AL_MUX
  (
  input i0,
  input i1,
  input sel,
  output o
  );

  wire not_sel, sel_i0, sel_i1;
  not u0 (not_sel, sel);
  and u1 (sel_i1, sel, i1);
  and u2 (sel_i0, not_sel, i0);
  or u3 (o, sel_i1, sel_i0);

endmodule

