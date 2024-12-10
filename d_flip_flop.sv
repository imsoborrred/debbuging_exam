`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2024 03:40:11 PM
// Design Name: 
// Module Name: d_flip_flop
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


module d_flip_flop(
    input logic data,
    input logic clk,
    input logic reset,
    output logic q
    );
    logic qm;
    logic q1, q2;
    Latch l1(.clk(clk), .data(data), .reset(reset), .q1(qm), .q2(q1));
    Latch l2(.clk(clk), .data(qm), .reset(reset), .q1(q), .q2(q2));
    
endmodule
