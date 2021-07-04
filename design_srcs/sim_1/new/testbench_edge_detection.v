`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2020 03:56:00 PM
// Design Name: 
// Module Name: testbench_edge_detection
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testbench_edge_detection();
    reg clk;
    
    parameter input_filename = "C:/Users/Joey/Google Drive/ELEC 4320/Final Project/dataset/dataset_gray_edge_detection/lena_gray_array.txt";
    parameter x_filename = "C:/Users/Joey/Google Drive/ELEC 4320/Final Project/dataset/dataset_gray_edge_detection/lena_edge_x_array.txt";
    parameter y_filename = "C:/Users/Joey/Google Drive/ELEC 4320/Final Project/dataset/dataset_gray_edge_detection/lena_edge_y_array.txt";
    parameter output_filename = "C:/Users/Joey/Google Drive/ELEC 4320/Final Project/dataset/dataset_gray_edge_detection/lena_edge_array.txt";
    
    initial begin
        clk = 0;
    end
    
    always
    begin
        #1 clk = ~clk; 
    end
    
    edge_detection_sober MODEL(.clk(clk), .input_filename(input_filename), .x_filename(x_filename), .y_filename(y_filename), .output_filename(output_filename),  .G_x(Gx), .G_y(Gy));
    
endmodule
