`timescale 1ns / 1ps
module tb_fourbit_counter;

    logic clk;
    logic reset_n;
    logic load;
    logic [3:0] load_data;
    logic [3:0] count;

    counter_4bit4 uut (
        .clk(clk),
        .reset_n(reset_n),
        .load(load),
        .load_data(load_data),
        .count(count)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
            reset_n = 0;
        
        #10 reset_n = 1; load = 1; load_data = 4'b0111;
        
        #10 reset_n = 0;
        
        #10 reset_n = 1; load = 0;
        #10 reset_n = 1; load = 1; load_data = 4'b0101;
        #10 reset_n = 0; load = 0;
        #10 reset_n = 1;
        #200
//        #10 reset_n = 1;
//        #10 load = 1;
//        #10 load = 0;

//        #10 load_data = 4'b0101;
//        #10 load = 1;
//        #10 load = 0;
        
        
//       // #10 reset_n = 1;
        
        
    
//        #10 load_data = 4'b0111;
//        #10 load = 1;
//        #10 load = 0;
        
//        #10 reset_n = 1;
//        #10 reset_n = 1;
      
        #30 $finish;
    end

endmodule
