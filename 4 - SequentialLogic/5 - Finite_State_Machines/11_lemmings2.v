module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 

    reg [1:0]y, Y;
    parameter A=2'b00, B=2'b01, C=2'b10, D=2'b11;

    always@(*)begin
        case(y)
            A:
                case({bump_left, bump_right, ground})
                    3'b001:
                        Y <= A;
                    3'b011:
                        Y <= A;
                    3'b101:
                        Y <= B;
                    3'b111:
                        Y <= B;
                    default:
                        Y <= C;
                endcase
            B:
                case({bump_left, bump_right, ground})
                    3'b001:
                        Y <= B;
                    3'b011:
                        Y <= A;
                    3'b101:
                        Y <= B;
                    3'b111:
                        Y <= A;
                    default:
                        Y <= D;
                endcase
            C:
                if(ground)  Y <= A;
                else    Y <= C;                    
            D:
                if(ground)  Y <= B;
                else    Y <= D;    
        endcase
    end

    always@(posedge clk, posedge areset)begin
        if(areset)
            y <= A;
        else
            y <= Y;
    end

    assign walk_left = (y == A);
    assign walk_right = (y == B);
    assign aaah = (y == C | y == D);

endmodule
