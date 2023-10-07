//n-bit shift register NÎ»ÒÆÎ»¼Ä´æÆ÷


module top_module (
    input clk,
    input w, R, E, L,
    output Q
);

    wire m0out;
    wire d;
    wire aq;

    multiflexr m0(
        .a(Q),
        .b(w),
        .sel(E),
        .s(m0out)
    );

    multiflexr m1(
        .a(m0out),
        .b(R),
        .sel(L),
        .s(d)
    );

    mydff dff0(
        .d(d),
        .clk(clk),
        .q(Q),
        .aq(aq)
    );


endmodule



module multiflexr(
    input a, b, sel,
    output s
);

    assign s = sel ? b : a;

endmodule


module mydff(
    input d, clk,
    output reg q, aq
);

    always@(posedge clk) begin
        q <= d;
        aq <= ~d;
    end

endmodule