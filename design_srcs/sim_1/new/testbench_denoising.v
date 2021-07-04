`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2020 04:23:02 PM
// Design Name: 
// Module Name: testbench_denoising
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


module testbench_denoising();
    
    reg clk;
    
    integer data;
    `define NULL 0
    
    parameter input_filename = "C:/Users/Joey/Google Drive/ELEC 4320/Final Project/dataset/dataset_gray_denoising/lena_gray_noise_array.txt";
    parameter output_filename = "C:/Users/Joey/Google Drive/ELEC 4320/Final Project/dataset/dataset_gray_denoising/lena_gray_denoise_array.txt";
    
    initial begin
        clk=0;
    end
    
    always 
    begin
        #1 clk = ~clk; 
    end
    
    denoising_median_filter MODEL(.clk(clk), .input_filename(input_filename), .output_filename(output_filename), .Median(median));
    
endmodule
