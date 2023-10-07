//这个题目告诉我们，有的是无法通过卡诺图进行化简的
//因为卡诺图只能化简乘加
//这个时候要从公式入手，往往夹杂着异或

module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    assign out = (a ^ b) ^ (c ^ d);
endmodule
