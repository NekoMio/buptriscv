// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Thu Jul  8 16:42:23 2021
// Host        : DESKTOP-IMRPLSV running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Regen/Desktop/buptriscv/buptriscv.gen/sources_1/ip/clockgen/clockgen_stub.v
// Design      : clockgen
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clockgen(clk2, resetn, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk2,resetn,locked,clk_in1" */;
  output clk2;
  input resetn;
  output locked;
  input clk_in1;
endmodule
