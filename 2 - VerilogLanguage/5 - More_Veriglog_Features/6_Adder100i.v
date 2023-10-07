//ripple-carry adder行波进位加法器
//instantiate   实例化
//Create a 100-bit binary ripple-carry adder 
//by instantiating 100 full adders.

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    full_adder fa0(
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .cout(cout[0]),
        .sum(sum[0])
    );

    genvar i;
    generate
        for(i=1; i<=99; i=i+1)
        begin: rippleCarryAdder
            full_adder fa(
                .a(a[i]),
                .b(b[i]),
                .cin(cout[i-1]),
                .cout(cout[i]),
                .sum(sum[i])
            );
            
        end
    endgenerate


endmodule

module full_adder(
    input a, b, cin,
    output cout, sum
);
    assign sum = a ^ b ^ cin;
    assign cout = (a&b) | (a&cin) | (b&cin);

endmodule