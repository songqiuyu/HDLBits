module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4);

    wire [6:1] Y;
    parameter A=1, B=2, C=3, D=4, E=5, F=6;

    assign Y[B] = y[A] & ~w;
    assign Y[D] = (y[B] & w) | (y[C] & w) | (y[E] & w) | (y[F] & w);

    assign Y2 = Y[B];
    assign Y4 = Y[D];

endmodule