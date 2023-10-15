module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 

    reg [2:0]y, Y;
    parameter A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100, F=3'b101;
    reg [7:0]cnt;
    reg dead;

    always@(*)begin
        case(y)
            A:begin
                if(!ground)
                    Y <= C;
                else begin
                    if(dig)
                        Y <= E;
                    else
                        case({bump_left, bump_right})
                            2'b00: Y <= A;
                            2'b01: Y <= A;
                            2'b10: Y <= B;
                            2'b11: Y <= B;
                        endcase
                end
            end
            B:begin
                if(!ground)
                    Y <= D;
                else begin
                    if(dig)
                        Y <= F;
                    else
                        case({bump_left, bump_right})
                            2'b00: Y <= B;
                            2'b01: Y <= A;
                            2'b10: Y <= B;
                            2'b11: Y <= A;
                        endcase
                end
            end

            C:begin
                if(ground) Y <= A;
                else Y <= C;
            end

            D:begin
                if(ground)  Y <= B;
                else Y <= D;
            end

            E:begin
                if(ground) Y <= E;
                else   Y <= C;
            end

            F:begin
                if(ground) Y <= F;
                else   Y <= D;
            end
        endcase
    end

    always@(posedge clk, posedge areset)begin
        if(areset)begin
            y <= A;
            cnt <= 0;
            dead <= 0;
        end
        else begin
            if ((y == C | y == D) && (Y != C) && (Y != D) && cnt >= 20)begin
                dead = 1;
            end
            else if((y == C | y == D) && (Y == C | Y == D))begin
                cnt <= cnt + 1;
            end
            else begin
                cnt <= 0;
            end

            y <= Y;
        end
    end

    assign walk_left = (y == A) && (!dead);
    assign walk_right = (y == B) && (!dead);
    assign aaah = (y == C | y == D) && (!dead);
    assign digging = (y == E | y == F) && (!dead);

endmodule
