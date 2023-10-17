module top_module (
    input [3:1] y,
    input w,
    output Y2);

    reg [3:1]Y;
    parameter [3:1] A = 0, B = 1, C = 2, D = 3, E = 4, F = 5;

    always@(*)begin
        case(y)
            A:  Y <= w ? A: B;
            B:  Y <= w ? D: C;
            C:  Y <= w ? D: E;
            D:  Y <= w ? A: F;
            E:  Y <= w ? D: E;
            F:  Y <= w ? D: C;
        endcase 
    end

    assign Y2 = Y[2];

endmodule