module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);

    reg [2:0]Y;
    parameter[2:0] A=0, B=1, C=2, D=3, E=4;

    always@(*)begin
        case(y)
            A:  if(x) Y <= B;
                else  Y <= A;
            B:  if(x) Y <= E;
                else  Y <= B;
            C:  if(x) Y <= B;
                else  Y <= C;
            D:  if(x) Y <= C;
                else  Y <= B;
            E:  if(x) Y <= E;
                else  Y <= D;
        endcase
    end

    assign Y0 = Y[0];
    assign z = (y == D | y == E);

endmodule
