// Note the Verilog-1995 module declaration syntax here:
module top_module(
    input clk,
    input reset,   // Synchronous reset to state B
    input in,
    output out
);
    reg y, Y;   //y是现态   Y是终态
    parameter B = 1'b0, A = 1'b1;

    always@(in, y)begin
        case(y)
            B:  if(in)  Y = B;
                else    Y = A;              
            A:  if(in)  Y = A;
                else    Y = B;
            default:    Y = B;
        endcase
    end

    always@(posedge clk)begin
        if(reset)
            y <= B;
        else
            y <= Y;
    end

    assign out = (y == B);


endmodule