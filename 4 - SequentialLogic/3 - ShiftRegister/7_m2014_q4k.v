module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);

    wire q0, q1, q2;

    d_flip_flop d0(
        .d(in),
        .clk(clk),
        .reset(resetn),
        .q(q0)
    );

    d_flip_flop d1(
        .d(q0),
        .clk(clk),
        .reset(resetn),
        .q(q1)
    );

    d_flip_flop d2(
        .d(q1),
        .clk(clk),
        .reset(resetn),
        .q(q2)
    );

    d_flip_flop d3(
        .d(q2),
        .clk(clk),
        .reset(resetn),
        .q(out)
    );


endmodule



module d_flip_flop(
    input d, clk, reset,
    output reg q
);

    always@(posedge clk)begin
        if(!reset)
            q <= 0;
        else
            q <= d;
    end


endmodule