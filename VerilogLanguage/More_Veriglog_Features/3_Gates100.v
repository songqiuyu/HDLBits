/**
"Reduction operators"
这属于unary operators一元运算符，最后输出one bit of output
& a[3:0]     
// AND: a[3]&a[2]&a[1]&a[0]. Equivalent to (a[3:0] == 4'hf)
| b[3:0]     
// OR:  b[3]|b[2]|b[1]|b[0]. Equivalent to (b[3:0] != 4'h0)
^ c[2:0]     
// XOR: c[2]^c[1]^c[0]
**/

module top_module(
    input [99:0] in,
    output out_and,
    output out_or,
    output out_xor
);

    assign out_and = &in[99:0];
    assign out_or = |in[99:0];
    assign out_xor = ^in[99:0];

endmodule