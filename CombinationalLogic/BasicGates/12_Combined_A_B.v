module top_module(
    input x, y,
    output z
);
    wire az1, bz1, az2, bz2;  

    A IA1(x, y, az1);
    B IB1(x, y, bz1);
    A IA2(x, y, az2);
    B IB2(x, y, bz2);

    assign z = (az1 || bz1) ^ (az2 && bz2);

endmodule



module A(
    input x, y,
    output z
);

    assign z = (x ^ y) & x;

endmodule



module B ( 
    input x, input y, output z 
);

    assign z = ~(x ^ y);

endmodule