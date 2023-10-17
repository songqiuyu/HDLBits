// two inputs s and w

//是必须满足三个里面有两个，多了少了都不行
module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);

    reg [3:0]y, Y;
    parameter[3:0] A = 0, B = 1, C = 2, D = 3, E = 4, F = 5, G = 6, H = 7, I = 8;

    always@(*)begin
        case(y)
            A:  if(s) Y <= B;
                else  Y <= A;
            B:  if(w) Y <= F;
                else  Y <= C;
            C:  if(w) Y <= G;
                else  Y <= D;
            D:  Y <= E;
            E:  if(w) Y <= F;
                else  Y <= C;
            F:  if(w) Y <= H;
                else  Y <= G;
            G:  if(w) Y <= I;
                else  Y <= E;
            H:  if(w) Y <= E;
                else  Y <= I;
            I:  if(w) Y <= F;
                else  Y <= C;
        endcase
    end

    always@(posedge clk)begin
        if(reset)
            y <= A;
        else
            y <= Y;
    end

    assign z = (y == I);

endmodule
