//JK-Flip-Flop
//      TruthTable
//  J   K   Q
//  0   0   Q(old)
//  0   1   0
//  1   0   1
//  1   1   ~Q(old)

/**
    JK´¥·¢Æ÷Ô­Àí
    D = J~Q + ~KQ;
**/

module top_module (
    input clk,
    input j,
    input k,
    output Q); 

    wire d, aq;
    assign d = (j && aq) || (!k && Q);

    dflipflop dff0(
        .d(d),
        .clk(clk),
        .q(Q),
        .aq(aq)
    );

endmodule

module dflipflop(
    input d, clk,
    output reg q, aq
);

    always @(posedge clk) begin
        q <= d;
        aq <= ~d;
    end

endmodule