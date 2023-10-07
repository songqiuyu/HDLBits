module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );


    //可以使用其他的输入变量作为访问下标
    assign out = in[sel];


endmodule