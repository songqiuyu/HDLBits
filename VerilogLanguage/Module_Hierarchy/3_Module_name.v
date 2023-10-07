//用名字去调用mod_a

module mod_a ( output out1, output out2, input in1, input in2, input in3, input in4);
endmodule

module top_module(
    input a, b, c, d,
    output out1, out2
);
    mod_a ma(
        .out1(out1),
        .out2(out2),
        .in1(a),
        .in2(b),
        .in3(c),
        .in4(d)
    );

endmodule