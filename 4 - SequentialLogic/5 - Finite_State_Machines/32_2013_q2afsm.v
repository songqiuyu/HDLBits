module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 

    reg [1:0]y , Y;
    parameter A = 0, B = 1, C = 2, D = 3;
    always@(*)begin
        case(y)
            A:  if(r == 3'b000) Y <= A;
                else if(r[1])   Y <= B;
                else if(!r[1] & r[2]) Y <= C;
                else if (r == 3'b100) Y <= D;
            B:  if(r[1])    Y <= B;
                else if(!r[1])  Y <= A;
            C:  if(r[2])    Y <= C;
                else if(!r[2]) Y <= A;
            D:  if(r[3])    Y <= D;
                else if(!r[3]) Y <= A;
        endcase
    end

    always@(posedge clk)begin
        if(!resetn)
            y <= A;
        else
            y <= Y;
    end

    assign g[1] = (y == B);
    assign g[2] = (y == C);
    assign g[3] = (y == D);


endmodule