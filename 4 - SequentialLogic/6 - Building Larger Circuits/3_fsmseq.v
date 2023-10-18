module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);

    reg [2:0]y, Y;
    parameter [2:0] A=0, B=1, C=2, D=3, E=4;

    always@(*)begin
        case(y)
            A:  Y <= data ? B : A; 
            B:  Y <= data ? C : A;
            C:  Y <= data ? C : D;
            D:  Y <= data ? E : A;
            E:  Y <= E;
        endcase
    end

    always@(posedge clk)begin
        if(reset)
            y <= A;
        else
            y <= Y;
    end

    assign start_shifting = (y == E);



endmodule