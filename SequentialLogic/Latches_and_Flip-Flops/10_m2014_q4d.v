module top_module (
    input clk,
    input in, 
    output out);

    dff dff0(
        .d(in ^ out),
        .clk(clk),
        .q(out)
    );


endmodule


module dff(
    input d, clk,
    output reg q
);

    always@(clk)begin
        q <= d;
    end

endmodule