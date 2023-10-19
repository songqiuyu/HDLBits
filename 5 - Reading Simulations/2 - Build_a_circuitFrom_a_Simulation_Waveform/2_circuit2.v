module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//


    //卡诺图无相连的情况！
    assign q = ~(a^b^c^d);

endmodule