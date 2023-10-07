module top_module ( 
    input x, input y, output z 
);

/**
    TruthTable
    n  x  y  z
    0  0  0  1
    1  0  1  0  
    2  1  0  0
    3  1  1  1

由此得出，这不就是 同或吗

**/
    assign z = ~(x ^ y);

endmodule