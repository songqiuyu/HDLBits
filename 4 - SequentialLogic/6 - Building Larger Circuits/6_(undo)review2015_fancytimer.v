module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );


    reg[2:0] y, Y;
    reg [11:0] counter;
    reg [3:0] delay;
    parameter S=0, S1=1, S11=2, S110=3;
    parameter A=4, B=5, C=6, D=7;

    always@(*)begin
        case(y)
            S:      Y <= data ? S1 : S;
            S1:     Y <= data ? S11 : S;  
            S11:    Y <= data ? S11 : S110;
            S110:   Y <= data ? A : S;
            A:  Y <= (counter == 12'd0) ? B : A;
            B:  Y <= C;
            C:  Y <= (counter == 12'd0 && delay == 4'b0) ? D : C;
            D:  Y <= ack ? A : D;
        endcase
    end

    always@(posedge clk)begin
        if(reset)begin
            y <= A;
            counter <= 12'd0;
            delay <= 4'b0;
        end
        else begin
            if(y == S110)
                counter = 12'd3;
            else if (y == A) begin
                counter --;
                delay = {delay[2:0], data};
            end
            else if(y == B)
                counter = 12'd999 - 12'd1;
            else if(y == C)begin
                if(counter == 12'd0)begin
                    counter = 12'd999;
                    delay --;
                end
                else
                    counter --;
            end
            y <= Y;
            end
        end

    assign count = delay;
    assign counting = (y == B | y == C);
    assign done = (y == D);

endmodule
