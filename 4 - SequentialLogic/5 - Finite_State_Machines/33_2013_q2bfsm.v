module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 

    reg [3:0] state, next_state;
    parameter [3:0] A=0, B=1, C=2, D=3, E=4, F=5, G=6, H=7, I=8, WAIT = 9;

    always@(*)begin
        case(state)
            A:  next_state <= B;
            B:  next_state <= WAIT;
            WAIT: next_state <= x ? C : D;
            C:  next_state <= x ? C : E;
            D:  next_state <= x ? C : D;
            E:  next_state <= x ? F : D;
            F:  next_state <= y ? H : G;
            G:  next_state <= y ? H : I;
            H:  next_state <= H;
            I:  next_state <= I;
        endcase      
    end

    always@(posedge clk)begin
        if(!resetn)
            state <= A;
        else 
            state <= next_state;
    end

    assign f = (state == B);
    assign g = (state == F | state == H | state == G);

endmodule