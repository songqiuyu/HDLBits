module top_module( 
    input a, b, cin,
    output cout, sum );

/**
    sum = a ^ b ^ cin;
    cout = (a && b) || (a && cin) || (b && cin);

**/
    assign sum = a ^ b ^ cin;
    assign cout = (a && b) || (a && cin) || (b && cin);


endmodule
