module mod_a(
    input in1, in2,
    output out
);
endmodule

module top_module(
    input a, b,
    output out
);

    mod_a instance1 (a, b, out);

endmodule


