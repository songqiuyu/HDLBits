module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q


    wire d0, d1, d2;
    mutiflexer m0(LEDR[2], SW[0], KEY[1], d0);
    mutiflexer m1(LEDR[0], SW[1], KEY[1], d1);
    mutiflexer m2(LEDR[1] ^ LEDR[2], SW[2], KEY[1], d2);

    d_flip_flop D0(
        .d(d0),
        .clk(KEY[0]),
        .q(LEDR[0])
    );

    d_flip_flop D1(
        .d(d1),
        .clk(KEY[0]),
        .q(LEDR[1])
    );

    d_flip_flop D2(
        .d(d2),
        .clk(KEY[0]),
        .q(LEDR[02])
    );

endmodule


module d_flip_flop(
    input d, clk,
    output reg q
);
    always@(posedge clk)begin
        q <= d;
    end

endmodule

module mutiflexer(
    input a, b, sel,
    output s
);

    assign s = sel ? b : a;

endmodule
