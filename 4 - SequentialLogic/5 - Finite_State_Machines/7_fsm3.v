module top_module(
    input clk,
    input in,
    input areset,
    output out); 

    reg [3:0]y ,Y;
    parameter A = 0, B = 1, C = 2, D = 3;

    always@(in, y)begin
        Y[A] = (y[A] & ~in) | (y[C] & ~in);
        Y[B] = (y[A] & in) | (y[B] & in) | (y[D] & in);
        Y[C] = (y[B] & ~in) | (y[D] & ~in);
        Y[D] = y[C] & in;
    end

    always@(posedge clk, posedge areset)begin
        if(areset)
            y <= 4'b0001;
        else
            y <= Y;
    end

    assign out = y[D];


endmodule
