// 8 * 1 memory 


module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 

    wire[7:0] Q;

    _8bit_register shift_register(
        .S(S),
        .ena(enable),
        .clk(clk),
        .Q(Q)
    );

    _3to8multiplxer m(
        .data(Q),
        .sel({A, B, C}),
        .s(Z)
    );


endmodule


module _3to8multiplxer(
    input [7:0] data,
    input [2:0] sel,
    output reg s
);

    always@(*)begin
        case(sel)
            3'b000:
                s = data[0];
            3'b001:
                s = data[1];            
            3'b010:
                s = data[2];
            3'b011:
                s = data[3];
            3'b100:
                s = data[4];
            3'b101:
                s = data[5];
            3'b110:
                s = data[6];
            3'b111:
                s = data[7];
        endcase
    end

endmodule



module _8bit_register(
    input S, ena, clk,
    output [7:0] Q
);

    d_flip_flop d0(
        .s(S),
        .clk(clk),
        .ena(ena),
        .q(Q[0])
    );

    genvar i;
    generate
        for(i=1; i<=7; i=i+1)
        begin: dff
            d_flip_flop d(
                .s(Q[i-1]),
                .clk(clk),
                .ena(ena),
                .q(Q[i])
            );
        end
    endgenerate


endmodule


module d_flip_flop(
    input s, clk, ena,
    output reg q
);

    always@(posedge clk)begin
        if(ena)
            q <= s;
    end

endmodule