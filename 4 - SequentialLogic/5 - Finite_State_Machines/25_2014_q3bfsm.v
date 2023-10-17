module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);

    reg [2:0]y, Y;
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

    always@(posedge clk)begin
        if(reset)
            y <= A;
        else
            y <= Y;
    end

    assign z = (y == D | y == E);

endmodule