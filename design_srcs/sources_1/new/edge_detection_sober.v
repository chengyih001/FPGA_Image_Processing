`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2020 03:36:48 PM
// Design Name: 
// Module Name: edge_detection_sober
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


module edge_detection_sober(clk, input_filename, x_filename, y_filename, output_filename, G_x, G_y);

input clk;
input [1000:0] input_filename, x_filename, y_filename, output_filename;
output G_x, G_y;

(*mark_debug = "true"*) reg [7:0] r0 [0:511];
(*mark_debug = "true"*) reg [7:0] r1 [0:511];
(*mark_debug = "true"*) reg [7:0] r2 [0:511];
(*mark_debug = "true"*) reg [9:0] Gx;
(*mark_debug = "true"*) reg [9:0] Gy;
reg [31:0] i, done;
reg [7:0] pixel;


integer data_file, scan, final_file, x_file, y_file, img_size;
`define NULL 0 

initial begin
    i=0; done=0; img_size=512;
    data_file = $fopen(input_filename, "r");
    x_file = $fopen(x_filename, "w");
    y_file = $fopen(y_filename, "w");
    final_file = $fopen(output_filename,"w");
end


always@(posedge clk) begin

    if(i == img_size) begin
        done = done +1;
        i = 0;
    end
    
    if(i < img_size) begin
        r0[i] = r1[i];
        r1[i] = r2[i];
        scan = $fscanf(data_file, "%d\n", pixel);
        r2[i] = pixel;
    end
    
    /*
         *  pixel matrix
         * [   r0[i-2]   r0[i-1]   r0[i]
         *     r1[i-2]    r1[i-1]   r1[i]
         *     r2[i-2]   r2[i-1]   r2[i]   ]
        */
    
    if(done>1 && i>1) begin
        /*
                * x kernel matrix
                *  [ -1  0  1
                *   -2  0  2
                *   -1  0  1 ]
                */
        Gx = (r0[i] - r0[i-2]) + (r1[i]*2 - r1[i-2]*2) + (r2[i] - r2[i-2]);
        
        /* 
                * y kernel matrix
                * [ -1  -2  -1
                *     0   0   0
                *    1   2   1 ]
                */
        Gy = (r2[i] - r0[i]) + (r2[i-1]*2 - r0[i-1]*2) + (r2[i-2] - r0[i-2]);
        
        if(Gx[9] == 1)
            Gx = ~Gx +1;
        if(Gy[9] == 1)
            Gy = ~Gy + 1;
        $fwrite(x_file, "%d\n", Gx);
        $fwrite(y_file, "%d\n", Gy);
        $fwrite(final_file, "%d\n", Gx + Gy);
    end
    
    if(done == img_size) begin
        $display("Sobel edge detection done!");
        $finish;
    end
     
    i = i+1;
end

assign G_x = Gx;
assign G_y = Gy;

endmodule
