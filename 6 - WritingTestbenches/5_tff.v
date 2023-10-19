`timescale 1ps / 1ps


/**
    T触发器
    T为1反转，T为0保持
**/
module top_module ();
    reg clk, reset,t;
    wire q;

    tff t_tff(clk, reset, t, q);

    initial begin
        clk = 0;
        reset = 0;
        #10
        reset = 1;
        #20
        reset = 0;
        t = 1;
        #10
        t = 0;
    end


    always begin
        #5
        clk = ~clk;

    end
endmodule


module tff (
    input clk,
    input reset,   // active-high synchronous reset
    input t,       // toggle
    output q
);
endmodule