// 有限状态自动机
// 两个状态那么就是一个y
// moore型和mealy型

module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out
);

    reg y, Y;
    parameter B = 1'b0, A = 1'b1;
    always@(in, y)begin
        case(y)
            B:  if(in)  Y = B;
                else    Y = A;
            A:  if(in)  Y = A;
                else    Y = B;
            default:    Y = B;
        endcase
    end

    always@(posedge clk, posedge areset)begin
        if(areset)
            y <= B;
        else
            y <= Y;
    end

    assign out = (y == B);


endmodule

