// finite state machine circuit 有限状态自动机
// 有限状态自动机FSM
module top_module (
    input clk,
    input x,
    output z
); 

    //定义现态和终态,其中y是现态，Y是终态
    reg [3:1] y, Y;
    parameter [3:1] A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100, F = 3'b101, G = 3'b110, H = 3'b111;
    initial begin
        y = A;
    end
    always @(x, y)begin
        case(y)
            A:  if(x)   Y = H;
                else    Y = B;
            B:
                if(x)   Y = H;
                else    Y = A;
            C:
                if(x)   Y = F;
                else    Y = B;
            D:
                if(x)   Y = F;
                else    Y = A;
            E:
                if(x)   Y = D;
                else    Y = F;
            F:
                if(x)   Y = D;
                else    Y = E;
            G:
                if(x)   Y = B;
                else    Y = F;
            H:
                if(x)   Y = B;
                else    Y = E;
            default:    Y = A;
        endcase

    end

    always@(posedge clk)begin
        y <= Y;
    end

    assign z = (y == A);

endmodule
