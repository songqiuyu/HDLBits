module top_module(
    input [31:0]a, b,
    output [31:0]sum
);

    wire carry_out;
    wire res_out;
    add16 addl(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum[15:0]),
        .cout(carry_out)
    );
    add16 addh(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(carry_out),
        .sum(sum[31:16]),
        .cout(res_out)
    );

endmodule


/**
    fulladderÈ«¼ÓÆ÷
    s = a ^ b ^ cin
    cout = (a & b) | (b & cin) | (a & cin)
**/

module add1 ( 
    input a, 
    input b, 
    input cin, 
    output sum, 
    output cout ); 

    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);

endmodule

module add16 ( 
    input[15:0] a,
    input[15:0] b,
    input cin,
    output[15:0] sum, 
    output cout );

endmodule