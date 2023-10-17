module top_module (
    input [5:0] y,
    input w,
    output Y1,
    output Y3
);

    wire [5:0] Y;
    parameter A=0, B=1, C=2, D=3, E=4, F=5;

    assign Y[B] = y[A] & w;
    assign Y[D] = (y[B] & ~w) | (y[C] & ~w) | (y[E] & ~w) | (y[F] & ~w);

    assign Y1 = Y[B];
    assign Y3 = Y[D];

endmodule