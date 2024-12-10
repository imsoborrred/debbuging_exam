`timescale 1ns / 1ps

module counter_4bit4 (
     input logic clk,
    input logic reset_n,
    input logic load,
    input logic [3:0] load_data,
    output logic [3:0] count
);
    logic [3:0] next_count; // size of next state should be 4 bits
    assign next_count = load ? (load_data) : (count + 1); // order of load data and count swapped 
    
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)       
            count <= 0;  
        else 
            count <= next_count;
    end

endmodule

