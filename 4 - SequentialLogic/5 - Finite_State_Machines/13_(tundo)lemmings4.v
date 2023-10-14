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
    output digging); 

    reg [2:0]y, Y;
    parameter A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100, F=3'b101;
    reg [4:0] splatter = 5'b00000;
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
                else begin
                    Y <= C;
                end
            end

            D:begin
                if(ground)  Y <= B;
                else begin
                    Y <= D;
                end
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
            splatter <= 0;
            dead <= 0;
        end
        else begin      //else的begin end问题！
            if((y == C | y == D) & (Y == C | Y == D))
                splatter <= splatter + 1;
            else if(splatter <= 19)
                splatter <= 0;
            if(splatter > 19 && Y != C && Y != D)
                dead <= 1;
            y <= Y;
		end
    end

    assign walk_left = (y == A) && !dead;
    assign walk_right = (y == B) && !dead;
    assign aaah = (y == C | y == D) && !dead;
    assign digging = (y == E | y == F) && !dead;


endmodule
