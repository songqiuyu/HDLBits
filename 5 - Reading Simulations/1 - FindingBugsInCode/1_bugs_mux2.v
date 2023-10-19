module top_module (
    input sel,
    input [7:0] a,
    input [7:0] b,
    output [7:0] out  ); 


    assign out = sel ? a : b;
    // !表示逻辑非，~表示按位求反

endmodule
