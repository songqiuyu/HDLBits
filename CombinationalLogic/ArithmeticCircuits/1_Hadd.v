module top_module( 
    input a, b,
    output cout, sum );
    

    assign sum = a ^ b;
    assign cout = a && b;

/**
        TruthTable
    n  a  b  s  c
    0  0  0  0  0
    1  0  1  1  0
    2  1  0  1  0
    3  1  1  0  1

    s = a ^ b;
    c = a && b;

**/

endmodule