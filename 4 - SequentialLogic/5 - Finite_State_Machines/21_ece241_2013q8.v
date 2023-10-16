module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 

    //Mealy-type finite state machine
    //input 101 output z
    //Your FSM should recognize overlapping sequences
    //要求Mealy而且是Overlapping
    

    reg [1:0]y, Y;
    parameter [1:0] A = 2'd0, B = 2'd1, C = 2'd2;

    always@(*)begin
        case(y)
            A:  if(x)   Y <= B;
                else    Y <= A;
            B:  if(x)   Y <= B;
                else    Y <= C;
            C:  if(x)   Y <= B;
                else    Y <= A;
        endcase     
    end

    always@(posedge clk, negedge aresetn)begin
        if(!aresetn)
            y <= A;
        else
            y <= Y;
    end

    assign z = (y == C & x);

endmodule