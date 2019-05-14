// Verilog netlist created by TD v4.3.815
// Tue May 14 18:54:02 2019

`timescale 1ns / 1ps
module led  // ../src/led.v(1)
  (
  CLK_IN,
  RST_N,
  keyB,
  RGB_LED
  );

  input CLK_IN;  // ../src/led.v(3)
  input RST_N;  // ../src/led.v(4)
  input keyB;  // ../src/led.v(5)
  output [2:0] RGB_LED;  // ../src/led.v(6)

  parameter time1 = 25'b1011011100011011000000000;
  wire [24:0] count;  // ../src/led.v(12)
  wire [2:0] n1;
  wire [2:0] n10;
  wire [1:0] n11;
  wire [1:0] n2;
  wire [1:0] n5;
  wire [2:0] n6;
  wire [1:0] n7;
  wire [24:0] n8;
  wire [24:0] n9;
  wire [2:0] rledout;  // ../src/led.v(11)
  wire [1:0] shift_cnt;  // ../src/led.v(13)
  wire n0;
  wire n3;
  wire n4;

  add_pu2_pu2_o2 add0 (
    .i0(shift_cnt),
    .i1(2'b01),
    .o(n5));  // ../src/led.v(39)
  add_pu25_pu25_o25 add1 (
    .i0(count),
    .i1(25'b0000000000000000000000001),
    .o(n8));  // ../src/led.v(43)
  eq_w1 eq0 (
    .i0(RST_N),
    .i1(1'b0),
    .o(n0));  // ../src/led.v(23)
  eq_w25 eq1 (
    .i0(count),
    .i1(25'b1011011100011011000000000),
    .o(n3));  // ../src/led.v(29)
  eq_w2 eq2 (
    .i0(shift_cnt),
    .i1(2'b10),
    .o(n4));  // ../src/led.v(33)
  binary_mux_s1_w3 mux0 (
    .i0(rledout),
    .i1(3'b001),
    .sel(n0),
    .o(n1));  // ../src/led.v(27)
  binary_mux_s1_w2 mux1 (
    .i0(shift_cnt),
    .i1(2'b00),
    .sel(n0),
    .o(n2));  // ../src/led.v(27)
  binary_mux_s1_w3 mux2 (
    .i0({rledout[1:0],1'b0}),
    .i1(3'b001),
    .sel(n4),
    .o(n6));  // ../src/led.v(40)
  binary_mux_s1_w2 mux3 (
    .i0(n5),
    .i1(2'b00),
    .sel(n4),
    .o(n7));  // ../src/led.v(40)
  binary_mux_s1_w25 mux4 (
    .i0(n8),
    .i1(25'b0000000000000000000000000),
    .sel(n3),
    .o(n9));  // ../src/led.v(43)
  binary_mux_s1_w3 mux5 (
    .i0(n1),
    .i1(n6),
    .sel(n3),
    .o(n10));  // ../src/led.v(43)
  binary_mux_s1_w2 mux6 (
    .i0(n2),
    .i1(n7),
    .sel(n3),
    .o(n11));  // ../src/led.v(43)
  reg_ar_as_w3 reg0 (
    .clk(CLK_IN),
    .d(n10),
    .reset(3'b000),
    .set(3'b000),
    .q(rledout));  // ../src/led.v(44)
  reg_ar_as_w2 reg1 (
    .clk(CLK_IN),
    .d(n11),
    .reset(2'b00),
    .set(2'b00),
    .q(shift_cnt));  // ../src/led.v(44)
  reg_ar_as_w25 reg2 (
    .clk(CLK_IN),
    .d(n9),
    .reset(25'b0000000000000000000000000),
    .set(25'b0000000000000000000000000),
    .q(count));  // ../src/led.v(44)
  buf u2 (RGB_LED[2], rledout[2]);  // ../src/led.v(46)
  buf u3 (RGB_LED[1], rledout[1]);  // ../src/led.v(46)
  buf u4 (RGB_LED[0], rledout[0]);  // ../src/led.v(46)

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

module add_pu25_pu25_o25
  (
  i0,
  i1,
  o
  );

  input [24:0] i0;
  input [24:0] i1;
  output [24:0] o;



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

module eq_w25
  (
  i0,
  i1,
  o
  );

  input [24:0] i0;
  input [24:0] i1;
  output o;



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

module reg_ar_as_w25
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input [24:0] d;
  input en;
  input [24:0] reset;
  input [24:0] set;
  output [24:0] q;



endmodule 

