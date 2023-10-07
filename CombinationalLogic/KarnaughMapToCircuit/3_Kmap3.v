module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    //卡诺图的顺序并不是一定为00 01 10 11，只要符合定义01 00 10 11也是可以的
    assign out = a || (~b && c);

endmodule