`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2020 10:34:32 AM
// Design Name: 
// Module Name: testbench_denoising_color
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


module testbench_denoising_color();

reg clk;
    
    integer data_1, data_2, data_3;
    `define NULL 0
    
    initial begin
        clk = 0;
    end
    
    parameter input_filename_1 = "C:/Users/Joey/Google Drive/ELEC 4320/Final Project/dataset/dataset_color_denoising/lena_r_noise_array.txt";
    parameter output_filename_1 = "C:/Users/Joey/Google Drive/ELEC 4320/Final Project/dataset/dataset_color_denoising/lena_r_denoise_array.txt";
    parameter input_filename_2 = "C:/Users/Joey/Google Drive/ELEC 4320/Final Project/dataset/dataset_color_denoising/lena_g_noise_array.txt";
    parameter output_filename_2 = "C:/Users/Joey/Google Drive/ELEC 4320/Final Project/dataset/dataset_color_denoising/lena_g_denoise_array.txt";
    parameter input_filename_3 = "C:/Users/Joey/Google Drive/ELEC 4320/Final Project/dataset/dataset_color_denoising/lena_b_noise_array.txt";
    parameter output_filename_3 = "C:/Users/Joey/Google Drive/ELEC 4320/Final Project/dataset/dataset_color_denoising/lena_b_denoise_array.txt";
    
    always 
    begin
        #1 clk = ~clk; 
    end
    
    denoising_median_filter MODEL_RED(.clk(clk), .input_filename(input_filename_1), .output_filename(output_filename_1), .Median(median1));
    denoising_median_filter MODEL_GREEN(.clk(clk), .input_filename(input_filename_2), .output_filename(output_filename_2), .Median(median2));
    denoising_median_filter MODEL_BLUE(.clk(clk), .input_filename(input_filename_3), .output_filename(output_filename_3), .Median(median3));

endmodule
