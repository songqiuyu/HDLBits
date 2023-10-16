// Moore state machine

module top_module (
    input clk,
    input areset,
    input x,
    output z
); 

    reg [2:0]y ,Y;
    parameter [2:0] A = 3'd0, B = 3'd1, C = 3'd2, D = 3'd3, E = 3'd4;

    always@(*)begin
        case(y)
            A:  Y <= x ? C : B;
            B:  Y <= x ? C : B;
            C:  Y <= x ? E : D;
            D:  Y <= x ? E : D;
            E:  Y <= x ? E : D;
        endcase
    end

    always@(posedge clk, posedge areset)begin
        if(areset)
            y <= A;
        else
            y <= Y;
    end

    assign z = (y == C | y == D);

endmodule

