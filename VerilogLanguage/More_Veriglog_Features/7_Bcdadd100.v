//BCDÂë ==> 8421Âë
module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

    genvar i;
    wire carryout[99:0];
    bcd_fadd bcd0(
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .cout(carryout[0]),
        .sum(sum[3:0])
    );


    generate
        for(i=1; i<=99; i=i+1)
        begin:bcdadder
            bcd_fadd bcd(a[i*4+3:i*4], b[i*4+3:i*4], carryout[i-1], carryout[i], sum[i*4+3:i*4]);
        end
    endgenerate

    assign cout = carryout[99];


endmodule


module bcd_fadd (
    input [3:0] a,
    input [3:0] b,
    input     cin,
    output   cout,
    output [3:0] sum );

endmodule
