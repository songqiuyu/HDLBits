module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);

    wire d;

    multiplexer m0(
        .a(q_in),
        .b(r_in),
        .sel(L),
        .s(d)
    );

    dff dff0(
        .d(d),
        .clk(clk),
        .q(Q)
    );


endmodule



// multiplexer ¶àÂ·Ñ¡ÔñÆ÷
module multiplexer(
    input a, b, sel,
    output s
);
    assign s = sel ? b : a;

endmodule

module dff(
    input d, clk,
    output reg q
);
    always@(posedge clk)begin
        q <= d;
    end


endmodule