module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );

    wire carryout[4:0];
    assign carryout[0] = cin;

    genvar i;
    generate
        for(i=0; i<=3; i=i+1)
        begin: bcdfaddloop
            bcd_fadd bcdfadd(
                .a(a[i*4+3: i*4]),
                .b(b[i*4+3: i*4]),
                .cin(carryout[i]),
                .cout(carryout[i+1]),
                .sum(sum[i*4+3: i*4])
            );
        end    
    endgenerate

    assign cout = carryout[4];


endmodule



module bcd_fadd (
    input [3:0] a,
    input [3:0] b,
    input     cin,
    output   cout,
    output [3:0] sum );

endmodule