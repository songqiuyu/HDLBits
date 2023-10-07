//Verilog也有类似于C语言的?表达式
//?表达式叫做conditional operator 条件运算

//Given four unsigned numbers, find the minimum.
module top_module(
    input [7:0] a, b, c, d,
    output [7:0] min
);
    wire [7:0] t1, t2;
    two_way_min twm1(a, b, t1);
    two_way_min twm2(c, d, t2);
    assign min = t1 < t2 ? t1 : t2;

endmodule


module two_way_min(
    input [7:0] a, b,
    output [7:0] min
);

    assign min = a < b ? a : b;

endmodule
