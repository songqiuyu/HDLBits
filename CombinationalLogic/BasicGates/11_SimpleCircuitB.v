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

�ɴ˵ó����ⲻ���� ͬ����

**/
    assign z = ~(x ^ y);

endmodule