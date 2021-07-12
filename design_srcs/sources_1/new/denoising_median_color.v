`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2020 04:46:59 PM
// Design Name: 
// Module Name: denoising_median_color
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


module denoising_median_color(clk, input_filename, output_filename, Median);

input wire clk;
input [1000:0] input_filename, output_filename;
output Median;

(*mark_debug = "true"*) reg [7:0] r0 [0:511];
(*mark_debug = "true"*) reg [7:0] r1 [0:511];
(*mark_debug = "true"*) reg [7:0] r2 [0:511];
(*mark_debug = "true"*) reg [7:0] median;
reg [31:0] i, j, k, done;
reg [7:0] pixel;


integer data, scan, final;
integer img_size, kernel_size;
`define NULL 0

reg [7:0] array [0:8];
reg [7:0] temp;

function [7:0] find_median;
    input [7:0] array_00, array_01, array_02, array_10, array_11, array_12, array_20, array_21, array_22;
    begin
        array[0] = array_00;
        array[1] = array_01;
        array[2] = array_02;
        array[3] = array_10;
        array[4] = array_11;
        array[5] = array_12;
        array[6] = array_20;
        array[7] = array_21;
        array[8] = array_22;
        
        for (j=0; j < 8; j=j+1) begin
            if (j == 0) begin
                for (k=0; k < 8; k=k+1) begin
                    if (array[k] > array[k+1]) begin
                        temp = array[k+1];
                        array[k+1] = array[k];
                        array[k] = temp;
                    end
                end
            end
            else if (j == 1) begin
                for (k=0; k < 7; k=k+1) begin
                    if (array[k] > array[k+1]) begin
                        temp = array[k+1];
                        array[k+1] = array[k];
                        array[k] = temp;
                    end
                end
            end
            else if (j == 2) begin
                for (k=0; k < 6; k=k+1) begin
                    if (array[k] > array[k+1]) begin
                        temp = array[k+1];
                        array[k+1] = array[k];
                        array[k] = temp;
                    end
                end
            end
            else if (j == 3) begin
                for (k=0; k < 5; k=k+1) begin
                    if (array[k] > array[k+1]) begin
                        temp = array[k+1];
                        array[k+1] = array[k];
                        array[k] = temp;
                    end
                end
            end
            else if (j == 4) begin
                for (k=0; k < 4; k=k+1) begin
                    if (array[k] > array[k+1]) begin
                        temp = array[k+1];
                        array[k+1] = array[k];
                        array[k] = temp;
                    end
                end
            end
            else if (j == 5) begin
                for (k=0; k < 3; k=k+1) begin
                    if (array[k] > array[k+1]) begin
                        temp = array[k+1];
                        array[k+1] = array[k];
                        array[k] = temp;
                    end
                end
            end
            else if (j == 6) begin
                for (k=0; k < 2; k=k+1) begin
                    if (array[k] > array[k+1]) begin
                        temp = array[k+1];
                        array[k+1] = array[k];
                        array[k] = temp;
                    end
                end
            end
            else if (j == 7) begin
                for (k=0; k < 1; k=k+1) begin
                    if (array[k] > array[k+1]) begin
                        temp = array[k+1];
                        array[k+1] = array[k];
                        array[k] = temp;
                    end
                end
            end
            else if (j == 8) begin
                for (k=0; k < 0; k=k+1) begin
                    if (array[k] > array[k+1]) begin
                        temp = array[k+1];
                        array[k+1] = array[k];
                        array[k] = temp;
                    end
                end
            end
        end
        
        find_median = array[4];
    end
endfunction

initial begin
    i=0; j=0; k=0; done=0; img_size=512; kernel_size=3;
    data = $fopen(input_filename, "r");
    final = $fopen(output_filename,"w");
end

always@(posedge clk) begin

    if(i == img_size) begin
        done = done +1;
        i = 0;
    end
    
    if(i < img_size) begin
        r0[i] = r1[i];
        r1[i] = r2[i];
        scan = $fscanf(data, "%d\n", pixel);
        r2[i] = pixel;
    end
    
    /*
         *  pixel matrix
         * [   r0[i-2]   r0[i-1]   r0[i]
         *     r1[i-2]    r1[i-1]   r1[i]
         *     r2[i-2]   r2[i-1]   r2[i]   ]
        */

    if(done>1 && i>1) begin

        median = find_median(r0[i-2], r0[i-1], r0[i], r1[i-2], r1[i-1], r1[i], r2[i-2], r2[i-1], r2[i]);
        $fwrite(final, "%d\n", median);
        
    end
    
    if(done == img_size) begin
        $display("Median filter image denoising done!");
        $finish;
    end
    
    i = i+1;
end

assign Median = median;

endmodule
