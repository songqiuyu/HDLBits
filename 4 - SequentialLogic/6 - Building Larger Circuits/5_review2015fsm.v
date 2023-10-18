module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );


    reg [3:0]y, Y;
    parameter [3:0] A=0, B=1, C=2, D=3, E=4, F=5, G=6, H=7, I=8, J=9;

    always@(*)begin
        case(y)
            A:  Y <= data ? B : A; 
            B:  Y <= data ? C : A;
            C:  Y <= data ? C : D;
            D:  Y <= data ? E : A;
            E:  Y <= F;
            F:  Y <= G;
            G:  Y <= H;
            H:  Y <= I;
            I:  if(done_counting)   Y <= J;
                else Y <= I;
            J:  if(ack) Y <= A;
                else Y <= J;
        endcase
    end

    always@(posedge clk)begin
        if(reset)
            y <= A;
        else
            y <= Y;
    end

    assign shift_ena = (y == E | y == F | y == G | y == H);
    assign counting = (y == I);
    assign done = (y == J);

endmodule
