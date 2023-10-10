// 定义参数parameter n
// 实例化参数 counter #(.n(1)) c0 ();


module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); 
    wire [3:0]q;
    sub_module s0(
        .E(KEY[1]),
        .R(SW[3]),
        .L(KEY[2]),
        .w(KEY[3]),
        .clk(KEY[0]),
        .q(LEDR[3])
    );
    genvar i;
    generate
        for(i=1; i<=3; i=i+1)
        begin: submod
            sub_module sub(
                .E(KEY[1]),
                .R(SW[3-i]),
                .L(KEY[2]),
                .w(LEDR[3-i+1]),
                .clk(KEY[0]),
                .q(LEDR[3-i])
            );
        end
    endgenerate

endmodule

module sub_module(
    input E, R, L, w, clk,
    output reg q
);

    wire mux0;
    wire mux1;

    assign mux0 = E ? w : q;
    assign mux1 = L ? R : mux0;

    always @(posedge clk) begin
        q <= mux1;
    end

endmodule