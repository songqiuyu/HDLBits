module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);

    wire cout[0:3];
    fadd fa0(x[0], y[0], 1'b0, sum[0], cout[0]);
    fadd fa1(x[1], y[1], cout[0], sum[1], cout[1]);
    fadd fa2(x[2], y[2], cout[1], sum[2], cout[2]);
    fadd fa3(x[3], y[3], cout[2], sum[3], sum[4]);


endmodule



module fadd(
    input a, b, cin,
    output s, cout);

    assign s = a ^ b ^ cin;
    assign cout = (a && b) || (a && cin) || (b && cin);

endmodule