module my_dff ( input clk, input d, output q );
endmodule

//D flip-flop D´¥·¢Æ÷
module top_module(
    input clk, d,
    output q
);
    wire q1, q2;
    my_dff dff_1(
        .clk(clk),
        .d(d),
        .q(q1)
    );

    my_dff dff_2(
        .clk(clk),
        .d(q1),
        .q(q2)
    );

    my_dff dff_3(
        .clk(clk),
        .d(q2),
        .q(q)
    );

endmodule