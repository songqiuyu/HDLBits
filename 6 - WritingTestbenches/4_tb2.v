`timescale 1ps / 1ps

module top_module();
    reg clk, in;
    reg [2:0] s;
    wire out;

    initial begin
        clk = 0;
        in = 0;
        s = 3'd2;
        #10
        s = 3'd6;
        #10
        in = 1;
        s = 3'd2;
        #10
        in = 0;
        s = 3'd7;
        #10
        in = 1;
        s = 3'd0;
        #30
        in = 0;
    end

    q7 t_q7(clk, in, s, out);

    always begin
        #5
        clk = ~clk;
    end

endmodule

module q7 (
    input clk,
    input in,
    input [2:0] s,
    output out
);
endmodule