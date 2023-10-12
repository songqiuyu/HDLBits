module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out); 

    reg y, Y;
    parameter off = 1'b0, on = 1'b1;

    always@(y, j, k)begin
        case(y)
            off:    
                if(!j)  Y = off;
                else if(j)  Y = on;
            on: 
                if(!k)  Y = on;
                else if(k)  Y = off;
        endcase
    end

    always@(posedge clk)begin
        if(reset)
            y <= off;
        else
            y <= Y;
    end

    assign out = (y == on);


endmodule