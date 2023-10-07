/**
    | ^ & 表示按位与或非
    || ^^ && 表示逻辑与或非 逻辑的只有0与非0（将整个向量看作一个）
**/

module top_module(
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
    
    assign out_or_bitwise = a | b;
    assign out_or_logical = a || b;
    assign out_not[5:3] = ~b;
    assign out_not[2:0] = ~a;

endmodule