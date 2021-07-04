//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1.1 (win64) Build 2960000 Wed Aug  5 22:57:20 MDT 2020
//Date        : Tue Dec 22 16:11:05 2020
//Host        : DESKTOP-6REML9T running 64-bit major release  (build 9200)
//Command     : generate_target edge_detection_wrapper.bd
//Design      : edge_detection_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module edge_detection_wrapper
   (clk,
    input_filename,
    output_filename,
    x_filename,
    y_filename);
  input clk;
  input [1000:0]input_filename;
  input [1000:0]output_filename;
  input [1000:0]x_filename;
  input [1000:0]y_filename;

  wire clk;
  wire [1000:0]input_filename;
  wire [1000:0]output_filename;
  wire [1000:0]x_filename;
  wire [1000:0]y_filename;

  edge_detection edge_detection_i
       (.clk(clk),
        .input_filename(input_filename),
        .output_filename(output_filename),
        .x_filename(x_filename),
        .y_filename(y_filename));
endmodule
