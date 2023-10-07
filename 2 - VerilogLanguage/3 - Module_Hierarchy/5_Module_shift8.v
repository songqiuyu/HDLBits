module my_dff8 ( 
    input clk, 
    input [7:0] d, 
    output [7:0] q );
endmodule

module mux4to1(
    input [7:0]a, b, c, d,
    input [1:0]sel,
    output reg[7:0]out
);
    always@(*)
    begin
        case(sel)
            2'b00:  out = a;
            2'b01:  out = b;
            2'b10:  out = c;
            2'b11:  out = d;
            default: out = a;
        endcase
    end

endmodule

module top_module(
    input clk,
    input [7:0]d,
    input [1:0]sel,
    output [7:0]q
);
    wire [7:0]q1, q2, q3;

    my_dff8 dff1(clk, d, q1);
    my_dff8 dff2(clk, q1, q2);
    my_dff8 dff3(clk, q2, q3);
    mux4to1 mux(d, q1, q2, q3, sel, q); 

endmodule
