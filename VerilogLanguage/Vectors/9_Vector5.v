//~表示按位取反，^表示按位异或

module top_module(
    input a, b, c, d, e,
    output [24:0] out
);

    assign out = {{5{~a}} ^ {a, b, c, d, e}, {5{~b}} ^ {a, b, c, d, e}, {5{~c}} ^ {a, b, c, d, e}, {5{~d}} ^ {a, b, c, d, e}, {5{~e}} ^ {a, b, c, d, e}};


endmodule


