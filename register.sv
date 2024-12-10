//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2024 04:15:25 PM
// Design Name: 
// Module Name: register
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


module register(
    input logic [3:0] data,
    input logic clk,
    input logic reset,
    output logic [3:0] q 
    );
    
    d_flip_flop dff3(.data(data[3]), .clk(clk), .reset(reset), .q(q[3]));
    d_flip_flop dff2(.data(data[2]), .clk(clk), .reset(reset), .q(q[2]));
    d_flip_flop dff1(.data(data[1]), .clk(clk), .reset(reset), .q(q[1]));
    d_flip_flop dff0(.data(data[0]), .clk(clk), .reset(reset), .q(q[0]));

    
endmodule
