//bitwise operations 位运算
//tedious 冗长的

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

//Parity checking奇偶检验
//imperfect 不完善的，不完美的

//奇偶校验使用XOR
//We will use "even" parity, where the parity bit is just the XOR of all 8 data bits. 

//even parity 偶校验
//odd parity 奇校验

module top_module(
    input [7:0] in,
    output parity
);
    assign parity = ^in[7:0];

endmodule