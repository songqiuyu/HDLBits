module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    wire carryout[99:0];


    fadd fa0(a[0], b[0], cin, sum[0], carryout[0]);
    
    genvar i;
    generate
        for(i=1; i<=99; i=i+1)
        begin:fulladd
            fadd fa(
                .a(a[i]),
                .b(b[i]),
                .cin(carryout[i-1]),
                .s(sum[i]),
                .cout(carryout[i])
            );
        end    
    endgenerate

    assign cout = carryout[99];



endmodule

module fadd(
    input a, b, cin,
    output s, cout);

    assign s = a ^ b ^ cin;
    assign cout = (a && b) || (a && cin) || (b && cin);

endmodule