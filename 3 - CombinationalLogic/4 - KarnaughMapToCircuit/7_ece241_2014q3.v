//multiplexer¶àÂ·×ª»»Æ÷


module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 
    wire [3:0]t1, t2;


    two2one to1(4'b0100, 4'b0101, c, t1);
    two2one to2(4'b0001, 4'b1001, c, t2);
    two2one to3(t1, t2, d, mux_in);

endmodule


module two2one(
    input [3:0]a, b, 
    input sel,
    output [3:0]f
);
    assign f = sel ? b : a;
endmodule

