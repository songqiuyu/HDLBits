module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);

    reg [2:0]y, Y;
    parameter [2:0] A=0, B=1, C=2, D=3, E=4;

    always@(*)begin
        case(y)
            A:  Y <= B;
            B:  Y <= C;
            C:  Y <= D;
            D:  Y <= E;
            E:  Y <= E;
        endcase
    end

    always@(posedge clk)begin
        if(reset)
            y <= A;
        else
            y <= Y;
    end    

    assign shift_ena = !(y == E);

endmodule
