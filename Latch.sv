module Latch(
    input logic data,
    input logic clk,
    output logic q1,
    input logic reset,
    output logic q2
);
    //wire q2;
    wire w1, w2, w3, w4;
    //logic q2 ;
    // First NAND gate
    assign w1 = ~(clk & data);
    assign w2 = w1 | reset; 
    
    // Second NAND gate
    assign w3 = ~(clk & ~data);

    // Third NAND gate 
    assign q1 = ~(w2 & q2);
    // reset before second Nand
    assign w4 = ~reset & w3 ;
    // Fourth NAND gate
    assign q2 = ~(w4 & q1);

endmodule
