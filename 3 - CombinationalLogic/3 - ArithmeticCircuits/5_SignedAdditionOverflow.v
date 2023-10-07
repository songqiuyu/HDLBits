module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); 

// complement numbers 补码
// overflow 溢出
// 使用最高位的结果位和进位异或就行
    wire [9:0] cout;
    wire a_8, b_8, s_8;
    assign a_8 = a[7];
    assign b_8 = b[7];
    assign cout[0] = 0;
    genvar i;
    generate
        for(i=0; i<=7; i=i+1)
        begin:fulladd
            fadd fa(
                .a(a[i]),
                .b(b[i]),
                .cin(cout[i]),
                .s(s[i]),
                .cout(cout[i+1])
            );
        end    
    endgenerate

    fadd signadd(a_8, b_8, cout[8], s_8, cout[9]);
    assign overflow = s[7] ^ s_8 ? 1 : 0;

endmodule

module fadd(
    input a, b, cin,
    output s, cout);

    assign s = a ^ b ^ cin;
    assign cout = (a && b) || (a && cin) || (b && cin);

endmodule
