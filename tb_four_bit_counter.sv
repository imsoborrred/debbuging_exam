`timescale 1ns/1ps
module tb_four_bit_counter;

    // Testbench signals
    logic clk;
    logic up_and_down;
    logic reset;
    logic S;               // Select line (Load control)
    logic [3:0] D;         // Load value
    logic [3:0] q;         // Counter output

    // Instantiate the four_bit_counter
    four_bit_counter uut (
        .S(S),
        .up_and_down(up_and_down),
        .clk(clk),
        .reset(reset),
        .D(D),
        .qout(q)
        
    );

    // Clock generation (10ns period)
    initial begin
        clk = 0;
//        forever #5 clk = ~clk;  // 10 ns clock period
    #900 $finish;
    end

always 
#5 clk=~clk;

    // Test sequence
    initial begin
        $display("Time\tReset\tS\tD\tQ");
        $display("--------------------------------------");
        // Step 1: Reset the counter
        reset = 0; S = 1; D = 4'h0; up_and_down=0;  #10 
        $display("%0t\t%b\t%b\t%b\t%b", $time, reset, S, D,up_and_down, q);
        // Step 2: Let the counter count normally
        #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, reset, S, D,up_and_down, q);
        #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, reset, S, D,up_and_down, q);
        #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, reset, S, D,up_and_down, q);
        // Step 3: Load a custom value (D = 4'b1010)
        S = 1; D = 4'h5; up_and_down=0; #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, reset, S, D,up_and_down, q);
        S = 0; #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, reset, S, D,up_and_down, q);
        // Step 4: Let the counter count from the loaded value
        #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, reset, S, D,up_and_down, q);
        #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, reset, S, D,up_and_down, q);
        // Step 5: Reset the counter again
        reset = 1; #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, reset, S, D,up_and_down, q);
        reset = 0; #10;
        $display("%0t\t%b\t%b\t%b\t%b", $time, reset, S, D,up_and_down, q);
        #300
        up_and_down =1;        
        #300
        up_and_down =0;
        #200
        $finish;
    end

endmodule