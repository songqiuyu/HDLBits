//根据in[3]来判断有限状态自动机
//首先去绘制FSM


module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); 

    reg[1:0] y, Y;
    parameter A = 2'b00, B =2'b01, C = 2'b10, D = 2'b11;

    always@(*)begin
        case(y)
            A:  if(in[3])   Y <= B;
                else        Y <= A;
            B:  Y <= C;
            C:  Y <= D;
            D:  if(in[3])   Y <= B;
                else        Y <= A;
        endcase
    end

    always@(posedge clk)begin
        if(reset)
            y <= A;
        else
            y <= Y;
    end

    assign done = (y == D);


endmodule