module top_module(
    input a, b, c, d,
    output out1, out2
);

    mod_a instance1(out1, out2, a, b, c, d);


endmodule

module mod_a(
    output out1, out2,
    input a, b, c, d
);

endmodule