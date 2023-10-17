module top_module (
    input clk,
    input areset,
    input x,
    output z
); 

    //Mealy
    // Implement using one-hot encoding. 

    reg [1:0] y, Y;
    parameter A = 0, B = 1;

    /**
        s   0   1   |   0   1
        A   A   B   |   0   1
        B   B   B   |   1   0   
    **/

    always@(*)begin
        Y[A] = y[A] & ~x;
        Y[B] = (y[A] & x) | y[B];
    end


    always@(posedge clk, posedge areset)begin
        if(areset)
            y <= 2'b01; //！！要把初始位置1，同时其他位要为0
        else
            y <= Y;            
    end 

    assign z = (y[A] & x) | (y[B] & ~x);

endmodule